Class {
	#name : #AodStartEditCommand,
	#superclass : #AodEditCommand,
	#instVars : [
		'handle',
		'autoResolve'
	],
	#category : #'Aod-Command'
}

{ #category : #'as yet unclassified' }
AodStartEditCommand class >> via: aHandle [
	^ self new
		handle: aHandle;
		yourself
]

{ #category : #executing }
AodStartEditCommand >> applyOn: aDrawing [
	aDrawing constraintSolver isEditing
		ifTrue: [ self error: 'already editing' ].
	
	aDrawing constraintSolver edit: handle model.
	aDrawing currentEdit: (AodEdit new
		solver: aDrawing constraintSolver;
		handle: handle;
		autoResolve: (autoResolve ifNil: [ true ]);
		yourself).
		
	^ true
	
]

{ #category : #accessing }
AodStartEditCommand >> autoResolve [
	^ autoResolve
]

{ #category : #accessing }
AodStartEditCommand >> autoResolve: anObject [
	autoResolve := anObject
]

{ #category : #accessing }
AodStartEditCommand >> handle [
	^ handle
]

{ #category : #accessing }
AodStartEditCommand >> handle: anObject [
	handle := anObject
]
