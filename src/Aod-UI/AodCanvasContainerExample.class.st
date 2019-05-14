Class {
	#name : #AodCanvasContainerExample,
	#superclass : #Object,
	#instVars : [
		'container'
	],
	#category : #'Aod-UI-Examples'
}

{ #category : #'as yet unclassified' }
AodCanvasContainerExample >> advancedExample [
	<gtExample>
	| container drawing shape1 shape2 shape3 builder |
	builder := AodConstraintBuilder default.
	drawing := AodDrawing new.
	container := AodCanvasContainer new.
	container drawing: drawing.
	shape1 := AodRectangle new.
	shape2 := AodEllipse new.
	shape3 := AodLine new.
	drawing addShape: shape1.
	drawing addShape: shape2.
	drawing addShape: shape3.
	drawing constraintSolver addConstraint: (builder
		data: shape1 vessel;
		data: shape2 vessel;
		push: AodLeftOfRelator;
		build).
	drawing constraintSolver addConstraint: (builder
			data: 0 @ 0;
			data: shape1 vessel;
		push: AodBoxPositionTransformer;
		push: AodPointLeqRelator;
		build).
	drawing constraintSolver addConstraint: (builder
						data: shape1 vessel;
					push: AodBoxCenterTransformer;
				push: AodPointXTransformer;
					data: shape1 vessel;
				push: AodBoxBottomTransformer;
			push: AodPointConstructor;
				data: shape3 vessel;
			push: AodLineStartTransformer;
		push: AodPointEqRelator;
		build).
	
	drawing constraintSolver addConstraint: (builder
				data: shape2 vessel;
			push: AodBoxCenterTransformer;
				data: shape3 vessel;
			push: AodLineEndTransformer;
		push: AodPointEqRelator;
		build).
		
	container
		constraintsDo: [ :c | 
			c vertical matchParent.
			c horizontal matchParent ].

	container addEventHandler: (AodCommandIssueListener new
		drawing: drawing;
		yourself).
	

	^ container
]

{ #category : #'as yet unclassified' }
AodCanvasContainerExample >> advancedWithProgramExample [
	<gtExample>
	| container drawing shape1 shape2 shape3 builder program |
	drawing := AodDrawing new.
	container := AodCanvasContainer new.
	container drawing: drawing.
	shape1 := AodRectangle new.
	shape2 := AodEllipse new.
	shape3 := AodLine new.
	drawing addShape: shape1.
	drawing addShape: shape2.
	drawing addShape: shape3.
	
	builder := AodConstraintBuilder default.
	program := AodProgram new.
	program constraints: { 
		builder
				shape: shape1;
				shape: shape2;
			push: AodLeftOfRelator;
			build.
		builder
				data: 0 @ 0;
				shape: shape1;
			push: AodBoxPositionTransformer;
			push: AodPointLeqRelator;
			build.
		builder
							shape: shape1;
						push: AodBoxHorizontalTransformer;
					push: AodSpanMiddleTransformer;
						shape: shape1;
					push: AodBoxBottomTransformer;
				push: AodPointConstructor;
					shape: shape3;
				push: AodLineStartTransformer;
			push: AodPointEqRelator;
			build.
	
		builder
					shape: shape2;
				push: AodBoxCenterTransformer;
					shape: shape3;
				push: AodLineEndTransformer;
			push: AodPointEqRelator;
			build }.
			
	program resolveReferencesWith: drawing.
	drawing program: program.

	container
		constraintsDo: [ :c | 
			c vertical matchParent.
			c horizontal matchParent ].
		
	container addEventHandler: (AodCommandIssueListener new
		drawing: drawing;
		yourself).
	

	^ container
]

{ #category : #'as yet unclassified' }
AodCanvasContainerExample >> basicExample [
	<gtExample>
	| drawing canvasContainer shape |
	drawing := AodDrawing new.
	drawing constraintSolver: AodDummySolver new.
	shape := AodRectangle new.
	shape vessel position value: 25@25.
	drawing addShape: shape.

	canvasContainer := AodCanvasContainer new
		drawing: drawing.
	
	canvasContainer constraintsDo: [ :c | 
		c vertical matchParent.
		c horizontal matchParent ].
	
	drawing announceState.
		
	drawing selection select: shape.

	^ canvasContainer 
]
