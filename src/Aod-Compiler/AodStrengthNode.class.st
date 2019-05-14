Class {
	#name : #AodStrengthNode,
	#superclass : #AodBaseNode,
	#instVars : [
		'identifierNode'
	],
	#category : #'Aod-Compiler-Generated'
}

{ #category : #generated }
AodStrengthNode >> acceptVisitor: aBaseVisitor [
	^ aBaseVisitor visitStrength: self
]

{ #category : #generated }
AodStrengthNode >> identifierNode [
	^ identifierNode
]

{ #category : #generated }
AodStrengthNode >> identifierNode: anAodIdentifierNode [
	self identifierNode notNil
		ifTrue: [ self identifierNode parent: nil ].
	identifierNode := anAodIdentifierNode.
	self identifierNode notNil
		ifTrue: [ self identifierNode parent: self ]
]

{ #category : #generated }
AodStrengthNode >> nodeVariables [
	^ #(#identifierNode)
]
