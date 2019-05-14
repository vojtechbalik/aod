Class {
	#name : #AodTypedNode,
	#superclass : #AodBaseNode,
	#category : #'Aod-Compiler-Generated'
}

{ #category : #generated }
AodTypedNode >> acceptVisitor: aBaseVisitor [
	^ aBaseVisitor visitTyped: self
]
