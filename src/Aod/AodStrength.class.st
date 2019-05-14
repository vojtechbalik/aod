"
Level 0 always represents a required strength.
"
Class {
	#name : #AodStrength,
	#superclass : #Object,
	#instVars : [
		'level'
	],
	#category : #'Aod-Language-Strength'
}

{ #category : #accessing }
AodStrength class >> level: anInteger [
	^ self new 
		level: anInteger;
		yourself
]

{ #category : #strengths }
AodStrength class >> required [
	^ self level: 0
]

{ #category : #comparing }
AodStrength >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ level = anObject level
]

{ #category : #comparing }
AodStrength >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ level hash
]

{ #category : #testing }
AodStrength >> isRequired [
	^ level = 0
]

{ #category : #accessing }
AodStrength >> level [
	^ level
]

{ #category : #accessing }
AodStrength >> level: anObject [
	level := anObject
]
