"
Immutability? I can enforce it from the inside, but you can just assign a new object..
"
Class {
	#name : #AodIdProperty,
	#superclass : #AodProperty,
	#instVars : [
		'number'
	],
	#category : #'Aod-Property'
}

{ #category : #testing }
AodIdProperty class >> isMutable [
	^ false
]

{ #category : #accessing }
AodIdProperty class >> label [
	^ #id
]

{ #category : #evaluating }
AodIdProperty >> value [
	^ number
]

{ #category : #evaluating }
AodIdProperty >> value: aNumber [
	self assert: number isNil description: 'Cannot change ID. ID is immutable!'.
	self assert: aNumber isInteger.
	number := aNumber
]
