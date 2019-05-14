Class {
	#name : #AodStrengthDeclarations,
	#superclass : #Object,
	#instVars : [
		'nLevels',
		'mappings'
	],
	#category : #'Aod-Language-Strength'
}

{ #category : #accessing }
AodStrengthDeclarations class >> default [
	^ self new
		nLevels: self defaultNLevels;
		mappings: self defaultMappings;
		yourself
]

{ #category : #'as yet unclassified' }
AodStrengthDeclarations class >> defaultMappings [
	^ Dictionary newFromPairs: { 
		'required'. 	0.
		'strong'. 	1.
		'medium' .	2.
		'stay'. 		3. }
]

{ #category : #'as yet unclassified' }
AodStrengthDeclarations class >> defaultNLevels [
	^ 3
]

{ #category : #accessing }
AodStrengthDeclarations >> mappings [
	^ mappings
]

{ #category : #accessing }
AodStrengthDeclarations >> mappings: anObject [
	mappings := anObject
]

{ #category : #accessing }
AodStrengthDeclarations >> nLevels [
	^ nLevels
]

{ #category : #accessing }
AodStrengthDeclarations >> nLevels: anObject [
	nLevels := anObject
]

{ #category : #'as yet unclassified' }
AodStrengthDeclarations >> named: aString ifAbsent: aBlock [
	^ mappings at: aString ifAbsent: aBlock
]
