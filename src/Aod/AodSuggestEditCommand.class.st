Class {
	#name : #AodSuggestEditCommand,
	#superclass : #AodEditCommand,
	#instVars : [
		'value'
	],
	#category : #'Aod-Command'
}

{ #category : #accessing }
AodSuggestEditCommand class >> value: aPoint [
	^ self new
		value: aPoint;
		yourself
]

{ #category : #hook }
AodSuggestEditCommand >> applyOn: aDrawing [
	self assert: aDrawing constraintSolver isEditing.
	
	aDrawing currentEdit suggest: value.
	aDrawing canvasLayoutChanged.

	^ true
]

{ #category : #accessing }
AodSuggestEditCommand >> value: anObject [
	value := anObject
]
