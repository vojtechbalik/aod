Class {
	#name : #ClDummyVariable,
	#superclass : #ClAbstractVariable,
	#category : #'Cassowary-Kernel'
}

{ #category : #initialization }
ClDummyVariable >> initialize [
	super initialize.
	
	self name: 'dummy'
]

{ #category : #testing }
ClDummyVariable >> isDummy [

	^ true
]

{ #category : #testing }
ClDummyVariable >> isExternal [

	^ false
]

{ #category : #testing }
ClDummyVariable >> isPivotable [

	^ false
]

{ #category : #testing }
ClDummyVariable >> isRestricted [

	^ true
]
