Class {
	#name : #AodDotExpressionNode,
	#superclass : #AodValueNode,
	#instVars : [
		'valueNode',
		'operator',
		'actorReferenceNode'
	],
	#category : #'Aod-Compiler-Generated'
}

{ #category : #generated }
AodDotExpressionNode >> acceptVisitor: aBaseVisitor [
	^ aBaseVisitor visitDotExpression: self
]

{ #category : #generated }
AodDotExpressionNode >> actorReferenceNode [
	^ actorReferenceNode
]

{ #category : #generated }
AodDotExpressionNode >> actorReferenceNode: anAodBasicActorReferenceNode [
	self actorReferenceNode notNil
		ifTrue: [ self actorReferenceNode parent: nil ].
	actorReferenceNode := anAodBasicActorReferenceNode.
	self actorReferenceNode notNil
		ifTrue: [ self actorReferenceNode parent: self ]
]

{ #category : #generated }
AodDotExpressionNode >> nodeVariables [
	^ #(#valueNode #actorReferenceNode)
]

{ #category : #generated }
AodDotExpressionNode >> operator [
	^ operator
]

{ #category : #generated }
AodDotExpressionNode >> operator: aSmaCCToken [
	operator := aSmaCCToken
]

{ #category : #generated }
AodDotExpressionNode >> tokenVariables [
	^ #(#operator)
]

{ #category : #generated }
AodDotExpressionNode >> valueNode [
	^ valueNode
]

{ #category : #generated }
AodDotExpressionNode >> valueNode: anAodBaseNode [
	self valueNode notNil
		ifTrue: [ self valueNode parent: nil ].
	valueNode := anAodBaseNode.
	self valueNode notNil
		ifTrue: [ self valueNode parent: self ]
]
