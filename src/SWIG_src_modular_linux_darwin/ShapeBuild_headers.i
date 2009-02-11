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
%{

// Headers necessary to define wrapped classes.

#include<ShapeBuild_ReShape.hxx>
#include<ShapeBuild_Vertex.hxx>
#include<ShapeBuild_Edge.hxx>
#include<ShapeBuild.hxx>
#include<Handle_ShapeBuild_ReShape.hxx>

// Additional headers necessary for compilation.

#include<TopoDS_TVertex.hxx>
#include<TopoDS_TWire.hxx>
#include<TopoDS_TEdge.hxx>
#include<TopoDSToStep_FacetedTool.hxx>
#include<TopoDSToStep_FacetedError.hxx>
#include<TopoDS_CompSolid.hxx>
#include<TopoDS_Solid.hxx>
#include<TopoDSToStep_MakeGeometricCurveSet.hxx>
#include<TopoDSToStep_MakeEdgeError.hxx>
#include<TopoDS_HShape.hxx>
#include<TopoDS_Vertex.hxx>
#include<TopoDS_TCompSolid.hxx>
#include<TopoDS_Iterator.hxx>
#include<TopoDSToStep_MakeShellBasedSurfaceModel.hxx>
#include<TopoDSToStep_MakeStepFace.hxx>
#include<TopoDS_TCompound.hxx>
#include<TopoDSToStep.hxx>
#include<TopoDS_Builder.hxx>
#include<TopoDSToStep_Root.hxx>
#include<TopoDSToStep_MakeWireError.hxx>
#include<TopoDSToStep_MakeStepEdge.hxx>
#include<TopoDS_UnCompatibleShapes.hxx>
#include<TopoDSToStep_MakeBrepWithVoids.hxx>
#include<TopoDS_Compound.hxx>
#include<TopoDS_TFace.hxx>
#include<TopoDS_TShape.hxx>
#include<TopoDSToStep_MakeStepVertex.hxx>
#include<TopoDSToStep_WireframeBuilder.hxx>
#include<TopoDS_TShell.hxx>
#include<TopoDS.hxx>
#include<TopoDS_TSolid.hxx>
#include<TopoDS_ListIteratorOfListOfShape.hxx>
#include<TopoDSToStep_BuilderError.hxx>
#include<TopoDS_ListOfShape.hxx>
#include<TopoDS_FrozenShape.hxx>
#include<TopoDSToStep_MakeManifoldSolidBrep.hxx>
#include<TopoDS_Shell.hxx>
#include<TopoDSToStep_MakeFacetedBrep.hxx>
#include<TopoDSToStep_Tool.hxx>
#include<TopoDS_ListNodeOfListOfShape.hxx>
#include<TopoDS_Edge.hxx>
#include<TopoDSToStep_MakeFaceError.hxx>
#include<TopoDSToStep_MakeVertexError.hxx>
#include<TopoDS_Shape.hxx>
#include<TopoDS_Wire.hxx>
#include<TopoDS_Builder3D.hxx>
#include<TopoDS_Face.hxx>
#include<TopoDSToStep_MakeStepWire.hxx>
#include<TopoDSToStep_MakeFacetedBrepAndBrepWithVoids.hxx>
#include<TopoDSToStep_Builder.hxx>
#include<TopTools_DataMapOfShapeListOfShape.hxx>
#include<TopTools_MapIteratorOfMapOfShape.hxx>
#include<TopTools_DataMapNodeOfDataMapOfOrientedShapeInteger.hxx>
#include<TopTools_ShapeSet.hxx>
#include<TopTools_IndexedDataMapOfShapeListOfShape.hxx>
#include<TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeShape.hxx>
#include<TopTools_IndexedMapNodeOfIndexedMapOfOrientedShape.hxx>
#include<TopTools_DataMapOfShapeListOfInteger.hxx>
#include<TopTools_DataMapNodeOfDataMapOfShapeShape.hxx>
#include<TopTools_StdMapNodeOfMapOfShape.hxx>
#include<TopTools_HArray1OfListOfShape.hxx>
#include<TopTools_DataMapIteratorOfDataMapOfShapeListOfShape.hxx>
#include<TopTools_SequenceOfShape.hxx>
#include<TopTools_SequenceNodeOfSequenceOfShape.hxx>
#include<TopTools_LocationSet.hxx>
#include<TopTools_MapOfOrientedShape.hxx>
#include<TopTools_DataMapIteratorOfDataMapOfShapeInteger.hxx>
#include<TopTools_DataMapOfIntegerShape.hxx>
#include<TopTools_DataMapNodeOfDataMapOfIntegerListOfShape.hxx>
#include<TopTools_DataMapOfIntegerListOfShape.hxx>
#include<TopTools_MapIteratorOfMapOfOrientedShape.hxx>
#include<TopTools_DataMapOfShapeInteger.hxx>
#include<TopTools_IndexedMapOfShape.hxx>
#include<TopTools_Array1OfShape.hxx>
#include<TopTools_ListOfShape.hxx>
#include<TopTools_IndexedMapOfOrientedShape.hxx>
#include<TopTools_OrientedShapeMapHasher.hxx>
#include<TopTools_DataMapIteratorOfDataMapOfIntegerListOfShape.hxx>
#include<TopTools_ShapeMapHasher.hxx>
#include<TopTools_HArray1OfShape.hxx>
#include<TopTools_DataMapIteratorOfDataMapOfOrientedShapeInteger.hxx>
#include<TopTools_ListNodeOfListOfShape.hxx>
#include<TopTools_DataMapOfOrientedShapeInteger.hxx>
#include<TopTools_HArray2OfShape.hxx>
#include<TopTools.hxx>
#include<TopTools_StdMapNodeOfMapOfOrientedShape.hxx>
#include<TopTools_IndexedMapNodeOfIndexedMapOfShape.hxx>
#include<TopTools_IndexedDataMapNodeOfIndexedDataMapOfShapeListOfShape.hxx>
#include<TopTools_Array1OfListOfShape.hxx>
#include<TopTools_DataMapOfShapeShape.hxx>
#include<TopTools_DataMapNodeOfDataMapOfIntegerShape.hxx>
#include<TopTools_IndexedDataMapOfShapeShape.hxx>
#include<TopTools_MapOfShape.hxx>
#include<TopTools_HSequenceOfShape.hxx>
#include<TopTools_DataMapIteratorOfDataMapOfShapeListOfInteger.hxx>
#include<TopTools_DataMapIteratorOfDataMapOfIntegerShape.hxx>
#include<TopTools_DataMapNodeOfDataMapOfShapeListOfShape.hxx>
#include<TopTools_Array2OfShape.hxx>
#include<TopTools_DataMapIteratorOfDataMapOfShapeShape.hxx>
#include<TopTools_DataMapNodeOfDataMapOfShapeListOfInteger.hxx>
#include<TopTools_DataMapNodeOfDataMapOfShapeInteger.hxx>
#include<TopTools_ListIteratorOfListOfShape.hxx>
#include<TCollection_MapNodePtr.hxx>
#include<TCollection_PrivCompareOfInteger.hxx>
#include<TCollection_BaseSequence.hxx>
#include<TCollection_HAsciiString.hxx>
#include<TCollection_AVLBaseNodePtr.hxx>
#include<TCollection_BasicMap.hxx>
#include<TCollection_SeqNodePtr.hxx>
#include<TCollection.hxx>
#include<TCollection_CompareOfInteger.hxx>
#include<TCollection_ExtendedString.hxx>
#include<TCollection_CompareOfReal.hxx>
#include<TCollection_AVLBaseNode.hxx>
#include<TCollection_BasicMapIterator.hxx>
#include<TCollection_MapNode.hxx>
#include<TCollection_Array2Descriptor.hxx>
#include<TCollection_SeqNode.hxx>
#include<TCollection_Array1Descriptor.hxx>
#include<TCollection_PrivCompareOfReal.hxx>
#include<TCollection_AsciiString.hxx>
#include<TCollection_Side.hxx>
#include<TCollection_HExtendedString.hxx>
#include<Geom_Hyperbola.hxx>
#include<Geom2dGcc_Circ2d2TanRad.hxx>
#include<Geom2dConvert.hxx>
#include<Geom_SurfaceOfRevolution.hxx>
#include<Geom2dConvert_CompCurveToBSplineCurve.hxx>
#include<GeomInt_WLApprox.hxx>
#include<GeomToStep_MakeBoundedSurface.hxx>
#include<GeomFill_LocationDraft.hxx>
#include<GeomPlate_BuildAveragePlane.hxx>
#include<GeomPlate_CurveConstraint.hxx>
#include<Geom_SequenceNodeOfSequenceOfBSplineSurface.hxx>
#include<GeomFill_BoundWithSurf.hxx>
#include<Geom2dHatch_ElementsOfHatcher.hxx>
#include<Geom2dHatch_HatchingsOfHatcher.hxx>
#include<GeomInt_MyGradientbisOfTheComputeLineOfWLApprox.hxx>
#include<Geom2d_BezierCurve.hxx>
#include<Geom2dInt_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter.hxx>
#include<GeomAPI_PointsToBSpline.hxx>
#include<GeomConvert.hxx>
#include<Geom2dInt_Geom2dCurveTool.hxx>
#include<GeomInt_SequenceNodeOfSequenceOfParameterAndOrientation.hxx>
#include<GeomPlate_HArray1OfSequenceOfReal.hxx>
#include<Geom2d_Transformation.hxx>
#include<GeomPlate_Aij.hxx>
#include<GeomInt_BSpParFunctionOfMyBSplGradientOfTheComputeLineOfWLApprox.hxx>
#include<GeomFill_TgtOnCoons.hxx>
#include<Geom2d_UndefinedDerivative.hxx>
#include<GeomToStep_MakeToroidalSurface.hxx>
#include<Geom2d_Hyperbola.hxx>
#include<Geom_Axis1Placement.hxx>
#include<GeomInt_ResConstraintOfMyGradientOfTheComputeLineBezierOfWLApprox.hxx>
#include<GeomFill_Tensor.hxx>
#include<GeomFill_DraftTrihedron.hxx>
#include<Geom2dHatch_ElementOfHatcher.hxx>
#include<GeomTools_CurveSet.hxx>
#include<Geom2dGcc_FuncTOblOfMyL2dTanObl.hxx>
#include<GeomFill_CorrectedFrenet.hxx>
#include<Geom2dInt_InterferencePoly2dOfTheIntPCurvePCurveOfGInter.hxx>
#include<Geom2dGcc_MyCirc2dTanOnRad.hxx>
#include<GeomAPI_PointsToBSplineSurface.hxx>
#include<GeomPlate_Array1OfHCurveOnSurface.hxx>
#include<Geom2d_Parabola.hxx>
#include<GeomPlate_PlateG0Criterion.hxx>
#include<GeomToStep_MakeBSplineSurfaceWithKnots.hxx>
#include<Geom2dAPI_ExtremaCurveCurve.hxx>
#include<Geom_SequenceOfBSplineSurface.hxx>
#include<GeomLib_Tool.hxx>
#include<GeomToStep_MakePolyline.hxx>
#include<GeomConvert_BSplineCurveKnotSplitting.hxx>
#include<GeomToIGES_GeomEntity.hxx>
#include<Geom2dGcc_MyL2dTanObl.hxx>
#include<GeomLib_LogSample.hxx>
#include<Geom2dInt_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfGInter.hxx>
#include<GeomAbs_SurfaceForm.hxx>
#include<Geom2dInt_TheIntPCurvePCurveOfGInter.hxx>
#include<GeomInt_IntSS.hxx>
#include<Geom_Curve.hxx>
#include<Geom2dHatch_DataMapNodeOfMapOfElementsOfElementsOfHatcher.hxx>
#include<GeomInt_ParFunctionOfMyGradientOfTheComputeLineBezierOfWLApprox.hxx>
#include<Geom2dInt_TheIntConicCurveOfGInter.hxx>
#include<Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter.hxx>
#include<Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter.hxx>
#include<Geom2dInt_TheCurveLocatorOfTheProjPCurOfGInter.hxx>
#include<Geom2dToIGES_Geom2dEntity.hxx>
#include<GeomAbs_CurveForm.hxx>
#include<GeomFill_SectionLaw.hxx>
#include<Geom2dGcc_Circ2d3Tan.hxx>
#include<GeomLProp_CurveTool.hxx>
#include<GeomPlate_MakeApprox.hxx>
#include<Geom2dAPI_ProjectPointOnCurve.hxx>
#include<Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter.hxx>
#include<Geom2dGcc_FuncTCuCuOnCuOfMyC2d2TanOn.hxx>
#include<GeomTools_UndefinedTypeHandler.hxx>
#include<GeomAbs_IsoType.hxx>
#include<GeomFill_PipeError.hxx>
#include<GeomInt_LineConstructor.hxx>
#include<Geom2dGcc_FuncTCuCuCuOfMyC2d3Tan.hxx>
#include<GeomInt_TheImpPrmSvSurfacesOfWLApprox.hxx>
#include<GeomAPI_IntCS.hxx>
#include<Geom2dLProp_CurAndInf2d.hxx>
#include<GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve.hxx>
#include<GeomAPI_ProjectPointOnCurve.hxx>
#include<Geom2dGcc_Circ2d2TanOn.hxx>
#include<Geom_Point.hxx>
#include<GeomToStep_MakePlane.hxx>
#include<Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter.hxx>
#include<GeomPlate_SequenceOfPointConstraint.hxx>
#include<GeomTools_Curve2dSet.hxx>
#include<Geom2dHatch_HatchingOfHatcher.hxx>
#include<GeomTools.hxx>
#include<GeomAPI_Interpolate.hxx>
#include<Geom2dGcc_MyL2d2Tan.hxx>
#include<GeomToStep_MakeConic.hxx>
#include<GeomInt_Gradient_BFGSOfMyGradientbisOfTheComputeLineOfWLApprox.hxx>
#include<Geom2dConvert_ApproxCurve.hxx>
#include<Geom_BoundedSurface.hxx>
#include<GeomFill_Coons.hxx>
#include<GeomFill_Sweep.hxx>
#include<GeomFill_SimpleBound.hxx>
#include<GeomInt_MyBSplGradientOfTheComputeLineOfWLApprox.hxx>
#include<GeomToStep_MakeCircle.hxx>
#include<GeomFill_CurveAndTrihedron.hxx>
#include<GeomPlate_PointConstraint.hxx>
#include<GeomConvert_ApproxSurface.hxx>
#include<GeomFill_Array1OfLocationLaw.hxx>
#include<GeomFill_Boundary.hxx>
#include<GeomFill_CoonsAlgPatch.hxx>
#include<Geom2d_Point.hxx>
#include<Geom2dConvert_BSplineCurveKnotSplitting.hxx>
#include<GeomAPI_IntSS.hxx>
#include<Geom2dHatch_DataMapIteratorOfHatchingsOfHatcher.hxx>
#include<Geom_Plane.hxx>
#include<GeomToStep_MakeRectangularTrimmedSurface.hxx>
#include<Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter.hxx>
#include<GeomProjLib.hxx>
#include<GeomFill_HArray1OfSectionLaw.hxx>
#include<GeomFill_NSections.hxx>
#include<Geom2d_Conic.hxx>
#include<Geom_OffsetSurface.hxx>
#include<GeomFill_SectionPlacement.hxx>
#include<GeomFill_SequenceOfCurve.hxx>
#include<Geom_HSequenceOfSurface.hxx>
#include<Geom_SweptSurface.hxx>
#include<GeomLib_MakeCurvefromApprox.hxx>
#include<Geom2d_Ellipse.hxx>
#include<GeomPlate_HSequenceOfPointConstraint.hxx>
#include<GeomFill_ApproxStyle.hxx>
#include<GeomFill_SequenceNodeOfSequenceOfCurve.hxx>
#include<GeomToIGES_GeomVector.hxx>
#include<Geom2dInt_TheProjPCurOfGInter.hxx>
#include<GeomFill_Pipe.hxx>
#include<GeomToStep_MakeParabola.hxx>
#include<Geom_Conic.hxx>
#include<Geom2d_CartesianPoint.hxx>
#include<GeomToStep_MakeAxis2Placement2d.hxx>
#include<GeomInt_ParLeastSquareOfMyGradientOfTheComputeLineBezierOfWLApprox.hxx>
#include<GeomToStep_MakeSweptSurface.hxx>
#include<GeomPlate_SequenceNodeOfSequenceOfCurveConstraint.hxx>
#include<Geom2dGcc_MyC2d2TanOn.hxx>
#include<GeomFill_SweepFunction.hxx>
#include<Geom2dHatch_ClassifierOfHatcher.hxx>
#include<Geom2dHatch_Intersector.hxx>
#include<GeomConvert_ApproxCurve.hxx>
#include<GeomToStep_MakeAxis2Placement3d.hxx>
#include<GeomLib_DenominatorMultiplier.hxx>
#include<Geom2d_UndefinedValue.hxx>
#include<Geom_Vector.hxx>
#include<Geom2dGcc_MyCirc2d2TanOn.hxx>
#include<GeomToStep_MakeConicalSurface.hxx>
#include<GeomToStep_MakeAxis1Placement.hxx>
#include<GeomLProp_SLProps.hxx>
#include<GeomTools_SurfaceSet.hxx>
#include<GeomLib_IsPlanarSurface.hxx>
#include<Geom2dGcc_FuncTCuCuOfMyL2d2Tan.hxx>
#include<GeomInt_ParLeastSquareOfMyGradientbisOfTheComputeLineOfWLApprox.hxx>
#include<GeomAdaptor.hxx>
#include<Geom_CylindricalSurface.hxx>
#include<Geom2dLProp_FCurExtOfNumericCurInf2d.hxx>
#include<Geom2dHatch_DataMapIteratorOfMapOfElementsOfElementsOfHatcher.hxx>
#include<GeomFill_Darboux.hxx>
#include<Geom_UndefinedValue.hxx>
#include<Geom2d_OffsetCurve.hxx>
#include<GeomToStep_MakeLine.hxx>
#include<GeomFill_ConstrainedFilling.hxx>
#include<GeomAbs_CurveType.hxx>
#include<Geom2dInt_ThePolygon2dToolOfTheIntPCurvePCurveOfGInter.hxx>
#include<Geom_SphericalSurface.hxx>
#include<Geom2dAdaptor_GHCurve.hxx>
#include<GeomAbs_BSplKnotDistribution.hxx>
#include<GeomToStep_MakeBSplineCurveWithKnots.hxx>
#include<Geom_SurfaceOfLinearExtrusion.hxx>
#include<Geom2dHatch_MapOfElementsOfElementsOfHatcher.hxx>
#include<GeomLib_Interpolate.hxx>
#include<GeomInt_BSpGradient_BFGSOfMyBSplGradientOfTheComputeLineOfWLApprox.hxx>
#include<GeomInt_SequenceOfParameterAndOrientation.hxx>
#include<Geom_Line.hxx>
#include<GeomLib_Array1OfMat.hxx>
#include<Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter.hxx>
#include<GeomConvert_BSplineSurfaceToBezierSurface.hxx>
#include<Geom_Direction.hxx>
#include<Geom_Transformation.hxx>
#include<GeomToStep_MakeCylindricalSurface.hxx>
#include<GeomPlate_Array1OfSequenceOfReal.hxx>
#include<GeomToStep_MakeSurface.hxx>
#include<Geom_OffsetCurve.hxx>
#include<Geom2dGcc_MyCirc2dTanCen.hxx>
#include<GeomPlate_SequenceOfCurveConstraint.hxx>
#include<GeomFill_DegeneratedBound.hxx>
#include<GeomFill_HArray1OfLocationLaw.hxx>
#include<GeomFill_EvolvedSection.hxx>
#include<Geom2dHatch_Hatcher.hxx>
#include<GeomFill_TrihedronWithGuide.hxx>
#include<GeomAbs_Shape.hxx>
#include<Geom_BSplineSurface.hxx>
#include<GeomFill_Array1OfSectionLaw.hxx>
#include<GeomInt_ResConstraintOfMyGradientbisOfTheComputeLineOfWLApprox.hxx>
#include<GeomToStep_Root.hxx>
#include<GeomToStep_MakeEllipse.hxx>
#include<GeomToStep_MakeSphericalSurface.hxx>
#include<GeomFill_PolynomialConvertor.hxx>
#include<GeomFill_AppSurf.hxx>
#include<Geom2dGcc_QualifiedCurve.hxx>
#include<Geom2dAdaptor_Curve.hxx>
#include<Geom_ElementarySurface.hxx>
#include<Geom_SequenceNodeOfSequenceOfSurface.hxx>
#include<Geom2dGcc_MyC2d3Tan.hxx>
#include<GeomToStep_MakeElementarySurface.hxx>
#include<GeomToStep_MakeCartesianPoint.hxx>
#include<GeomLib_DenominatorMultiplierPtr.hxx>
#include<GeomInt_ParameterAndOrientation.hxx>
#include<GeomFill_CircularBlendFunc.hxx>
#include<GeomFill_QuasiAngularConvertor.hxx>
#include<Geom2dGcc_Circ2dTanCen.hxx>
#include<GeomToIGES_GeomPoint.hxx>
#include<Geom_Axis2Placement.hxx>
#include<GeomFill_TrihedronLaw.hxx>
#include<GeomAdaptor_Surface.hxx>
#include<GeomToStep_MakeBoundedCurve.hxx>
#include<GeomFill_Stretch.hxx>
#include<GeomInt_TheInt2SOfThePrmPrmSvSurfacesOfWLApprox.hxx>
#include<GeomConvert_BSplineSurfaceKnotSplitting.hxx>
#include<Geom2d_Circle.hxx>
#include<Geom2dAdaptor.hxx>
#include<Geom_SequenceOfSurface.hxx>
#include<GeomAPI.hxx>
#include<Geom2dHatch_FClass2dOfClassifierOfHatcher.hxx>
#include<Geom2dGcc_MyQCurve.hxx>
#include<GeomLib_Check2dBSplineCurve.hxx>
#include<Geom2dToIGES_Geom2dPoint.hxx>
#include<GeomInt_MyGradientOfTheComputeLineBezierOfWLApprox.hxx>
#include<Geom2d_Curve.hxx>
#include<GeomToStep_MakeSurfaceOfRevolution.hxx>
#include<Geom2dGcc_FuncTCirCuOfMyL2d2Tan.hxx>
#include<Geom_BezierCurve.hxx>
#include<GeomToStep_MakeSurfaceOfLinearExtrusion.hxx>
#include<GeomToStep_MakeVector.hxx>
#include<GeomToStep_MakeDirection.hxx>
#include<Geom2dGcc_MyCirc2d2TanRad.hxx>
#include<Geom_HSequenceOfBSplineSurface.hxx>
#include<Geom2d_Line.hxx>
#include<Geom2dInt_GInter.hxx>
#include<Geom_Surface.hxx>
#include<GeomAdaptor_HCurve.hxx>
#include<Geom2dHatch_DataMapNodeOfHatchingsOfHatcher.hxx>
#include<GeomFill_Generator.hxx>
#include<GeomliteTest.hxx>
#include<Geom2dGcc.hxx>
#include<Geom2d_TrimmedCurve.hxx>
#include<GeomLProp.hxx>
#include<Geom2d_Direction.hxx>
#include<GeomToIGES_GeomCurve.hxx>
#include<GeomFill_PlanFunc.hxx>
#include<Geom2dGcc_Circ2dTanOnRad.hxx>
#include<GeomAdaptor_GHSurface.hxx>
#include<Geom2dConvert_BSplineCurveToBezierCurve.hxx>
#include<GeomLib_InterpolationErrors.hxx>
#include<GeomFill_UniformSection.hxx>
#include<GeomFill_Curved.hxx>
#include<Geom2dToIGES_Geom2dCurve.hxx>
#include<GeomFill_FillingStyle.hxx>
#include<GeomAPI_ProjectPointOnSurf.hxx>
#include<Geom_UndefinedDerivative.hxx>
#include<GeomLib_PolyFunc.hxx>
#include<GeomFill_SectionGenerator.hxx>
#include<GeomConvert_CompBezierSurfacesToBSplineSurface.hxx>
#include<GeomPlate_HArray1OfHCurveOnSurface.hxx>
#include<GeomToStep_MakeHyperbola.hxx>
#include<Geom2d_Geometry.hxx>
#include<GeomAbs_UVSense.hxx>
#include<Geom_RectangularTrimmedSurface.hxx>
#include<GeomPlate_BuildPlateSurface.hxx>
#include<GeomLProp_SurfaceTool.hxx>
#include<GeomInt_TheComputeLineOfWLApprox.hxx>
#include<GeomInt_Gradient_BFGSOfMyGradientOfTheComputeLineBezierOfWLApprox.hxx>
#include<GeomFill_SweepSectionGenerator.hxx>
#include<Geom_Circle.hxx>
#include<GeomPlate_HSequenceOfCurveConstraint.hxx>
#include<GeomAdaptor_Curve.hxx>
#include<GeomFill_TgtField.hxx>
#include<Geom2dLProp_NumericCurInf2d.hxx>
#include<GeomFill_SequenceNodeOfSequenceOfTrsf.hxx>
#include<GeomFill_GuideTrihedronAC.hxx>
#include<GeomFill_BezierCurves.hxx>
#include<GeomAdaptor_HSurface.hxx>
#include<GeomFill_AppSweep.hxx>
#include<GeomConvert_CompCurveToBSplineCurve.hxx>
#include<GeomFill_CornerState.hxx>
#include<Geom_TrimmedCurve.hxx>
#include<GeomAbs_SurfaceType.hxx>
#include<Geom2dLProp_Curve2dTool.hxx>
#include<Geom2dGcc_MyCurveTool.hxx>
#include<Geom_BSplineCurve.hxx>
#include<Geom2dLProp_CLProps2d.hxx>
#include<GeomFill.hxx>
#include<GeomFill_BSplineCurves.hxx>
#include<Geom_AxisPlacement.hxx>
#include<Geom_BoundedCurve.hxx>
#include<GeomPlate_SequenceOfAij.hxx>
#include<Geom2dInt_IntConicCurveOfGInter.hxx>
#include<GeomInt_TheComputeLineBezierOfWLApprox.hxx>
#include<GeomAbs_JoinType.hxx>
#include<Geom_ConicalSurface.hxx>
#include<GeomToIGES_GeomSurface.hxx>
#include<Geom2dAPI_Interpolate.hxx>
#include<GeomFill_LocFunction.hxx>
#include<GeomAPI_ExtremaCurveCurve.hxx>
#include<Geom2dAdaptor_HCurve.hxx>
#include<GeomPlate_SequenceNodeOfSequenceOfAij.hxx>
#include<Geom2dGcc_Lin2d2Tan.hxx>
#include<Geom_CartesianPoint.hxx>
#include<GeomInt_TheMultiLineToolOfWLApprox.hxx>
#include<GeometryTest.hxx>
#include<Geom2dToIGES_Geom2dVector.hxx>
#include<GeomInt_ParFunctionOfMyGradientbisOfTheComputeLineOfWLApprox.hxx>
#include<GeomConvert_BSplineCurveToBezierCurve.hxx>
#include<Geom2dLProp_FCurNulOfNumericCurInf2d.hxx>
#include<Geom2dGcc_FuncTCuPtOfMyL2d2Tan.hxx>
#include<GeomInt_ThePrmPrmSvSurfacesOfWLApprox.hxx>
#include<GeomAdaptor_GHCurve.hxx>
#include<GeomFill_ConstantBiNormal.hxx>
#include<GeomInt_BSpParLeastSquareOfMyBSplGradientOfTheComputeLineOfWLApprox.hxx>
#include<Geom2dGcc_Lin2dTanObl.hxx>
#include<Geom2d_BoundedCurve.hxx>
#include<GeomInt_TheZerImpFuncOfTheImpPrmSvSurfacesOfWLApprox.hxx>
#include<Geom_Ellipse.hxx>
#include<Geom_VectorWithMagnitude.hxx>
#include<GeomFill_Filling.hxx>
#include<GeomInt_TheFunctionOfTheInt2SOfThePrmPrmSvSurfacesOfWLApprox.hxx>
#include<GeomFill_GuideTrihedronPlan.hxx>
#include<Geom2d_VectorWithMagnitude.hxx>
#include<GeomInt_TheMultiLineOfWLApprox.hxx>
#include<GeomFill_LocationLaw.hxx>
#include<GeomFill_SnglrFunc.hxx>
#include<GeomPlate_PlateG1Criterion.hxx>
#include<GeomPlate_SequenceNodeOfSequenceOfPointConstraint.hxx>
#include<Geom2dAPI_PointsToBSpline.hxx>
#include<GeomToStep_MakeBSplineSurfaceWithKnotsAndRationalBSplineSurface.hxx>
#include<GeomFill_FunctionDraft.hxx>
#include<Geom_BezierSurface.hxx>
#include<Geom2d_Vector.hxx>
#include<GeomFill_Frenet.hxx>
#include<GeomFill_FunctionGuide.hxx>
#include<GeomAPI_ExtremaSurfaceSurface.hxx>
#include<Geom_Parabola.hxx>
#include<GeomToStep_MakeCurve.hxx>
#include<GeomFill_Profiler.hxx>
#include<GeomFill_SequenceOfTrsf.hxx>
#include<GeomFill_Line.hxx>
#include<Geom_Geometry.hxx>
#include<Geom_OsculatingSurface.hxx>
#include<Geom2d_BSplineCurve.hxx>
#include<Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter.hxx>
#include<Geom_ToroidalSurface.hxx>
#include<GeomFill_Trihedron.hxx>
#include<GeomFill_LocationGuide.hxx>
#include<Geom2d_AxisPlacement.hxx>
#include<GeomFill_Fixed.hxx>
#include<GeomPlate_Surface.hxx>
#include<Geom2dGcc_CurveTool.hxx>
#include<GeomLib.hxx>
#include<GeomAPI_ExtremaCurveSurface.hxx>
#include<Geom2dAPI_InterCurveCurve.hxx>
#include<GeomInt_LineTool.hxx>
#include<GeomLib_CheckBSplineCurve.hxx>
#include<GeomLProp_CLProps.hxx>
#include<Message_SequenceNodeOfSequenceOfPrinters.hxx>
#include<Message_ProgressIndicator.hxx>
#include<Message_SequenceOfPrinters.hxx>
#include<Message_ProgressScale.hxx>
#include<Message_PrinterOStream.hxx>
#include<Message_ListOfMsg.hxx>
#include<Message_ListNodeOfListOfMsg.hxx>
#include<Message_SequenceNodeOfSequenceOfProgressScale.hxx>
#include<Message_Messenger.hxx>
#include<Message_MsgFile.hxx>
#include<Message_ListIteratorOfListOfMsg.hxx>
#include<Message.hxx>
#include<Message_Gravity.hxx>
#include<Message_ProgressSentry.hxx>
#include<Message_Status.hxx>
#include<Message_StatusType.hxx>
#include<Message_Msg.hxx>
#include<Message_SequenceOfProgressScale.hxx>
#include<Message_Printer.hxx>
#include<Handle_Message_Algorithm.hxx>

// Needed headers necessary for compilation.

#include<Handle_Standard_Transient.hxx>
#include<Handle_Geom_Plane.hxx>
#include<TopoDS_Shape.hxx>
#include<TopoDS_Edge.hxx>
#include<TopoDS_Vertex.hxx>
#include<TopoDS_Face.hxx>
#include<Handle_Geom_Surface.hxx>
#include<TopLoc_Location.hxx>
#include<Handle_Geom2d_Curve.hxx>
#include<gp_Trsf2d.hxx>
#include<Handle_Geom_Curve.hxx>
#include<gp_Pnt.hxx>
%}