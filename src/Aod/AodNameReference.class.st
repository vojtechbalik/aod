Class {
	#name : #AodNameReference,
	#superclass : #AodShapeReference,
	#instVars : [
		'name'
	],
	#category : #'Aod-Shape'
}

{ #category : #comparing }
AodNameReference >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ name = anObject name
]

{ #category : #'as yet unclassified' }
AodNameReference >> aodWriteOn: aStream [
	aStream << $@ << name
]

{ #category : #comparing }
AodNameReference >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ name hash
]

{ #category : #accessing }
AodNameReference >> name [
	^ name
]

{ #category : #accessing }
AodNameReference >> name: anObject [
	name := anObject
]

{ #category : #querying }
AodNameReference >> resolveWith: aDrawing [
	^ aDrawing shapeBy: #name at: name ifAbsent: [ nil ]
]
