Class {
	#name : #AodEndEditCommand,
	#superclass : #AodEditCommand,
	#instVars : [
		'edit'
	],
	#category : #'Aod-Command'
}

{ #category : #'instance creation' }
AodEndEditCommand class >> on: anEdit [
	^ self new
		edit: anEdit;
		yourself
]

{ #category : #executing }
AodEndEditCommand >> applyOn: aDrawing [
	self assert: aDrawing constraintSolver isEditing description: 'no edit active'.
	
	"also some book-keeping to be able to at least partially reverse it"
	aDrawing constraintSolver endEdit.
	aDrawing currentEdit: nil.
	
	"as edit constraints are removed, some changes might happen too"
	aDrawing canvasLayoutChanged.
	
	^ true
]
