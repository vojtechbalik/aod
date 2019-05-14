Class {
	#name : #AodAddOperatorNode,
	#superclass : #AodBinaryOperatorNode,
	#category : #'Aod-Compiler-Generated'
}

{ #category : #generated }
AodAddOperatorNode >> acceptVisitor: aBaseVisitor [
	^ aBaseVisitor visitAddOperator: self
]
