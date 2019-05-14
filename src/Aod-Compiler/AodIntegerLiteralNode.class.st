Class {
	#name : #AodIntegerLiteralNode,
	#superclass : #AodBaseNode,
	#instVars : [
		'integer',
		'convertedValue'
	],
	#category : #'Aod-Compiler-Generated'
}

{ #category : #generated }
AodIntegerLiteralNode >> acceptVisitor: aBaseVisitor [
	^ aBaseVisitor visitIntegerLiteral: self
]

{ #category : #generated }
AodIntegerLiteralNode >> convertedValue [
	^ convertedValue
]

{ #category : #generated }
AodIntegerLiteralNode >> convertedValue: anObject [
	convertedValue := anObject
]

{ #category : #generated }
AodIntegerLiteralNode >> integer [
	^ integer
]

{ #category : #generated }
AodIntegerLiteralNode >> integer: aSmaCCToken [
	integer := aSmaCCToken
]

{ #category : #generated }
AodIntegerLiteralNode >> tokenVariables [
	^ #(#integer)
]
