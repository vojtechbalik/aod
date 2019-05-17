Class {
	#name : #AodProperty,
	#superclass : #Object,
	#category : #'Aod-Property'
}

{ #category : #converting }
AodProperty class >> asSymbol [
	^ self selector
]

{ #category : #'as yet unclassified' }
AodProperty class >> contextHolder [
	^ nil
]

{ #category : #testing }
AodProperty class >> isMutable [
	^ true
]

{ #category : #accessing }
AodProperty class >> label [
	"it is easier to implement the lookup if there is some default label"
	^ #'--no-label--'
]

{ #category : #'instance creation' }
AodProperty class >> lookup: aString [
	"be careful not to modify the subclasses collection, this saves us a lot of copies"
	| results |
	results := OrderedCollection new.
	self lookup: aString results: results.
	results size > 1 
		ifTrue: [ self error: 'multiple properties under the selector ', aString ].
	results size = 0
		ifTrue: [ self error: 'no property under the selector ', aString ].
	^ results first
]

{ #category : #'instance creation' }
AodProperty class >> lookup: aString results: aCollection [
	"be careful not to modify the subclasses collection. this is dangerous, but saves us a lot of copies"
	self label = aString
			ifTrue: [ aCollection add: self ].
	subclasses ifNil: [ ^ self ].
	subclasses do: [ :sub | sub lookup: aString results: aCollection ]
]

{ #category : #accessing }
AodProperty class >> selector [
	^ self label
]

{ #category : #accessing }
AodProperty class >> value: anObject [
	^ self new 
		value: anObject;
		yourself
]

{ #category : #converting }
AodProperty >> asSymbol [
	^ self class asSymbol
]

{ #category : #testing }
AodProperty >> isMutable [
	^ self class isMutable
]

{ #category : #accessing }
AodProperty >> label [
	^ self class label
]

{ #category : #evaluating }
AodProperty >> value [
	"answer the value of the property, e.g. string for a name property, color for a color property, etc."
	^ self subclassResponsibility 
]

{ #category : #accessing }
AodProperty >> value: anObject [
	^ self subclassResponsibility 
]
