Class {
	#name : #AodConstraint,
	#superclass : #AodType,
	#instVars : [
		'relator',
		'strength'
	],
	#category : #'Aod-Program'
}

{ #category : #accessing }
AodConstraint class >> builder [
	^ AodConstraintBuilder default
]

{ #category : #'as yet unclassified' }
AodConstraint class >> defaultStrength [
	^ AodStrength required
]

{ #category : #testing }
AodConstraint class >> isConstraintType [
	^ true
]

{ #category : #comparing }
AodConstraint >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ relator = anObject relator and: [ strength = anObject strength ]
]

{ #category : #'as yet unclassified' }
AodConstraint >> defaultStrength [
	^ self class defaultStrength
]

{ #category : #comparing }
AodConstraint >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ relator hash
]

{ #category : #printing }
AodConstraint >> printOn: aStream [
	| printer |
	printer := AodActorPrinter new 
		stream: aStream.
	
	relator acceptVisitor: printer.
	
	aStream << ' : '.
	
	strength printOn: aStream
]

{ #category : #accessing }
AodConstraint >> relator [
	^ relator
]

{ #category : #accessing }
AodConstraint >> relator: anObject [
	relator := anObject
]

{ #category : #'as yet unclassified' }
AodConstraint >> resolveReferencesUsing: aResolver [
	^ relator acceptVisitor: aResolver
]

{ #category : #'as yet unclassified' }
AodConstraint >> resolveReferencesWith: aDrawing [
	| resolver |
	resolver := AodConstraintReferenceResolver new
		drawing: aDrawing;
		yourself.
	^ self resolveReferencesUsing: resolver
]

{ #category : #accessing }
AodConstraint >> strength [
	^ strength
]

{ #category : #accessing }
AodConstraint >> strength: anObject [
	strength := anObject
]
