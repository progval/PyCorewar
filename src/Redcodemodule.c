/* Redcodemodule.c - Classes for representing Redcode instructions
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
#include <MyTypes.h>
#include <Instruction.h>

#if PY_MAJOR_VERSION >= 3
    #define py3long_or_py2int_from_long PyLong_FromLong
#else
    #define py3long_or_py2int_from_long PyInt_FromLong
#endif

/*
 * ATTENTION! Be sure to use the same order as in Instruction.h.
 */
static char *INSTRUCTIONS88[] = {"DAT", "MOV", "ADD", "SUB", "JMP", "JMZ",
				"JMN", "DJN", "CMP", "SPL", "SLT"};
static char *MODES88 = "$#@<";

static char *INSTRUCTIONS[] = {"DAT", "MOV", "ADD", "SUB", "JMP", "JMZ",
			       "JMN", "DJN", "SEQ", "SPL", "SLT", "MUL",
			       "DIV", "MOD", "SNE", "NOP", "LDP", "STP"};
static char *MODIFIERS[] = {"F ", "A ", "B ", "AB", "BA", "X ", "I "};
static char *MODES = "$#@<>*{}";

typedef struct {
	PyObject_HEAD
	u32_t coresize; /* size of core */
	insn_t insn; /* the instruction itself */
} Instruction88;

typedef struct {
	PyObject_HEAD
	u32_t coresize; /* size of core */
	insn_t insn; /* the instruction itself */
} Instruction;

static PyTypeObject Instruction88Type;
static PyTypeObject InstructionType;

/*
 * class Instruction88
 */

PyDoc_STRVAR(Instruction88__doc__,
"Redcode instruction according to ICWS '88\n\n"\
"Methods:\n\n"\
"  copy() -- create a copy (clone) of the instruction\n"\
"  reinit() -- reset to default, i.e. DAT $ 0, $ 0\n\n"\
"Attributes:\n\n"\
"  opcode -- opcode of instruction\n"\
"  amode -- A-mode\n"\
"  afield -- A-field (value is always reduced mod CORESIZE)\n"\
"  bmode -- B-mode\n"\
"  bfield -- B-field (value is always reduced mod CORESIZE)");

