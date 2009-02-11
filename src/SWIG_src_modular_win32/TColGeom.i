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
%module TColGeom

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


%include TColGeom_dependencies.i


%include TColGeom_headers.i




%nodefaultctor Handle_TColGeom_SequenceNodeOfSequenceOfCurve;
class Handle_TColGeom_SequenceNodeOfSequenceOfCurve : public Handle_TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		~Handle_TColGeom_SequenceNodeOfSequenceOfCurve();
		%feature("autodoc", "1");
		Handle_TColGeom_SequenceNodeOfSequenceOfCurve();
		%feature("autodoc", "1");
		Handle_TColGeom_SequenceNodeOfSequenceOfCurve(const Handle_TColGeom_SequenceNodeOfSequenceOfCurve &aHandle);
		%feature("autodoc", "1");
		Handle_TColGeom_SequenceNodeOfSequenceOfCurve(const TColGeom_SequenceNodeOfSequenceOfCurve *anItem);
		%feature("autodoc", "1");
		Handle_TColGeom_SequenceNodeOfSequenceOfCurve const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_SequenceNodeOfSequenceOfCurve {
	TColGeom_SequenceNodeOfSequenceOfCurve* GetObject() {
	return (TColGeom_SequenceNodeOfSequenceOfCurve*)$self->Access();
	}
};

%nodefaultctor Handle_TColGeom_SequenceNodeOfSequenceOfBoundedSurface;
class Handle_TColGeom_SequenceNodeOfSequenceOfBoundedSurface : public Handle_TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		~Handle_TColGeom_SequenceNodeOfSequenceOfBoundedSurface();
		%feature("autodoc", "1");
		Handle_TColGeom_SequenceNodeOfSequenceOfBoundedSurface();
		%feature("autodoc", "1");
		Handle_TColGeom_SequenceNodeOfSequenceOfBoundedSurface(const Handle_TColGeom_SequenceNodeOfSequenceOfBoundedSurface &aHandle);
		%feature("autodoc", "1");
		Handle_TColGeom_SequenceNodeOfSequenceOfBoundedSurface(const TColGeom_SequenceNodeOfSequenceOfBoundedSurface *anItem);
		%feature("autodoc", "1");
		Handle_TColGeom_SequenceNodeOfSequenceOfBoundedSurface const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_SequenceNodeOfSequenceOfBoundedSurface {
	TColGeom_SequenceNodeOfSequenceOfBoundedSurface* GetObject() {
	return (TColGeom_SequenceNodeOfSequenceOfBoundedSurface*)$self->Access();
	}
};

%nodefaultctor Handle_TColGeom_HArray1OfBoundedSurface;
class Handle_TColGeom_HArray1OfBoundedSurface : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_TColGeom_HArray1OfBoundedSurface();
		%feature("autodoc", "1");
		Handle_TColGeom_HArray1OfBoundedSurface();
		%feature("autodoc", "1");
		Handle_TColGeom_HArray1OfBoundedSurface(const Handle_TColGeom_HArray1OfBoundedSurface &aHandle);
		%feature("autodoc", "1");
		Handle_TColGeom_HArray1OfBoundedSurface(const TColGeom_HArray1OfBoundedSurface *anItem);
		%feature("autodoc", "1");
		Handle_TColGeom_HArray1OfBoundedSurface const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HArray1OfBoundedSurface {
	TColGeom_HArray1OfBoundedSurface* GetObject() {
	return (TColGeom_HArray1OfBoundedSurface*)$self->Access();
	}
};

%nodefaultctor Handle_TColGeom_HArray2OfBoundedSurface;
class Handle_TColGeom_HArray2OfBoundedSurface : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_TColGeom_HArray2OfBoundedSurface();
		%feature("autodoc", "1");
		Handle_TColGeom_HArray2OfBoundedSurface();
		%feature("autodoc", "1");
		Handle_TColGeom_HArray2OfBoundedSurface(const Handle_TColGeom_HArray2OfBoundedSurface &aHandle);
		%feature("autodoc", "1");
		Handle_TColGeom_HArray2OfBoundedSurface(const TColGeom_HArray2OfBoundedSurface *anItem);
		%feature("autodoc", "1");
		Handle_TColGeom_HArray2OfBoundedSurface const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HArray2OfBoundedSurface {
	TColGeom_HArray2OfBoundedSurface* GetObject() {
	return (TColGeom_HArray2OfBoundedSurface*)$self->Access();
	}
};

%nodefaultctor Handle_TColGeom_HArray1OfCurve;
class Handle_TColGeom_HArray1OfCurve : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_TColGeom_HArray1OfCurve();
		%feature("autodoc", "1");
		Handle_TColGeom_HArray1OfCurve();
		%feature("autodoc", "1");
		Handle_TColGeom_HArray1OfCurve(const Handle_TColGeom_HArray1OfCurve &aHandle);
		%feature("autodoc", "1");
		Handle_TColGeom_HArray1OfCurve(const TColGeom_HArray1OfCurve *anItem);
		%feature("autodoc", "1");
		Handle_TColGeom_HArray1OfCurve const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HArray1OfCurve {
	TColGeom_HArray1OfCurve* GetObject() {
	return (TColGeom_HArray1OfCurve*)$self->Access();
	}
};

%nodefaultctor Handle_TColGeom_SequenceNodeOfSequenceOfSurface;
class Handle_TColGeom_SequenceNodeOfSequenceOfSurface : public Handle_TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		~Handle_TColGeom_SequenceNodeOfSequenceOfSurface();
		%feature("autodoc", "1");
		Handle_TColGeom_SequenceNodeOfSequenceOfSurface();
		%feature("autodoc", "1");
		Handle_TColGeom_SequenceNodeOfSequenceOfSurface(const Handle_TColGeom_SequenceNodeOfSequenceOfSurface &aHandle);
		%feature("autodoc", "1");
		Handle_TColGeom_SequenceNodeOfSequenceOfSurface(const TColGeom_SequenceNodeOfSequenceOfSurface *anItem);
		%feature("autodoc", "1");
		Handle_TColGeom_SequenceNodeOfSequenceOfSurface const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_SequenceNodeOfSequenceOfSurface {
	TColGeom_SequenceNodeOfSequenceOfSurface* GetObject() {
	return (TColGeom_SequenceNodeOfSequenceOfSurface*)$self->Access();
	}
};

%nodefaultctor Handle_TColGeom_HArray1OfBoundedCurve;
class Handle_TColGeom_HArray1OfBoundedCurve : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_TColGeom_HArray1OfBoundedCurve();
		%feature("autodoc", "1");
		Handle_TColGeom_HArray1OfBoundedCurve();
		%feature("autodoc", "1");
		Handle_TColGeom_HArray1OfBoundedCurve(const Handle_TColGeom_HArray1OfBoundedCurve &aHandle);
		%feature("autodoc", "1");
		Handle_TColGeom_HArray1OfBoundedCurve(const TColGeom_HArray1OfBoundedCurve *anItem);
		%feature("autodoc", "1");
		Handle_TColGeom_HArray1OfBoundedCurve const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HArray1OfBoundedCurve {
	TColGeom_HArray1OfBoundedCurve* GetObject() {
	return (TColGeom_HArray1OfBoundedCurve*)$self->Access();
	}
};

%nodefaultctor Handle_TColGeom_HArray2OfBSplineSurface;
class Handle_TColGeom_HArray2OfBSplineSurface : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_TColGeom_HArray2OfBSplineSurface();
		%feature("autodoc", "1");
		Handle_TColGeom_HArray2OfBSplineSurface();
		%feature("autodoc", "1");
		Handle_TColGeom_HArray2OfBSplineSurface(const Handle_TColGeom_HArray2OfBSplineSurface &aHandle);
		%feature("autodoc", "1");
		Handle_TColGeom_HArray2OfBSplineSurface(const TColGeom_HArray2OfBSplineSurface *anItem);
		%feature("autodoc", "1");
		Handle_TColGeom_HArray2OfBSplineSurface const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HArray2OfBSplineSurface {
	TColGeom_HArray2OfBSplineSurface* GetObject() {
	return (TColGeom_HArray2OfBSplineSurface*)$self->Access();
	}
};

