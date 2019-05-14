Class {
	#name : #AodIdentifierNode,
	#superclass : #AodBaseNode,
	#instVars : [
		'identifier'
	],
	#category : #'Aod-Compiler-Generated'
}

{ #category : #generated }
AodIdentifierNode >> acceptVisitor: aBaseVisitor [
	^ aBaseVisitor visitIdentifier: self
]

{ #category : #generated }
AodIdentifierNode >> identifier [
	^ identifier
]

{ #category : #generated }
AodIdentifierNode >> identifier: aSmaCCToken [
	identifier := aSmaCCToken
]

{ #category : #generated }
AodIdentifierNode >> tokenVariables [
	^ #(#identifier)
]
