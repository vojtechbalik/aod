"
when I am added to a drawing, there is an attempt to resolve references

I deal with Stays
"
Class {
	#name : #AodProgram,
	#superclass : #Object,
	#instVars : [
		'constraints',
		'strengthsDeclaration',
		'text',
		'referencesCache'
	],
	#category : #'Aod-Program'
}

{ #category : #comparing }
AodProgram >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ constraints hasEqualElements: anObject constraints
]

{ #category : #accessing }
AodProgram >> constraints [
	^ constraints
]

{ #category : #accessing }
AodProgram >> constraints: anObject [
	constraints := anObject
]

{ #category : #'as yet unclassified' }
AodProgram >> generateText [
	^ String streamContents: [ :s |
		constraints do: [ :c |
			c printOn: s.
			s << Character cr ] ] 
]

{ #category : #comparing }
AodProgram >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ constraints hash
]

{ #category : #initialization }
AodProgram >> initialize [
	super initialize.

	constraints := #()
]

{ #category : #accessing }
AodProgram >> references [
	| selector |
	referencesCache
		ifNotNil: [ :rc | ^ rc ].
		
	referencesCache := OrderedCollection new.
	
	selector := AodActorSelector new.
	
	constraints do: [ :c |
		referencesCache addAll: (selector select: AodShapeBinding in: c relator) ].
	
	referencesCache := referencesCache collect: #data.
	
	^ referencesCache
		
]

{ #category : #'as yet unclassified' }
AodProgram >> resolveReferencesWith: aDrawing [
	| resolver |
	resolver := AodConstraintReferenceResolver new.
	resolver drawing: aDrawing.
	^ constraints allSatisfy: [ :c | c resolveReferencesUsing: resolver ]
]

{ #category : #accessing }
AodProgram >> strengthsDeclaration [
	^ strengthsDeclaration
]

{ #category : #accessing }
AodProgram >> strengthsDeclaration: anObject [
	strengthsDeclaration := anObject
]

{ #category : #accessing }
AodProgram >> text [
	text ifNil: [ text := self generateText ].
	
	^ text
]

{ #category : #accessing }
AodProgram >> text: anObject [
	text := anObject
]
