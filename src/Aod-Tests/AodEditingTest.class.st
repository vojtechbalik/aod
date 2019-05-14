Class {
	#name : #AodEditingTest,
	#superclass : #TestCase,
	#instVars : [
		'drawing'
	],
	#category : #'Aod-Tests'
}

{ #category : #running }
AodEditingTest >> setUp [
	super setUp.
	
	drawing := AodDrawing new
		constraintSolver: AodDummySolver new;
		yourself
]

{ #category : #tests }
AodEditingTest >> testSimple [
	| shape startCommand handle |
	shape := AodRectangle new.
	handle := AodBoxPositionHandle on: shape vessel.
	startCommand := AodStartEditCommand via: handle.
	
	drawing addShape: shape.
	
	drawing applyCommand: startCommand.
	
	"initialy, if not specified otherwise, a shape's position is 0@0"
	self assert: shape vessel position value equals: 0@0.
	
	drawing applyCommand: (AodSuggestEditCommand value: 50@50).
	self assert: shape vessel position value equals: 50@50.
	
	drawing applyCommand: (AodSuggestEditCommand value: 25@25).
	self assert: shape vessel position value equals: 25@25.
	
	drawing applyCommand: AodEndEditCommand new.
	
	self assert: shape vessel position value equals: 25@25.
	

]
