Class {
	#name : #AodShapeNameRegistryTest,
	#superclass : #TestCase,
	#category : #'Aod-Tests'
}

{ #category : #'instance creation' }
AodShapeNameRegistryTest >> newShape [ 
	^ AodRectangle new
]

{ #category : #tests }
AodShapeNameRegistryTest >> testRegister [
	| registry shape1 shape2 invalidShape |
	registry := AodShapeNameRegistry new.
	
	shape1 := self newShape
		propertyAt: #name put: 'name1';
		yourself.
		
	shape2 := self newShape.
	
	
	self assert: (registry register: shape1).
	"even that the shape is not registered, there has not been a conflict, true should be returned"
	self assert: (registry register: shape2).
		
	self assert: registry registeredCount equals: 1.
	self assert: (registry at: 'name1') == shape1.
	
	"conflicting name, false should be returned"
	invalidShape := self newShape
		propertyAt: #name put: 'name1';
		yourself.
	
	self deny: (registry register: invalidShape).
	self assert: registry registeredCount equals: 1.
	self assert: (registry at: 'name1') == shape1.
]

{ #category : #tests }
AodShapeNameRegistryTest >> testRegisterAs [
	| registry shape1 shape2 invalidShape |
	registry := AodShapeNameRegistry new.
	
	shape1 := self newShape.	
	shape2 := self newShape.
	
	invalidShape := self newShape
		propertyAt: #name put: 'name1';
		yourself.
		
	self assert: (registry register: shape1 as: 'name1').
	self assert: registry registeredCount equals: 1.
	self assert: (registry at: 'name1') == shape1.
	self assert: (shape1 propertyAt: #name) value equals: 'name1'. 
	
	"trying to register under an occupied name should return false"
	self deny: (registry register: shape2 as: 'name1').
	self assert: registry registeredCount equals: 1.
	
	"trying to register an already registered shape is an error"
	self should: [ registry register: shape1 as: 'differentName' ] raise: Error.
	self assert: registry registeredCount equals: 1.
	self assert: (registry at: 'differentName') == nil.
	self assert: (registry at: 'name1') == shape1.
	
	self should: [ registry register: shape1 as: 'name1' ] raise: Error.
	self assert: registry registeredCount equals: 1.
	self assert: (registry at: 'differentName') == nil.
	self assert: (registry at: 'name1') == shape1.
	
	"registering a shape with the property set, but not already registered, should never happen and is an error"
	invalidShape := self newShape
		propertyAt: #name put: 'bad';
		yourself.
	
	self should: [ registry register: invalidShape as: 'other' ] raise: Error.
	self assert: registry registeredCount equals: 1.
	self should: [ registry register: invalidShape as: 'bad' ] raise: Error.
	self assert: registry registeredCount equals: 1.
	
]

{ #category : #tests }
AodShapeNameRegistryTest >> testUnregister [
	| registry shape1 shape2 invalidShape |
	registry := AodShapeNameRegistry new.
	
	shape1 := self newShape.	
	shape2 := self newShape
		propertyAt: #name put: 'name2';
		yourself.
	
	registry 
		register: shape1 as: 'name1';
		register: shape2.
		
	self assert: (registry unregister: shape1).
	self assert: (shape1 propertyAt: #name) equals: nil.
	self assert: registry registeredCount equals: 1.
	
	"unregistering a shape, that is not registered and has name property not set, is valid operation and should return false"
	invalidShape := self newShape.
	self deny: (registry unregister: invalidShape).
	
	"unregistering a shape, that is not registered but has the property set, is an error"
	invalidShape := self newShape
		propertyAt: #name put: 'invalid';
		yourself.
		
	self should: [ registry unregister: invalidShape ] raise: Error.
	
	"unregistering an unregistered shape with a name that is registered does not unregister the original registered"
	invalidShape := self newShape
		propertyAt: #name put: 'name2';
		yourself.
	self deny: (registry unregister: invalidShape).
	self assert: registry registeredCount equals: 1.
	self assert: (registry at: 'name2') == shape2
]

{ #category : #tests }
AodShapeNameRegistryTest >> testUnregisterAll [
	| registry shape1 shape2 |
	registry := AodShapeNameRegistry new.
	
	shape1 := self newShape.	
	shape2 := self newShape.
	
	registry
		register: shape1 as: 'name1';
		register: shape2 as: 'name2'.
		
	self shouldnt: registry unregisterAll raise: Error.
	self assert: (shape1 propertyAt: #name) equals: nil.
	self assert: (shape2 propertyAt: #name) equals: nil.
	self assert: registry registeredCount equals: 0.
]
