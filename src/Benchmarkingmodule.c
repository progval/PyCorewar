/* Benchmarkingmodule.c - Corwar.Benchmarking
 *
 * Copyright (C) 2005-2006 Jens Gutzeit <jens@jgutzeit.de>
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
#include <time.h>
#include <MyTypes.h>
#include <Instruction.h>
#include <BenchWarrior.h>
#include <BenchMARS88.h>
#include <BenchMARS94nop.h>

#if PY_MAJOR_VERSION >= 3
    #define check_py3long_or_py2int PyLong_Check
    #define py3long_or_py2int_as_long  PyLong_AsLong
    #define py3long_or_py2int_from_long PyLong_FromLong
#else
    #define check_py3long_or_py2int PyInt_Check
    #define py3long_or_py2int_as_long  PyInt_AsLong
    #define py3long_or_py2int_from_long PyInt_FromLong
#endif

/* FIXME: Use faster methods for converting warrior into internal format */

/*
 * Helper functions for Corewar.Benchmarking.MARS_88
 */

/* Copy instruction from instruction to internal format. Return 0 on success,
 * 1 on error. Assume, that both arguments are not NULL.
 */
u32_t
get_instruction88(PyObject *src, insn_t *insn)
{
	PyObject *tmp;
	u32_t opcode;
	u32_t amode;
	u32_t bmode;

	tmp = PyObject_GetAttrString(src, "opcode");
	if (tmp == NULL) {
		return 1;
	}
	if (!check_py3long_or_py2int(tmp)) {
		Py_DECREF(tmp);
		return 1;
	}
	opcode = py3long_or_py2int_as_long(tmp);
	Py_DECREF(tmp);

	tmp = PyObject_GetAttrString(src, "amode");
	if (tmp == NULL) {
		return 1;
	}
	if (!check_py3long_or_py2int(tmp)) {
		Py_DECREF(tmp);
		return 1;
	}
	amode = py3long_or_py2int_as_long(tmp);
	Py_DECREF(tmp);

	tmp = PyObject_GetAttrString(src, "bmode");
	if (tmp == NULL) {
		return 1;
	}
	if (!check_py3long_or_py2int(tmp)) {
		Py_DECREF(tmp);
		return 1;
	}
	bmode = py3long_or_py2int_as_long(tmp);
	Py_DECREF(tmp);

	insn->insn = INSN88(opcode, amode, bmode);

	tmp = PyObject_GetAttrString(src, "afield");
	if (tmp == NULL) {
		return 1;
	}
	if (!check_py3long_or_py2int(tmp)) {
		Py_DECREF(tmp);
		return 1;
	}
	insn->a = py3long_or_py2int_as_long(tmp);
	Py_DECREF(tmp);

	tmp = PyObject_GetAttrString(src, "bfield");
	if (tmp == NULL) {
		return 1;
	}
	if (!check_py3long_or_py2int(tmp)) {
		Py_DECREF(tmp);
		return 1;
	}
	insn->b = py3long_or_py2int_as_long(tmp);
	Py_DECREF(tmp);
	
	return 0;
}

/* Copy all instructions from a list into an internal representation.
 * Return NULL on error.
 */
insn_t *
get_instructions88(PyObject *insnList, u32_t numinsns)
{
	PyObject *insn;
	insn_t *insns;
	u32_t i;

	insns = calloc(numinsns, sizeof(insn_t));
	if (insns == NULL) {
		return NULL;
	}

	for (i = 0; i < numinsns; i++) {
		insn = PySequence_GetItem(insnList, i);
		if (insn == NULL) {
			free(insns);
			return NULL;
		}
		if (get_instruction88(insn, &insns[i])) {
			Py_DECREF(insn);
			free(insns);
			return NULL;
		}
		Py_DECREF(insn);
	}

	return insns;
}

/* Try to convert warrior into internal warrior format. Return 0 on success,
 * 1 on error. */
u32_t
get_warrior88(PyObject *w, warrior_t *warrior, u32_t maxlength)
{
	PyObject *tmp;
	s32_t length;
	s32_t start;
	
	/* Get length of warrior. */
	tmp = PyObject_GetAttrString(w, "length");
	if (tmp == NULL) {
		return 1;
	}
	if (!check_py3long_or_py2int(tmp)) {
		Py_DECREF(tmp);
		return 1;
	}
	length = py3long_or_py2int_as_long(tmp);
	Py_DECREF(tmp);
	if ((length < 1) | (length > maxlength)) {
		return 1;
	}

	/* Get start instruction. */
	tmp = PyObject_GetAttrString(w, "start");
	if (tmp == NULL) {
		return 1;
	}
	if (!check_py3long_or_py2int(tmp)) {
		Py_DECREF(tmp);
		return 1;
	}
	start = py3long_or_py2int_as_long(tmp);
	Py_DECREF(tmp);
	if ((start < 0) | (start >= length)) {
		return 1;
	}
	
	/* Check for instructions. */
	tmp = PyObject_GetAttrString(w, "instructions");
	if (tmp == NULL) {
		return 1;
	}
	if (!PySequence_Check(tmp)) {
		Py_DECREF(tmp);
		return 1;
	}
	if (PySequence_Size(tmp) != length) {
		Py_DECREF(tmp);
		return 1;
	}
	
	/* Get instructions. */
	warrior->insns = get_instructions88(tmp, length);
	Py_DECREF(tmp);
	if (warrior->insns == NULL) {
		return 1;
	}
	warrior->start = start;
	warrior->length = length;

	return 0;
}

/* Return an array of warriors (internal format). Return NULL on error. */
warrior_t *
get_warriors88(PyObject *warriors, u32_t numwarriors, u32_t maxlength)
{
	warrior_t *wlist = calloc(numwarriors, sizeof(warrior_t));
	PyObject *warrior;
	u32_t i;
	u32_t j;
	
	for (i = 0; i < numwarriors; i++) {
		warrior = PySequence_GetItem(warriors, i);
		if (warrior == NULL) {
			for (j = 0; j < i; j++) {
				free(wlist[i].insns);
			}
			free(wlist);
			return NULL;
		}
		if (get_warrior88(warrior, &wlist[i], maxlength)) {
			for (j = 0; j < i; j++) {
				free(wlist[i].insns);
			}
			free(wlist);
			return NULL;
		}
	}
	
	return wlist;
}

