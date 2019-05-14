Class {
	#name : #AodSelectionElementExample,
	#superclass : #Object,
	#category : #'Aod-UI-Examples'
}

{ #category : #'as yet unclassified' }
AodSelectionElementExample >> basicExample [
	<gtExample>
	| selection element shape |
	selection := AodSelection new.
	shape := AodRectangle new.
	element := AodSelectionElement new.
	
	element selection: selection.
	self assert: element isVisible not.
	selection select: shape.
	self assert: element isVisible.
	selection deselect.
	self assert: element isVisible not.
	
	selection select: shape.
	
	^ element
	
]
