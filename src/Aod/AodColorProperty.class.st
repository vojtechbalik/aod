Class {
	#name : #AodColorProperty,
	#superclass : #AodProperty,
	#instVars : [
		'color'
	],
	#category : #'Aod-Property'
}

{ #category : #accessing }
AodColorProperty class >> label [
	^ #color
]

{ #category : #evaluating }
AodColorProperty >> value [
	^ color
]

{ #category : #evaluating }
AodColorProperty >> value: aColor [
	aColor ifNil: [ ^ self ].
	
	self assert: aColor class == Color.
	color := aColor
]
