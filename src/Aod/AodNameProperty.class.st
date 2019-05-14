Class {
	#name : #AodNameProperty,
	#superclass : #AodProperty,
	#instVars : [
		'name'
	],
	#category : #'Aod-Property'
}

{ #category : #accessing }
AodNameProperty class >> label [
	^ #name
]

{ #category : #initialization }
AodNameProperty >> initialize [
	super initialize.
	
	"nil means the property is not set. maybe some more general solution for optional properties? maybe on a higher level?"
	name := nil
]

{ #category : #evaluating }
AodNameProperty >> value [
	^ name
]

{ #category : #evaluating }
AodNameProperty >> value: aString [
	aString ifNil: [ self error: 'name cannot be nil' ].
	(aString matchesRegex: '\w+')
		ifFalse: [ AodInvalidPropertyValueError signal: 'invalid name' ].
	name := aString.
]
