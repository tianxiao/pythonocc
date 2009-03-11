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
%module BinLDrivers

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


%include BinLDrivers_dependencies.i


%include BinLDrivers_headers.i

typedef NCollection_Vector<BinLDrivers_DocumentSection> BinLDrivers_VectorOfDocumentSection;

enum BinLDrivers_Marker {
	BinLDrivers_ENDATTRLIST,
	BinLDrivers_ENDLABEL,
	};



%nodefaultctor Handle_BinLDrivers_DocumentRetrievalDriver;
class Handle_BinLDrivers_DocumentRetrievalDriver : public Handle_PCDM_RetrievalDriver {
	public:
		%feature("autodoc", "1");
		~Handle_BinLDrivers_DocumentRetrievalDriver();
		%feature("autodoc", "1");
		Handle_BinLDrivers_DocumentRetrievalDriver();
		%feature("autodoc", "1");
		Handle_BinLDrivers_DocumentRetrievalDriver(const Handle_BinLDrivers_DocumentRetrievalDriver &aHandle);
		%feature("autodoc", "1");
		Handle_BinLDrivers_DocumentRetrievalDriver(const BinLDrivers_DocumentRetrievalDriver *anItem);
		%feature("autodoc", "1");
		Handle_BinLDrivers_DocumentRetrievalDriver const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinLDrivers_DocumentRetrievalDriver {
	BinLDrivers_DocumentRetrievalDriver* GetObject() {
	return (BinLDrivers_DocumentRetrievalDriver*)$self->Access();
	}
};

%nodefaultctor Handle_BinLDrivers_DocumentStorageDriver;
class Handle_BinLDrivers_DocumentStorageDriver : public Handle_PCDM_StorageDriver {
	public:
		%feature("autodoc", "1");
		~Handle_BinLDrivers_DocumentStorageDriver();
		%feature("autodoc", "1");
		Handle_BinLDrivers_DocumentStorageDriver();
		%feature("autodoc", "1");
		Handle_BinLDrivers_DocumentStorageDriver(const Handle_BinLDrivers_DocumentStorageDriver &aHandle);
		%feature("autodoc", "1");
		Handle_BinLDrivers_DocumentStorageDriver(const BinLDrivers_DocumentStorageDriver *anItem);
		%feature("autodoc", "1");
		Handle_BinLDrivers_DocumentStorageDriver const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinLDrivers_DocumentStorageDriver {
	BinLDrivers_DocumentStorageDriver* GetObject() {
	return (BinLDrivers_DocumentStorageDriver*)$self->Access();
	}
};

%nodefaultctor BinLDrivers_DocumentRetrievalDriver;
class BinLDrivers_DocumentRetrievalDriver : public PCDM_RetrievalDriver {
	public:
		%feature("autodoc", "1");
		BinLDrivers_DocumentRetrievalDriver();
		%feature("autodoc", "1");
		virtual		TCollection_ExtendedString SchemaName() const;
		%feature("autodoc", "1");
		virtual		void Make(const Handle_PCDM_Document &PD, const Handle_CDM_Document &TD);
		%feature("autodoc", "1");
		virtual		Handle_CDM_Document CreateDocument();
		%feature("autodoc", "1");
		virtual		void Read(const TCollection_ExtendedString &theFileName, const Handle_CDM_Document &theNewDocument, const Handle_CDM_Application &theApplication);
		%feature("autodoc", "1");
		virtual		Handle_BinMDF_ADriverTable AttributeDrivers(const Handle_CDM_MessageDriver &theMsgDriver);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~BinLDrivers_DocumentRetrievalDriver();

};
%extend BinLDrivers_DocumentRetrievalDriver {
	Handle_BinLDrivers_DocumentRetrievalDriver GetHandle() {
	return *(Handle_BinLDrivers_DocumentRetrievalDriver*) &$self;
	}
};

%nodefaultctor BinLDrivers_DocumentStorageDriver;
class BinLDrivers_DocumentStorageDriver : public PCDM_StorageDriver {
	public:
		%feature("autodoc", "1");
		BinLDrivers_DocumentStorageDriver();
		%feature("autodoc", "1");
		virtual		TCollection_ExtendedString SchemaName() const;
		%feature("autodoc", "1");
		virtual		void Write(const Handle_CDM_Document &theDocument, const TCollection_ExtendedString &theFileName);
		%feature("autodoc", "1");
		Standard_Boolean IsError() const;
		%feature("autodoc", "1");
		virtual		Handle_BinMDF_ADriverTable AttributeDrivers(const Handle_CDM_MessageDriver &theMsgDriver);
		%feature("autodoc", "1");
		void AddSection(const TCollection_AsciiString &theName, const Standard_Boolean isPostRead=1);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~BinLDrivers_DocumentStorageDriver();

};
%extend BinLDrivers_DocumentStorageDriver {
	Handle_BinLDrivers_DocumentStorageDriver GetHandle() {
	return *(Handle_BinLDrivers_DocumentStorageDriver*) &$self;
	}
};

%nodefaultctor BinLDrivers_DocumentSection;
class BinLDrivers_DocumentSection {
	public:
		%feature("autodoc", "1");
		~BinLDrivers_DocumentSection();
		%feature("autodoc", "1");
		BinLDrivers_DocumentSection();
		%feature("autodoc", "1");
		BinLDrivers_DocumentSection(const TCollection_AsciiString &theName, const Standard_Boolean isPostRead);
		%feature("autodoc", "1");
		const TCollection_AsciiString & Name() const;
		%feature("autodoc", "1");
		Standard_Boolean IsPostRead() const;
		%feature("autodoc", "1");
		Standard_Size Offset() const;
		%feature("autodoc", "1");
		void SetOffset(const Standard_Size theOffset);
		%feature("autodoc", "1");
		Standard_Size Length() const;
		%feature("autodoc", "1");
		void SetLength(const Standard_Size theLength);
		%feature("autodoc", "1");
		void WriteTOC(Standard_OStream & theOS);
		%feature("autodoc", "1");
		void Write(Standard_OStream & theOS, const Standard_Size theOffset);
		%feature("autodoc", "1");
		void ReadTOC(BinLDrivers_DocumentSection & theSection, std::istream & theIS);

};

%nodefaultctor BinLDrivers;
class BinLDrivers {
	public:
		%feature("autodoc", "1");
		~BinLDrivers();
		%feature("autodoc", "1");
		BinLDrivers();
		%feature("autodoc", "1");
		Handle_Standard_Transient Factory(const Standard_GUID &theGUID);
		%feature("autodoc", "1");
		Handle_BinMDF_ADriverTable AttributeDrivers(const Handle_CDM_MessageDriver &MsgDrv);
		%feature("autodoc", "1");
		TCollection_AsciiString StorageVersion();

};