Class {
	#name : #AodAddShapeCommand,
	#superclass : #AodCommand,
	#instVars : [
		'shape'
	],
	#category : #'Aod-Command'
}

{ #category : #hook }
AodAddShapeCommand >> applyOn: aDrawing [
	aDrawing 
		addShape: shape
		onConflict: [ :selector |
			| property |
			property := shape propertyAt: selector.
			self message: 'drawing already has a shape with ', selector, '=', property value asString.
			^ false ].
		
	^ true 
]

{ #category : #'as yet unclassified' }
AodAddShapeCommand >> mayFail [
	^ true
]

{ #category : #accessing }
AodAddShapeCommand >> shape [
	^ shape
]

{ #category : #accessing }
AodAddShapeCommand >> shape: anObject [
	shape := anObject
]
