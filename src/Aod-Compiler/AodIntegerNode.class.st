Class {
	#name : #AodIntegerNode,
	#superclass : #AodValueNode,
	#instVars : [
		'integerLiteralNode'
	],
	#category : #'Aod-Compiler-Generated'
}

{ #category : #generated }
AodIntegerNode >> acceptVisitor: aBaseVisitor [
	^ aBaseVisitor visitInteger: self
]

{ #category : #generated }
AodIntegerNode >> integerLiteralNode [
	^ integerLiteralNode
]

{ #category : #generated }
AodIntegerNode >> integerLiteralNode: anAodIntegerLiteralNode [
	self integerLiteralNode notNil
		ifTrue: [ self integerLiteralNode parent: nil ].
	integerLiteralNode := anAodIntegerLiteralNode.
	self integerLiteralNode notNil
		ifTrue: [ self integerLiteralNode parent: self ]
]

{ #category : #generated }
AodIntegerNode >> nodeVariables [
	^ #(#integerLiteralNode)
]