%nodefaultctor Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve;
class Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve : public Handle_TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		~Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve();
		%feature("autodoc", "1");
		Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve();
		%feature("autodoc", "1");
		Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve(const Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve &aHandle);
		%feature("autodoc", "1");
		Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve(const TColGeom_SequenceNodeOfSequenceOfBoundedCurve *anItem);
		%feature("autodoc", "1");
		Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve {
	TColGeom_SequenceNodeOfSequenceOfBoundedCurve* GetObject() {
	return (TColGeom_SequenceNodeOfSequenceOfBoundedCurve*)$self->Access();
	}
};

%nodefaultctor Handle_TColGeom_HSequenceOfCurve;
class Handle_TColGeom_HSequenceOfCurve : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_TColGeom_HSequenceOfCurve();
		%feature("autodoc", "1");
		Handle_TColGeom_HSequenceOfCurve();
		%feature("autodoc", "1");
		Handle_TColGeom_HSequenceOfCurve(const Handle_TColGeom_HSequenceOfCurve &aHandle);
		%feature("autodoc", "1");
		Handle_TColGeom_HSequenceOfCurve(const TColGeom_HSequenceOfCurve *anItem);
		%feature("autodoc", "1");
		Handle_TColGeom_HSequenceOfCurve const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HSequenceOfCurve {
	TColGeom_HSequenceOfCurve* GetObject() {
	return (TColGeom_HSequenceOfCurve*)$self->Access();
	}
};

%nodefaultctor Handle_TColGeom_HArray2OfBezierSurface;
class Handle_TColGeom_HArray2OfBezierSurface : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_TColGeom_HArray2OfBezierSurface();
		%feature("autodoc", "1");
		Handle_TColGeom_HArray2OfBezierSurface();
		%feature("autodoc", "1");
		Handle_TColGeom_HArray2OfBezierSurface(const Handle_TColGeom_HArray2OfBezierSurface &aHandle);
		%feature("autodoc", "1");
		Handle_TColGeom_HArray2OfBezierSurface(const TColGeom_HArray2OfBezierSurface *anItem);
		%feature("autodoc", "1");
		Handle_TColGeom_HArray2OfBezierSurface const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HArray2OfBezierSurface {
	TColGeom_HArray2OfBezierSurface* GetObject() {
	return (TColGeom_HArray2OfBezierSurface*)$self->Access();
	}
};

%nodefaultctor Handle_TColGeom_HArray1OfSurface;
class Handle_TColGeom_HArray1OfSurface : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_TColGeom_HArray1OfSurface();
		%feature("autodoc", "1");
		Handle_TColGeom_HArray1OfSurface();
		%feature("autodoc", "1");
		Handle_TColGeom_HArray1OfSurface(const Handle_TColGeom_HArray1OfSurface &aHandle);
		%feature("autodoc", "1");
		Handle_TColGeom_HArray1OfSurface(const TColGeom_HArray1OfSurface *anItem);
		%feature("autodoc", "1");
		Handle_TColGeom_HArray1OfSurface const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HArray1OfSurface {
	TColGeom_HArray1OfSurface* GetObject() {
	return (TColGeom_HArray1OfSurface*)$self->Access();
	}
};

%nodefaultctor Handle_TColGeom_HArray1OfBezierCurve;
class Handle_TColGeom_HArray1OfBezierCurve : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_TColGeom_HArray1OfBezierCurve();
		%feature("autodoc", "1");
		Handle_TColGeom_HArray1OfBezierCurve();
		%feature("autodoc", "1");
		Handle_TColGeom_HArray1OfBezierCurve(const Handle_TColGeom_HArray1OfBezierCurve &aHandle);
		%feature("autodoc", "1");
		Handle_TColGeom_HArray1OfBezierCurve(const TColGeom_HArray1OfBezierCurve *anItem);
		%feature("autodoc", "1");
		Handle_TColGeom_HArray1OfBezierCurve const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HArray1OfBezierCurve {
	TColGeom_HArray1OfBezierCurve* GetObject() {
	return (TColGeom_HArray1OfBezierCurve*)$self->Access();
	}
};

%nodefaultctor Handle_TColGeom_HSequenceOfBoundedSurface;
class Handle_TColGeom_HSequenceOfBoundedSurface : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_TColGeom_HSequenceOfBoundedSurface();
		%feature("autodoc", "1");
		Handle_TColGeom_HSequenceOfBoundedSurface();
		%feature("autodoc", "1");
		Handle_TColGeom_HSequenceOfBoundedSurface(const Handle_TColGeom_HSequenceOfBoundedSurface &aHandle);
		%feature("autodoc", "1");
		Handle_TColGeom_HSequenceOfBoundedSurface(const TColGeom_HSequenceOfBoundedSurface *anItem);
		%feature("autodoc", "1");
		Handle_TColGeom_HSequenceOfBoundedSurface const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HSequenceOfBoundedSurface {
	TColGeom_HSequenceOfBoundedSurface* GetObject() {
	return (TColGeom_HSequenceOfBoundedSurface*)$self->Access();
	}
};

%nodefaultctor Handle_TColGeom_HArray1OfBSplineCurve;
class Handle_TColGeom_HArray1OfBSplineCurve : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_TColGeom_HArray1OfBSplineCurve();
		%feature("autodoc", "1");
		Handle_TColGeom_HArray1OfBSplineCurve();
		%feature("autodoc", "1");
		Handle_TColGeom_HArray1OfBSplineCurve(const Handle_TColGeom_HArray1OfBSplineCurve &aHandle);
		%feature("autodoc", "1");
		Handle_TColGeom_HArray1OfBSplineCurve(const TColGeom_HArray1OfBSplineCurve *anItem);
		%feature("autodoc", "1");
		Handle_TColGeom_HArray1OfBSplineCurve const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HArray1OfBSplineCurve {
	TColGeom_HArray1OfBSplineCurve* GetObject() {
	return (TColGeom_HArray1OfBSplineCurve*)$self->Access();
	}
};

%nodefaultctor Handle_TColGeom_HSequenceOfSurface;
class Handle_TColGeom_HSequenceOfSurface : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_TColGeom_HSequenceOfSurface();
		%feature("autodoc", "1");
		Handle_TColGeom_HSequenceOfSurface();
		%feature("autodoc", "1");
		Handle_TColGeom_HSequenceOfSurface(const Handle_TColGeom_HSequenceOfSurface &aHandle);
		%feature("autodoc", "1");
		Handle_TColGeom_HSequenceOfSurface(const TColGeom_HSequenceOfSurface *anItem);
		%feature("autodoc", "1");
		Handle_TColGeom_HSequenceOfSurface const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HSequenceOfSurface {
	TColGeom_HSequenceOfSurface* GetObject() {
	return (TColGeom_HSequenceOfSurface*)$self->Access();
	}
};

%nodefaultctor Handle_TColGeom_HArray2OfSurface;
class Handle_TColGeom_HArray2OfSurface : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_TColGeom_HArray2OfSurface();
		%feature("autodoc", "1");
		Handle_TColGeom_HArray2OfSurface();
		%feature("autodoc", "1");
		Handle_TColGeom_HArray2OfSurface(const Handle_TColGeom_HArray2OfSurface &aHandle);
		%feature("autodoc", "1");
		Handle_TColGeom_HArray2OfSurface(const TColGeom_HArray2OfSurface *anItem);
		%feature("autodoc", "1");
		Handle_TColGeom_HArray2OfSurface const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HArray2OfSurface {
	TColGeom_HArray2OfSurface* GetObject() {
	return (TColGeom_HArray2OfSurface*)$self->Access();
	}
};

