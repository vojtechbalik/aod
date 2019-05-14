Class {
	#name : #AodMulOperatorNode,
	#superclass : #AodBinaryOperatorNode,
	#category : #'Aod-Compiler-Generated'
}

{ #category : #generated }
AodMulOperatorNode >> acceptVisitor: aBaseVisitor [
	^ aBaseVisitor visitMulOperator: self
]
