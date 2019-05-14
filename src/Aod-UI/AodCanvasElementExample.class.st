Class {
	#name : #AodCanvasElementExample,
	#superclass : #Object,
	#category : #'Aod-UI-Examples'
}

{ #category : #'as yet unclassified' }
AodCanvasElementExample >> basicExample [
	<gtExample>
	| canvas drawing shapes |
	drawing := AodDrawing new.
	drawing
		constraintSolver: AodDummySolver new.
	shapes := 3 timesCollect: [ AodRectangle new ].
		shapes do: [ :shape | shape vessel extent value: 50@50 ].
	shapes second vessel position value: 50@50.
	shapes third vessel position value: 100@100.
	shapes do: [ :s |
		drawing addShape: s ].
	canvas := AodCanvasElement new
		drawing: drawing;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
	
	drawing announceState.
	self assert: (canvas children collect: #aodModel) asIdentitySet equals: shapes asIdentitySet.
	
	canvas forceLayout.
	canvas childrenDo: [ :c |
		self assert: c position equals: c aodModel vessel position value.
		self assert: c extent equals: c aodModel vessel extent value ].
	
	^ canvas 
]

{ #category : #'as yet unclassified' }
AodCanvasElementExample >> editsExample [
	<gtExample>
	| drawing canvasElem shape1 shape2 |
	drawing := AodDrawing new.
	drawing constraintSolver: AodDummySolver new.

	canvasElem := AodCanvasElement new.
	canvasElem
		look: BrLayoutLook matchParent.
	
	canvasElem drawing: drawing.

	shape1 := AodRectangle new.
	drawing addShape: shape1.
	shape2 := AodRectangle new.
	drawing addShape: shape2.

	drawing applyCommand: ((AodStartEditCommand
		via: (AodBoxPositionHandle on: shape1 vessel))
			autoResolve: true;
			yourself).
	drawing applyCommand: (AodSuggestEditCommand value: 50@50).
	drawing applyCommand: (AodEndEditCommand new).

	drawing applyCommand: ((AodStartEditCommand
		via: (AodBoxPositionHandle on: shape2 vessel))
			autoResolve: true;
			yourself).
	drawing applyCommand: (AodSuggestEditCommand value: 100@100).
	drawing applyCommand: (AodEndEditCommand new).

	^ canvasElem
	
]
