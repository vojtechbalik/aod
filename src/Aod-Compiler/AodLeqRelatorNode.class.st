Class {
	#name : #AodLeqRelatorNode,
	#superclass : #AodRelatorNode,
	#category : #'Aod-Compiler-Generated'
}

{ #category : #generated }
AodLeqRelatorNode >> acceptVisitor: aBaseVisitor [
	^ aBaseVisitor visitLeqRelator: self
]
