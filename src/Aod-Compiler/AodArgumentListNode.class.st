Class {
	#name : #AodArgumentListNode,
	#superclass : #AodBaseNode,
	#instVars : [
		'argumentNodes'
	],
	#category : #'Aod-Compiler-Generated'
}

{ #category : #generated }
AodArgumentListNode >> acceptVisitor: aBaseVisitor [
	^ aBaseVisitor visitArgumentList: self
]

{ #category : #generated }
AodArgumentListNode >> argumentNodes [
	^ argumentNodes
]

{ #category : #generated }
AodArgumentListNode >> argumentNodes: anOrderedCollection [
	self setParents: self argumentNodes to: nil.
	argumentNodes := anOrderedCollection.
	self setParents: self argumentNodes to: self
]

{ #category : #generated }
AodArgumentListNode >> compositeNodeVariables [
	^ #(#argumentNodes)
]

{ #category : #'generated-initialize-release' }
AodArgumentListNode >> initialize [
	super initialize.
	argumentNodes := OrderedCollection new: 2.
]
