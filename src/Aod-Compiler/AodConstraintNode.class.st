Class {
	#name : #AodConstraintNode,
	#superclass : #AodTypedNode,
	#instVars : [
		'relationNode',
		'strengthSeparator',
		'strengthNode'
	],
	#category : #'Aod-Compiler-Generated'
}

{ #category : #generated }
AodConstraintNode >> acceptVisitor: aBaseVisitor [
	^ aBaseVisitor visitConstraint: self
]

{ #category : #generated }
AodConstraintNode >> nodeVariables [
	^ #(#relationNode #strengthNode)
]

{ #category : #generated }
AodConstraintNode >> relationNode [
	^ relationNode
]

{ #category : #generated }
AodConstraintNode >> relationNode: anAodBaseNode [
	self relationNode notNil
		ifTrue: [ self relationNode parent: nil ].
	relationNode := anAodBaseNode.
	self relationNode notNil
		ifTrue: [ self relationNode parent: self ]
]

{ #category : #generated }
AodConstraintNode >> strengthNode [
	^ strengthNode
]

{ #category : #generated }
AodConstraintNode >> strengthNode: anAodStrengthNode [
	self strengthNode notNil
		ifTrue: [ self strengthNode parent: nil ].
	strengthNode := anAodStrengthNode.
	self strengthNode notNil
		ifTrue: [ self strengthNode parent: self ]
]

{ #category : #generated }
AodConstraintNode >> strengthSeparator [
	^ strengthSeparator
]

{ #category : #generated }
AodConstraintNode >> strengthSeparator: aSmaCCToken [
	strengthSeparator := aSmaCCToken
]

{ #category : #generated }
AodConstraintNode >> tokenVariables [
	^ #(#strengthSeparator)
]
