Class {
	#name : #AodIdReference,
	#superclass : #AodShapeReference,
	#instVars : [
		'id'
	],
	#category : #'Aod-Shape'
}

{ #category : #comparing }
AodIdReference >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ id = anObject id
]

{ #category : #'as yet unclassified' }
AodIdReference >> aodWriteOn: aStream [
	aStream << $# << id asString
]

{ #category : #comparing }
AodIdReference >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ id hash
]

{ #category : #accessing }
AodIdReference >> id [
	^ id
]

{ #category : #accessing }
AodIdReference >> id: anObject [
	id := anObject
]

{ #category : #querying }
AodIdReference >> resolveWith: aDrawing [
	^ aDrawing shapeBy: #id at: id ifAbsent: [ nil ]
]
