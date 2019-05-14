Class {
	#name : #AodBasicActorReferenceNode,
	#superclass : #AodBaseNode,
	#instVars : [
		'identifierNode'
	],
	#category : #'Aod-Compiler-Generated'
}

{ #category : #generated }
AodBasicActorReferenceNode >> acceptVisitor: aBaseVisitor [
	^ aBaseVisitor visitBasicActorReference: self
]

{ #category : #generated }
AodBasicActorReferenceNode >> identifierNode [
	^ identifierNode
]

{ #category : #generated }
AodBasicActorReferenceNode >> identifierNode: anAodIdentifierNode [
	self identifierNode notNil
		ifTrue: [ self identifierNode parent: nil ].
	identifierNode := anAodIdentifierNode.
	self identifierNode notNil
		ifTrue: [ self identifierNode parent: self ]
]

{ #category : #generated }
AodBasicActorReferenceNode >> nodeVariables [
	^ #(#identifierNode)
]
