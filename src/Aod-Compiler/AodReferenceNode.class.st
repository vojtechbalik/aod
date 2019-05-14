Class {
	#name : #AodReferenceNode,
	#superclass : #AodValueNode,
	#category : #'Aod-Compiler-Generated'
}

{ #category : #generated }
AodReferenceNode >> acceptVisitor: aBaseVisitor [
	^ aBaseVisitor visitReference: self
]
