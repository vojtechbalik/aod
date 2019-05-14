Class {
	#name : #AodValueNode,
	#superclass : #AodTypedNode,
	#category : #'Aod-Compiler-Generated'
}

{ #category : #generated }
AodValueNode >> acceptVisitor: aBaseVisitor [
	^ aBaseVisitor visitValue: self
]