%nodefaultctor Handle_TColGeom_HSequenceOfBoundedCurve;
class Handle_TColGeom_HSequenceOfBoundedCurve : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_TColGeom_HSequenceOfBoundedCurve();
		%feature("autodoc", "1");
		Handle_TColGeom_HSequenceOfBoundedCurve();
		%feature("autodoc", "1");
		Handle_TColGeom_HSequenceOfBoundedCurve(const Handle_TColGeom_HSequenceOfBoundedCurve &aHandle);
		%feature("autodoc", "1");
		Handle_TColGeom_HSequenceOfBoundedCurve(const TColGeom_HSequenceOfBoundedCurve *anItem);
		%feature("autodoc", "1");
		Handle_TColGeom_HSequenceOfBoundedCurve const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TColGeom_HSequenceOfBoundedCurve {
	TColGeom_HSequenceOfBoundedCurve* GetObject() {
	return (TColGeom_HSequenceOfBoundedCurve*)$self->Access();
	}
};

%nodefaultctor TColGeom_HArray1OfSurface;
class TColGeom_HArray1OfSurface : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		TColGeom_HArray1OfSurface(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		TColGeom_HArray1OfSurface(const Standard_Integer Low, const Standard_Integer Up, const Handle_Geom_Surface &V);
		%feature("autodoc", "1");
		void Init(const Handle_Geom_Surface &V);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_Geom_Surface &Value);
		%feature("autodoc", "1");
		const Handle_Geom_Surface & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_Geom_Surface & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		const TColGeom_Array1OfSurface & Array1() const;
		%feature("autodoc", "1");
		TColGeom_Array1OfSurface & ChangeArray1();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TColGeom_HArray1OfSurface();

};
%extend TColGeom_HArray1OfSurface {
	Handle_TColGeom_HArray1OfSurface GetHandle() {
	return *(Handle_TColGeom_HArray1OfSurface*) &$self;
	}
};

%nodefaultctor TColGeom_HSequenceOfCurve;
class TColGeom_HSequenceOfCurve : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		TColGeom_HSequenceOfCurve();
		%feature("autodoc", "1");
		Standard_Boolean IsEmpty() const;
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		void Append(const Handle_Geom_Curve &anItem);
		%feature("autodoc", "1");
		void Append(const Handle_TColGeom_HSequenceOfCurve &aSequence);
		%feature("autodoc", "1");
		void Prepend(const Handle_Geom_Curve &anItem);
		%feature("autodoc", "1");
		void Prepend(const Handle_TColGeom_HSequenceOfCurve &aSequence);
		%feature("autodoc", "1");
		void Reverse();
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer anIndex, const Handle_Geom_Curve &anItem);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer anIndex, const Handle_TColGeom_HSequenceOfCurve &aSequence);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer anIndex, const Handle_Geom_Curve &anItem);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer anIndex, const Handle_TColGeom_HSequenceOfCurve &aSequence);
		%feature("autodoc", "1");
		void Exchange(const Standard_Integer anIndex, const Standard_Integer anOtherIndex);
		%feature("autodoc", "1");
		Handle_TColGeom_HSequenceOfCurve Split(const Standard_Integer anIndex);
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer anIndex, const Handle_Geom_Curve &anItem);
		%feature("autodoc", "1");
		const Handle_Geom_Curve & Value(const Standard_Integer anIndex) const;
		%feature("autodoc", "1");
		Handle_Geom_Curve & ChangeValue(const Standard_Integer anIndex);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer anIndex);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer fromIndex, const Standard_Integer toIndex);
		%feature("autodoc", "1");
		const TColGeom_SequenceOfCurve & Sequence() const;
		%feature("autodoc", "1");
		TColGeom_SequenceOfCurve & ChangeSequence();
		%feature("autodoc", "1");
		Handle_TColGeom_HSequenceOfCurve ShallowCopy() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TColGeom_HSequenceOfCurve();

};
%extend TColGeom_HSequenceOfCurve {
	Handle_TColGeom_HSequenceOfCurve GetHandle() {
	return *(Handle_TColGeom_HSequenceOfCurve*) &$self;
	}
};

%nodefaultctor TColGeom_Array1OfBoundedCurve;
class TColGeom_Array1OfBoundedCurve {
	public:
		%feature("autodoc", "1");
		TColGeom_Array1OfBoundedCurve(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		TColGeom_Array1OfBoundedCurve(const Handle_Geom_BoundedCurve &Item, const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		void Init(const Handle_Geom_BoundedCurve &V);
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		~TColGeom_Array1OfBoundedCurve();
		%feature("autodoc", "1");
		Standard_Boolean IsAllocated() const;
		%feature("autodoc", "1");
		const TColGeom_Array1OfBoundedCurve & Assign(const TColGeom_Array1OfBoundedCurve &Other);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_Geom_BoundedCurve &Value);
		%feature("autodoc", "1");
		const Handle_Geom_BoundedCurve & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Handle_Geom_BoundedCurve & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_Geom_BoundedCurve & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Handle_Geom_BoundedCurve & operator()(const Standard_Integer Index);

};

%nodefaultctor TColGeom_Array1OfCurve;
class TColGeom_Array1OfCurve {
	public:
		%feature("autodoc", "1");
		TColGeom_Array1OfCurve(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		TColGeom_Array1OfCurve(const Handle_Geom_Curve &Item, const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		void Init(const Handle_Geom_Curve &V);
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		~TColGeom_Array1OfCurve();
		%feature("autodoc", "1");
		Standard_Boolean IsAllocated() const;
		%feature("autodoc", "1");
		const TColGeom_Array1OfCurve & Assign(const TColGeom_Array1OfCurve &Other);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_Geom_Curve &Value);
		%feature("autodoc", "1");
		const Handle_Geom_Curve & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Handle_Geom_Curve & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_Geom_Curve & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Handle_Geom_Curve & operator()(const Standard_Integer Index);

};

%nodefaultctor TColGeom_HSequenceOfSurface;
class TColGeom_HSequenceOfSurface : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		TColGeom_HSequenceOfSurface();
		%feature("autodoc", "1");
		Standard_Boolean IsEmpty() const;
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		void Append(const Handle_Geom_Surface &anItem);
		%feature("autodoc", "1");
		void Append(const Handle_TColGeom_HSequenceOfSurface &aSequence);
		%feature("autodoc", "1");
		void Prepend(const Handle_Geom_Surface &anItem);
		%feature("autodoc", "1");
		void Prepend(const Handle_TColGeom_HSequenceOfSurface &aSequence);
		%feature("autodoc", "1");
		void Reverse();
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer anIndex, const Handle_Geom_Surface &anItem);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer anIndex, const Handle_TColGeom_HSequenceOfSurface &aSequence);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer anIndex, const Handle_Geom_Surface &anItem);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer anIndex, const Handle_TColGeom_HSequenceOfSurface &aSequence);
		%feature("autodoc", "1");
		void Exchange(const Standard_Integer anIndex, const Standard_Integer anOtherIndex);
		%feature("autodoc", "1");
		Handle_TColGeom_HSequenceOfSurface Split(const Standard_Integer anIndex);
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer anIndex, const Handle_Geom_Surface &anItem);
		%feature("autodoc", "1");
		const Handle_Geom_Surface & Value(const Standard_Integer anIndex) const;
		%feature("autodoc", "1");
		Handle_Geom_Surface & ChangeValue(const Standard_Integer anIndex);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer anIndex);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer fromIndex, const Standard_Integer toIndex);
		%feature("autodoc", "1");
		const TColGeom_SequenceOfSurface & Sequence() const;
		%feature("autodoc", "1");
		TColGeom_SequenceOfSurface & ChangeSequence();
		%feature("autodoc", "1");
		Handle_TColGeom_HSequenceOfSurface ShallowCopy() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TColGeom_HSequenceOfSurface();

};
%extend TColGeom_HSequenceOfSurface {
	Handle_TColGeom_HSequenceOfSurface GetHandle() {
	return *(Handle_TColGeom_HSequenceOfSurface*) &$self;
	}
};

