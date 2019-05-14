Class {
	#name : #AodSelectCommand,
	#superclass : #AodCommand,
	#instVars : [
		'target'
	],
	#category : #'Aod-Command'
}

{ #category : #'instance creation' }
AodSelectCommand class >> on: aTarget [
	^ self new
		target: aTarget;
		yourself
]

{ #category : #comparing }
AodSelectCommand >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ target = anObject target
]

{ #category : #hook }
AodSelectCommand >> applyOn: aDrawing [
	| selection |
	selection := aDrawing selection.
	
	selection isSelecting
		ifTrue: [ selection deselect ].
		
	selection select: target
]

{ #category : #comparing }
AodSelectCommand >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ target hash
]

{ #category : #accessing }
AodSelectCommand >> target [
	^ target
]

{ #category : #accessing }
AodSelectCommand >> target: anObject [
	target := anObject
]
