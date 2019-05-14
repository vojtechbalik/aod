Class {
	#name : #AodNameReferenceNode,
	#superclass : #AodShapeReferenceNode,
	#category : #'Aod-Compiler-Generated'
}

{ #category : #generated }
AodNameReferenceNode >> acceptVisitor: aBaseVisitor [
	^ aBaseVisitor visitNameReference: self
]