%nodefaultctor TColGeom_HArray1OfCurve;
class TColGeom_HArray1OfCurve : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		TColGeom_HArray1OfCurve(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		TColGeom_HArray1OfCurve(const Standard_Integer Low, const Standard_Integer Up, const Handle_Geom_Curve &V);
		%feature("autodoc", "1");
		void Init(const Handle_Geom_Curve &V);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_Geom_Curve &Value);
		%feature("autodoc", "1");
		const Handle_Geom_Curve & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_Geom_Curve & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		const TColGeom_Array1OfCurve & Array1() const;
		%feature("autodoc", "1");
		TColGeom_Array1OfCurve & ChangeArray1();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TColGeom_HArray1OfCurve();

};
%extend TColGeom_HArray1OfCurve {
	Handle_TColGeom_HArray1OfCurve GetHandle() {
	return *(Handle_TColGeom_HArray1OfCurve*) &$self;
	}
};

%nodefaultctor TColGeom_HArray2OfBoundedSurface;
class TColGeom_HArray2OfBoundedSurface : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		TColGeom_HArray2OfBoundedSurface(const Standard_Integer R1, const Standard_Integer R2, const Standard_Integer C1, const Standard_Integer C2);
		%feature("autodoc", "1");
		TColGeom_HArray2OfBoundedSurface(const Standard_Integer R1, const Standard_Integer R2, const Standard_Integer C1, const Standard_Integer C2, const Handle_Geom_BoundedSurface &V);
		%feature("autodoc", "1");
		void Init(const Handle_Geom_BoundedSurface &V);
		%feature("autodoc", "1");
		Standard_Integer ColLength() const;
		%feature("autodoc", "1");
		Standard_Integer RowLength() const;
		%feature("autodoc", "1");
		Standard_Integer LowerCol() const;
		%feature("autodoc", "1");
		Standard_Integer LowerRow() const;
		%feature("autodoc", "1");
		Standard_Integer UpperCol() const;
		%feature("autodoc", "1");
		Standard_Integer UpperRow() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Row, const Standard_Integer Col, const Handle_Geom_BoundedSurface &Value);
		%feature("autodoc", "1");
		const Handle_Geom_BoundedSurface & Value(const Standard_Integer Row, const Standard_Integer Col) const;
		%feature("autodoc", "1");
		Handle_Geom_BoundedSurface & ChangeValue(const Standard_Integer Row, const Standard_Integer Col);
		%feature("autodoc", "1");
		const TColGeom_Array2OfBoundedSurface & Array2() const;
		%feature("autodoc", "1");
		TColGeom_Array2OfBoundedSurface & ChangeArray2();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TColGeom_HArray2OfBoundedSurface();

};
%extend TColGeom_HArray2OfBoundedSurface {
	Handle_TColGeom_HArray2OfBoundedSurface GetHandle() {
	return *(Handle_TColGeom_HArray2OfBoundedSurface*) &$self;
	}
};

%nodefaultctor TColGeom_SequenceNodeOfSequenceOfBoundedSurface;
class TColGeom_SequenceNodeOfSequenceOfBoundedSurface : public TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		TColGeom_SequenceNodeOfSequenceOfBoundedSurface(const Handle_Geom_BoundedSurface &I, const TCollection_SeqNodePtr &n, const TCollection_SeqNodePtr &p);
		%feature("autodoc", "1");
		Handle_Geom_BoundedSurface & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TColGeom_SequenceNodeOfSequenceOfBoundedSurface();

};
%extend TColGeom_SequenceNodeOfSequenceOfBoundedSurface {
	Handle_TColGeom_SequenceNodeOfSequenceOfBoundedSurface GetHandle() {
	return *(Handle_TColGeom_SequenceNodeOfSequenceOfBoundedSurface*) &$self;
	}
};

%nodefaultctor TColGeom_SequenceNodeOfSequenceOfCurve;
class TColGeom_SequenceNodeOfSequenceOfCurve : public TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		TColGeom_SequenceNodeOfSequenceOfCurve(const Handle_Geom_Curve &I, const TCollection_SeqNodePtr &n, const TCollection_SeqNodePtr &p);
		%feature("autodoc", "1");
		Handle_Geom_Curve & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TColGeom_SequenceNodeOfSequenceOfCurve();

};
%extend TColGeom_SequenceNodeOfSequenceOfCurve {
	Handle_TColGeom_SequenceNodeOfSequenceOfCurve GetHandle() {
	return *(Handle_TColGeom_SequenceNodeOfSequenceOfCurve*) &$self;
	}
};

%nodefaultctor TColGeom_Array2OfSurface;
class TColGeom_Array2OfSurface {
	public:
		%feature("autodoc", "1");
		TColGeom_Array2OfSurface(const Standard_Integer R1, const Standard_Integer R2, const Standard_Integer C1, const Standard_Integer C2);
		%feature("autodoc", "1");
		TColGeom_Array2OfSurface(const Handle_Geom_Surface &Item, const Standard_Integer R1, const Standard_Integer R2, const Standard_Integer C1, const Standard_Integer C2);
		%feature("autodoc", "1");
		void Init(const Handle_Geom_Surface &V);
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		~TColGeom_Array2OfSurface();
		%feature("autodoc", "1");
		const TColGeom_Array2OfSurface & Assign(const TColGeom_Array2OfSurface &Other);
		%feature("autodoc", "1");
		Standard_Integer ColLength() const;
		%feature("autodoc", "1");
		Standard_Integer RowLength() const;
		%feature("autodoc", "1");
		Standard_Integer LowerCol() const;
		%feature("autodoc", "1");
		Standard_Integer LowerRow() const;
		%feature("autodoc", "1");
		Standard_Integer UpperCol() const;
		%feature("autodoc", "1");
		Standard_Integer UpperRow() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Row, const Standard_Integer Col, const Handle_Geom_Surface &Value);
		%feature("autodoc", "1");
		const Handle_Geom_Surface & Value(const Standard_Integer Row, const Standard_Integer Col) const;
		%feature("autodoc", "1");
		const Handle_Geom_Surface & operator()(const Standard_Integer Row, const Standard_Integer Col) const;
		%feature("autodoc", "1");
		Handle_Geom_Surface & ChangeValue(const Standard_Integer Row, const Standard_Integer Col);
		%feature("autodoc", "1");
		Handle_Geom_Surface & operator()(const Standard_Integer Row, const Standard_Integer Col);

};

%nodefaultctor TColGeom_Array2OfBezierSurface;
class TColGeom_Array2OfBezierSurface {
	public:
		%feature("autodoc", "1");
		TColGeom_Array2OfBezierSurface(const Standard_Integer R1, const Standard_Integer R2, const Standard_Integer C1, const Standard_Integer C2);
		%feature("autodoc", "1");
		TColGeom_Array2OfBezierSurface(const Handle_Geom_BezierSurface &Item, const Standard_Integer R1, const Standard_Integer R2, const Standard_Integer C1, const Standard_Integer C2);
		%feature("autodoc", "1");
		void Init(const Handle_Geom_BezierSurface &V);
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		~TColGeom_Array2OfBezierSurface();
		%feature("autodoc", "1");
		const TColGeom_Array2OfBezierSurface & Assign(const TColGeom_Array2OfBezierSurface &Other);
		%feature("autodoc", "1");
		Standard_Integer ColLength() const;
		%feature("autodoc", "1");
		Standard_Integer RowLength() const;
		%feature("autodoc", "1");
		Standard_Integer LowerCol() const;
		%feature("autodoc", "1");
		Standard_Integer LowerRow() const;
		%feature("autodoc", "1");
		Standard_Integer UpperCol() const;
		%feature("autodoc", "1");
		Standard_Integer UpperRow() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Row, const Standard_Integer Col, const Handle_Geom_BezierSurface &Value);
		%feature("autodoc", "1");
		const Handle_Geom_BezierSurface & Value(const Standard_Integer Row, const Standard_Integer Col) const;
		%feature("autodoc", "1");
		const Handle_Geom_BezierSurface & operator()(const Standard_Integer Row, const Standard_Integer Col) const;
		%feature("autodoc", "1");
		Handle_Geom_BezierSurface & ChangeValue(const Standard_Integer Row, const Standard_Integer Col);
		%feature("autodoc", "1");
		Handle_Geom_BezierSurface & operator()(const Standard_Integer Row, const Standard_Integer Col);

};

