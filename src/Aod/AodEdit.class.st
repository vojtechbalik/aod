Class {
	#name : #AodEdit,
	#superclass : #Object,
	#instVars : [
		'handle',
		'solver',
		'autoResolve'
	],
	#category : #'Aod-Command'
}

{ #category : #accessing }
AodEdit >> autoResolve [
	^ autoResolve
]

{ #category : #accessing }
AodEdit >> autoResolve: aBoolean [
	"during an Editing cycle (see AodConstraintSolver), after suggesting new values, AodConstraintSolver>>#resolve needs to be called, so that the solver attempts to accomodate for the new value. If a view is open, in case of Bloc, the Layout strategy takes care of calling #resolve each frame. For, for example, testing purposes however, setting autoResolve := true is convenient"
	
	autoResolve := aBoolean
]

{ #category : #accessing }
AodEdit >> handle [
	^ handle
]

{ #category : #accessing }
AodEdit >> handle: anObject [
	handle := anObject
]

{ #category : #editing }
AodEdit >> initialize [
	super initialize.
	
	autoResolve := false
]

{ #category : #accessing }
AodEdit >> solver [
	^ solver
]

{ #category : #accessing }
AodEdit >> solver: anObject [
	solver := anObject
]

{ #category : #editing }
AodEdit >> suggest: aPoint [
	handle suggest: aPoint in: solver.
	autoResolve
		ifTrue: [ solver resolve ]
]
