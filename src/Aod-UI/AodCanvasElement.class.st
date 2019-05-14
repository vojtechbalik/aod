"
an element on which the visual of a drawing is rendered.

positions from shapes' models are mapped 1:1 to my local coordinates
"
Class {
	#name : #AodCanvasElement,
	#superclass : #BlElement,
	#instVars : [
		'drawing'
	],
	#category : #'Aod-UI-Canvas'
}

{ #category : #initialization }
AodCanvasElement >> defaultLayout [
	^ AodCanvasLayout new
]

{ #category : #accessing }
AodCanvasElement >> drawing [
	^ drawing
]

{ #category : #accessing }
AodCanvasElement >> drawing: anObject [
	drawing ifNotNil: [ self error: 'cannot change drawing' ].
	
	drawing := anObject.
	self layout solver: drawing constraintSolver.
	self initializeHooks
]

{ #category : #initialization }
AodCanvasElement >> initializeHooks [
	drawing announcer weak
		when: AodShapeAdded
		send: #onShapeAdded:
		to: self;
		
		when: AodShapeRemoved
		send: #onShapeRemoved:
		to: self
]

{ #category : #'hooks - children' }
AodCanvasElement >> onChildAdded: anElement [
	self assert: (anElement aodModel isKindOf: AodShape)
]

{ #category : #'shapes - hooks' }
AodCanvasElement >> onShapeAdded: anAnnouncement [
	self addChild: anAnnouncement shape asElement
]

{ #category : #'shapes - hooks' }
AodCanvasElement >> onShapeRemoved: anAnnouncement [
	self children
			detect: [ :child | child aodModel == anAnnouncement shape ]
			ifFound: [ :child | child removeFromParent ]
			ifNone: [ self error: 'removed shape has no view' ]
	
]

{ #category : #'as yet unclassified' }
AodCanvasElement >> onShapeUpdated: aShape [
]