%nodefaultctor TColGeom_HSequenceOfBoundedCurve;
class TColGeom_HSequenceOfBoundedCurve : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		TColGeom_HSequenceOfBoundedCurve();
		%feature("autodoc", "1");
		Standard_Boolean IsEmpty() const;
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		void Append(const Handle_Geom_BoundedCurve &anItem);
		%feature("autodoc", "1");
		void Append(const Handle_TColGeom_HSequenceOfBoundedCurve &aSequence);
		%feature("autodoc", "1");
		void Prepend(const Handle_Geom_BoundedCurve &anItem);
		%feature("autodoc", "1");
		void Prepend(const Handle_TColGeom_HSequenceOfBoundedCurve &aSequence);
		%feature("autodoc", "1");
		void Reverse();
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer anIndex, const Handle_Geom_BoundedCurve &anItem);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer anIndex, const Handle_TColGeom_HSequenceOfBoundedCurve &aSequence);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer anIndex, const Handle_Geom_BoundedCurve &anItem);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer anIndex, const Handle_TColGeom_HSequenceOfBoundedCurve &aSequence);
		%feature("autodoc", "1");
		void Exchange(const Standard_Integer anIndex, const Standard_Integer anOtherIndex);
		%feature("autodoc", "1");
		Handle_TColGeom_HSequenceOfBoundedCurve Split(const Standard_Integer anIndex);
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer anIndex, const Handle_Geom_BoundedCurve &anItem);
		%feature("autodoc", "1");
		const Handle_Geom_BoundedCurve & Value(const Standard_Integer anIndex) const;
		%feature("autodoc", "1");
		Handle_Geom_BoundedCurve & ChangeValue(const Standard_Integer anIndex);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer anIndex);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer fromIndex, const Standard_Integer toIndex);
		%feature("autodoc", "1");
		const TColGeom_SequenceOfBoundedCurve & Sequence() const;
		%feature("autodoc", "1");
		TColGeom_SequenceOfBoundedCurve & ChangeSequence();
		%feature("autodoc", "1");
		Handle_TColGeom_HSequenceOfBoundedCurve ShallowCopy() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TColGeom_HSequenceOfBoundedCurve();

};
%extend TColGeom_HSequenceOfBoundedCurve {
	Handle_TColGeom_HSequenceOfBoundedCurve GetHandle() {
	return *(Handle_TColGeom_HSequenceOfBoundedCurve*) &$self;
	}
};

%nodefaultctor TColGeom_SequenceOfBoundedSurface;
class TColGeom_SequenceOfBoundedSurface : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "1");
		TColGeom_SequenceOfBoundedSurface();
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~TColGeom_SequenceOfBoundedSurface();
		%feature("autodoc", "1");
		const TColGeom_SequenceOfBoundedSurface & Assign(const TColGeom_SequenceOfBoundedSurface &Other);
		%feature("autodoc", "1");
		void Append(const Handle_Geom_BoundedSurface &T);
		%feature("autodoc", "1");
		void Append(TColGeom_SequenceOfBoundedSurface & S);
		%feature("autodoc", "1");
		void Prepend(const Handle_Geom_BoundedSurface &T);
		%feature("autodoc", "1");
		void Prepend(TColGeom_SequenceOfBoundedSurface & S);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, const Handle_Geom_BoundedSurface &I);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, TColGeom_SequenceOfBoundedSurface & S);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, const Handle_Geom_BoundedSurface &T);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, TColGeom_SequenceOfBoundedSurface & S);
		%feature("autodoc", "1");
		const Handle_Geom_BoundedSurface & First() const;
		%feature("autodoc", "1");
		const Handle_Geom_BoundedSurface & Last() const;
		%feature("autodoc", "1");
		void Split(const Standard_Integer Index, TColGeom_SequenceOfBoundedSurface & S);
		%feature("autodoc", "1");
		const Handle_Geom_BoundedSurface & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Handle_Geom_BoundedSurface & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_Geom_BoundedSurface &I);
		%feature("autodoc", "1");
		Handle_Geom_BoundedSurface & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Handle_Geom_BoundedSurface & operator()(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer FromIndex, const Standard_Integer ToIndex);

};

%nodefaultctor TColGeom_Array1OfSurface;
class TColGeom_Array1OfSurface {
	public:
		%feature("autodoc", "1");
		TColGeom_Array1OfSurface(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		TColGeom_Array1OfSurface(const Handle_Geom_Surface &Item, const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		void Init(const Handle_Geom_Surface &V);
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		~TColGeom_Array1OfSurface();
		%feature("autodoc", "1");
		Standard_Boolean IsAllocated() const;
		%feature("autodoc", "1");
		const TColGeom_Array1OfSurface & Assign(const TColGeom_Array1OfSurface &Other);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_Geom_Surface &Value);
		%feature("autodoc", "1");
		const Handle_Geom_Surface & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Handle_Geom_Surface & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_Geom_Surface & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Handle_Geom_Surface & operator()(const Standard_Integer Index);

};

%nodefaultctor TColGeom_HArray2OfBezierSurface;
class TColGeom_HArray2OfBezierSurface : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		TColGeom_HArray2OfBezierSurface(const Standard_Integer R1, const Standard_Integer R2, const Standard_Integer C1, const Standard_Integer C2);
		%feature("autodoc", "1");
		TColGeom_HArray2OfBezierSurface(const Standard_Integer R1, const Standard_Integer R2, const Standard_Integer C1, const Standard_Integer C2, const Handle_Geom_BezierSurface &V);
		%feature("autodoc", "1");
		void Init(const Handle_Geom_BezierSurface &V);
		%feature("autodoc", "1");
		Standard_Integer ColLength() const;
		%feature("autodoc", "1");
		Standard_Integer RowLength() const;
		%feature("autodoc", "1");
		Standard_Integer LowerCol() const;
		%feature("autodoc", "1");
		Standard_Integer LowerRow() const;
		%feature("autodoc", "1");
		Standard_Integer UpperCol() const;
		%feature("autodoc", "1");
		Standard_Integer UpperRow() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Row, const Standard_Integer Col, const Handle_Geom_BezierSurface &Value);
		%feature("autodoc", "1");
		const Handle_Geom_BezierSurface & Value(const Standard_Integer Row, const Standard_Integer Col) const;
		%feature("autodoc", "1");
		Handle_Geom_BezierSurface & ChangeValue(const Standard_Integer Row, const Standard_Integer Col);
		%feature("autodoc", "1");
		const TColGeom_Array2OfBezierSurface & Array2() const;
		%feature("autodoc", "1");
		TColGeom_Array2OfBezierSurface & ChangeArray2();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TColGeom_HArray2OfBezierSurface();

};
%extend TColGeom_HArray2OfBezierSurface {
	Handle_TColGeom_HArray2OfBezierSurface GetHandle() {
	return *(Handle_TColGeom_HArray2OfBezierSurface*) &$self;
	}
};

