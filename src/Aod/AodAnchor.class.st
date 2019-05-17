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

{ #category : #editing }
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
