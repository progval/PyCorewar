/* _Debuggingmodule.c - Corewar._Debugging
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
#include <ProcessQueue.h>
#include <Core.h>

static PyMethodDef module_methods[] = {
	{NULL} /* sentinel */
};


PyDoc_STRVAR(module__doc__,
"FIXME");

#if PY_MAJOR_VERSION >= 3
static struct PyModuleDef module_def = {
    PyModuleDef_HEAD_INIT,
    "Corewar._Debugging",     /* m_name */
    module__doc__,  /* m_doc */
    -1,                  /* m_size */
    module_methods,    /* m_methods */
    NULL,                /* m_reload */
    NULL,                /* m_traverse */
    NULL,                /* m_clear */
    NULL,                /* m_free */
};
PyMODINIT_FUNC
PyInit__Debugging(void)
{
	PyObject *m;

	if (PyType_Ready(&ProcessQueueType) < 0) {
        return NULL;
	}
	if (PyType_Ready(&CoreType) < 0) {
        return NULL;
	}
	
    m = PyModule_Create(&module_def);
	if (m == NULL) {
        return NULL;
	}
	
	Py_INCREF(&ProcessQueueType);
	PyModule_AddObject(m, "ProcessQueue", (PyObject *) &ProcessQueueType);

	Py_INCREF(&CoreType);
	PyModule_AddObject(m, "Core", (PyObject *) &CoreType);

    return m;
}
#else

#ifndef PyMODINIT_FUNC
#define PyMODINIT_FUNC void
#endif

PyMODINIT_FUNC
init_Debugging(void)
{
	PyObject *m;

	if (PyType_Ready(&ProcessQueueType) < 0) {
        return;
	}
	if (PyType_Ready(&CoreType) < 0) {
        return;
	}
	
	m = Py_InitModule3("Corewar._Debugging", module_methods, module__doc__);
	if (m == NULL) {
        return;
	}
	
	Py_INCREF(&ProcessQueueType);
	PyModule_AddObject(m, "ProcessQueue", (PyObject *) &ProcessQueueType);

	Py_INCREF(&CoreType);
	PyModule_AddObject(m, "Core", (PyObject *) &CoreType);
}
#endif
