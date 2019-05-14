Class {
	#name : #AodProgramEditorExample,
	#superclass : #Object,
	#category : #'Aod-UI-Examples'
}

{ #category : #example }
AodProgramEditorExample >> example [ 
	<gtExample>
	| drawing canvasContainer programEditor container |
	drawing := AodDrawing new.
	drawing addShape: (AodRectangle new
		propertyAt: #name put: 'first';
		yourself).
	
	drawing addShape: (AodEllipse new
		propertyAt: #name put: 'second';
		yourself).
		
	drawing addShape: (AodEllipse new
		propertyAt: #name put: 'third';
		yourself).
		
	canvasContainer := AodCanvasContainer new.
	canvasContainer 
		drawing: drawing;
		constraintsDo: [ :c |
			c linear weight: 2.
			c horizontal matchParent.
			c vertical matchParent ].
	
	programEditor := AodProgramEditor new.
	programEditor 
		background: Color blue muchLighter.
	programEditor constraintsDo: [ :c |
		c linear weight: 1.
		c horizontal matchParent.
		c vertical matchParent ].
	
	container := BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ].
	
	container
		addChild: canvasContainer;
		addChild: programEditor.
		
	container addEventHandler: (AodCommandIssueListener new
		drawing: drawing;
		yourself).
	
	drawing announceState.
	
	^ container
]