static PyObject *
Instruction88_new(PyTypeObject *type, PyObject *args, PyObject *kwds)
{
	Instruction88 *self;
	s32_t coresize = 8000;
  PyObject *state;

  /* Check for invocation from pickle with __getstate__ state. */
  if (PyTuple_GET_SIZE(args) == 4) {
    s32_t coresize;
    s32_t insn;
    s32_t a;
    s32_t b;

    /* Get and check coresize. */
#if PY_MAJOR_VERSION >= 3
    if (PyLong_Check(state = PyTuple_GET_ITEM(args, 0))) {
      coresize = PyLong_AsLong(state);
#else
    if (PyInt_Check(state = PyTuple_GET_ITEM(args, 0))) {
      coresize = PyInt_AsLong(state);
#endif
      if ((coresize < 1) || (coresize > MAX_CORESIZE)) {
        PyErr_SetString(PyExc_ValueError, "Bad "\
                        "coresize state");
        return NULL;
      }
    } else {
      PyErr_SetString(PyExc_TypeError, "Bad coresize state");
      return NULL;
    }

    /* Get and check opcode/modifier/A-mode/B-mode. */
#if PY_MAJOR_VERSION >= 3
    if (PyLong_Check(state = PyTuple_GET_ITEM(args, 1))) {
      insn = PyLong_AsLong(state);
#else
    if (PyInt_Check(state = PyTuple_GET_ITEM(args, 1))) {
      insn = PyInt_AsLong(state);
#endif
      if ((insn < 0) ||
          (insn > INSN(0x11, 0x06, 0x07, 0x07))) {
        PyErr_SetString(PyExc_ValueError, "Bad "\
                        "instruction state");
        return NULL;
      }
    } else {
      PyErr_SetString(PyExc_TypeError,
                      "Bad instruction state");
      return NULL;
    }

    /* Get and check A-field. */

#if PY_MAJOR_VERSION >= 3
    if (PyLong_Check(state = PyTuple_GET_ITEM(args, 2))) {
      a = PyLong_AsLong(state);
#else
    if (PyInt_Check(state = PyTuple_GET_ITEM(args, 2))) {
      a = PyInt_AsLong(state);
#endif
      if ((a < 0) || (a >= coresize)) {
        PyErr_SetString(PyExc_ValueError, "Bad "\
                        "A-field state");
        return NULL;
      }
    } else {
      PyErr_SetString(PyExc_TypeError, "Bad A-field state");
      return NULL;
    }

    /* Get and check B-field. */
#if PY_MAJOR_VERSION >= 3
    if (PyLong_Check(state = PyTuple_GET_ITEM(args, 3))) {
      b = PyLong_AsLong(state);
#else
    if (PyInt_Check(state = PyTuple_GET_ITEM(args, 3))) {
      b = PyInt_AsLong(state);
#endif
      if ((b < 0) || (b >= coresize)) {
        PyErr_SetString(PyExc_ValueError, "Bad "\
                        "B-field state");
        return NULL;
      }
    } else {
      PyErr_SetString(PyExc_TypeError, "Bad B-field state");
      return NULL;
    }

  }
	/* get coresize */
	static char *kwlist[] = {"coresize", NULL};
	PyArg_ParseTupleAndKeywords(args, kwds, "|i", kwlist, &coresize);

	if (coresize < 1) {
		PyErr_SetString(PyExc_ValueError, "Invalid coresize");
		return NULL;
	}

	self = (Instruction88 *) type->tp_alloc(type, 0);
	if (self != NULL) {
		self->coresize = coresize;
		self->insn.insn = INSN88(DAT, DIRECT, DIRECT);
		self->insn.a = 0;
		self->insn.b = 0;
	}

	return (PyObject *) self;
}

static void 
Instruction88_dealloc(Instruction88 *self)
{
	Py_TYPE(self)->tp_free((PyObject*) self);
}

PyDoc_STRVAR(opcode88__doc__,
"Opcode of the instruction");

static PyObject *
Instruction88_GetOpcode(Instruction88 *self, void *closure)
{
#if PY_MAJOR_VERSION >= 3
	PyObject *opcode = PyLong_FromLong(OPCODE88(self->insn.insn));
#else
	PyObject *opcode = py3long_or_py2int_from_long(OPCODE88(self->insn.insn));
#endif

	if (opcode == NULL) {
		return NULL;
	}
	Py_INCREF(opcode);

	return opcode;
}

static int
Instruction88_SetOpcode(Instruction88 *self, PyObject *value, void *closure)
{
	s32_t opcode;

	/* plausibility checks */
#if PY_MAJOR_VERSION >= 3
	if (!PyLong_Check(value)) {
#else
	if (!PyInt_Check(value)) {
#endif
		PyErr_SetString(PyExc_TypeError, "Invalid opcode");
		return -1;
	}

	/* get value */
	opcode = PyLong_AsLong(value);

	if ((opcode < DAT) || (opcode > SLT)) {
		PyErr_SetString(PyExc_ValueError,
				"Invalid or unknown opcode according "\
				"to ICWS '88 rules");
		return -1;
	}

	self->insn.insn = SETOPCODE88(self->insn.insn, opcode);

	return 0;
}

PyDoc_STRVAR(amode88__doc__,
"A-mode of instruction");

static PyObject *
Instruction88_GetAMode(Instruction88 *self, void *closure)
{
#if PY_MAJOR_VERSION >= 3
	PyObject *amode = PyLong_FromLong(AMODE88(self->insn.insn));
#else
	PyObject *amode = py3long_or_py2int_from_long(AMODE88(self->insn.insn));
#endif

	if (amode == NULL) {
		return NULL;
	}
	Py_INCREF(amode);

	return amode;
}

static int
Instruction88_SetAMode(Instruction88 *self, PyObject *value, void *closure)
{
	s32_t amode;

	/* plausibility checks */
#if PY_MAJOR_VERSION >= 3
	if (!PyLong_Check(value)) {
#else
	if (!PyInt_Check(value)) {
#endif
		PyErr_SetString(PyExc_TypeError, "Invalid A-mode");
		return -1;
	}

	/* get value */
	amode = PyLong_AsLong(value);

	if ((amode < DIRECT) || (amode > PREDECREMENT)) {
		PyErr_SetString(PyExc_ValueError,
				"Invalid or unknown A-mode according "\
				"to ICWS '88 rules");
		return -1;
	}

	self->insn.insn = SETAMODE88(self->insn.insn, amode);

	return 0;
}

PyDoc_STRVAR(bmode88__doc__,
"B-mode of instruction");

static PyObject *
Instruction88_GetBMode(Instruction88 *self, void *closure)
{
#if PY_MAJOR_VERSION >= 3
	PyObject *bmode = PyLong_FromLong(BMODE88(self->insn.insn));
#else
	PyObject *bmode = py3long_or_py2int_from_long(BMODE88(self->insn.insn));
#endif

	if (bmode == NULL) {
		return NULL;
	}
	Py_INCREF(bmode);

	return bmode;
}

static int
Instruction88_SetBMode(Instruction88 *self, PyObject *value, void *closure)
{
	s32_t bmode;

	/* plausibility checks */
#if PY_MAJOR_VERSION >= 3
	if (!PyLong_Check(value)) {
#else
	if (!PyInt_Check(value)) {
#endif
		PyErr_SetString(PyExc_TypeError, "Invalid B-mode");
		return -1;
	}

	/* get value */
	bmode = PyLong_AsLong(value);

	if ((bmode < DIRECT) || (bmode > PREDECREMENT)) {
		PyErr_SetString(PyExc_ValueError,
				"Invalid or unknown B-mode according "\
				"to ICWS '88 rules");
		return -1;
	}

	self->insn.insn = SETBMODE88(self->insn.insn, bmode);

	return 0;
}

PyDoc_STRVAR(afield88__doc__,
"A-field of instruction\n\n"\
"Values are reduced module CORESIZE!");

static PyObject *
Instruction88_GetAField(Instruction88 *self, void *closure)
{
#if PY_MAJOR_VERSION >= 3
	PyObject *afield = PyLong_FromLong(self->insn.a);
#else
	PyObject *afield = py3long_or_py2int_from_long(self->insn.a);
#endif

	if (afield == NULL) {
		return NULL;
	}
	Py_INCREF(afield);

	return afield;
}

static int
Instruction88_SetAField(Instruction88 *self, PyObject *value, void *closure)
{
	s32_t tmp;

	/* plausibility checks */
#if PY_MAJOR_VERSION >= 3
	if (!PyLong_Check(value)) {
#else
	if (!PyInt_Check(value)) {
#endif
		PyErr_SetString(PyExc_TypeError, "A-field must be an integer");
		return -1;
	}

#if PY_MAJOR_VERSION >= 3
	tmp = PyLong_AsLong(value);
#else
	tmp = PyInt_AsLong(value);
#endif
	if (tmp < 0) {
		tmp = self->coresize - (abs(tmp) % self->coresize);
	}
	self->insn.a = tmp % self->coresize;

	return 0;
}

PyDoc_STRVAR(bfield88__doc__,
"B-field of instruction\n\n"\
"Values are reduced module CORESIZE!");

static PyObject *
Instruction88_GetBField(Instruction88 *self, void *closure)
{
#if PY_MAJOR_VERSION >= 3
	PyObject *bfield = PyLong_FromLong(self->insn.b);
#else
	PyObject *bfield = py3long_or_py2int_from_long(self->insn.b);
#endif

	if (bfield == NULL) {
		return NULL;
	}
	Py_INCREF(bfield);

	return bfield;
}

static int
Instruction88_SetBField(Instruction88 *self, PyObject *value, void *closure)
{
	s32_t tmp;

	/* plausibility checks */
#if PY_MAJOR_VERSION >= 3
	if (!PyLong_Check(value)) {
#else
	if (!PyInt_Check(value)) {
#endif
		PyErr_SetString(PyExc_TypeError, "B-field must be an integer");
		return -1;
	}

#if PY_MAJOR_VERSION >= 3
	tmp = PyLong_AsLong(value);
#else
	tmp = PyInt_AsLong(value);
#endif
	if (tmp < 0) {
		tmp = self->coresize - (abs(tmp) % self->coresize);
	}
	self->insn.b = tmp % self->coresize;

	return 0;
}

static PyObject *
Instruction88_richcompare(Instruction88 *obj1, Instruction88 *obj2, int op)
{
	u32_t isEqual;
	PyObject *result;

	isEqual = obj1->insn.insn == obj2->insn.insn &&
		  obj1->insn.a == obj2->insn.a &&
		  obj1->insn.b == obj2->insn.b;

	if (op == Py_EQ) {
		result = isEqual ? Py_True : Py_False;
		Py_INCREF(result);
		return result;
	}

	if (op == Py_NE) {
		result = isEqual ? Py_False : Py_True;
		Py_INCREF(result);
		return result;
	}

	PyErr_SetString(PyExc_NotImplementedError,
			"Can only test, whether an instruction is equal "\
			"to another or not.");
	return NULL;
}

static PyObject *
Instruction88_repr(Instruction88 *self)
{
	PyObject *result;
	char buffer[33];
	int afield;
	int bfield;

	afield = self->insn.a;
	if (afield > self->coresize/2) {
		afield -= self->coresize;
	}

	bfield = self->insn.b;
	if (bfield > self->coresize/2) {
		bfield -= self->coresize;
	}

	if (self->coresize < 2*100000) {
		snprintf(buffer, 33, "%s    %c%6d, %c%6d", 
			 INSTRUCTIONS88[OPCODE88(self->insn.insn)],
			 MODES88[AMODE88(self->insn.insn)], afield,
			 MODES88[BMODE88(self->insn.insn)], bfield);
	} else {
		snprintf(buffer, 33, "%s    %c%11d, %c%11d", 
			 INSTRUCTIONS88[OPCODE88(self->insn.insn)],
			 MODES88[AMODE88(self->insn.insn)], afield,
			 MODES88[BMODE88(self->insn.insn)], bfield);
	}

	/* build result */
#if PY_MAJOR_VERSION >= 3
	result = PyUnicode_FromString(buffer);
#else
	result = PyString_FromString(buffer);
#endif

	return result;
}

PyDoc_STRVAR(copy88__doc__,
"copy() -> Instruction88\n\n"\
"Return a copy (clone) of the instruction.");

static PyObject *
Instruction88_copy(Instruction88 *self)
{
	Instruction88 *insn_copy;

	insn_copy = PyObject_New(Instruction88, &Instruction88Type);
	if (insn_copy == NULL) {
		return NULL;
	}

	/* copy values */
	insn_copy->coresize = self->coresize;
	insn_copy->insn.insn = self->insn.insn;
	insn_copy->insn.a = self->insn.a;
	insn_copy->insn.b = self->insn.b;

	return (PyObject*) insn_copy;
}

PyDoc_STRVAR(reinit88__doc__,
"reinit() -> None\n\n"\
"Reset instruction to default values (DAT $ 0, $ 0).");

static PyObject *
Instruction88_reinit(Instruction88 *self)
{
	self->insn.insn = INSN88(DAT, DIRECT, DIRECT);
	self->insn.a = 0;
	self->insn.b = 0;

	Py_INCREF(Py_None);
	return Py_None;
}

/* Pickle support. */

static PyObject *
  Instruction88_getstate(Instruction88 *self)
{
  return Py_BuildValue("kkkk", self->coresize, self->insn.insn,
                       self->insn.a, self->insn.b);
}

static PyObject *
  Instruction88_reduce(Instruction88 *self)
{
  return Py_BuildValue("(ON)", Py_TYPE(self),
                       Instruction88_getstate(self));
}

static PyMemberDef Instruction88_members[] = {
	{NULL} /* sentinel */
};

static PyMethodDef Instruction88_methods[] = {
	{"copy", (PyCFunction)Instruction88_copy, METH_NOARGS, copy88__doc__},
	{"reinit", (PyCFunction)Instruction88_reinit, METH_NOARGS,
	 reinit88__doc__},
  {"__reduce__", (PyCFunction)Instruction88_reduce, METH_NOARGS,
   PyDoc_STR("__reduce__() -> (cls, state)")},
	{NULL, NULL, 0, NULL} /* sentinel */
};

static PyGetSetDef Instruction88_getseters[] = {
	{"opcode", (getter)Instruction88_GetOpcode,
	 (setter)Instruction88_SetOpcode, opcode88__doc__, NULL},
	{"amode", (getter)Instruction88_GetAMode,
	 (setter)Instruction88_SetAMode, amode88__doc__, NULL},
	{"afield", (getter)Instruction88_GetAField,
	 (setter)Instruction88_SetAField, afield88__doc__, NULL},
	{"bmode", (getter)Instruction88_GetBMode,
	 (setter)Instruction88_SetBMode, bmode88__doc__, NULL},
	{"bfield", (getter)Instruction88_GetBField,
	 (setter)Instruction88_SetBField, bfield88__doc__, NULL},
	{NULL} /* sentinel */
};

static PyTypeObject Instruction88Type = {
	PyVarObject_HEAD_INIT(NULL, 0) 			/*ob_size*/
	"Corewar.Redcode.Instruction88",			/*tp_name*/
	sizeof(Instruction88),		 	  	/*tp_basicsize*/
	0,                         			/*tp_itemsize*/
	(destructor)Instruction88_dealloc,	  	/*tp_dealloc*/
	0,						/*tp_print*/
	0,						/*tp_getattr*/
	0,						/*tp_setattr*/
	0,						/*tp_compare*/
	(reprfunc)Instruction88_repr,			/*tp_repr*/
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
	Instruction88__doc__,				/*tp_doc */
	0,						/*tp_traverse */
	0,						/*tp_clear */
	(richcmpfunc)Instruction88_richcompare,		/*tp_richcompare */
	0,						/*tp_weaklistoffset */
	0,						/*tp_iter */
	0,						/*tp_iternext */
	Instruction88_methods,				/*tp_methods */
	Instruction88_members,				/*tp_members */
	Instruction88_getseters,			/*tp_getset */
	0,						/*tp_base */
	0,						/*tp_dict */
	0,						/*tp_descr_get */
	0,						/*tp_descr_set */
	0,						/*tp_dictoffset */
	0,						/*tp_init */
	0,						/*tp_alloc */
	Instruction88_new,				/*tp_new */
};

/*
 * class Instruction
 */

PyDoc_STRVAR(Instruction__doc__,
"Redcode instruction according to ICWS '94 draft with pMARS extension\n\n"\
"Methods:\n\n"\
"  copy() -- create a copy (clone) of the instruction\n"\
"  reinit() -- reset to default, i.e. DAT.F $ 0, $ 0\n\n"\
"Attributes:\n\n"\
"  opcode -- opcode of instruction\n"\
"  modifier -- modifer of instruction\n"\
"  amode -- A-mode\n"\
"  afield -- A-field (value is always reduced mod CORESIZE)\n"\
"  bmode -- B-mode\n"\
"  bfield -- B-field (value is always reduced mod CORESIZE)");

static PyObject *
Instruction_new(PyTypeObject *type, PyObject *args, PyObject *kwds)
{
	Instruction *self;
  PyObject *state;
  s32_t coresize = 8000;

  /* Check for invocation from pickle with __getstate__ state. */
  if (PyTuple_GET_SIZE(args) == 4) {
    s32_t coresize;
    s32_t insn;
    s32_t a;
    s32_t b;

    /* Get and check coresize. */
#if PY_MAJOR_VERSION >= 3
    if (PyLong_Check(state = PyTuple_GET_ITEM(args, 0))) {
      coresize = PyLong_AsLong(state);
#else
    if (PyInt_Check(state = PyTuple_GET_ITEM(args, 0))) {
      coresize = PyInt_AsLong(state);
#endif
      if ((coresize < 1) || (coresize > MAX_CORESIZE)) {
        PyErr_SetString(PyExc_ValueError, "Bad "\
                        "coresize state");
        return NULL;
      }
    } else {
      PyErr_SetString(PyExc_TypeError, "Bad coresize state");
      return NULL;
    }

    /* Get and check opcode/modifier/A-mode/B-mode. */
#if PY_MAJOR_VERSION >= 3
    if (PyLong_Check(state = PyTuple_GET_ITEM(args, 1))) {
      insn = PyLong_AsLong(state);
#else
    if (PyInt_Check(state = PyTuple_GET_ITEM(args, 1))) {
      insn = PyInt_AsLong(state);
#endif
      if ((insn < 0) ||
          (insn > INSN(0x11, 0x06, 0x07, 0x07))) {
        PyErr_SetString(PyExc_ValueError, "Bad "\
                        "instruction state");
        return NULL;
      }
    } else {
      PyErr_SetString(PyExc_TypeError,
                      "Bad instruction state");
      return NULL;
    }

    /* Get and check A-field. */

#if PY_MAJOR_VERSION >= 3
    if (PyLong_Check(state = PyTuple_GET_ITEM(args, 2))) {
      a = PyLong_AsLong(state);
#else
    if (PyInt_Check(state = PyTuple_GET_ITEM(args, 2))) {
      a = PyInt_AsLong(state);
#endif
      if ((a < 0) || (a >= coresize)) {
        PyErr_SetString(PyExc_ValueError, "Bad "\
                        "A-field state");
        return NULL;
      }
    } else {
      PyErr_SetString(PyExc_TypeError, "Bad A-field state");
      return NULL;
    }

    /* Get and check B-field. */
#if PY_MAJOR_VERSION >= 3
    if (PyLong_Check(state = PyTuple_GET_ITEM(args, 3))) {
      b = PyLong_AsLong(state);
#else
    if (PyInt_Check(state = PyTuple_GET_ITEM(args, 3))) {
      b = PyInt_AsLong(state);
#endif
      if ((b < 0) || (b >= coresize)) {
        PyErr_SetString(PyExc_ValueError, "Bad "\
                        "B-field state");
        return NULL;
      }
    } else {
      PyErr_SetString(PyExc_TypeError, "Bad B-field state");
      return NULL;
    }

    /* Build instruction. */
    self = (Instruction *) type->tp_alloc(type, 0);
    if (self != NULL) {
      self->coresize = coresize;
      self->insn.insn = insn;
      self->insn.a = a;
      self->insn.b = b;
    }

    return (PyObject *) self;
  }

	/* get coresize */
	static char *kwlist[] = {"coresize", NULL};
	PyArg_ParseTupleAndKeywords(args, kwds, "|i", kwlist, &coresize);

	if (coresize < 1) {
		PyErr_SetString(PyExc_ValueError, "Invalid coresize");
		return NULL;
	}

	self = (Instruction *) type->tp_alloc(type, 0);
	if (self != NULL) {
		self->coresize = coresize;
		self->insn.insn = INSN(DAT, MODIFIER_F, DIRECT, DIRECT);
		self->insn.a = 0;
		self->insn.b = 0;
	}

	return (PyObject *) self;
}

static void 
Instruction_dealloc(Instruction *self)
{
	Py_TYPE(self)->tp_free((PyObject*) self);
}

PyDoc_STRVAR(opcode__doc__,
"Opcode of the instruction");

static PyObject *
Instruction_GetOpcode(Instruction *self, void *closure)
{
	PyObject *opcode = py3long_or_py2int_from_long(OPCODE(self->insn.insn));

	if (opcode == NULL) {
		return NULL;
	}
	Py_INCREF(opcode);

	return opcode;
}

static int
Instruction_SetOpcode(Instruction *self, PyObject *value, void *closure)
{
	s32_t opcode;

	/* plausibility checks */
#if PY_MAJOR_VERSION >= 3
	if (!PyLong_Check(value)) {
#else
	if (!PyInt_Check(value)) {
#endif
		PyErr_SetString(PyExc_TypeError, "Invalid opcode");
		return -1;
	}

	/* get value */
	opcode = PyLong_AsLong(value);

	if ((opcode < DAT) || (opcode > STP)) {
		PyErr_SetString(PyExc_ValueError,
				"Unknown opcode according to ICWS '94 "\
				"draft (with pMARS extension) rules");
		return -1;
	}

	self->insn.insn = SETOPCODE(self->insn.insn, opcode);

	return 0;
}

PyDoc_STRVAR(modifier__doc__,
"Opcode modifier of instruction");

static PyObject *
Instruction_GetModifier(Instruction *self, void *closure)
{
	PyObject *modifier = py3long_or_py2int_from_long(MODIFIER(self->insn.insn));

	if (modifier == NULL) {
		return NULL;
	}
	Py_INCREF(modifier);

	return modifier;
}

static int
Instruction_SetModifier(Instruction *self, PyObject *value, void *closure)
{
	s32_t modifier;

	/* plausibility checks */
#if PY_MAJOR_VERSION >= 3
	if (!PyLong_Check(value)) {
#else
	if (!PyInt_Check(value)) {
#endif
		PyErr_SetString(PyExc_TypeError, "Invalid modifier");
		return -1;
	}

	/* get value */
	modifier = PyLong_AsLong(value);

	if ((modifier < MODIFIER_F) || (modifier > MODIFIER_I)) {
		PyErr_SetString(PyExc_ValueError,
				"Invalid or unknown modifier according "\
				"to ICWS '94 draft rules");
		return -1;
	}

	self->insn.insn = SETMODIFIER(self->insn.insn, modifier);

	return 0;
}

PyDoc_STRVAR(amode__doc__,
"A-mode of instruction");

static PyObject *
Instruction_GetAMode(Instruction88 *self, void *closure)
{
	PyObject *amode = py3long_or_py2int_from_long(AMODE(self->insn.insn));

	if (amode == NULL) {
		return NULL;
	}
	Py_INCREF(amode);

	return amode;
}

static int
Instruction_SetAMode(Instruction *self, PyObject *value, void *closure)
{
	s32_t amode;

	/* plausibility checks */
#if PY_MAJOR_VERSION >= 3
	if (!PyLong_Check(value)) {
#else
	if (!PyInt_Check(value)) {
#endif
		PyErr_SetString(PyExc_TypeError, "Invalid A-mode");
		return -1;
	}

	/* get value */
	amode = PyLong_AsLong(value);

	if ((amode < DIRECT) || (amode > A_POSTINCREMENT)) {
		PyErr_SetString(PyExc_ValueError,
				"Invalid or unknown A-mode according "\
				"to ICWS '94 draft rules");
		return -1;
	}

	self->insn.insn = SETAMODE(self->insn.insn, amode);

	return 0;
}

PyDoc_STRVAR(bmode__doc__,
"B-mode of instruction");

static PyObject *
Instruction_GetBMode(Instruction *self, void *closure)
{
	PyObject *bmode = py3long_or_py2int_from_long(BMODE(self->insn.insn));

	if (bmode == NULL) {
		return NULL;
	}
	Py_INCREF(bmode);

	return bmode;
}

static int
Instruction_SetBMode(Instruction *self, PyObject *value, void *closure)
{
	s32_t bmode;

	/* plausibility checks */
#if PY_MAJOR_VERSION >= 3
	if (!PyLong_Check(value)) {
#else
	if (!PyInt_Check(value)) {
#endif
		PyErr_SetString(PyExc_TypeError, "Invalid B-mode");
		return -1;
	}

	/* get value */
	bmode = PyLong_AsLong(value);

	if ((bmode < DIRECT) || (bmode > A_POSTINCREMENT)) {
		PyErr_SetString(PyExc_ValueError,
				"Invalid or unknown B-mode according "\
				"to ICWS '94 draft rules");
		return -1;
	}

	self->insn.insn = SETBMODE(self->insn.insn, bmode);

	return 0;
}

PyDoc_STRVAR(afield__doc__,
"A-field of instruction\n\n"\
"Values are reduced module CORESIZE!");

static PyObject *
Instruction_GetAField(Instruction *self, void *closure)
{
	PyObject *afield = py3long_or_py2int_from_long(self->insn.a);

	if (afield == NULL) {
		return NULL;
	}
	Py_INCREF(afield);

	return afield;
}

static int
Instruction_SetAField(Instruction *self, PyObject *value, void *closure)
{
	s32_t tmp;

	/* plausibility checks */
#if PY_MAJOR_VERSION >= 3
	if (!PyLong_Check(value)) {
#else
	if (!PyInt_Check(value)) {
#endif
		PyErr_SetString(PyExc_TypeError, "A-field must be an integer");
		return -1;
	}

#if PY_MAJOR_VERSION >= 3
	tmp = PyLong_AsLong(value);
#else
	tmp = PyInt_AsLong(value);
#endif
	if (tmp < 0) {
		tmp = self->coresize - (abs(tmp) % self->coresize);
	}
	self->insn.a = tmp % self->coresize;

	return 0;
}

PyDoc_STRVAR(bfield__doc__,
"B-field of instruction\n\n"\
"Values are reduced module CORESIZE!");

static PyObject *
Instruction_GetBField(Instruction *self, void *closure)
{
	PyObject *bfield = py3long_or_py2int_from_long(self->insn.b);

	if (bfield == NULL) {
		return NULL;
	}
	Py_INCREF(bfield);

	return bfield;
}

static int
Instruction_SetBField(Instruction *self, PyObject *value, void *closure)
{
	s32_t tmp;

	/* plausibility checks */
#if PY_MAJOR_VERSION >= 3
	if (!PyLong_Check(value)) {
#else
	if (!PyInt_Check(value)) {
#endif
		PyErr_SetString(PyExc_TypeError, "B-field must be an integer");
		return -1;
	}

#if PY_MAJOR_VERSION >= 3
	tmp = PyLong_AsLong(value);
#else
	tmp = PyInt_AsLong(value);
#endif
	if (tmp < 0) {
		tmp = self->coresize - (abs(tmp) % self->coresize);
	}
	self->insn.b = tmp % self->coresize;

	return 0;
}

static PyObject *
Instruction_richcompare(Instruction *obj1, Instruction *obj2, int op)
{
	u32_t isEqual;
	PyObject *result;

	isEqual = obj1->insn.insn == obj2->insn.insn &&
		  obj1->insn.a == obj2->insn.a &&
		  obj1->insn.b == obj2->insn.b;

	if (op == Py_EQ) {
		result = isEqual ? Py_True : Py_False;
		Py_INCREF(result);
		return result;
	}

	if (op == Py_NE) {
		result = isEqual ? Py_False : Py_True;
		Py_INCREF(result);
		return result;
	}

	PyErr_SetString(PyExc_NotImplementedError,
			"Can only test, whether an instruction is equal "\
			"to another or not.");
	return NULL;
}

static PyObject *
Instruction_repr(Instruction *self)
{
	PyObject *result;
	char buffer[33];
	int afield;
	int bfield;

	afield = self->insn.a;
	if (afield > self->coresize/2) {
		afield -= self->coresize;
	}

	bfield = self->insn.b;
	if (bfield > self->coresize/2) {
		bfield -= self->coresize;
	}

	if (self->coresize < 2*100000) {
		snprintf(buffer, 33, "%s.%s %c%6d, %c%6d", 
			 INSTRUCTIONS[OPCODE(self->insn.insn)],
			 MODIFIERS[MODIFIER(self->insn.insn)],
			 MODES[AMODE(self->insn.insn)], afield,
			 MODES[BMODE(self->insn.insn)], bfield);
	} else {
		snprintf(buffer, 33, "%s.%s %c%11d, %c%11d", 
			 INSTRUCTIONS[OPCODE(self->insn.insn)],
			 MODIFIERS[MODIFIER(self->insn.insn)],
			 MODES[AMODE(self->insn.insn)], afield,
			 MODES[BMODE(self->insn.insn)], bfield);
	}

	/* build result */
#if PY_MAJOR_VERSION >= 3
	result = PyUnicode_FromString(buffer);
#else
	result = PyString_FromString(buffer);
#endif

	return result;
}

PyDoc_STRVAR(copy__doc__,
"copy() -> Instruction\n\n"\
"Return a copy (clone) of the instruction.");

static PyObject *
Instruction_copy(Instruction *self)
{
	Instruction *insn_copy;

	insn_copy = PyObject_New(Instruction, &InstructionType);
	if (insn_copy == NULL) {
		return NULL;
	}

	/* copy values */
	insn_copy->coresize = self->coresize;
	insn_copy->insn.insn = self->insn.insn;
	insn_copy->insn.a = self->insn.a;
	insn_copy->insn.b = self->insn.b;

	return (PyObject*) insn_copy;
}

/* Pickle support. */

static PyObject *
  Instruction_getstate(Instruction *self)
{
  return Py_BuildValue("kkkk", self->coresize, self->insn.insn,
                       self->insn.a, self->insn.b);
}

static PyObject *
  Instruction_reduce(Instruction *self)
{
  return Py_BuildValue("(ON)", Py_TYPE(self),
                       Instruction_getstate(self));
}

PyDoc_STRVAR(reinit__doc__,
"reinit() -> None\n\n"\
"Reset instruction to default values (DAT.F $ 0, $ 0).");

static PyObject *
Instruction_reinit(Instruction88 *self)
{
	self->insn.insn = INSN(DAT, MODIFIER_F, DIRECT, DIRECT);
	self->insn.a = 0;
	self->insn.b = 0;

	Py_INCREF(Py_None);
	return Py_None;
}

static PyMemberDef Instruction_members[] = {
	{NULL} /* sentinel */
};

static PyMethodDef Instruction_methods[] = {
	{"copy", (PyCFunction)Instruction_copy, METH_NOARGS, copy__doc__},
	{"reinit", (PyCFunction)Instruction_reinit, METH_NOARGS,
	 reinit__doc__},
  {"__reduce__", (PyCFunction)Instruction_reduce, METH_NOARGS,
   PyDoc_STR("__reduce__() -> (cls, state)")},
	{NULL, NULL, 0, NULL} /* sentinel */
};

static PyGetSetDef Instruction_getseters[] = {
	{"opcode", (getter)Instruction_GetOpcode,
	 (setter)Instruction_SetOpcode, opcode__doc__, NULL},
	{"modifier", (getter)Instruction_GetModifier,
	 (setter)Instruction_SetModifier, modifier__doc__, NULL},
	{"amode", (getter)Instruction_GetAMode,
	 (setter)Instruction_SetAMode, amode__doc__, NULL},
	{"afield", (getter)Instruction_GetAField,
	 (setter)Instruction_SetAField, afield__doc__, NULL},
	{"bmode", (getter)Instruction_GetBMode,
	 (setter)Instruction_SetBMode, bmode__doc__, NULL},
	{"bfield", (getter)Instruction_GetBField,
	 (setter)Instruction_SetBField, bfield__doc__, NULL},
	{NULL} /* sentinel */
};

static PyTypeObject InstructionType = {
	PyVarObject_HEAD_INIT(NULL, 0) 			/*ob_size*/
	"Corewar.Redcode.Instruction",	 			/*tp_name*/
	sizeof(Instruction),		 	  	/*tp_basicsize*/
	0,                         			/*tp_itemsize*/
	(destructor)Instruction_dealloc,	  	/*tp_dealloc*/
	0,						/*tp_print*/
	0,						/*tp_getattr*/
	0,						/*tp_setattr*/
	0,						/*tp_compare*/
	(reprfunc)Instruction_repr,			/*tp_repr*/
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
	Instruction__doc__,				/*tp_doc */
	0,						/*tp_traverse */
	0,						/*tp_clear */
	(richcmpfunc)Instruction_richcompare,		/*tp_richcompare */
	0,						/*tp_weaklistoffset */
	0,						/*tp_iter */
	0,						/*tp_iternext */
	Instruction_methods,				/*tp_methods */
	Instruction_members,				/*tp_members */
	Instruction_getseters,				/*tp_getset */
	0,						/*tp_base */
	0,						/*tp_dict */
	0,						/*tp_descr_get */
	0,						/*tp_descr_set */
	0,						/*tp_dictoffset */
	0,						/*tp_init */
	0,						/*tp_alloc */
	Instruction_new,				/*tp_new */
};

static PyMethodDef module_methods[] = {
	{NULL} /* sentinel */
};

#ifndef PyMODINIT_FUNC
#define PyMODINIT_FUNC void
#endif

PyDoc_STRVAR(module__doc__,
"Redcode instructions\n\n"\
"Classes:\n\n"\
"  Intruction88 -- Redcode instruction according to ICWS '88 rules\n"\
"  Instruction  -- Redcode instruction according to ICWS '94 (with pMARS\n"\
"                  extensions) rules\n\n"\
"Integer constants:\n\n"\
"  OPCODE_DAT, OPCODE_MOV, OPCODE_ADD, OPCODE_SUB, OPCODE_JMP,\n"\
"  OPCODE_JMZ, OPCODE_JMN, OPCODE_DJN, OPCODE_CMP, OPCODE_SPL,\n"\
"  OPCODE_SLT, OPCODE_MUL, OPCODE_DIV, OPCODE_MOD, OPCODE_SEQ,\n"\
"  OPCODE_SNE, OPCODE_NOP, OPCODE_LDP, OPCODE_STP  -- opcodes\n"\
"  MODE_DIRECT, MODE_IMMEDIATE, MODE_INDIRECT, MODE_PREDECREMENT,\n"\
"  MODE_B_INDIRECT, MODE_B_PREDECREMENT, MODE_B_POSTINCREMENT,\n"\
"  MODE_A_INDIRECT, MODE_A_PREDECREMENT, MODE_A_POSTINCREMENT\n"\
"   -- addressing modes");

#if PY_MAJOR_VERSION >= 3
static struct PyModuleDef module_def = {
    PyModuleDef_HEAD_INIT,
    "Redcode",     /* m_name */
    module__doc__,  /* m_doc */
    -1,                  /* m_size */
    module_methods,    /* m_methods */
    NULL,                /* m_reload */
    NULL,                /* m_traverse */
    NULL,                /* m_clear */
    NULL,                /* m_free */
};
#endif

PyMODINIT_FUNC
#if PY_MAJOR_VERSION >= 3
PyInit_Redcode(void)
#else
initRedcode(void)
#endif
{
	PyObject *m;
	PyObject *d;

	if (PyType_Ready(&Instruction88Type) < 0 || PyType_Ready(&InstructionType) < 0) {
#if PY_MAJOR_VERSION >= 3
		return NULL;
#else
        return;
#endif
	}

	/* Initialize module. */	
#if PY_MAJOR_VERSION >= 3
    m = PyModule_Create(&module_def);
	if (m == NULL) {
		return NULL;
	}
#else
	m = Py_InitModule3("Redcode", module_methods, module__doc__);
	if (m == NULL) {
		return;
	}
#endif

	/* Add classes Instruction88, Instruction */
	Py_INCREF(&Instruction88Type);
	PyModule_AddObject(m, "Instruction88",
			   (PyObject *) &Instruction88Type);
	Py_INCREF(&InstructionType);
	PyModule_AddObject(m, "Instruction", (PyObject *) &InstructionType);

	/* Get dict of module. */
	d = PyModule_GetDict(m);
	if (d == NULL) {
#if PY_MAJOR_VERSION >= 3
		return NULL;
#else
		return;
#endif
	}

	/* Add instruction set of ICWS '88. */
	PyModule_AddIntConstant(m, "OPCODE_DAT", DAT);
	PyModule_AddIntConstant(m, "OPCODE_MOV", MOV);
	PyModule_AddIntConstant(m, "OPCODE_ADD", ADD);
	PyModule_AddIntConstant(m, "OPCODE_SUB", SUB);
	PyModule_AddIntConstant(m, "OPCODE_JMP", JMP);
	PyModule_AddIntConstant(m, "OPCODE_JMZ", JMZ);
	PyModule_AddIntConstant(m, "OPCODE_JMN", JMN);
	PyModule_AddIntConstant(m, "OPCODE_DJN", DJN);
	PyModule_AddIntConstant(m, "OPCODE_CMP", CMP);
	PyModule_AddIntConstant(m, "OPCODE_SPL", SPL);
	PyModule_AddIntConstant(m, "OPCODE_SLT", SLT);

	/* Add instruction set of ICWS '94 draft (without p-space). */
	PyModule_AddIntConstant(m, "OPCODE_MUL", MUL);
	PyModule_AddIntConstant(m, "OPCODE_DIV", DIV);
	PyModule_AddIntConstant(m, "OPCODE_MOD", MOD);
	PyModule_AddIntConstant(m, "OPCODE_SEQ", SEQ);
	PyModule_AddIntConstant(m, "OPCODE_SNE", SNE);
	PyModule_AddIntConstant(m, "OPCODE_NOP", NOP);

	/* Add instruction set of ICWS '94 draft. */
	PyModule_AddIntConstant(m, "OPCODE_LDP", LDP);
	PyModule_AddIntConstant(m, "OPCODE_STP", STP);

	/* Add addressing modes of ICWS '88. */
	PyModule_AddIntConstant(m, "MODE_IMMEDIATE", IMMEDIATE);
	PyModule_AddIntConstant(m, "MODE_DIRECT", DIRECT);
	PyModule_AddIntConstant(m, "MODE_INDIRECT", INDIRECT);
	PyModule_AddIntConstant(m, "MODE_PREDECREMENT", PREDECREMENT);

	/* Add addressing modes of ICWS '94 draft. */
	PyModule_AddIntConstant(m, "MODE_B_INDIRECT", B_INDIRECT);
	PyModule_AddIntConstant(m, "MODE_B_PREDECREMENT", B_PREDECREMENT);
	PyModule_AddIntConstant(m, "MODE_B_POSTINCREMENT", B_POSTINCREMENT);
	PyModule_AddIntConstant(m, "MODE_A_INDIRECT", A_INDIRECT);
	PyModule_AddIntConstant(m, "MODE_A_PREDECREMENT", A_PREDECREMENT);
	PyModule_AddIntConstant(m, "MODE_A_POSTINCREMENT", A_POSTINCREMENT);

	/* Add opcode modifiers of ICWS '94 draft. */
	PyModule_AddIntConstant(m, "MODIFIER_A", MODIFIER_A);
	PyModule_AddIntConstant(m, "MODIFIER_B", MODIFIER_B);
	PyModule_AddIntConstant(m, "MODIFIER_F", MODIFIER_F);
	PyModule_AddIntConstant(m, "MODIFIER_I", MODIFIER_I);
	PyModule_AddIntConstant(m, "MODIFIER_X", MODIFIER_X);
	PyModule_AddIntConstant(m, "MODIFIER_AB", MODIFIER_AB);
	PyModule_AddIntConstant(m, "MODIFIER_BA", MODIFIER_BA);

#if PY_MAJOR_VERSION >= 3
		return m;
#endif
}
