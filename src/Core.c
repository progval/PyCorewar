/* Core.c - Corewar.Debugging.Core
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
#include <Core.h>

/* Create a core (= List of Instructions) with the given size
 * Arguments are NOT checked!
 */
PyObject **
create_core(u32_t coresize, PyObject *insn_class)
{
	PyObject **core;
	PyObject *argList;
	u32_t i;
	u32_t j;
	
	/* create list for instructions */
	core = calloc(coresize, sizeof(PyObject *));
	if (core == NULL) {
		return NULL;
	}

	/* create instructions */
	argList = Py_BuildValue("(i)", coresize);
	for (i = 0; i < coresize; i++) {
		core[i] = PyObject_CallObject(insn_class, argList);
		if (core[i] == NULL) {
			/* undo everything :( */
			for (j = 0; j < i; j++) {
				Py_DECREF(core[j]);
			}
			Py_DECREF(argList);
			free(core);
			return NULL;
		}
	}
	Py_DECREF(argList);
	
	return core;
}

static PyObject *
Core_new(PyTypeObject *type, PyObject *args, PyObject *kwds)
{
	Core *self;
	PyObject *m; /* module */
	PyObject *d; /* dict of module */
	PyObject *c; /* class of module */
	PyObject **core;
	s32_t coresize = 8000; /* default value */

	/* FIXME: get type of instruction as argument */
	
	/* get size of core */
	static char *kwlist[] = {"coresize", NULL};
	PyArg_ParseTupleAndKeywords(args, kwds, "|i", kwlist, &coresize);

	if (coresize < 1) {
		PyErr_SetString(PyExc_ValueError, "Invalid coresize");
		return NULL;
	}

	/* try to import module Corewar.Redcode */
	m = PyImport_ImportModule("Corewar.Redcode");
	if (m == NULL) {
		PyErr_SetString(PyExc_ImportError,
				"Cannot import module Corewar.Redcode.");
		return NULL;
	}

	/* get module's dict */
	d = PyModule_GetDict(m);
	if (d == NULL) {
		Py_DECREF(m);
		PyErr_SetString(PyExc_ImportError,
				"Cannot get dict of module Corewar.Redcode.");
		return NULL;
	}

	/* get class Instruction88 */
	c = PyDict_GetItemString(d, "Instruction88");
	if (c == NULL) {
		Py_DECREF(m);
		PyErr_SetString(PyExc_ImportError,
				"Cannot find class Instruction88 in module "\
				"Corewar.Redcode.");
		return NULL;
	}

	core = create_core(coresize, c);
	if (core == NULL) {
		Py_DECREF(c);
		Py_DECREF(m);
		PyErr_SetString(PyExc_MemoryError,
				"Cannot get enough memory for core.");
		return NULL;
	}
	
	self = (Core *) type->tp_alloc(type, 0);
	if (self != NULL) {
		self->coresize = coresize;
		self->core = core;
	}

	Py_DECREF(c);
	Py_DECREF(m);

	return (PyObject *) self;
}

static void
Core_dealloc(Core *self)
{
	u32_t i;

	/* free all instructions */
	for (i = 0; i < self->coresize; i++) {
		Py_XDECREF(self->core[i]);	
	}
	
	free(self->core);
	self->ob_type->tp_free((PyObject*) self);
}

static PyObject *
Core_GetItem(Core *self, int i)
{
	if (i < 0) {
		i = self->coresize - (abs(i) % self->coresize);
	}
	i %= self->coresize;

	Py_INCREF(self->core[i]);
	return self->core[i];
}

static int
Core_SetItem(Core *self, int i, PyObject *insn)
{
	/* FIXME: type checking */
	PyObject *old;

	if (i < 0) {
		i = self->coresize - (abs(i) % self->coresize);
	}
	i %= self->coresize;

	old = self->core[i];
	if (insn) {
		Py_INCREF(insn);
		self->core[i] = insn;
		Py_DECREF(old);
	}

	return 0;
}

static int
Core_GetLength(Core *self)
{
	return self->coresize;
}

PyDoc_STRVAR(reinit__doc__,
"reinit() -> None\n\n"\
"Reset all instructions of core to default, i.e. DAT $ 0, $ 0.");

static PyObject *
Core_reinit(Core *self)
{
	PyObject *result;
	u32_t i;

	for (i = 0; i < self->coresize; i++) {
		result = PyObject_CallMethod(self->core[i], "reinit", NULL);
		if (result != NULL) {
			Py_DECREF(result);
		}
	}

	Py_INCREF(Py_None);
	return Py_None;
}

static PyMemberDef Core_members[] = {
	{NULL}	/* sentinel */
};

static PyMethodDef Core_methods[] = {
	{"reinit", (PyCFunction)Core_reinit, METH_NOARGS, reinit__doc__},
	{NULL, NULL, 0, NULL} /* sentinel */
};

static PyGetSetDef Core_getseters[] = {
	{NULL} /* sentinel */
};

static PySequenceMethods Core_as_sequence = {
	(inquiry)Core_GetLength,     	/*sq_length*/
	0,               		/*sq_concat*/
	0,				/*sq_repeat*/
	(intargfunc)Core_GetItem,	/*sq_item*/
	0,				/*sq_slice*/
	(intobjargproc)Core_SetItem,	/*sq_ass_item*/
	0,				/*sq_ass_slice*/
	0,				/*sq_contains*/
	0,				/*sq_inplace_concat*/
	0				/*sq_inplace_repeat*/
};

PyTypeObject CoreType = {
	PyObject_HEAD_INIT(NULL) 0, 			/*ob_size*/
	"Core.Debugging.Core",				/*tp_name*/
	sizeof(Core),			 	  	/*tp_basicsize*/
	0,                         			/*tp_itemsize*/
	(destructor)Core_dealloc,	  		/*tp_dealloc*/
	0,						/*tp_print*/
	0,						/*tp_getattr*/
	0,						/*tp_setattr*/
	0,						/*tp_compare*/
	0,						/*tp_repr*/
	0,						/*tp_as_number*/
	&Core_as_sequence,				/*tp_as_sequence*/
	0,						/*tp_as_mapping*/
	0,						/*tp_hash */
	0,						/*tp_call*/
	0,						/*tp_str*/
	0,						/*tp_getattro*/
	0,						/*tp_setattro*/
	0,						/*tp_as_buffer*/
	Py_TPFLAGS_DEFAULT | Py_TPFLAGS_BASETYPE,	/*tp_flags*/
	"Core according to ICWS' 88",			/*tp_doc */
	0,						/*tp_traverse */
	0,						/*tp_clear */
	0,						/*tp_richcompare */
	0,						/*tp_weaklistoffset */
	0,						/*tp_iter */
	0,						/*tp_iternext */
	Core_methods,					/*tp_methods */
	Core_members,					/*tp_members */
	Core_getseters,					/*tp_getset */
	0,						/*tp_base */
	0,						/*tp_dict */
	0,						/*tp_descr_get */
	0,						/*tp_descr_set */
	0,						/*tp_dictoffset */
	0,						/*tp_init */
	0,						/*tp_alloc */
	Core_new,					/*tp_new */
};
