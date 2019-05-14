Class {
	#name : #AodRemoveShapeCommand,
	#superclass : #AodCommand,
	#instVars : [
		'reference'
	],
	#category : #'Aod-Command'
}

{ #category : #hook }
AodRemoveShapeCommand >> applyOn: aDrawing [
	| shape id name references |
	shape := reference resolveWith: aDrawing.
	shape ifNil: [ ^ false ].
	
	id := shape propertyAt: #id.
	name := shape propertyAt: #name.
	
	references := aDrawing program references.
	(references includes: id value asAodReference)
		ifTrue: [ 
			self message: 'cannot remove shape whose ID is referenced in program'.
			^ false ].
	
	(name isNotNil and: [ references includes: name value asAodReference ])
		ifTrue: [ 
			self message: 'cannot remove shape whose name is referenced in program'.
			^ false ].
		
	aDrawing removeShape: shape.
	
	^ true
]

{ #category : #'as yet unclassified' }
AodRemoveShapeCommand >> mayFail [
	^ true
]

{ #category : #accessing }
AodRemoveShapeCommand >> reference [
	^ reference
]

{ #category : #accessing }
AodRemoveShapeCommand >> reference: anObject [
	reference := anObject
]
