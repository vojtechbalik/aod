Class {
	#name : #AodShapeManagerTest,
	#superclass : #TestCase,
	#category : #'Aod-Tests'
}

{ #category : #'instance creation' }
AodShapeManagerTest >> newShapeId: anId named: aName [
	| shape |
	shape := AodRectangle new.
	anId ifNotNil: [ :id | shape propertyAt: #id put: id ].
	aName ifNotNil: [ :name | shape propertyAt: #name put: name ].
	^ shape
]

{ #category : #tests }
AodShapeManagerTest >> testAddOnConflict [
	| shapeHolder shape1 shape2 shape3 generatedId invalidShape flag |
	shapeHolder := AodShapeManager new.
	
	shape1 := self newShapeId: 1 named: 'name1'.
	shape2 := self newShapeId: 2 named: nil.
	shape3 := self newShapeId: nil named: 'name3'.
	
	shapeHolder
		add: shape1
		onConflict: [ self assert: false ];
		
		add: shape2
		onConflict: [ self assert: false ];
		
		add: shape3
		onConflict: [ self assert: false ].
		
	self assert: (shapeHolder registeredCount) equals: (shapeHolder registryAt: #id) registeredCount.
	self assert: (shapeHolder registeredCount) equals: 3.
	
	self assert: (shapeHolder registryAt: #name) registeredCount equals: 2.
	
	self assert: (shapeHolder by: #id at: 1) == shape1.
	self assert: (shapeHolder by: #name at: 'name1') == shape1.
	self assert: (shapeHolder by: #id at: 2) == shape2.
	self assert: (shapeHolder by: #name at: 'name3') == shape3.
	
	"shape3 was assigned an ID"
	generatedId := (shape3 propertyAt: #id ifAbsent: [ self assert: false ]) value.
	self assert: generatedId isNotNil.
	
	"conflicting ID"
	invalidShape := self newShapeId: generatedId named: nil.
	
	flag := false.
	shapeHolder add: invalidShape onConflict: [ flag := true ].
	self assert: flag.
	self assert: shapeHolder registeredCount equals: 3.
	self assert: (shapeHolder registryAt: #id) registeredCount equals: 3.
	self assert: (shapeHolder registryAt: #name) registeredCount equals: 2.
	self assert: (shapeHolder by: #id at: generatedId) == shape3.
	
	"conflicting name"
	invalidShape := self newShapeId: nil named: 'name3'.
	
	flag := false.
	shapeHolder add: invalidShape onConflict: [ flag := true ].
	self assert: flag.
	self assert: shapeHolder registeredCount equals: 3.
	self assert: (shapeHolder registryAt: #id) registeredCount equals: 3.
	self assert: (shapeHolder registryAt: #name) registeredCount equals: 2.
	self assert: (shapeHolder by: #name at: 'name3') == shape3.
]

{ #category : #tests }
AodShapeManagerTest >> testIsRegisteringOf [
	| shapeHolder shape1 shape2 invalidShape |
	shapeHolder := AodShapeManager new.
	
	shape1 := self newShapeId: nil named: 'name1'.
	shape2 := self newShapeId: nil named: nil.
	invalidShape := self newShapeId: nil named: nil.
	
	shapeHolder 
		add: shape1;
		add: shape2.
		
	"testing for foreign shapes is an error"
	self should: [ shapeHolder isRegistering: #id of: invalidShape ] raise: Error.
	self should: [ shapeHolder isRegistering: #name of: invalidShape ] raise: Error.
	
	self deny: (shapeHolder isRegistering: #name of: shape2).
	self assert: (shapeHolder isRegistering: #id of: shape2).
	
	self assert: (shapeHolder isRegistering: #name of: shape1)
]

{ #category : #tests }
AodShapeManagerTest >> testRegisterOfAs [
	| shapeHolder shape1 shape2 shape3 invalidShape |
	shapeHolder := AodShapeManager new.
	
	shape1 := self newShapeId: nil named: 'name1'.
	shape2 := self newShapeId: nil named: nil.
	shape3 := self newShapeId: nil named: nil.
	
	shapeHolder 
		add: shape1;
		add: shape2;
		add: shape3. 
		
	"cannot register a shape that was not added to the shapeHolder first (it is foreign to it)"
	invalidShape := self newShapeId: nil named: nil.
	self should: [ shapeHolder register: #id of: invalidShape as: 1 ] raise: Error.
	self assert: shapeHolder registeredCount equals: 3.
	
	self should: [ shapeHolder register: #name of: invalidShape as: 'invalid' ] raise: Error.
	self assert: shapeHolder registeredCount equals: 3.
	self assert: (shapeHolder registryAt: #name) registeredCount equals: 1.
	
	"cannot register under a key that is already occupied"
	self should: [ shapeHolder register: #name of: shape2 as: 'name1' ] raise: Error.
	self assert: (shapeHolder registryAt: #name) registeredCount equals: 1.
	self assert: (shapeHolder by: #name at: 'name1') == shape1.
	
	"cannot register a property for a shape that has that property already registered"
	self should: [ shapeHolder register: #name of: shape1 as: 'differentName' ] raise: Error.
	self assert: (shapeHolder registryAt: #name) registeredCount equals: 1.
	self assert: (shapeHolder by: #name at: 'differentName') equals: nil.
	self assert: (shapeHolder by: #name at: 'name1') == shape1.
	
	"ok usage"
	self shouldnt: (shapeHolder register: #name of: shape2 as: 'name2') raise: Error.
	self assert: (shapeHolder registryAt: #name) registeredCount equals: 2.
	self assert: (shapeHolder by: #name at: 'name2') == shape2.
	self assert: shapeHolder registeredCount equals: 3.
]

{ #category : #tests }
AodShapeManagerTest >> testRemove [
	| shapeHolder shape1 shape2 shape3 invalidShape |
	shapeHolder := AodShapeManager new.
	
	shape1 := self newShapeId: 1 named: 'name1'.
	shape2 := self newShapeId: 2 named: nil.
	shape3 := self newShapeId: nil named: 'name3'.
	
	shapeHolder 
		add: shape1;
		add: shape2;
		add: shape3.
	
	"foreign shape"
	invalidShape := self newShapeId: nil named: 'name4'.
		
	self should: [ shapeHolder remove: invalidShape ] raise: Error.
	self assert: shapeHolder registeredCount equals: 3.
	self assert: (shapeHolder registryAt: #id) registeredCount equals: 3.
	self assert: (shapeHolder registryAt: #name) registeredCount equals: 2.
	self assert: shapeHolder registeredShapes asSet equals: { shape1. shape2. shape3 } asSet.
	
	"foreign shape with ID registered"
	invalidShape := self newShapeId: 2 named: nil.
	
	self should: [ shapeHolder remove: invalidShape ] raise: Error.
	self assert: shapeHolder registeredCount equals: 3.
	self assert: (shapeHolder registryAt: #id) registeredCount equals: 3.
	self assert: (shapeHolder registryAt: #name) registeredCount equals: 2.
	self assert: shapeHolder registeredShapes asSet equals: { shape1. shape2. shape3 } asSet.
	
	self shouldnt: [ shapeHolder remove: shape1 ] raise: Error.
	self assert: shapeHolder registeredCount equals: 2.
	self assert: (shapeHolder registryAt: #id) registeredCount equals: 2.
	self assert: (shapeHolder registryAt: #name) registeredCount equals: 1.
	self assert: shapeHolder registeredShapes asSet equals: { shape2. shape3 } asSet.
	
	self shouldnt: [ shapeHolder remove: shape2 ] raise: Error.
	self assert: shapeHolder registeredCount equals: 1.
	self assert: (shapeHolder registryAt: #id) registeredCount equals: 1.
	self assert: (shapeHolder registryAt: #name) registeredCount equals: 1.
	self assert: shapeHolder registeredShapes asSet equals: { shape3 } asSet.
	
	self shouldnt: [ shapeHolder remove: shape3 ] raise: Error.
	self assert: shapeHolder registeredCount equals: 0.
	self assert: (shapeHolder registryAt: #id) registeredCount equals: 0.
	self assert: (shapeHolder registryAt: #name) registeredCount equals: 0.
	self assert: shapeHolder registeredShapes asSet equals: { } asSet.
	
]

{ #category : #tests }
AodShapeManagerTest >> testUnregisterOf [
	| shapeHolder shape1 shape2 shape3 |
	shapeHolder := AodShapeManager new.
	
	shape1 := self newShapeId: 1 named: 'name1'.
	shape2 := self newShapeId: 2 named: nil.
	shape3 := self newShapeId: nil named: 'name3'.
	
	shapeHolder 
		add: shape1;
		add: shape2;
		add: shape3.
		
	"cannot use unregister to remove shapes"
	self should: [ shapeHolder unregister: #id of: shape1 ] raise: Error.
	self assert: shapeHolder registeredCount equals: 3.
	
	"unregistering absent property returns false"
	self deny: (shapeHolder unregister: #name of: shape2).
	self assert: shapeHolder registeredCount equals: 3.
	self assert: (shapeHolder registryAt: #name) registeredCount equals: 2.
	
	self assert: (shapeHolder unregister: #name of: shape3).
	self assert: shapeHolder registeredCount equals: 3.
	self assert: (shapeHolder registryAt: #name) registeredCount equals: 1.
	
]
