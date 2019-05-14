Class {
	#name : #AodProgramNode,
	#superclass : #AodBaseNode,
	#instVars : [
		'constraintNodes',
		'constraintSeparators'
	],
	#category : #'Aod-Compiler-Generated'
}

{ #category : #generated }
AodProgramNode >> acceptVisitor: aBaseVisitor [
	^ aBaseVisitor visitProgram: self
]

{ #category : #generated }
AodProgramNode >> compositeNodeVariables [
	^ #(#constraintNodes)
]

{ #category : #generated }
AodProgramNode >> compositeTokenVariables [
	^ #(#constraintSeparators)
]

{ #category : #generated }
AodProgramNode >> constraintNodes [
	^ constraintNodes
]

{ #category : #generated }
AodProgramNode >> constraintNodes: anOrderedCollection [
	self setParents: self constraintNodes to: nil.
	constraintNodes := anOrderedCollection.
	self setParents: self constraintNodes to: self
]

{ #category : #generated }
AodProgramNode >> constraintSeparators [
	^ constraintSeparators
]

{ #category : #generated }
AodProgramNode >> constraintSeparators: anOrderedCollection [
	constraintSeparators := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
AodProgramNode >> initialize [
	super initialize.
	constraintNodes := OrderedCollection new: 2.
	constraintSeparators := OrderedCollection new: 2.
]
