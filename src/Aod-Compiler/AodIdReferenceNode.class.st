Class {
	#name : #AodIdReferenceNode,
	#superclass : #AodShapeReferenceNode,
	#category : #'Aod-Compiler-Generated'
}

{ #category : #generated }
AodIdReferenceNode >> acceptVisitor: aBaseVisitor [
	^ aBaseVisitor visitIdReference: self
]
