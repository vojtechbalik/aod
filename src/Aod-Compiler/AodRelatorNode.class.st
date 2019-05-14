Class {
	#name : #AodRelatorNode,
	#superclass : #AodTypedNode,
	#instVars : [
		'leftNode',
		'operator',
		'rightNode'
	],
	#category : #'Aod-Compiler-Generated'
}

{ #category : #generated }
AodRelatorNode >> acceptVisitor: aBaseVisitor [
	^ aBaseVisitor visitRelator: self
]

{ #category : #generated }
AodRelatorNode >> leftNode [
	^ leftNode
]

{ #category : #generated }
AodRelatorNode >> leftNode: anAodBaseNode [
	self leftNode notNil
		ifTrue: [ self leftNode parent: nil ].
	leftNode := anAodBaseNode.
	self leftNode notNil
		ifTrue: [ self leftNode parent: self ]
]

{ #category : #generated }
AodRelatorNode >> nodeVariables [
	^ #(#leftNode #rightNode)
]

{ #category : #generated }
AodRelatorNode >> operator [
	^ operator
]

{ #category : #generated }
AodRelatorNode >> operator: aSmaCCToken [
	operator := aSmaCCToken
]

{ #category : #generated }
AodRelatorNode >> rightNode [
	^ rightNode
]

{ #category : #generated }
AodRelatorNode >> rightNode: anAodBaseNode [
	self rightNode notNil
		ifTrue: [ self rightNode parent: nil ].
	rightNode := anAodBaseNode.
	self rightNode notNil
		ifTrue: [ self rightNode parent: self ]
]

{ #category : #generated }
AodRelatorNode >> tokenVariables [
	^ #(#operator)
]
