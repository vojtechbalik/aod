Class {
	#name : #AodCanvasContainer,
	#superclass : #BlElement,
	#instVars : [
		'drawing',
		'canvas',
		'overlays',
		'selection'
	],
	#category : #'Aod-UI-Canvas'
}

{ #category : #accessing }
AodCanvasContainer >> drawing [
	^ drawing
]

{ #category : #accessing }
AodCanvasContainer >> drawing: anObject [
	self assert: drawing isNil description: 'cannot change drawing'.
	drawing := anObject.
	canvas drawing: anObject.
	selection selection: drawing selection.
	
	drawing announcer weak 
		when: AodCanvasLayoutChanged
		send: #onCanvasLayoutChange
		to: self;
		
		when: AodCommandResult
		send: #onCommandResult:
		to: self
	
]

{ #category : #initialization }
AodCanvasContainer >> initialize [
	super initialize.
		
	canvas := AodCanvasElement new.
	canvas constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	
	selection := AodSelectionElement new.
	
	"it is IMPORTANT to add canvas as the first child. this is what allows selection to act as an overlay over elements of the canvas"
	self addChild: canvas.
	"self addChildren: overlays"
	self addChild: selection.
	
	self addEventHandler: AodSelectionTool new
]

{ #category : #'as yet unclassified' }
AodCanvasContainer >> onCanvasLayoutChange [
	canvas requestLayout.
	selection updateFromModel
]

{ #category : #'as yet unclassified' }
AodCanvasContainer >> onCommandResult: announcement [
	self inform: announcement printString
]
