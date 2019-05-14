Class {
	#name : #AodListNode,
	#superclass : #AodBaseNode,
	#instVars : [
		'argumentListNode'
	],
	#category : #'Aod-Compiler'
}

{ #category : #generated }
AodListNode >> acceptVisitor: aBaseVisitor [
	^ aBaseVisitor visitList: self
]

{ #category : #generated }
AodListNode >> argumentListNode [
	^ argumentListNode
]

{ #category : #generated }
AodListNode >> argumentListNode: anAodArgumentListNode [
	self argumentListNode notNil
		ifTrue: [ self argumentListNode parent: nil ].
	argumentListNode := anAodArgumentListNode.
	self argumentListNode notNil
		ifTrue: [ self argumentListNode parent: self ]
]

{ #category : #generated }
AodListNode >> nodeVariables [
	^ #(#argumentListNode)
]
