Class {
	#name : #AodTryDeselectCommand,
	#superclass : #AodCommand,
	#category : #'Aod-Command'
}

{ #category : #comparing }
AodTryDeselectCommand >> = other [
	self == other
	 ifTrue: [ ^ true ].
	
	self class = other class
		ifTrue: [ ^ true ].
		
	^ false
]

{ #category : #hook }
AodTryDeselectCommand >> applyOn: aDrawing [
	| selection |
	selection := aDrawing selection.
	
	selection isSelecting
		ifTrue: [ selection deselect ]
]
