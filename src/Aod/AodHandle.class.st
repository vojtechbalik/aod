Class {
	#name : #AodHandle,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'Aod-Language-Vessels'
}

{ #category : #'instance creation' }
AodHandle class >> on: aModel [
	^ self new
		model: aModel;
		yourself
]

{ #category : #converting }
AodHandle >> asElement [
	^ self elementClass new
		handle: self;
		yourself
]

{ #category : #'as yet unclassified' }
AodHandle >> elementClass [
	self subclassResponsibility
]

{ #category : #accessing }
AodHandle >> layoutPosition [
	self subclassResponsibility
]

{ #category : #accessing }
AodHandle >> model [
	^ model
]

{ #category : #accessing }
AodHandle >> model: anObject [
	model := anObject
]

{ #category : #'as yet unclassified' }
AodHandle >> suggest: aPoint in: solver [
	self subclassResponsibility
]
