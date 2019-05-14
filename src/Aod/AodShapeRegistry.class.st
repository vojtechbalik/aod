Class {
	#name : #AodShapeRegistry,
	#superclass : #Object,
	#instVars : [
		'dictionary'
	],
	#category : #'Aod-Core'
}

{ #category : #accessing }
AodShapeRegistry class >> newProperty: aKey [
	^ self propertyClass value: aKey
]

{ #category : #'as yet unclassified' }
AodShapeRegistry class >> propertyClass [
	self subclassResponsibility 
]

{ #category : #accessing }
AodShapeRegistry class >> selector [
	^ self propertyClass selector
]

{ #category : #accessing }
AodShapeRegistry >> at: aName [
	^ dictionary at: aName ifAbsent: [ nil ]
]

{ #category : #accessing }
AodShapeRegistry >> at: aName ifAbsent: aBlock [
	^ dictionary at: aName ifAbsent: aBlock
]

{ #category : #enumerating }
AodShapeRegistry >> do: aBlock [
	dictionary valuesDo: aBlock
]

{ #category : #initialization }
AodShapeRegistry >> initialize [
	super initialize.
	
	dictionary := Dictionary new
]

{ #category : #'instance creation' }
AodShapeRegistry >> newProperty: aName [
	^ self class newProperty: aName
]

{ #category : #registry }
AodShapeRegistry >> register: aShape [
	| name |
	name := aShape
		propertyAt: self selector
		ifAbsent: [ ^ true ].
	
	name := name value.
	
	dictionary
		at: name
		ifPresent: [ ^ false ]
		ifAbsentPut: [ aShape ].
		
	^ true
	
]

{ #category : #'as yet unclassified' }
AodShapeRegistry >> register: aShape as: aName [
	| property |
	property := aShape
		propertyAt: self selector.
		
	property
		ifNotNil: [ self error: 'cannot register ', self selector, ' for a shape, as the property is already set' ].
		
	dictionary
		at: aName
		ifPresent: [ ^ false ]
		ifAbsentPut: [ aShape ].
		
	aShape propertyAt: #name put: aName.
		
	^ true
]

{ #category : #'as yet unclassified' }
AodShapeRegistry >> registeredCount [
	^ dictionary size
]

{ #category : #'as yet unclassified' }
AodShapeRegistry >> registeredShapes [
	^ dictionary values
]

{ #category : #accessing }
AodShapeRegistry >> selector [
	^ self class selector
]

{ #category : #registry }
AodShapeRegistry >> unregister: aShape [
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
		
	aShape removeProperty: self selector.
	
	^ true
]

{ #category : #'as yet unclassified' }
AodShapeRegistry >> unregisterAll [
	dictionary valuesDo: [ :shape | self unregister: shape ]
]