%nodefaultctor TColGeom_HArray1OfBoundedSurface;
class TColGeom_HArray1OfBoundedSurface : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		TColGeom_HArray1OfBoundedSurface(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		TColGeom_HArray1OfBoundedSurface(const Standard_Integer Low, const Standard_Integer Up, const Handle_Geom_BoundedSurface &V);
		%feature("autodoc", "1");
		void Init(const Handle_Geom_BoundedSurface &V);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_Geom_BoundedSurface &Value);
		%feature("autodoc", "1");
		const Handle_Geom_BoundedSurface & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_Geom_BoundedSurface & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		const TColGeom_Array1OfBoundedSurface & Array1() const;
		%feature("autodoc", "1");
		TColGeom_Array1OfBoundedSurface & ChangeArray1();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TColGeom_HArray1OfBoundedSurface();

};
%extend TColGeom_HArray1OfBoundedSurface {
	Handle_TColGeom_HArray1OfBoundedSurface GetHandle() {
	return *(Handle_TColGeom_HArray1OfBoundedSurface*) &$self;
	}
};

%nodefaultctor TColGeom_HArray2OfSurface;
class TColGeom_HArray2OfSurface : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		TColGeom_HArray2OfSurface(const Standard_Integer R1, const Standard_Integer R2, const Standard_Integer C1, const Standard_Integer C2);
		%feature("autodoc", "1");
		TColGeom_HArray2OfSurface(const Standard_Integer R1, const Standard_Integer R2, const Standard_Integer C1, const Standard_Integer C2, const Handle_Geom_Surface &V);
		%feature("autodoc", "1");
		void Init(const Handle_Geom_Surface &V);
		%feature("autodoc", "1");
		Standard_Integer ColLength() const;
		%feature("autodoc", "1");
		Standard_Integer RowLength() const;
		%feature("autodoc", "1");
		Standard_Integer LowerCol() const;
		%feature("autodoc", "1");
		Standard_Integer LowerRow() const;
		%feature("autodoc", "1");
		Standard_Integer UpperCol() const;
		%feature("autodoc", "1");
		Standard_Integer UpperRow() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Row, const Standard_Integer Col, const Handle_Geom_Surface &Value);
		%feature("autodoc", "1");
		const Handle_Geom_Surface & Value(const Standard_Integer Row, const Standard_Integer Col) const;
		%feature("autodoc", "1");
		Handle_Geom_Surface & ChangeValue(const Standard_Integer Row, const Standard_Integer Col);
		%feature("autodoc", "1");
		const TColGeom_Array2OfSurface & Array2() const;
		%feature("autodoc", "1");
		TColGeom_Array2OfSurface & ChangeArray2();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TColGeom_HArray2OfSurface();

};
%extend TColGeom_HArray2OfSurface {
	Handle_TColGeom_HArray2OfSurface GetHandle() {
	return *(Handle_TColGeom_HArray2OfSurface*) &$self;
	}
};

%nodefaultctor TColGeom_SequenceOfBoundedCurve;
class TColGeom_SequenceOfBoundedCurve : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "1");
		TColGeom_SequenceOfBoundedCurve();
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~TColGeom_SequenceOfBoundedCurve();
		%feature("autodoc", "1");
		const TColGeom_SequenceOfBoundedCurve & Assign(const TColGeom_SequenceOfBoundedCurve &Other);
		%feature("autodoc", "1");
		void Append(const Handle_Geom_BoundedCurve &T);
		%feature("autodoc", "1");
		void Append(TColGeom_SequenceOfBoundedCurve & S);
		%feature("autodoc", "1");
		void Prepend(const Handle_Geom_BoundedCurve &T);
		%feature("autodoc", "1");
		void Prepend(TColGeom_SequenceOfBoundedCurve & S);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, const Handle_Geom_BoundedCurve &I);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, TColGeom_SequenceOfBoundedCurve & S);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, const Handle_Geom_BoundedCurve &T);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, TColGeom_SequenceOfBoundedCurve & S);
		%feature("autodoc", "1");
		const Handle_Geom_BoundedCurve & First() const;
		%feature("autodoc", "1");
		const Handle_Geom_BoundedCurve & Last() const;
		%feature("autodoc", "1");
		void Split(const Standard_Integer Index, TColGeom_SequenceOfBoundedCurve & S);
		%feature("autodoc", "1");
		const Handle_Geom_BoundedCurve & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Handle_Geom_BoundedCurve & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_Geom_BoundedCurve &I);
		%feature("autodoc", "1");
		Handle_Geom_BoundedCurve & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Handle_Geom_BoundedCurve & operator()(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer FromIndex, const Standard_Integer ToIndex);

};

%nodefaultctor TColGeom_SequenceNodeOfSequenceOfBoundedCurve;
class TColGeom_SequenceNodeOfSequenceOfBoundedCurve : public TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		TColGeom_SequenceNodeOfSequenceOfBoundedCurve(const Handle_Geom_BoundedCurve &I, const TCollection_SeqNodePtr &n, const TCollection_SeqNodePtr &p);
		%feature("autodoc", "1");
		Handle_Geom_BoundedCurve & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TColGeom_SequenceNodeOfSequenceOfBoundedCurve();

};
%extend TColGeom_SequenceNodeOfSequenceOfBoundedCurve {
	Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve GetHandle() {
	return *(Handle_TColGeom_SequenceNodeOfSequenceOfBoundedCurve*) &$self;
	}
};

%nodefaultctor TColGeom_HSequenceOfBoundedSurface;
class TColGeom_HSequenceOfBoundedSurface : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		TColGeom_HSequenceOfBoundedSurface();
		%feature("autodoc", "1");
		Standard_Boolean IsEmpty() const;
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		void Append(const Handle_Geom_BoundedSurface &anItem);
		%feature("autodoc", "1");
		void Append(const Handle_TColGeom_HSequenceOfBoundedSurface &aSequence);
		%feature("autodoc", "1");
		void Prepend(const Handle_Geom_BoundedSurface &anItem);
		%feature("autodoc", "1");
		void Prepend(const Handle_TColGeom_HSequenceOfBoundedSurface &aSequence);
		%feature("autodoc", "1");
		void Reverse();
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer anIndex, const Handle_Geom_BoundedSurface &anItem);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer anIndex, const Handle_TColGeom_HSequenceOfBoundedSurface &aSequence);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer anIndex, const Handle_Geom_BoundedSurface &anItem);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer anIndex, const Handle_TColGeom_HSequenceOfBoundedSurface &aSequence);
		%feature("autodoc", "1");
		void Exchange(const Standard_Integer anIndex, const Standard_Integer anOtherIndex);
		%feature("autodoc", "1");
		Handle_TColGeom_HSequenceOfBoundedSurface Split(const Standard_Integer anIndex);
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer anIndex, const Handle_Geom_BoundedSurface &anItem);
		%feature("autodoc", "1");
		const Handle_Geom_BoundedSurface & Value(const Standard_Integer anIndex) const;
		%feature("autodoc", "1");
		Handle_Geom_BoundedSurface & ChangeValue(const Standard_Integer anIndex);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer anIndex);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer fromIndex, const Standard_Integer toIndex);
		%feature("autodoc", "1");
		const TColGeom_SequenceOfBoundedSurface & Sequence() const;
		%feature("autodoc", "1");
		TColGeom_SequenceOfBoundedSurface & ChangeSequence();
		%feature("autodoc", "1");
		Handle_TColGeom_HSequenceOfBoundedSurface ShallowCopy() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TColGeom_HSequenceOfBoundedSurface();

};
%extend TColGeom_HSequenceOfBoundedSurface {
	Handle_TColGeom_HSequenceOfBoundedSurface GetHandle() {
	return *(Handle_TColGeom_HSequenceOfBoundedSurface*) &$self;
	}
};

