Class {
	#name : #AodShapeReferenceNode,
	#superclass : #AodReferenceNode,
	#instVars : [
		'operator',
		'identifierNode'
	],
	#category : #'Aod-Compiler-Generated'
}

{ #category : #generated }
AodShapeReferenceNode >> acceptVisitor: aBaseVisitor [
	^ aBaseVisitor visitShapeReference: self
]

{ #category : #generated }
AodShapeReferenceNode >> identifierNode [
	^ identifierNode
]

{ #category : #generated }
AodShapeReferenceNode >> identifierNode: anAodBaseNode [
	self identifierNode notNil
		ifTrue: [ self identifierNode parent: nil ].
	identifierNode := anAodBaseNode.
	self identifierNode notNil
		ifTrue: [ self identifierNode parent: self ]
]

{ #category : #generated }
AodShapeReferenceNode >> nodeVariables [
	^ #(#identifierNode)
]

{ #category : #generated }
AodShapeReferenceNode >> operator [
	^ operator
]

{ #category : #generated }
AodShapeReferenceNode >> operator: aSmaCCToken [
	operator := aSmaCCToken
]

{ #category : #generated }
AodShapeReferenceNode >> tokenVariables [
	^ #(#operator)
]
