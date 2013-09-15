/* ProcessQueue.c - Corewar.Debugging.ProcessQueue
 *
 * Copyright (C) 2005 Jens Gutzeit <jens@jgutzeit.de>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include <Python.h>
#include "structmember.h"
#include <stdlib.h>
#include <MyTypes.h>
#include <ProcessQueue.h>

static PyObject *
ProcessQueue_new(PyTypeObject *type, PyObject *args, PyObject *kwds)
{
	ProcessQueue *self;
	u32_t *queue;
	s32_t start = 0;
	s32_t maxprocess = 8000;

	/* process arguments */
	static char *kwlist[] = {"start", "maxprocess", NULL};
	if (!PyArg_ParseTupleAndKeywords(args, kwds, "|ii", kwlist,
				    	 &start, &maxprocess)) {
		PyErr_SetString(PyExc_ValueError,
				"All arguments must be usigned integers.");
		return NULL;
	}
	if (start < 0) {
		PyErr_SetString(PyExc_ValueError, "Invalid start position.");
		return NULL;
	}
	if (maxprocess < 1) {
		PyErr_SetString(PyExc_ValueError,
				"Max. number of processes must be greater "\
				"than zero.");
		return NULL;
	}

	/* allocate some memory */
	queue = calloc(maxprocess, sizeof(u32_t));
	if (queue == NULL) {
		PyErr_SetString(PyExc_MemoryError,
				"Not enough memory for process queue.");
		return NULL;
	}
	self = (ProcessQueue *) type->tp_alloc(type, 0);
	if (self != NULL) {
		self->maxprocess = maxprocess;
		self->numprocess = 1;
		self->head = 0;
		self->tail = 1;
		self->queue = queue;
		self->queue[0] = start;
	}

	return (PyObject *) self;
}

static void
ProcessQueue_dealloc(ProcessQueue *self)
{
	free(self->queue);
	self->ob_type->tp_free((PyObject*) self);
}

static int
ProcessQueue_GetLength(ProcessQueue *self)
{
	return self->numprocess;
}

static PyObject *
ProcessQueue_GetItem(ProcessQueue *self, int i)
{
	u32_t pos;
	PyObject *proc;

	/* plausibility checks */	
	if ((i < 0) || (i >= self->numprocess)) {
		PyErr_SetString(PyExc_ValueError, "Invalid index");
		return NULL;
	}

	pos = (self->head + i) % self->maxprocess;
	proc = PyInt_FromLong(self->queue[pos]);
	if (proc == NULL) {
		return NULL;
	}
	Py_INCREF(proc);

	return proc;
}

static int
ProcessQueue_SetItem(ProcessQueue *self, int i, PyObject *proc)
{
	s32_t new_proc;
	u32_t pos;
	
	/* plausibility checks */
	if ((i < 0) || (i >= self->maxprocess)) {
		PyErr_SetString(PyExc_IndexError, "Invalid index.");
		return -1;
	}
	if (!PyInt_Check(proc)) {
		PyErr_SetString(PyExc_TypeError,
				"Process must be an unsigned integer.");
		return -1;
	}
	new_proc = PyInt_AsLong(proc);
	if (new_proc < 1) {
		PyErr_SetString(PyExc_TypeError, 
				"Process must be an unsigned integer.");
		return -1;
	}

	/* set value */
	pos = (self->head + i) % self->maxprocess;
	self->queue[pos] = new_proc;
	
	return 0;
}

PyDoc_STRVAR(get__doc__,
"get() -> integer\n\n"\
"Return and remove the next process from the process queue.");

static PyObject *
ProcessQueue_get(ProcessQueue *self)
{
	PyObject *proc;
	
	/* check, if process queue is not empty */
	if (self->numprocess == 0) {
		PyErr_SetString(PyExc_IndexError, "Process queue is empty.");
		return NULL;
	}

	proc = PyInt_FromLong(self->queue[self->head]);
	if (proc == NULL) {
		return NULL;
	}
	Py_INCREF(proc);
	
	self->head = (self->head + 1) % self->maxprocess;
	self->numprocess--;
	
	return proc;
}