%nodefaultctor TColGeom_Array1OfBoundedSurface;
class TColGeom_Array1OfBoundedSurface {
	public:
		%feature("autodoc", "1");
		TColGeom_Array1OfBoundedSurface(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		TColGeom_Array1OfBoundedSurface(const Handle_Geom_BoundedSurface &Item, const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		void Init(const Handle_Geom_BoundedSurface &V);
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		~TColGeom_Array1OfBoundedSurface();
		%feature("autodoc", "1");
		Standard_Boolean IsAllocated() const;
		%feature("autodoc", "1");
		const TColGeom_Array1OfBoundedSurface & Assign(const TColGeom_Array1OfBoundedSurface &Other);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_Geom_BoundedSurface &Value);
		%feature("autodoc", "1");
		const Handle_Geom_BoundedSurface & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Handle_Geom_BoundedSurface & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_Geom_BoundedSurface & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Handle_Geom_BoundedSurface & operator()(const Standard_Integer Index);

};

%nodefaultctor TColGeom_HArray1OfBSplineCurve;
class TColGeom_HArray1OfBSplineCurve : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		TColGeom_HArray1OfBSplineCurve(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		TColGeom_HArray1OfBSplineCurve(const Standard_Integer Low, const Standard_Integer Up, const Handle_Geom_BSplineCurve &V);
		%feature("autodoc", "1");
		void Init(const Handle_Geom_BSplineCurve &V);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_Geom_BSplineCurve &Value);
		%feature("autodoc", "1");
		const Handle_Geom_BSplineCurve & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_Geom_BSplineCurve & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		const TColGeom_Array1OfBSplineCurve & Array1() const;
		%feature("autodoc", "1");
		TColGeom_Array1OfBSplineCurve & ChangeArray1();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TColGeom_HArray1OfBSplineCurve();

};
%extend TColGeom_HArray1OfBSplineCurve {
	Handle_TColGeom_HArray1OfBSplineCurve GetHandle() {
	return *(Handle_TColGeom_HArray1OfBSplineCurve*) &$self;
	}
};

%nodefaultctor TColGeom_SequenceOfSurface;
class TColGeom_SequenceOfSurface : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "1");
		TColGeom_SequenceOfSurface();
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~TColGeom_SequenceOfSurface();
		%feature("autodoc", "1");
		const TColGeom_SequenceOfSurface & Assign(const TColGeom_SequenceOfSurface &Other);
		%feature("autodoc", "1");
		void Append(const Handle_Geom_Surface &T);
		%feature("autodoc", "1");
		void Append(TColGeom_SequenceOfSurface & S);
		%feature("autodoc", "1");
		void Prepend(const Handle_Geom_Surface &T);
		%feature("autodoc", "1");
		void Prepend(TColGeom_SequenceOfSurface & S);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, const Handle_Geom_Surface &I);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, TColGeom_SequenceOfSurface & S);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, const Handle_Geom_Surface &T);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, TColGeom_SequenceOfSurface & S);
		%feature("autodoc", "1");
		const Handle_Geom_Surface & First() const;
		%feature("autodoc", "1");
		const Handle_Geom_Surface & Last() const;
		%feature("autodoc", "1");
		void Split(const Standard_Integer Index, TColGeom_SequenceOfSurface & S);
		%feature("autodoc", "1");
		const Handle_Geom_Surface & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Handle_Geom_Surface & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_Geom_Surface &I);
		%feature("autodoc", "1");
		Handle_Geom_Surface & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Handle_Geom_Surface & operator()(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer FromIndex, const Standard_Integer ToIndex);

};

%nodefaultctor TColGeom_HArray2OfBSplineSurface;
class TColGeom_HArray2OfBSplineSurface : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		TColGeom_HArray2OfBSplineSurface(const Standard_Integer R1, const Standard_Integer R2, const Standard_Integer C1, const Standard_Integer C2);
		%feature("autodoc", "1");
		TColGeom_HArray2OfBSplineSurface(const Standard_Integer R1, const Standard_Integer R2, const Standard_Integer C1, const Standard_Integer C2, const Handle_Geom_BSplineSurface &V);
		%feature("autodoc", "1");
		void Init(const Handle_Geom_BSplineSurface &V);
		%feature("autodoc", "1");
		Standard_Integer ColLength() const;
		%feature("autodoc", "1");
		Standard_Integer RowLength() const;
		%feature("autodoc", "1");
		Standard_Integer LowerCol() const;
		%feature("autodoc", "1");
		Standard_Integer LowerRow() const;
		%feature("autodoc", "1");
		Standard_Integer UpperCol() const;
		%feature("autodoc", "1");
		Standard_Integer UpperRow() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Row, const Standard_Integer Col, const Handle_Geom_BSplineSurface &Value);
		%feature("autodoc", "1");
		const Handle_Geom_BSplineSurface & Value(const Standard_Integer Row, const Standard_Integer Col) const;
		%feature("autodoc", "1");
		Handle_Geom_BSplineSurface & ChangeValue(const Standard_Integer Row, const Standard_Integer Col);
		%feature("autodoc", "1");
		const TColGeom_Array2OfBSplineSurface & Array2() const;
		%feature("autodoc", "1");
		TColGeom_Array2OfBSplineSurface & ChangeArray2();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TColGeom_HArray2OfBSplineSurface();

};
%extend TColGeom_HArray2OfBSplineSurface {
	Handle_TColGeom_HArray2OfBSplineSurface GetHandle() {
	return *(Handle_TColGeom_HArray2OfBSplineSurface*) &$self;
	}
};

%nodefaultctor TColGeom_Array2OfBoundedSurface;
class TColGeom_Array2OfBoundedSurface {
	public:
		%feature("autodoc", "1");
		TColGeom_Array2OfBoundedSurface(const Standard_Integer R1, const Standard_Integer R2, const Standard_Integer C1, const Standard_Integer C2);
		%feature("autodoc", "1");
		TColGeom_Array2OfBoundedSurface(const Handle_Geom_BoundedSurface &Item, const Standard_Integer R1, const Standard_Integer R2, const Standard_Integer C1, const Standard_Integer C2);
		%feature("autodoc", "1");
		void Init(const Handle_Geom_BoundedSurface &V);
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		~TColGeom_Array2OfBoundedSurface();
		%feature("autodoc", "1");
		const TColGeom_Array2OfBoundedSurface & Assign(const TColGeom_Array2OfBoundedSurface &Other);
		%feature("autodoc", "1");
		Standard_Integer ColLength() const;
		%feature("autodoc", "1");
		Standard_Integer RowLength() const;
		%feature("autodoc", "1");
		Standard_Integer LowerCol() const;
		%feature("autodoc", "1");
		Standard_Integer LowerRow() const;
		%feature("autodoc", "1");
		Standard_Integer UpperCol() const;
		%feature("autodoc", "1");
		Standard_Integer UpperRow() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Row, const Standard_Integer Col, const Handle_Geom_BoundedSurface &Value);
		%feature("autodoc", "1");
		const Handle_Geom_BoundedSurface & Value(const Standard_Integer Row, const Standard_Integer Col) const;
		%feature("autodoc", "1");
		const Handle_Geom_BoundedSurface & operator()(const Standard_Integer Row, const Standard_Integer Col) const;
		%feature("autodoc", "1");
		Handle_Geom_BoundedSurface & ChangeValue(const Standard_Integer Row, const Standard_Integer Col);
		%feature("autodoc", "1");
		Handle_Geom_BoundedSurface & operator()(const Standard_Integer Row, const Standard_Integer Col);

};