/*
 * MARS_88
 */

typedef struct {
	PyObject_HEAD
	u32_t coresize;
	u32_t maxprocesses;
	u32_t maxcycles;
	u32_t mindistance;
	u32_t maxlength;
	insn_t *core;
} MARS_88;

PyDoc_STRVAR(MARS_88__doc__,
"A MARS with ICWS '88 rules.\n\n"\
"Methods:\n"\
"  run    -- Run a two-warrior-fight.\n"\
"  p_run  -- Run a two-warrior-fight with all possible start positions.\n"\
"  mw_run -- Run a multiwarrior fight.");

static PyObject *
MARS_88_new(PyTypeObject *type, PyObject *args, PyObject *kwds)
{
	MARS_88 *self;
	s32_t coresize = 8000;
	s32_t maxprocesses = 8000;
	s32_t maxcycles = 80000;
	s32_t mindistance = 100;
	s32_t maxlength = 100;
	insn_t *core;

	/* get and check arguments */
	static char *kwlist[] = {"coresize", "maxprocesses", "maxcycles",
				 "mindistance", "maxlength", NULL};
	if (!PyArg_ParseTupleAndKeywords(args, kwds, "|iiiii", kwlist,
					 &coresize, &maxprocesses, &maxcycles,
					 &mindistance, &maxlength)) {
		return NULL;
	}
	if (coresize < 1) {
		PyErr_SetString(PyExc_ValueError, "Core is too small.");
		return NULL;
	}
	if (maxprocesses < 1) {
		PyErr_SetString(PyExc_ValueError,
				"Invalid max. number of processes.");
		return NULL;
	}
	if (maxcycles < 1) {
		PyErr_SetString(PyExc_ValueError,
				"Invalid max. number of cycles.");
		return NULL;
	}
	if (mindistance < 1) {
		PyErr_SetString(PyExc_ValueError,
				"Invalid minimal distance distance between "\
				"warriors.");
		return NULL;
	}
	if (maxlength < 1) {
		PyErr_SetString(PyExc_ValueError,
				"Invalid max. length of warriors.");
		return NULL;
	}
	if (maxlength > mindistance) {
		PyErr_SetString(PyExc_ValueError,
				"Minimal warrior distance cannot be smaller "\
				"than maximal warrior length.");
		return NULL;
	}
	if (coresize < 2 * mindistance) {
		PyErr_SetString(PyExc_ValueError,
				"Core is not big enough for two warriors.");
		return NULL;
	}
	
	core = calloc(coresize, sizeof(insn_t));
	if (core == NULL) {
		return NULL;
	}
	
	self = (MARS_88 *) type->tp_alloc(type, 0);
	if (self != NULL) {
		self->coresize = coresize;
		self->maxprocesses = maxprocesses;
		self->maxcycles = maxcycles;
		self->mindistance = mindistance;
		self->maxlength = maxlength;
		self->core = core;
	}
	
	return (PyObject *) self;
}

static void
MARS_88_dealloc(MARS_88 *self)
{
	free(self->core);
	Py_TYPE(self)->tp_free((PyObject *) self);
}

PyDoc_STRVAR(MARS_88_coresize__doc__,
"Size of the core.");

static PyObject *
MARS_88_GetCoresize(MARS_88 *self, void *closure)
{
	PyObject *coresize = py3long_or_py2int_from_long(self->coresize);
	if (coresize == NULL) {
		return NULL;
	}
	Py_INCREF(coresize);

	return coresize;
}

PyDoc_STRVAR(MARS_88_maxprocesses__doc__,
"Max. number of processes per warrior.");

static PyObject *
MARS_88_GetMaxprocesses(MARS_88 *self, void *closure)
{
	PyObject *maxprocesses = py3long_or_py2int_from_long(self->maxprocesses);
	if (maxprocesses == NULL) {
		return NULL;
	}
	Py_INCREF(maxprocesses);

	return maxprocesses;
}

PyDoc_STRVAR(MARS_88_maxcycles__doc__,
"Max. number of cycles before a tie is declared.");

static PyObject *
MARS_88_GetMaxcycles(MARS_88 *self, void *closure)
{
	PyObject *maxcycles = py3long_or_py2int_from_long(self->maxcycles);
	if (maxcycles == NULL) {
		return NULL;
	}
	Py_INCREF(maxcycles);

	return maxcycles;
}

PyDoc_STRVAR(MARS_88_mindistance__doc__,
"Minimal warrior distance.");

static PyObject *
MARS_88_GetMindistance(MARS_88 *self, void *closure)
{
	PyObject *mindistance = py3long_or_py2int_from_long(self->mindistance);
	if (mindistance == NULL) {
		return NULL;
	}
	Py_INCREF(mindistance);

	return mindistance;
}

PyDoc_STRVAR(MARS_88_maxlength__doc__,
"Maximal length of warrior.");

static PyObject *
MARS_88_GetMaxlength(MARS_88 *self, void *closure)
{
	PyObject *maxlength = py3long_or_py2int_from_long(self->maxlength);
	if (maxlength == NULL) {
		return NULL;
	}
	Py_INCREF(maxlength);

	return maxlength;
}

PyDoc_STRVAR(MARS_88_run__doc__,
"run(warriors, rounds, seed) -> List\n\n"\
"Run a two warrior fight.\n\n"\
"Keyword Arguments:\n\n"\
"warriors -- list of two warriors\n"\
"rounds   -- number of rounds to fights (default 1)\n"\
"seed     -- position of the second warrior in the first fight\n"\
"            (default: a random value)\n\n"\
"The result of the fight is returned as a list with the format\n"\
"[[wins1, losses1, ties1], [wins2, losses2, ties2]].\n");

