Class {
	#name : #AodEqRelatorNode,
	#superclass : #AodRelatorNode,
	#category : #'Aod-Compiler-Generated'
}

{ #category : #generated }
AodEqRelatorNode >> acceptVisitor: aBaseVisitor [
	^ aBaseVisitor visitEqRelator: self
]
