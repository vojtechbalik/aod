"
Shapes - from SVG's 'shape element'.

constraint solver defines position/extent representation
"
Class {
	#name : #AodShape,
	#superclass : #Object,
	#traits : 'TAodPropertyDictionary',
	#classTraits : 'TAodPropertyDictionary classTrait',
	#instVars : [
		'announcer',
		'propertyDict',
		'vessel'
	],
	#category : #'Aod-Shape'
}

{ #category : #comparing }
AodShape >> = other [
	^ self == other
	
]

{ #category : #announce }
AodShape >> announce: aShapeAnnouncement [
	aShapeAnnouncement shape: self.
	announcer announce: aShapeAnnouncement
]

{ #category : #accessing }
AodShape >> announcer [
	^ announcer
]

{ #category : #'as yet unclassified' }
AodShape >> aodWriteOn: aStream [
	self 
		propertyAt: #name 
		ifPresent: [ :p | 
			aStream << $@ << p value.
			^ self ].
	
	self 
		propertyAt: #id
		ifPresent: [ :p |
			aStream << $# << p value.
			^ self ].
	
	self error: 'shape does not have id or name, cannot write it out'
]

{ #category : #converting }
AodShape >> asAodReference [
	"i am polymorphic with AodReference"
	^ self
]

{ #category : #initialization }
AodShape >> defaultColor [
	^ Color random
]

{ #category : #private }
AodShape >> defaultVessel [
	"defaults for individual shapes are implemented in the Aod - Language package to break hard dependency"
	self subclassResponsibility 
]

{ #category : #comparing }
AodShape >> hash [
	^ self identityHash 
	
]

{ #category : #initialization }
AodShape >> initialize [
	super initialize.
	
	vessel := self defaultVessel.
	propertyDict := Dictionary new.
	announcer := Announcer new
]

{ #category : #printing }
AodShape >> printOn: aStream [
	self aodWriteOn: aStream
]

{ #category : #properties }
AodShape >> properties [
	^ self propertyDictionary values
]

{ #category : #'as yet unclassified' }
AodShape >> propertiesChanged [
	self announce: AodShapeUpdated new
]

{ #category : #'private - properties' }
AodShape >> propertyDictionary [
	"return a Dictionary"
	^ propertyDict 
]

{ #category : #querying }
AodShape >> resolveWith: aDrawing [
	"polymorphism with AodShapeReference"
	^ self
]

{ #category : #accessing }
AodShape >> vessel [
	^ vessel
]

{ #category : #accessing }
AodShape >> vessel: anObject [
	vessel := anObject
]
