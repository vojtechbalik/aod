Class {
	#name : #AodRenameShapeCommand,
	#superclass : #AodCommand,
	#instVars : [
		'reference',
		'name'
	],
	#category : #'Aod-Command'
}

{ #category : #hook }
AodRenameShapeCommand >> applyOn: aDrawing [
	| shape oldName |
	"in the future, this should also rename references in the program, however it can work without"
	shape := reference resolveWith: aDrawing.
	shape ifNil: [ 
		self message: 'no shape under ', reference asString.
		^ false ].
	
	shape
		propertyAt: #name
		ifPresent: [ :p | 
			oldName := p value.
			aDrawing shapeManager unregister: #name of: shape ].
		
	^ [	aDrawing shapeManager register: #name of: shape as: name.
		shape propertiesChanged.
		true ]
		on: AodError
		do: [ :ex |
			oldName ifNotNil: [ aDrawing shapeManager register: #name of: shape as: oldName ].
			self message: 'name ', name, ' is already taken'.
			ex return: false ]
	
	 
]

{ #category : #'as yet unclassified' }
AodRenameShapeCommand >> mayFail [
	^ true
]

{ #category : #accessing }
AodRenameShapeCommand >> name [
	^ name
]

{ #category : #accessing }
AodRenameShapeCommand >> name: anObject [
	name := anObject
]

{ #category : #accessing }
AodRenameShapeCommand >> reference [
	^ reference
]

{ #category : #accessing }
AodRenameShapeCommand >> reference: anObject [
	reference := anObject
]
