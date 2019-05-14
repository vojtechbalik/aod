Class {
	#name : #AodActorReferenceNode,
	#superclass : #AodReferenceNode,
	#instVars : [
		'actorReferenceNode'
	],
	#category : #'Aod-Compiler-Generated'
}

{ #category : #generated }
AodActorReferenceNode >> acceptVisitor: aBaseVisitor [
	^ aBaseVisitor visitActorReference: self
]

{ #category : #generated }
AodActorReferenceNode >> actorReferenceNode [
	^ actorReferenceNode
]

{ #category : #generated }
AodActorReferenceNode >> actorReferenceNode: anAodBasicActorReferenceNode [
	self actorReferenceNode notNil
		ifTrue: [ self actorReferenceNode parent: nil ].
	actorReferenceNode := anAodBasicActorReferenceNode.
	self actorReferenceNode notNil
		ifTrue: [ self actorReferenceNode parent: self ]
]

{ #category : #generated }
AodActorReferenceNode >> nodeVariables [
	^ #(#actorReferenceNode)
]
