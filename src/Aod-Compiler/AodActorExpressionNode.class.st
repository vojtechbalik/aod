Class {
	#name : #AodActorExpressionNode,
	#superclass : #AodValueNode,
	#instVars : [
		'actorReferenceNode',
		'argumentListNode'
	],
	#category : #'Aod-Compiler-Generated'
}

{ #category : #generated }
AodActorExpressionNode >> acceptVisitor: aBaseVisitor [
	^ aBaseVisitor visitActorExpression: self
]

{ #category : #generated }
AodActorExpressionNode >> actorReferenceNode [
	^ actorReferenceNode
]

{ #category : #generated }
AodActorExpressionNode >> actorReferenceNode: anAodBasicActorReferenceNode [
	self actorReferenceNode notNil
		ifTrue: [ self actorReferenceNode parent: nil ].
	actorReferenceNode := anAodBasicActorReferenceNode.
	self actorReferenceNode notNil
		ifTrue: [ self actorReferenceNode parent: self ]
]

{ #category : #generated }
AodActorExpressionNode >> argumentListNode [
	^ argumentListNode
]

{ #category : #generated }
AodActorExpressionNode >> argumentListNode: anAodArgumentListNode [
	self argumentListNode notNil
		ifTrue: [ self argumentListNode parent: nil ].
	argumentListNode := anAodArgumentListNode.
	self argumentListNode notNil
		ifTrue: [ self argumentListNode parent: self ]
]

{ #category : #generated }
AodActorExpressionNode >> nodeVariables [
	^ #(#actorReferenceNode #argumentListNode)
]
