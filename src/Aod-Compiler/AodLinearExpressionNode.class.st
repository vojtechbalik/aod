Class {
	#name : #AodLinearExpressionNode,
	#superclass : #AodValueNode,
	#instVars : [
		'leftNode',
		'operator',
		'rightNode'
	],
	#category : #'Aod-Compiler-Generated'
}

{ #category : #generated }
AodLinearExpressionNode >> acceptVisitor: aBaseVisitor [
	^ aBaseVisitor visitLinearExpression: self
]

{ #category : #generated }
AodLinearExpressionNode >> leftNode [
	^ leftNode
]

{ #category : #generated }
AodLinearExpressionNode >> leftNode: anAodBaseNode [
	self leftNode notNil
		ifTrue: [ self leftNode parent: nil ].
	leftNode := anAodBaseNode.
	self leftNode notNil
		ifTrue: [ self leftNode parent: self ]
]

{ #category : #generated }
AodLinearExpressionNode >> nodeVariables [
	^ #(#leftNode #rightNode)
]

{ #category : #generated }
AodLinearExpressionNode >> operator [
	^ operator
]

{ #category : #generated }
AodLinearExpressionNode >> operator: aSmaCCToken [
	operator := aSmaCCToken
]

{ #category : #generated }
AodLinearExpressionNode >> rightNode [
	^ rightNode
]

{ #category : #generated }
AodLinearExpressionNode >> rightNode: anAodBaseNode [
	self rightNode notNil
		ifTrue: [ self rightNode parent: nil ].
	rightNode := anAodBaseNode.
	self rightNode notNil
		ifTrue: [ self rightNode parent: self ]
]

{ #category : #generated }
AodLinearExpressionNode >> tokenVariables [
	^ #(#operator)
]
