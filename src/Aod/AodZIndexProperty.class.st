Class {
	#name : #AodZIndexProperty,
	#superclass : #AodProperty,
	#instVars : [
		'index'
	],
	#category : #'Aod-Property'
}

{ #category : #accessing }
AodZIndexProperty class >> label [
	^ #zIndex
]

{ #category : #initialization }
AodZIndexProperty >> initialize [
	super initialize.
	
	index := 0.
]

{ #category : #evaluating }
AodZIndexProperty >> value [
	^ index
]

{ #category : #accessing }
AodZIndexProperty >> value: anObject [
	self assert: anObject isInteger description: 'zIndex must be an integer'.
	
	index := anObject
]