static PyObject *
MARS_88_run(MARS_88 *self, PyObject *args, PyObject *kwds)
{
	PyObject *warriors;
	s32_t rounds = 1;
	s32_t seed = time(0); /* some "random" value */
	u32_t *result;
	PyObject *res;

	warrior_t *wlist;

	/* Get and check arguments. */
	static char *kwlist[] = {"warriors", "rounds", "seed", NULL};
	if (!PyArg_ParseTupleAndKeywords(args, kwds, "O|ii", kwlist,
					 &warriors, &rounds, &seed)) {
		return NULL;
	}
	if (PySequence_Check(warriors) == 0) {
		PyErr_SetString(PyExc_ValueError, "List of warriors needed.");
		return NULL;
	}
	if (PySequence_Size(warriors) != 2) {
		PyErr_SetString(PyExc_ValueError,
				"Exactly two warriors are needed "\
				"to run a fight.");
		return NULL;
	}
	if (rounds < 1) {
		PyErr_SetString(PyExc_ValueError, "Invalid number of rounds.");
		return NULL;
	}
	if (seed < 0) {
		PyErr_SetString(PyExc_ValueError, "Invalid seed.");
		return NULL;
	}
	if (seed < self->mindistance) {
		PyErr_SetString(PyExc_ValueError, "Position of second "\
				"warrior cannot be smaller than minimal "\
				"warrior distance.");
		return NULL;
	}
	
	/* Try to convert warriors into internal format. */
	wlist = get_warriors88(warriors, 2, self->maxlength);
	if (wlist == NULL) {
		PyErr_SetString(PyExc_ValueError, "Couldn't load warriors.");
		return NULL;
	}

	/* Run all fights. */
	result = run_88(self->core, wlist, self->coresize, self->maxprocesses,
		        self->maxcycles, self->mindistance, rounds, seed);

	/* Build results. */
	res = Py_BuildValue("[[lll][lll]]", result[0], result[1], result[2],
			    result[1], result[0], result[2]);
	if (res == NULL) {
		free_warriors(wlist, 2);
		free(result);
		return NULL;
	}
	Py_INCREF(res);
		
	/* Clean up. */
	free_warriors(wlist, 2);
	free(result);
	
	return res;
}

PyDoc_STRVAR(MARS_88_p_run__doc__,
"p_run(warriors) -> List\n\n"\
"Run a two warrior fight with all possible start positions.\n\n"\
"Keyword Arguments:\n\n"\
"warriors -- list of two warriors\n\n"\
"2 * (CORESIZE - MINDISTANCE + 1) rounds are run. This might take a long\n"\
"time for larger cores! The result of the fights is returned as a list\n"\
"with the format [[wins1, losses1, ties1], [wins2, losses2, ties2]].");

static PyObject *
MARS_88_p_run(MARS_88 *self, PyObject *args, PyObject *kwds)
{
	PyObject *warriors;
	u32_t *result;
	PyObject *res;
	warrior_t *wlist;

	/* Get and check arguments. */
	static char *kwlist[] = {"warriors", NULL};
	if (!PyArg_ParseTupleAndKeywords(args, kwds, "O", kwlist,
				         &warriors)) {
		return NULL;
	}
	if (PySequence_Check(warriors) == 0) {
		PyErr_SetString(PyExc_ValueError, "List of warriors needed.");
		return NULL;
	}
	if (PySequence_Size(warriors) != 2) {
		PyErr_SetString(PyExc_ValueError,
				"Exactly two warriors are needed "\
				"to run a fight.");
		return NULL;
	}
	
	/* Try to convert warriors into internal format. */
	wlist = get_warriors88(warriors, 2, self->maxlength);
	if (wlist == NULL) {
		PyErr_SetString(PyExc_ValueError, "Couldn't load warriors.");
		return NULL;
	}

	/* Run all fights. */
	result = p_run_88(self->core, wlist, self->coresize,
			  self->maxprocesses, self->maxcycles,
			  self->mindistance);

	/* Build results. */
	res = Py_BuildValue("[[lll][lll]]", result[0], result[1], result[2],
			    result[1], result[0], result[2]);
	if (res == NULL) {
		free_warriors(wlist, 2);
		free(result);
		return NULL;
	}
	Py_INCREF(res);
		
	/* Clean up. */
	free_warriors(wlist, 2);
	free(result);
	
	return res;	
}

PyDoc_STRVAR(MARS_88_mw_run__doc__,
"mw_run(warriors, rounds, seed) -> List\n\n"\
"Run a multiwarrior fight.\n\n"\
"Keyword Arguments:\n\n"\
"warriors -- list of warriors\n"\
"rounds   -- number of rounds to fights (default 1)\n"\
"seed     -- seed for positioning the warriors (default: a random value)\n\n"\
"The result is returned as a list, in which each item has the following\n"\
"format: [wins[1], wins[2], win[3], ..., losses], where the index indicates\n"\
"the number of warriors that survived until the end.");

