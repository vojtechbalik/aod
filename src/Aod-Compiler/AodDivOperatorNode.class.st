Class {
	#name : #AodDivOperatorNode,
	#superclass : #AodBinaryOperatorNode,
	#category : #'Aod-Compiler-Generated'
}

{ #category : #generated }
AodDivOperatorNode >> acceptVisitor: aBaseVisitor [
	^ aBaseVisitor visitDivOperator: self
]
