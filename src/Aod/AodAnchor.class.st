"
when i am added to solver, the solver then does what it needs

as the default impl, a plain Number is used. It holds the desired value when I am not associated to any Solver with it's own impl

the problem with stays is similar to the one where I'm trying to know what is being edited.
ownership would solve this I think. or some sort of paths. this feels a little hacky and scattered.
"
Class {
	#name : #AodAnchor,
	#superclass : #AodDataType,
	#instVars : [
		'impl',
		'stay'
	],
	#category : #'Aod-Language-Core'
}

{ #category : #enumerating }
AodAnchor >> anchorsDo: aBlock [
	aBlock value: self
]

{ #category : #'as yet unclassified' }
AodAnchor >> editIn: solver [
	solver addAnchorEdit: self
]

{ #category : #accessing }
AodAnchor >> impl [
	^ impl
]

{ #category : #accessing }
AodAnchor >> impl: anObject [
	impl := anObject
]

{ #category : #initialization }
AodAnchor >> initialize [
	super initialize.
	
	impl := AodDummyAnchorImpl new
]

{ #category : #accessing }
AodAnchor >> stay [
	^ stay
]

{ #category : #accessing }
AodAnchor >> stay: anObject [
	stay := anObject
]

{ #category : #evaluating }
AodAnchor >> value [
	^ impl value
]

{ #category : #accessing }
AodAnchor >> value: aNumber [
	impl value: aNumber
]
