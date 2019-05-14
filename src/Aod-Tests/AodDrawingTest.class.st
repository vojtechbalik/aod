Class {
	#name : #AodDrawingTest,
	#superclass : #TestCase,
	#category : #'Aod-Tests'
}

{ #category : #tests }
AodDrawingTest >> testAddRemoveShapes [
	| counter drawing |
	drawing := AodDrawing new.
	counter := 0.
	drawing announcer when: AodShapeAdded do: [ counter := counter + 1 ].
	drawing announcer when: AodShapeRemoved do: [ counter := counter - 1 ].
	
	5 timesRepeat: [ drawing addShape: AodRectangle new ].
	self assert: counter equals: 5.
	self assert: drawing shapeCount equals: 5.
	
	drawing shapesRemoveAll.
	self assert: counter equals: 0.
	self assert: drawing shapeCount equals: 0.
	
]
