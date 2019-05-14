Class {
	#name : #AodSubOperatorNode,
	#superclass : #AodBinaryOperatorNode,
	#category : #'Aod-Compiler-Generated'
}

{ #category : #generated }
AodSubOperatorNode >> acceptVisitor: aBaseVisitor [
	^ aBaseVisitor visitSubOperator: self
]