%nodefaultctor TColGeom_Array1OfBSplineCurve;
class TColGeom_Array1OfBSplineCurve {
	public:
		%feature("autodoc", "1");
		TColGeom_Array1OfBSplineCurve(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		TColGeom_Array1OfBSplineCurve(const Handle_Geom_BSplineCurve &Item, const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		void Init(const Handle_Geom_BSplineCurve &V);
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		~TColGeom_Array1OfBSplineCurve();
		%feature("autodoc", "1");
		Standard_Boolean IsAllocated() const;
		%feature("autodoc", "1");
		const TColGeom_Array1OfBSplineCurve & Assign(const TColGeom_Array1OfBSplineCurve &Other);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_Geom_BSplineCurve &Value);
		%feature("autodoc", "1");
		const Handle_Geom_BSplineCurve & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Handle_Geom_BSplineCurve & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_Geom_BSplineCurve & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Handle_Geom_BSplineCurve & operator()(const Standard_Integer Index);

};

%nodefaultctor TColGeom_Array1OfBezierCurve;
class TColGeom_Array1OfBezierCurve {
	public:
		%feature("autodoc", "1");
		TColGeom_Array1OfBezierCurve(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		TColGeom_Array1OfBezierCurve(const Handle_Geom_BezierCurve &Item, const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		void Init(const Handle_Geom_BezierCurve &V);
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		~TColGeom_Array1OfBezierCurve();
		%feature("autodoc", "1");
		Standard_Boolean IsAllocated() const;
		%feature("autodoc", "1");
		const TColGeom_Array1OfBezierCurve & Assign(const TColGeom_Array1OfBezierCurve &Other);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_Geom_BezierCurve &Value);
		%feature("autodoc", "1");
		const Handle_Geom_BezierCurve & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Handle_Geom_BezierCurve & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_Geom_BezierCurve & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Handle_Geom_BezierCurve & operator()(const Standard_Integer Index);

};

%nodefaultctor TColGeom_HArray1OfBoundedCurve;
class TColGeom_HArray1OfBoundedCurve : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		TColGeom_HArray1OfBoundedCurve(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		TColGeom_HArray1OfBoundedCurve(const Standard_Integer Low, const Standard_Integer Up, const Handle_Geom_BoundedCurve &V);
		%feature("autodoc", "1");
		void Init(const Handle_Geom_BoundedCurve &V);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_Geom_BoundedCurve &Value);
		%feature("autodoc", "1");
		const Handle_Geom_BoundedCurve & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_Geom_BoundedCurve & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		const TColGeom_Array1OfBoundedCurve & Array1() const;
		%feature("autodoc", "1");
		TColGeom_Array1OfBoundedCurve & ChangeArray1();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TColGeom_HArray1OfBoundedCurve();

};
%extend TColGeom_HArray1OfBoundedCurve {
	Handle_TColGeom_HArray1OfBoundedCurve GetHandle() {
	return *(Handle_TColGeom_HArray1OfBoundedCurve*) &$self;
	}
};

%nodefaultctor TColGeom_Array2OfBSplineSurface;
class TColGeom_Array2OfBSplineSurface {
	public:
		%feature("autodoc", "1");
		TColGeom_Array2OfBSplineSurface(const Standard_Integer R1, const Standard_Integer R2, const Standard_Integer C1, const Standard_Integer C2);
		%feature("autodoc", "1");
		TColGeom_Array2OfBSplineSurface(const Handle_Geom_BSplineSurface &Item, const Standard_Integer R1, const Standard_Integer R2, const Standard_Integer C1, const Standard_Integer C2);
		%feature("autodoc", "1");
		void Init(const Handle_Geom_BSplineSurface &V);
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		~TColGeom_Array2OfBSplineSurface();
		%feature("autodoc", "1");
		const TColGeom_Array2OfBSplineSurface & Assign(const TColGeom_Array2OfBSplineSurface &Other);
		%feature("autodoc", "1");
		Standard_Integer ColLength() const;
		%feature("autodoc", "1");
		Standard_Integer RowLength() const;
		%feature("autodoc", "1");
		Standard_Integer LowerCol() const;
		%feature("autodoc", "1");
		Standard_Integer LowerRow() const;
		%feature("autodoc", "1");
		Standard_Integer UpperCol() const;
		%feature("autodoc", "1");
		Standard_Integer UpperRow() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Row, const Standard_Integer Col, const Handle_Geom_BSplineSurface &Value);
		%feature("autodoc", "1");
		const Handle_Geom_BSplineSurface & Value(const Standard_Integer Row, const Standard_Integer Col) const;
		%feature("autodoc", "1");
		const Handle_Geom_BSplineSurface & operator()(const Standard_Integer Row, const Standard_Integer Col) const;
		%feature("autodoc", "1");
		Handle_Geom_BSplineSurface & ChangeValue(const Standard_Integer Row, const Standard_Integer Col);
		%feature("autodoc", "1");
		Handle_Geom_BSplineSurface & operator()(const Standard_Integer Row, const Standard_Integer Col);

};

%nodefaultctor TColGeom_HArray1OfBezierCurve;
class TColGeom_HArray1OfBezierCurve : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		TColGeom_HArray1OfBezierCurve(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		TColGeom_HArray1OfBezierCurve(const Standard_Integer Low, const Standard_Integer Up, const Handle_Geom_BezierCurve &V);
		%feature("autodoc", "1");
		void Init(const Handle_Geom_BezierCurve &V);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_Geom_BezierCurve &Value);
		%feature("autodoc", "1");
		const Handle_Geom_BezierCurve & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_Geom_BezierCurve & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		const TColGeom_Array1OfBezierCurve & Array1() const;
		%feature("autodoc", "1");
		TColGeom_Array1OfBezierCurve & ChangeArray1();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TColGeom_HArray1OfBezierCurve();

};
%extend TColGeom_HArray1OfBezierCurve {
	Handle_TColGeom_HArray1OfBezierCurve GetHandle() {
	return *(Handle_TColGeom_HArray1OfBezierCurve*) &$self;
	}
};

%nodefaultctor TColGeom_SequenceOfCurve;
class TColGeom_SequenceOfCurve : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "1");
		TColGeom_SequenceOfCurve();
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~TColGeom_SequenceOfCurve();
		%feature("autodoc", "1");
		const TColGeom_SequenceOfCurve & Assign(const TColGeom_SequenceOfCurve &Other);
		%feature("autodoc", "1");
		void Append(const Handle_Geom_Curve &T);
		%feature("autodoc", "1");
		void Append(TColGeom_SequenceOfCurve & S);
		%feature("autodoc", "1");
		void Prepend(const Handle_Geom_Curve &T);
		%feature("autodoc", "1");
		void Prepend(TColGeom_SequenceOfCurve & S);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, const Handle_Geom_Curve &I);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, TColGeom_SequenceOfCurve & S);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, const Handle_Geom_Curve &T);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, TColGeom_SequenceOfCurve & S);
		%feature("autodoc", "1");
		const Handle_Geom_Curve & First() const;
		%feature("autodoc", "1");
		const Handle_Geom_Curve & Last() const;
		%feature("autodoc", "1");
		void Split(const Standard_Integer Index, TColGeom_SequenceOfCurve & S);
		%feature("autodoc", "1");
		const Handle_Geom_Curve & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Handle_Geom_Curve & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_Geom_Curve &I);
		%feature("autodoc", "1");
		Handle_Geom_Curve & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Handle_Geom_Curve & operator()(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer FromIndex, const Standard_Integer ToIndex);

};

%nodefaultctor TColGeom_SequenceNodeOfSequenceOfSurface;
class TColGeom_SequenceNodeOfSequenceOfSurface : public TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		TColGeom_SequenceNodeOfSequenceOfSurface(const Handle_Geom_Surface &I, const TCollection_SeqNodePtr &n, const TCollection_SeqNodePtr &p);
		%feature("autodoc", "1");
		Handle_Geom_Surface & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TColGeom_SequenceNodeOfSequenceOfSurface();

};
%extend TColGeom_SequenceNodeOfSequenceOfSurface {
	Handle_TColGeom_SequenceNodeOfSequenceOfSurface GetHandle() {
	return *(Handle_TColGeom_SequenceNodeOfSequenceOfSurface*) &$self;
	}
};