static PyObject *
MARS_88_mw_run(MARS_88 *self, PyObject *args, PyObject *kwds)
{
	PyObject *warriors;
	s32_t rounds = 1;
	s32_t seed = time(0); /* some "random" value */
	u32_t *result;
	PyObject *res;
	u32_t numwarriors;
	warrior_t *wlist;

	PyObject *tmp;
	PyObject *value;
	u32_t i;
	u32_t j;

	/* Get and check arguments. */
	static char *kwlist[] = {"warriors", "rounds", "seed", NULL};
	if (!PyArg_ParseTupleAndKeywords(args, kwds, "O|ii", kwlist,
					 &warriors, &rounds, &seed)) {
		return NULL;
	}
	if (PySequence_Check(warriors) == 0) {
		PyErr_SetString(PyExc_ValueError, "List of warriors needed.");
		return NULL;
	}
	numwarriors = PySequence_Size(warriors);
	if (numwarriors < 2) {
		PyErr_SetString(PyExc_ValueError,
				"At least two warriors are needed "\
				"to run a multiwarrior fight.");
		return NULL;
	}
	if (self->coresize < numwarriors * self->mindistance) {
		PyErr_SetString(PyExc_ValueError,
				"All warriors do not fit into the core.");
		return NULL;
	}
	if (rounds < 1) {
		PyErr_SetString(PyExc_ValueError, "Invalid number of rounds.");
		return NULL;
	}
	if (seed < 0) {
		PyErr_SetString(PyExc_ValueError, "Invalid seed.");
		return NULL;
	}
	if (seed < self->mindistance) {
		PyErr_SetString(PyExc_ValueError, "Position of second "\
				"warrior cannot be smaller than minimal "\
				"warrior distance.");
		return NULL;
	}
	
	/* Try to convert warriors into internal format. */
	wlist = get_warriors88(warriors, numwarriors, self->maxlength);
	if (wlist == NULL) {
		PyErr_SetString(PyExc_ValueError, "Couldn't load warriors.");
		return NULL;
	}

	/* Run all fights. */
	result = mw_run_88(self->core, numwarriors, wlist, self->coresize,
			   self->maxprocesses, self->maxcycles,
			   self->mindistance, rounds, seed);

	/* Partial cleanup. */
	free_warriors(wlist, numwarriors);
	
	/* Build results. */
	res = PyList_New(numwarriors);
	if (res == NULL) {
		free(result);
		return NULL;
	}
	for (i = 0; i < numwarriors; i++) {
		tmp = PyList_New(numwarriors + 1);
		if (tmp == NULL) {
			/* Free already generated items. */
			Py_DECREF(res);
			free(result);
			return NULL;
		}
		PyList_SetItem(res, i, tmp);
		for (j = 0; j < numwarriors + 1; j++) {
			value = py3long_or_py2int_from_long(result[i*(numwarriors+1)+j]);
			PyList_SetItem(tmp, j, value);
		}
	}
		
	/* Clean up. */
	free(result);
	
	return res;
}

static PyMemberDef MARS_88_members[] = {
	{NULL}	/* sentinel */
};

static PyMethodDef MARS_88_methods[] = {
	{"run", (PyCFunction)MARS_88_run, METH_VARARGS | METH_KEYWORDS,
	 MARS_88_run__doc__},
	{"p_run", (PyCFunction)MARS_88_p_run, METH_VARARGS | METH_KEYWORDS,
	 MARS_88_p_run__doc__},
	{"mw_run", (PyCFunction)MARS_88_mw_run, METH_VARARGS | METH_KEYWORDS,
	 MARS_88_mw_run__doc__},
	{NULL, NULL, 0, NULL} /* sentinel */
};

static PyGetSetDef MARS_88_getseters[] = {
	{"coresize", (getter)MARS_88_GetCoresize, NULL,
	 MARS_88_coresize__doc__, NULL},
	{"maxprocesses", (getter)MARS_88_GetMaxprocesses, NULL,
	 MARS_88_maxprocesses__doc__, NULL},
	{"maxcycles", (getter)MARS_88_GetMaxcycles, NULL,
	 MARS_88_maxcycles__doc__, NULL},
	{"mindistance", (getter)MARS_88_GetMindistance, NULL,
	 MARS_88_mindistance__doc__, NULL},
	{"maxlength", (getter)MARS_88_GetMaxlength, NULL,
	 MARS_88_maxlength__doc__, NULL},
	{NULL} /* sentinel */
};

static PyTypeObject MARS_88Type = {
	PyVarObject_HEAD_INIT(NULL, 0) 			/*ob_size*/
	"Corewar.Benchmarking.MARS_88",			/*tp_name*/
	sizeof(MARS_88),			 	/*tp_basicsize*/
	0,                         			/*tp_itemsize*/
	(destructor)MARS_88_dealloc,		  	/*tp_dealloc*/
	0,						/*tp_print*/
	0,						/*tp_getattr*/
	0,						/*tp_setattr*/
	0,						/*tp_compare*/
	0,						/*tp_repr*/
	0,						/*tp_as_number*/
	0,						/*tp_as_sequence*/
	0,						/*tp_as_mapping*/
	0,						/*tp_hash */
	0,						/*tp_call*/
	0,						/*tp_str*/
	0,						/*tp_getattro*/
	0,						/*tp_setattro*/
	0,						/*tp_as_buffer*/
	Py_TPFLAGS_DEFAULT | Py_TPFLAGS_BASETYPE,	/*tp_flags*/
	MARS_88__doc__,					/*tp_doc */
	0,						/*tp_traverse */
	0,						/*tp_clear */
	0,						/*tp_richcompare */
	0,						/*tp_weaklistoffset */
	0,						/*tp_iter */
	0,						/*tp_iternext */
	MARS_88_methods,				/*tp_methods */
	MARS_88_members,				/*tp_members */
	MARS_88_getseters,				/*tp_getset */
	0,						/*tp_base */
	0,						/*tp_dict */
	0,						/*tp_descr_get */
	0,						/*tp_descr_set */
	0,						/*tp_dictoffset */
	0,						/*tp_init */
	0,						/*tp_alloc */
	MARS_88_new,					/*tp_new */
};

/*
 * Helper functions for Corewar.Benchmarking.MARS_94nop
 */

/* Copy instruction from instruction to internal format. Return 0 on success,
 * 1 on error. Assume, that both arguments are not NULL.
 */
