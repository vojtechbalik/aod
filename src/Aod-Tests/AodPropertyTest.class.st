Class {
	#name : #AodPropertyTest,
	#superclass : #TestCase,
	#category : #'Aod-Tests'
}

{ #category : #tests }
AodPropertyTest >> testSimpleAddProperty [
	| shape |
	shape := AodRectangle new.
	shape propertyAt: #name put: 'foo'.
	shape propertyAt: #id put: 123.
	self assert: (shape propertyAt: AodNameProperty label) value equals: 'foo'.
	self assert: (shape propertyAt: AodIdProperty label) value equals: 123
]
