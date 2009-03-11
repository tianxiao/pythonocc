/*
##Copyright 2008-2009 Thomas Paviot
##
##thomas.paviot@free.fr
##
##pythonOCC is a computer program whose purpose is to provide a complete set
##of python bindings for OpenCascade library.
##
##This software is governed by the CeCILL license under French law and
##abiding by the rules of distribution of free software.  You can  use, 
##modify and/ or redistribute the software under the terms of the CeCILL
##license as circulated by CEA, CNRS and INRIA at the following URL
##"http://www.cecill.info". 
##
##As a counterpart to the access to the source code and  rights to copy,
##modify and redistribute granted by the license, users are provided only
##with a limited warranty  and the software's author,  the holder of the
##economic rights,  and the successive licensors  have only  limited
##liability. 
##
##In this respect, the user's attention is drawn to the risks associated
##with loading,  using,  modifying and/or developing or reproducing the
##software by the user in light of its specific status of free software,
##that may mean  that it is complicated to manipulate,  and  that  also
##therefore means  that it is reserved for developers  and  experienced
##professionals having in-depth computer knowledge. Users are therefore
##encouraged to load and test the software's suitability as regards their
##requirements in conditions enabling the security of their systems and/or 
##data to be ensured and,  more generally, to use and operate it in the 
##same conditions as regards security. 
##
##The fact that you are presently reading this means that you have had
##knowledge of the CeCILL license and that you accept its terms.
*/
%module XmlXCAFDrivers

%include typemaps.i
%include cmalloc.i
%include cpointer.i
%include carrays.i
%include exception.i

#ifndef _Standard_TypeDef_HeaderFile
#define _Standard_TypeDef_HeaderFile
#define Standard_False (Standard_Boolean) 0
#define Standard_True  (Standard_Boolean) 1
#endif

