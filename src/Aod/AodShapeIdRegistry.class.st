"
I handle IdProperties - their distribution, ...?
	
Ids have to be unique. I can find an object by ID in O(1).

Keep an array of free intervals below counter (run array?)
"
Class {
	#name : #AodShapeIdRegistry,
	#superclass : #AodShapeRegistry,
	#instVars : [
		'counter'
	],
	#category : #'Aod-Core'
}

{ #category : #'as yet unclassified' }
AodShapeIdRegistry class >> propertyClass [
	^ AodIdProperty
]

{ #category : #initialization }
AodShapeIdRegistry >> initialize [
	super initialize.

	counter := 1
]

{ #category : #accessing }
AodShapeIdRegistry >> nextId [
	"advance the counter until an open position is found"
	[ dictionary includesKey: counter ] 
		whileTrue: [ counter := counter + 1 ].
		
	self assert: (dictionary includesKey: counter) not description: 'generated id not unique!'.
	^ counter
]

{ #category : #registry }
AodShapeIdRegistry >> register: aShape [
	| id |
	id := aShape
		propertyAt: self selector
		ifAbsentPut: [ self nextId ].
	
	id := id value.
	
	dictionary
		at: id
		ifPresent: [ ^ false ]
		ifAbsentPut: [ aShape ].
		
	^ true
]

{ #category : #registry }
AodShapeIdRegistry >> unregister: aShape [
	| property registeredShape |
	property := aShape
		propertyAt: self selector
		ifAbsent: [ ^ false ].
		
	registeredShape := dictionary 
		at: property value
		ifAbsent: [ self error: 'shape has ', self selector, ' property set, but is not registered' ].
	
	"check that aShape is not just some random shape that happens to have the same property value"
	(registeredShape == aShape)
		ifFalse: [ ^ false ].
	
	dictionary removeKey: property value.
		
	"do not remove the property in case of ID"	
	"aShape removeProperty: self selector."
	
	^ true
]