PyDoc_STRVAR(append__doc__,
"append(process) -> None\n\n"\
"Append a process to the process queue, if it isn't full. Adding a new\n\n"\
"process to a full queue will fail silently.");

static PyObject *
ProcessQueue_append(ProcessQueue *self, PyObject *args, PyObject *kwds)
{
	s32_t proc;

	/* do nothing, if process queue is full */
	if (self->numprocess == self->maxprocess) {
		Py_INCREF(Py_None);
		return Py_None;
	}
	
	static char *kwlist[] = {"process", NULL};
	if (!PyArg_ParseTupleAndKeywords(args, kwds, "i", kwlist, &proc)) {
		PyErr_SetString(PyExc_ValueError,
				"Argument must be an unsigned integer.");
		return NULL;
	}
	if (proc < 0) {
		PyErr_SetString(PyExc_ValueError,
				"Invalid value for new process.");
		return NULL;
	}
	
	/* append new process */
	self->numprocess++;
	self->queue[self->tail] = proc;
	self->tail = (self->tail + 1) % self->maxprocess;
	
	Py_INCREF(Py_None);
	return Py_None;
}

static PyMemberDef ProcessQueue_members[] = {
	{NULL} /* sentinel */
};

static PyMethodDef ProcessQueue_methods[] = {
	{"get", (PyCFunction)ProcessQueue_get, METH_NOARGS, get__doc__},
	{"append", (PyCFunction)ProcessQueue_append,
	 METH_VARARGS | METH_KEYWORDS, append__doc__},
	{NULL, NULL, 0, NULL} /* sentinel */
};

static PyGetSetDef ProcessQueue_getseters[] = {
	{NULL} /* sentinel */
};

static PySequenceMethods ProcessQueue_as_sequence = {
	(inquiry)ProcessQueue_GetLength,	/*sq_length*/
	0,               			/*sq_concat*/
	0,					/*sq_repeat*/
	(intargfunc)ProcessQueue_GetItem,	/*sq_item*/
	0,					/*sq_slice*/
	(intobjargproc)ProcessQueue_SetItem,	/*sq_ass_item*/
	0,					/*sq_ass_slice*/
	0,					/*sq_contains*/
	0,					/*sq_inplace_concat*/
	0					/*sq_inplace_repeat*/
};

PyTypeObject ProcessQueueType = {
	PyObject_HEAD_INIT(NULL) 0, 			/*ob_size*/
	"Corewar.Debugging.ProcessQueue",		/*tp_name*/
	sizeof(ProcessQueue),		 	  	/*tp_basicsize*/
	0,                         			/*tp_itemsize*/
	(destructor)ProcessQueue_dealloc,	  	/*tp_dealloc*/
	0,						/*tp_print*/
	0,						/*tp_getattr*/
	0,						/*tp_setattr*/
	0,						/*tp_compare*/
	0,						/*tp_repr*/
	0,						/*tp_as_number*/
	&ProcessQueue_as_sequence,			/*tp_as_sequence*/
	0,						/*tp_as_mapping*/
	0,						/*tp_hash */
	0,						/*tp_call*/
	0,						/*tp_str*/
	0,						/*tp_getattro*/
	0,						/*tp_setattro*/
	0,						/*tp_as_buffer*/
	Py_TPFLAGS_DEFAULT | Py_TPFLAGS_BASETYPE,	/*tp_flags*/
	"Process queue for Core War",			/*tp_doc */
	0,						/*tp_traverse */
	0,						/*tp_clear */
	0,						/*tp_richcompare */
	0,						/*tp_weaklistoffset */
	0,						/*tp_iter */
	0,						/*tp_iternext */
	ProcessQueue_methods,				/*tp_methods */
	ProcessQueue_members,				/*tp_members */
	ProcessQueue_getseters,				/*tp_getset */
	0,						/*tp_base */
	0,						/*tp_dict */
	0,						/*tp_descr_get */
	0,						/*tp_descr_set */
	0,						/*tp_dictoffset */
	0,						/*tp_init */
	0,						/*tp_alloc */
	ProcessQueue_new,				/*tp_new */
};