/*
Exception handling
*/
%{#include <Standard_Failure.hxx>%}
%exception
{
    try
    {
        $action
    } 
    catch(Standard_Failure)
    {
        SWIG_exception(SWIG_RuntimeError,Standard_Failure::Caught()->DynamicType()->Name());
    }
}

/*
Standard_Real & function transformation
*/
%typemap(argout) Standard_Real &OutValue {
    PyObject *o, *o2, *o3;
    o = PyFloat_FromDouble(*$1);
    if ((!$result) || ($result == Py_None)) {
        $result = o;
    } else {
        if (!PyTuple_Check($result)) {
            PyObject *o2 = $result;
            $result = PyTuple_New(1);
            PyTuple_SetItem($result,0,o2);
        }
        o3 = PyTuple_New(1);
        PyTuple_SetItem(o3,0,o);
        o2 = $result;
        $result = PySequence_Concat(o2,o3);
        Py_DECREF(o2);
        Py_DECREF(o3);
    }
}

%typemap(in,numinputs=0) Standard_Real &OutValue(Standard_Real temp) {
    $1 = &temp;
}


%include XmlXCAFDrivers_dependencies.i


%include XmlXCAFDrivers_headers.i




%nodefaultctor Handle_XmlXCAFDrivers_DocumentRetrievalDriver;
class Handle_XmlXCAFDrivers_DocumentRetrievalDriver : public Handle_XmlDrivers_DocumentRetrievalDriver {
	public:
		%feature("autodoc", "1");
		Handle_XmlXCAFDrivers_DocumentRetrievalDriver();
		%feature("autodoc", "1");
		Handle_XmlXCAFDrivers_DocumentRetrievalDriver(const Handle_XmlXCAFDrivers_DocumentRetrievalDriver &aHandle);
		%feature("autodoc", "1");
		Handle_XmlXCAFDrivers_DocumentRetrievalDriver(const XmlXCAFDrivers_DocumentRetrievalDriver *anItem);
		%feature("autodoc", "1");
		Handle_XmlXCAFDrivers_DocumentRetrievalDriver const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlXCAFDrivers_DocumentRetrievalDriver {
	XmlXCAFDrivers_DocumentRetrievalDriver* GetObject() {
	return (XmlXCAFDrivers_DocumentRetrievalDriver*)$self->Access();
	}
};
%extend Handle_XmlXCAFDrivers_DocumentRetrievalDriver {
	~Handle_XmlXCAFDrivers_DocumentRetrievalDriver() {
	printf("Call custom destructor for instance of Handle_XmlXCAFDrivers_DocumentRetrievalDriver\n");
	}
};

%nodefaultctor Handle_XmlXCAFDrivers_DocumentStorageDriver;
class Handle_XmlXCAFDrivers_DocumentStorageDriver : public Handle_XmlDrivers_DocumentStorageDriver {
	public:
		%feature("autodoc", "1");
		Handle_XmlXCAFDrivers_DocumentStorageDriver();
		%feature("autodoc", "1");
		Handle_XmlXCAFDrivers_DocumentStorageDriver(const Handle_XmlXCAFDrivers_DocumentStorageDriver &aHandle);
		%feature("autodoc", "1");
		Handle_XmlXCAFDrivers_DocumentStorageDriver(const XmlXCAFDrivers_DocumentStorageDriver *anItem);
		%feature("autodoc", "1");
		Handle_XmlXCAFDrivers_DocumentStorageDriver const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlXCAFDrivers_DocumentStorageDriver {
	XmlXCAFDrivers_DocumentStorageDriver* GetObject() {
	return (XmlXCAFDrivers_DocumentStorageDriver*)$self->Access();
	}
};
%extend Handle_XmlXCAFDrivers_DocumentStorageDriver {
	~Handle_XmlXCAFDrivers_DocumentStorageDriver() {
	printf("Call custom destructor for instance of Handle_XmlXCAFDrivers_DocumentStorageDriver\n");
	}
};

%nodefaultctor XmlXCAFDrivers_DocumentRetrievalDriver;
class XmlXCAFDrivers_DocumentRetrievalDriver : public XmlDrivers_DocumentRetrievalDriver {
	public:
		%feature("autodoc", "1");
		XmlXCAFDrivers_DocumentRetrievalDriver();
		%feature("autodoc", "1");
		virtual		Handle_XmlMDF_ADriverTable AttributeDrivers(const Handle_CDM_MessageDriver &theMsgDriver);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend XmlXCAFDrivers_DocumentRetrievalDriver {
	Handle_XmlXCAFDrivers_DocumentRetrievalDriver GetHandle() {
	return *(Handle_XmlXCAFDrivers_DocumentRetrievalDriver*) &$self;
	}
};
%extend XmlXCAFDrivers_DocumentRetrievalDriver {
	~XmlXCAFDrivers_DocumentRetrievalDriver() {
	printf("Call custom destructor for instance of XmlXCAFDrivers_DocumentRetrievalDriver\n");
	}
};

%nodefaultctor XmlXCAFDrivers_DocumentStorageDriver;
class XmlXCAFDrivers_DocumentStorageDriver : public XmlDrivers_DocumentStorageDriver {
	public:
		%feature("autodoc", "1");
		XmlXCAFDrivers_DocumentStorageDriver(const TCollection_ExtendedString &theCopyright);
		%feature("autodoc", "1");
		virtual		Handle_XmlMDF_ADriverTable AttributeDrivers(const Handle_CDM_MessageDriver &theMsgDriver);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend XmlXCAFDrivers_DocumentStorageDriver {
	Handle_XmlXCAFDrivers_DocumentStorageDriver GetHandle() {
	return *(Handle_XmlXCAFDrivers_DocumentStorageDriver*) &$self;
	}
};
%extend XmlXCAFDrivers_DocumentStorageDriver {
	~XmlXCAFDrivers_DocumentStorageDriver() {
	printf("Call custom destructor for instance of XmlXCAFDrivers_DocumentStorageDriver\n");
	}
};

%nodefaultctor XmlXCAFDrivers;
class XmlXCAFDrivers {
	public:
		%feature("autodoc", "1");
		~XmlXCAFDrivers();
		%feature("autodoc", "1");
		XmlXCAFDrivers();
		%feature("autodoc", "1");
		Handle_Standard_Transient Factory(const Standard_GUID &aGUID);

};