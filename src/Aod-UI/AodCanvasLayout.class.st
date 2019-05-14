"
lays out Drawing Components on a Canvas according to their Model

also triggers Solver resolve
"
Class {
	#name : #AodCanvasLayout,
	#superclass : #BlLayout,
	#instVars : [
		'solver'
	],
	#category : #'Aod-UI-Canvas'
}

{ #category : #layout }
AodCanvasLayout >> layout: anElement in: aRectangle [
	anElement children accountedByLayout do: [ :child |
		"it has already been asserted in #measure:with: that there is the correct aodModel"
		child measuredBounds position: child aodModel vessel layoutPosition.
		child applyLayoutIn: child measuredBounds asRectangle ].
	
	self layoutIgnored: anElement
]

{ #category : #measure }
AodCanvasLayout >> measure: anElement with: anExtentSpec [
	"fit-content is not supported"
	anElement measuredExtent: (anExtentSpec sizeFor: 0@0).
	
	"solver isEditing
		ifTrue: [ solver resolve ]."
	
	anElement children accountedByLayout do: [ :child |
		| computedExtent model |	
		self assert: [ child aodModel isKindOf: AodShape ] description: [ 'I am only meant to layout elements representing AodShapes' ].
		model := child aodModel vessel.
		model aboutToLayout: child.
		computedExtent := model layoutExtent.
		child measure: (BlExtentMeasurementSpec exact: computedExtent) ].
	
	self measureIgnored: anElement with: anExtentSpec 
]

{ #category : #accessing }
AodCanvasLayout >> solver [
	^ solver
]

{ #category : #accessing }
AodCanvasLayout >> solver: anObject [
	solver := anObject
]