u32_t
get_instruction94(PyObject *src, insn_t *insn)
{
	PyObject *tmp;
	u32_t opcode;
	u32_t modifier;
	u32_t amode;
	u32_t bmode;

	tmp = PyObject_GetAttrString(src, "opcode");
	if (tmp == NULL) {
		return 1;
	}
	if (!check_py3long_or_py2int(tmp)) {
		Py_DECREF(tmp);
		return 1;
	}
	opcode = py3long_or_py2int_as_long(tmp);
	Py_DECREF(tmp);

	tmp = PyObject_GetAttrString(src, "modifier");
	if (tmp == NULL) {
		return 1;
	}
	if (!check_py3long_or_py2int(tmp)) {
		Py_DECREF(tmp);
		return 1;
	}
	modifier = py3long_or_py2int_as_long(tmp);
	Py_DECREF(tmp);
	
	tmp = PyObject_GetAttrString(src, "amode");
	if (tmp == NULL) {
		return 1;
	}
	if (!check_py3long_or_py2int(tmp)) {
		Py_DECREF(tmp);
		return 1;
	}
	amode = py3long_or_py2int_as_long(tmp);
	Py_DECREF(tmp);

	tmp = PyObject_GetAttrString(src, "bmode");
	if (tmp == NULL) {
		return 1;
	}
	if (!check_py3long_or_py2int(tmp)) {
		Py_DECREF(tmp);
		return 1;
	}
	bmode = py3long_or_py2int_as_long(tmp);
	Py_DECREF(tmp);

	insn->insn = INSN(opcode, modifier, amode, bmode);

	tmp = PyObject_GetAttrString(src, "afield");
	if (tmp == NULL) {
		return 1;
	}
	if (!check_py3long_or_py2int(tmp)) {
		Py_DECREF(tmp);
		return 1;
	}
	insn->a = py3long_or_py2int_as_long(tmp);
	Py_DECREF(tmp);

	tmp = PyObject_GetAttrString(src, "bfield");
	if (tmp == NULL) {
		return 1;
	}
	if (!check_py3long_or_py2int(tmp)) {
		Py_DECREF(tmp);
		return 1;
	}
	insn->b = py3long_or_py2int_as_long(tmp);
	Py_DECREF(tmp);
	
	return 0;
}

/* Copy all instructions from a list into an internal representation.
 * Return NULL on error.
 */
insn_t *
get_instructions94(PyObject *insnList, u32_t numinsns)
{
	PyObject *insn;
	insn_t *insns;
	u32_t i;

	insns = calloc(numinsns, sizeof(insn_t));
	if (insns == NULL) {
		return NULL;
	}

	for (i = 0; i < numinsns; i++) {
		insn = PySequence_GetItem(insnList, i);
		if (insn == NULL) {
			free(insns);
			return NULL;
		}
		if (get_instruction94(insn, &insns[i])) {
			Py_DECREF(insn);
			free(insns);
			return NULL;
		}
		Py_DECREF(insn);
	}

	return insns;
}

/* Try to convert warrior into internal warrior format. Return 0 on success,
 * 1 on error. */
u32_t
get_warrior94(PyObject *w, warrior_t *warrior, u32_t maxlength)
{
	PyObject *tmp;
	s32_t length;
	s32_t start;
	
	/* Get length of warrior. */
	tmp = PyObject_GetAttrString(w, "length");
	if (tmp == NULL) {
		return 1;
	}
	if (!check_py3long_or_py2int(tmp)) {
		Py_DECREF(tmp);
		return 1;
	}
	length = py3long_or_py2int_as_long(tmp);
	Py_DECREF(tmp);
	if ((length < 1) | (length > maxlength)) {
		return 1;
	}

	/* Get start instruction. */
	tmp = PyObject_GetAttrString(w, "start");
	if (tmp == NULL) {
		return 1;
	}
	if (!check_py3long_or_py2int(tmp)) {
		Py_DECREF(tmp);
		return 1;
	}
	start = py3long_or_py2int_as_long(tmp);
	Py_DECREF(tmp);
	if ((start < 0) | (start >= length)) {
		return 1;
	}
	
	/* Check for instructions. */
	tmp = PyObject_GetAttrString(w, "instructions");
	if (tmp == NULL) {
		return 1;
	}
	if (!PySequence_Check(tmp)) {
		Py_DECREF(tmp);
		return 1;
	}
	if (PySequence_Size(tmp) != length) {
		Py_DECREF(tmp);
		return 1;
	}
	
	/* Get instructions. */
	warrior->insns = get_instructions94(tmp, length);
	Py_DECREF(tmp);
	if (warrior->insns == NULL) {
		return 1;
	}
	warrior->start = start;
	warrior->length = length;

	return 0;
}

/* Return an array of warriors (internal format). Return NULL on error. */
warrior_t *
get_warriors94(PyObject *warriors, u32_t numwarriors, u32_t maxlength)
{
	warrior_t *wlist = calloc(numwarriors, sizeof(warrior_t));
	PyObject *warrior;
	u32_t i;
	u32_t j;
	
	for (i = 0; i < numwarriors; i++) {
		warrior = PySequence_GetItem(warriors, i);
		if (warrior == NULL) {
			for (j = 0; j < i; j++) {
				free(wlist[i].insns);
			}
			free(wlist);
			return NULL;
		}
		if (get_warrior94(warrior, &wlist[i], maxlength)) {
			for (j = 0; j < i; j++) {
				free(wlist[i].insns);
			}
			free(wlist);
			return NULL;
		}
	}
	
	return wlist;
}

/*
 * MARS_94nop
 */

typedef struct {
	PyObject_HEAD
	u32_t coresize;
	u32_t maxprocesses;
	u32_t maxcycles;
	u32_t mindistance;
	u32_t maxlength;
	insn_t *core;
} MARS_94nop;

PyDoc_STRVAR(MARS_94nop__doc__,
"A MARS with ICWS '88 rules.\n\n"\
"Methods:\n"\
"  run    -- Run a two-warrior-fight.\n"\
"  p_run  -- Run a two-warrior-fight with all possible start positions.\n"\
"  mw_run -- Run a multiwarrior fight.");

