Class {
	#name : #AodShapeReference,
	#superclass : #Object,
	#category : #'Aod-Shape'
}

{ #category : #comparing }
AodShapeReference >> = reference [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
AodShapeReference >> aodWriteOn: aStream [
	self subclassResponsibility
]

{ #category : #printing }
AodShapeReference >> printOn: aStream [
	self aodWriteOn: aStream
]

{ #category : #querying }
AodShapeReference >> resolveWith: aDrawing [
	self subclassResponsibility
]
