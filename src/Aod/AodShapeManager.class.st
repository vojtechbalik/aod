"
holds shapes.

names and ids have to be unique in a drawing. I manage that.

IdRegistry is special in that it owns the shapes. (there is a unique ID for every shape).
"
Class {
	#name : #AodShapeManager,
	#superclass : #Object,
	#instVars : [
		'idRegistry',
		'otherRegistries'
	],
	#category : #'Aod-Core'
}

{ #category : #adding }
AodShapeManager >> add: aShape [
	self 
		add: aShape 
		onConflict: [ :selector | self error: 'there was a conflict adding the shape to #', selector, ' registry' ]
]

{ #category : #adding }
AodShapeManager >> add: aShape onConflict: aBlock [
	| conflictingRegistry |

	(idRegistry register: aShape)
		ifFalse: [ ^ aBlock cull: idRegistry selector. ].
		
	otherRegistries 
		detect: [ :registry | (registry register: aShape) not ]
		ifFound: [ :registry | conflictingRegistry := registry ]
		ifNone: [ 
			"success!"
			^ self ].
		
	otherRegistries do: [ :registry | registry unregister: aShape ].
	idRegistry unregister: aShape.
	
	^ aBlock cull: conflictingRegistry selector
		
	
]

{ #category : #asserting }
AodShapeManager >> assertNotForeign: aShape [
	| property |
	property := aShape 
		propertyAt: #id 
		ifAbsent: [ self assert: false ].
	
	self assert: (self by: #id at: property value) == aShape
]

{ #category : #'as yet unclassified' }
AodShapeManager >> by: aSelector at: aKey [
	^ (self registryAt: aSelector) at: aKey
]

{ #category : #'as yet unclassified' }
AodShapeManager >> by: aSelector at: aKey ifAbsent: aBlock [
	^ (self registryAt: aSelector) at: aKey ifAbsent: aBlock
]

{ #category : #enumerating }
AodShapeManager >> do: aBlock [
	idRegistry do: aBlock
]

{ #category : #initialization }
AodShapeManager >> initialize [
	super initialize.
	
	idRegistry := AodShapeIdRegistry new.
	otherRegistries := { AodShapeNameRegistry new }
]

{ #category : #testing }
AodShapeManager >> isRegistering: aSelector of: aShape [
	| property |
	self assertNotForeign: aShape.
	
	property := aShape propertyAt: aSelector ifAbsent: [ ^ false ].
	
	"test that the property was properly registered"
	self assert: (self by: aSelector at: property value) == aShape.
	
	^ true
]

{ #category : #'as yet unclassified' }
AodShapeManager >> register: aSelector of: aShape as: aKey [
	| registry |
	
	self assertNotForeign: aShape.
	
	registry := self registryAt: aSelector.
	
	(registry register: aShape as: aKey)
		ifFalse: [ AodError signal: 'could not register (', aKey asString, ' is occupied, or shape already registers a #', aSelector ]
	
]

{ #category : #'as yet unclassified' }
AodShapeManager >> registeredCount [
	^ idRegistry registeredCount
]

{ #category : #'as yet unclassified' }
AodShapeManager >> registeredShapes [
	^ idRegistry registeredShapes
]

{ #category : #accessing }
AodShapeManager >> registryAt: aSelector [
	^ self 
		registryAt: aSelector 
		ifAbsent: [ self error: 'no registry at given selector found' ]
]

{ #category : #accessing }
AodShapeManager >> registryAt: aSelector ifAbsent: aBlock [
	(aSelector == idRegistry selector)
		ifTrue: [ ^ idRegistry ].
		
	otherRegistries 
		detect: [ :registry | registry selector == aSelector ]
		ifFound: [ :registry | ^ registry ].

	^ aBlock value
]

{ #category : #removing }
AodShapeManager >> remove: aShape [
	(idRegistry unregister: aShape)
		"foreign shape"
		ifFalse: [ self error: 'cannot remove shape not registered by me' ].
		
	otherRegistries do: [ :registry | registry unregister: aShape ]
]

{ #category : #'as yet unclassified' }
AodShapeManager >> unregister: aSelector of: aShape [
	| registry |
	self assertNotForeign: aShape.
	
	registry := self registryAt: aSelector ifAbsent: [ ^ self ].
	
	registry == idRegistry 
		ifTrue: [ AodError signal: 'cannot unregister ', aSelector ].
		
	^ registry unregister: aShape
]