static PyObject *
MARS_94nop_new(PyTypeObject *type, PyObject *args, PyObject *kwds)
{
	MARS_94nop *self;
	s32_t coresize = 8000;
	s32_t maxprocesses = 8000;
	s32_t maxcycles = 80000;
	s32_t mindistance = 100;
	s32_t maxlength = 100;
	insn_t *core;

	/* get and check arguments */
	static char *kwlist[] = {"coresize", "maxprocesses", "maxcycles",
				 "mindistance", "maxlength", NULL};
	if (!PyArg_ParseTupleAndKeywords(args, kwds, "|iiiii", kwlist,
					 &coresize, &maxprocesses, &maxcycles,
					 &mindistance, &maxlength)) {
		return NULL;
	}
	if (coresize < 1) {
		PyErr_SetString(PyExc_ValueError, "Core is too small.");
		return NULL;
	}
	if (maxprocesses < 1) {
		PyErr_SetString(PyExc_ValueError,
				"Invalid max. number of processes.");
		return NULL;
	}
	if (maxcycles < 1) {
		PyErr_SetString(PyExc_ValueError,
				"Invalid max. number of cycles.");
		return NULL;
	}
	if (mindistance < 1) {
		PyErr_SetString(PyExc_ValueError,
				"Invalid minimal distance distance between "\
				"warriors.");
		return NULL;
	}
	if (maxlength < 1) {
		PyErr_SetString(PyExc_ValueError,
				"Invalid max. length of warriors.");
		return NULL;
	}
	if (maxlength > mindistance) {
		PyErr_SetString(PyExc_ValueError,
				"Minimal warrior distance cannot be smaller "\
				"than maximal warrior length.");
		return NULL;
	}
	if (coresize < 2 * mindistance) {
		PyErr_SetString(PyExc_ValueError,
				"Core is not big enough for two warriors.");
		return NULL;
	}
	
	core = calloc(coresize, sizeof(insn_t));
	if (core == NULL) {
		return NULL;
	}
	
	self = (MARS_94nop *) type->tp_alloc(type, 0);
	if (self != NULL) {
		self->coresize = coresize;
		self->maxprocesses = maxprocesses;
		self->maxcycles = maxcycles;
		self->mindistance = mindistance;
		self->maxlength = maxlength;
		self->core = core;
	}
	
	return (PyObject *) self;
}

static void
MARS_94nop_dealloc(MARS_94nop *self)
{
	free(self->core);
	Py_TYPE(self)->tp_free((PyObject *) self);
}

PyDoc_STRVAR(MARS_94nop_coresize__doc__,
"Size of the core.");

static PyObject *
MARS_94nop_GetCoresize(MARS_94nop *self, void *closure)
{
	PyObject *coresize = py3long_or_py2int_from_long(self->coresize);
	if (coresize == NULL) {
		return NULL;
	}
	Py_INCREF(coresize);

	return coresize;
}

PyDoc_STRVAR(MARS_94nop_maxprocesses__doc__,
"Max. number of processes per warrior.");

static PyObject *
MARS_94nop_GetMaxprocesses(MARS_94nop *self, void *closure)
{
	PyObject *maxprocesses = py3long_or_py2int_from_long(self->maxprocesses);
	if (maxprocesses == NULL) {
		return NULL;
	}
	Py_INCREF(maxprocesses);

	return maxprocesses;
}

PyDoc_STRVAR(MARS_94nop_maxcycles__doc__,
"Max. number of cycles before a tie is declared.");

static PyObject *
MARS_94nop_GetMaxcycles(MARS_94nop *self, void *closure)
{
	PyObject *maxcycles = py3long_or_py2int_from_long(self->maxcycles);
	if (maxcycles == NULL) {
		return NULL;
	}
	Py_INCREF(maxcycles);

	return maxcycles;
}

PyDoc_STRVAR(MARS_94nop_mindistance__doc__,
"Minimal warrior distance.");

static PyObject *
MARS_94nop_GetMindistance(MARS_94nop *self, void *closure)
{
	PyObject *mindistance = py3long_or_py2int_from_long(self->mindistance);
	if (mindistance == NULL) {
		return NULL;
	}
	Py_INCREF(mindistance);

	return mindistance;
}

PyDoc_STRVAR(MARS_94nop_maxlength__doc__,
"Maximal length of warrior.");

static PyObject *
MARS_94nop_GetMaxlength(MARS_94nop *self, void *closure)
{
	PyObject *maxlength = py3long_or_py2int_from_long(self->maxlength);
	if (maxlength == NULL) {
		return NULL;
	}
	Py_INCREF(maxlength);

	return maxlength;
}

PyDoc_STRVAR(MARS_94nop_run__doc__,
"run(warriors, rounds, seed) -> List\n\n"\
"Run a two warrior fight.\n\n"\
"Keyword Arguments:\n\n"\
"warriors -- list of two warriors\n"\
"rounds   -- number of rounds to fights (default 1)\n"\
"seed     -- position of the second warrior in the first fight\n"\
"            (default: a random value)\n\n"\
"The result of the fight is returned as a list with the format\n"\
"[[wins1, losses1, ties1], [wins2, losses2, ties2]].\n");

static PyObject *
MARS_94nop_run(MARS_94nop *self, PyObject *args, PyObject *kwds)
{
	PyObject *warriors;
	s32_t rounds = 1;
	s32_t seed = time(0); /* some "random" value */
	u32_t *result;
	PyObject *res;

	warrior_t *wlist;

	/* Get and check arguments. */
	static char *kwlist[] = {"warriors", "rounds", "seed", NULL};
	if (!PyArg_ParseTupleAndKeywords(args, kwds, "O|ii", kwlist,
					 &warriors, &rounds, &seed)) {
		return NULL;
	}
	if (PySequence_Check(warriors) == 0) {
		PyErr_SetString(PyExc_ValueError, "List of warriors needed.");
		return NULL;
	}
	if (PySequence_Size(warriors) != 2) {
		PyErr_SetString(PyExc_ValueError,
				"Exactly two warriors are needed "\
				"to run a fight.");
		return NULL;
	}
	if (rounds < 1) {
		PyErr_SetString(PyExc_ValueError, "Invalid number of rounds.");
		return NULL;
	}
	if (seed < 0) {
		PyErr_SetString(PyExc_ValueError, "Invalid seed.");
		return NULL;
	}
	if (seed < self->mindistance) {
		PyErr_SetString(PyExc_ValueError, "Position of second "\
				"warrior cannot be smaller than minimal "\
				"warrior distance.");
		return NULL;
	}
	
	/* Try to convert warriors into internal format. */
	wlist = get_warriors94(warriors, 2, self->maxlength);
	if (wlist == NULL) {
		PyErr_SetString(PyExc_ValueError, "Couldn't load warriors.");
		return NULL;
	}

	/* Run all fights. */
	result = run_94nop(self->core, wlist, self->coresize,
			   self->maxprocesses, self->maxcycles,
			   self->mindistance, rounds, seed);

	/* Build results. */
	res = Py_BuildValue("[[lll][lll]]", result[0], result[1], result[2],
			    result[1], result[0], result[2]);
	if (res == NULL) {
		free_warriors(wlist, 2);
		free(result);
		return NULL;
	}
	Py_INCREF(res);
		
	/* Clean up. */
	free_warriors(wlist, 2);
	free(result);
	
	return res;
}

