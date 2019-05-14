Class {
	#name : #AodBinaryOperatorNode,
	#superclass : #AodLinearExpressionNode,
	#category : #'Aod-Compiler-Generated'
}

{ #category : #generated }
AodBinaryOperatorNode >> acceptVisitor: aBaseVisitor [
	^ aBaseVisitor visitBinaryOperator: self
]