PyDoc_STRVAR(MARS_94nop_p_run__doc__,
"p_run(warriors) -> List\n\n"\
"Run a two warrior fight with all possible start positions.\n\n"\
"Keyword Arguments:\n\n"\
"warriors -- list of two warriors\n\n"\
"2 * (CORESIZE - MINDISTANCE + 1) rounds are run. This might take a long\n"\
"time for larger cores! The result of the fights is returned as a list\n"\
"with the format [[wins1, losses1, ties1], [wins2, losses2, ties2]].");

static PyObject *
MARS_94nop_p_run(MARS_94nop *self, PyObject *args, PyObject *kwds)
{
	PyObject *warriors;
	u32_t *result;
	PyObject *res;
	warrior_t *wlist;

	/* Get and check arguments. */
	static char *kwlist[] = {"warriors", NULL};
	if (!PyArg_ParseTupleAndKeywords(args, kwds, "O", kwlist,
				         &warriors)) {
		return NULL;
	}
	if (PySequence_Check(warriors) == 0) {
		PyErr_SetString(PyExc_ValueError, "List of warriors needed.");
		return NULL;
	}
	if (PySequence_Size(warriors) != 2) {
		PyErr_SetString(PyExc_ValueError,
				"Exactly two warriors are needed "\
				"to run a fight.");
		return NULL;
	}
	
	/* Try to convert warriors into internal format. */
	wlist = get_warriors94(warriors, 2, self->maxlength);
	if (wlist == NULL) {
		PyErr_SetString(PyExc_ValueError, "Couldn't load warriors.");
		return NULL;
	}

	/* Run all fights. */
	result = p_run_94nop(self->core, wlist, self->coresize,
			     self->maxprocesses, self->maxcycles,
			     self->mindistance);

	/* Build results. */
	res = Py_BuildValue("[[lll][lll]]", result[0], result[1], result[2],
			    result[1], result[0], result[2]);
	if (res == NULL) {
		free_warriors(wlist, 2);
		free(result);
		return NULL;
	}
	Py_INCREF(res);
		
	/* Clean up. */
	free_warriors(wlist, 2);
	free(result);
	
	return res;	
}

PyDoc_STRVAR(MARS_94nop_mw_run__doc__,
"mw_run(warriors, rounds, seed) -> List\n\n"\
"Run a multiwarrior fight.\n\n"\
"Keyword Arguments:\n\n"\
"warriors -- list of warriors\n"\
"rounds   -- number of rounds to fights (default 1)\n"\
"seed     -- seed for positioning the warriors (default: a random value)\n\n"\
"The result is returned as a list, in which each item has the following\n"\
"format: [wins[1], wins[2], win[3], ..., losses], where the index indicates\n"\
"the number of warriors that survived until the end.");

static PyObject *
MARS_94nop_mw_run(MARS_94nop *self, PyObject *args, PyObject *kwds)
{
	PyObject *warriors;
	s32_t rounds = 1;
	s32_t seed = time(0); /* some "random" value */
	u32_t *result;
	PyObject *res;
	u32_t numwarriors;
	warrior_t *wlist;

	PyObject *tmp;
	PyObject *value;
	u32_t i;
	u32_t j;

	/* Get and check arguments. */
	static char *kwlist[] = {"warriors", "rounds", "seed", NULL};
	if (!PyArg_ParseTupleAndKeywords(args, kwds, "O|ii", kwlist,
					 &warriors, &rounds, &seed)) {
		return NULL;
	}
	if (PySequence_Check(warriors) == 0) {
		PyErr_SetString(PyExc_ValueError, "List of warriors needed.");
		return NULL;
	}
	numwarriors = PySequence_Size(warriors);
	if (numwarriors < 2) {
		PyErr_SetString(PyExc_ValueError,
				"At least two warriors are needed "\
				"to run a multiwarrior fight.");
		return NULL;
	}
	if (self->coresize < numwarriors * self->mindistance) {
		PyErr_SetString(PyExc_ValueError,
				"All warriors do not fit into the core.");
		return NULL;
	}
	if (rounds < 1) {
		PyErr_SetString(PyExc_ValueError, "Invalid number of rounds.");
		return NULL;
	}
	if (seed < 0) {
		PyErr_SetString(PyExc_ValueError, "Invalid seed.");
		return NULL;
	}
	if (seed < self->mindistance) {
		PyErr_SetString(PyExc_ValueError, "Position of second "\
				"warrior cannot be smaller than minimal "\
				"warrior distance.");
		return NULL;
	}
	
	/* Try to convert warriors into internal format. */
	wlist = get_warriors94(warriors, numwarriors, self->maxlength);
	if (wlist == NULL) {
		PyErr_SetString(PyExc_ValueError, "Couldn't load warriors.");
		return NULL;
	}

	/* Run all fights. */
	result = mw_run_94nop(self->core, numwarriors, wlist, self->coresize,
			      self->maxprocesses, self->maxcycles,
			      self->mindistance, rounds, seed);

	/* Partial cleanup. */
	free_warriors(wlist, numwarriors);
	
	/* Build results. */
	res = PyList_New(numwarriors);
	if (res == NULL) {
		free(result);
		return NULL;
	}
	for (i = 0; i < numwarriors; i++) {
		tmp = PyList_New(numwarriors + 1);
		if (tmp == NULL) {
			/* Free already generated items. */
			Py_DECREF(res);
			free(result);
			return NULL;
		}
		PyList_SetItem(res, i, tmp);
		for (j = 0; j < numwarriors + 1; j++) {
			value = py3long_or_py2int_from_long(result[i*(numwarriors+1)+j]);
			PyList_SetItem(tmp, j, value);
		}
	}
		
	/* Clean up. */
	free(result);
	
	return res;
}

static PyMemberDef MARS_94nop_members[] = {
	{NULL}	/* sentinel */
};

static PyMethodDef MARS_94nop_methods[] = {
	{"run", (PyCFunction)MARS_94nop_run, METH_VARARGS | METH_KEYWORDS,
	 MARS_94nop_run__doc__},
	{"p_run", (PyCFunction)MARS_94nop_p_run, METH_VARARGS | METH_KEYWORDS,
	 MARS_94nop_p_run__doc__},
	{"mw_run", (PyCFunction)MARS_94nop_mw_run, METH_VARARGS | METH_KEYWORDS,
	 MARS_94nop_mw_run__doc__},
	{NULL, NULL, 0, NULL} /* sentinel */
};

static PyGetSetDef MARS_94nop_getseters[] = {
	{"coresize", (getter)MARS_94nop_GetCoresize, NULL,
	 MARS_94nop_coresize__doc__, NULL},
	{"maxprocesses", (getter)MARS_94nop_GetMaxprocesses, NULL,
	 MARS_94nop_maxprocesses__doc__, NULL},
	{"maxcycles", (getter)MARS_94nop_GetMaxcycles, NULL,
	 MARS_94nop_maxcycles__doc__, NULL},
	{"mindistance", (getter)MARS_94nop_GetMindistance, NULL,
	 MARS_94nop_mindistance__doc__, NULL},
	{"maxlength", (getter)MARS_94nop_GetMaxlength, NULL,
	 MARS_94nop_maxlength__doc__, NULL},
	{NULL} /* sentinel */
};

static PyTypeObject MARS_94nopType = {
	PyVarObject_HEAD_INIT(NULL, 0) 			/*ob_size*/
	"Corewar.Benchmarking.MARS_94nop",		/*tp_name*/
	sizeof(MARS_94nop),			 	/*tp_basicsize*/
	0,                         			/*tp_itemsize*/
	(destructor)MARS_94nop_dealloc,		  	/*tp_dealloc*/
	0,						/*tp_print*/
	0,						/*tp_getattr*/
	0,						/*tp_setattr*/
	0,						/*tp_compare*/
	0,						/*tp_repr*/
	0,						/*tp_as_number*/
	0,						/*tp_as_sequence*/
	0,						/*tp_as_mapping*/
	0,						/*tp_hash */
	0,						/*tp_call*/
	0,						/*tp_str*/
	0,						/*tp_getattro*/
	0,						/*tp_setattro*/
	0,						/*tp_as_buffer*/
	Py_TPFLAGS_DEFAULT | Py_TPFLAGS_BASETYPE,	/*tp_flags*/
	MARS_94nop__doc__,				/*tp_doc */
	0,						/*tp_traverse */
	0,						/*tp_clear */
	0,						/*tp_richcompare */
	0,						/*tp_weaklistoffset */
	0,						/*tp_iter */
	0,						/*tp_iternext */
	MARS_94nop_methods,				/*tp_methods */
	MARS_94nop_members,				/*tp_members */
	MARS_94nop_getseters,				/*tp_getset */
	0,						/*tp_base */
	0,						/*tp_dict */
	0,						/*tp_descr_get */
	0,						/*tp_descr_set */
	0,						/*tp_dictoffset */
	0,						/*tp_init */
	0,						/*tp_alloc */
	MARS_94nop_new,					/*tp_new */
};

static PyMethodDef module_methods[] = {
	{NULL} /* sentinel */
};

#ifndef PyMODINIT_FUNC
#define PyMODINIT_FUNC void
#endif

PyDoc_STRVAR(module__doc__,
"Package for benchmarking warriors\n\n"\
"Classes:\n\n"\
"  MARS_88    -- MARS with ICWS '88 rules\n"\
"  MARS_94nop -- MARS with ICWS '94 draft rules (no P-Space)");

#if PY_MAJOR_VERSION >= 3
static struct PyModuleDef module_def = {
    PyModuleDef_HEAD_INIT,
    "Corewar.Benchmarking",     /* m_name */
    module__doc__,  /* m_doc */
    -1,                  /* m_size */
    module_methods,    /* m_methods */
    NULL,                /* m_reload */
    NULL,                /* m_traverse */
    NULL,                /* m_clear */
    NULL,                /* m_free */
};
PyMODINIT_FUNC
PyInit_Benchmarking(void)
{
	PyObject *m;

	if (PyType_Ready(&MARS_88Type) < 0) {
		return NULL;
	}

	if (PyType_Ready(&MARS_94nopType) < 0) {
		return NULL;
	}
	
    m = PyModule_Create(&module_def);
	if (m == NULL) {
		return NULL;
	}
	
	Py_INCREF(&MARS_88Type);
	PyModule_AddObject(m, "MARS_88", (PyObject *) &MARS_88Type);

	Py_INCREF(&MARS_94nopType);
	PyModule_AddObject(m, "MARS_94nop", (PyObject *) &MARS_94nopType);

    return m;
}
#else

PyMODINIT_FUNC
initBenchmarking(void)
{
	PyObject *m;

	if (PyType_Ready(&MARS_88Type) < 0) {
		return;
	}

	if (PyType_Ready(&MARS_94nopType) < 0) {
		return;
	}
	
	m = Py_InitModule3("Corewar.Benchmarking", module_methods,
			   module__doc__);
	if (m == NULL) {
		return;
	}
	
	Py_INCREF(&MARS_88Type);
	PyModule_AddObject(m, "MARS_88", (PyObject *) &MARS_88Type);

	Py_INCREF(&MARS_94nopType);
	PyModule_AddObject(m, "MARS_94nop", (PyObject *) &MARS_94nopType);
}
#endif
