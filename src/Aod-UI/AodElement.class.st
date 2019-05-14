"
View has notion of a model.

render is not a good term.

""ApplicationLayout"" is not a good name.

Have a model (-- tree, a visualization, a diagram) for the parts and subparts.
"
Class {
	#name : #AodElement,
	#superclass : #BlElement,
	#instVars : [
		'programEditor',
		'canvasContainer',
		'commandIssueListener',
		'drawing',
		'propertyList'
	],
	#category : #'Aod-UI-Bloc'
}

{ #category : #'instance creation' }
AodElement class >> on: aDrawing [
	^ self new 
		drawing: aDrawing;
		yourself
]

{ #category : #'instance creation' }
AodElement class >> openOn: aDrawing [
	| space elem |
	space := BlSpace new.
	elem := self new 
		drawing: aDrawing;
		yourself.
		
	elem constraintsDo: [ :c |
		c vertical matchParent.
		c horizontal matchParent ].
		
	space root addChild: elem.
	
	space show.
	
	^ elem
	
]

{ #category : #initialization }
AodElement >> defaultLayout [
	^ BlLinearLayout horizontal
]

{ #category : #accessing }
AodElement >> drawing [
	^ drawing
]

{ #category : #accessing }
AodElement >> drawing: anObject [
	self assert: drawing isNil description: 'cannot change drawing'.
	drawing := anObject.
	
	programEditor drawing: drawing.
	propertyList drawing: drawing.
	canvasContainer drawing: drawing.
	commandIssueListener drawing: drawing.
	
	drawing announceState
]

{ #category : #initialization }
AodElement >> initialize [
	| sidebarContainer inspectBar |
	super initialize.
	
	propertyList := AodPropertyList new.
	propertyList 
		background: Color red muchLighter;
		constraintsDo: [ :c |
			c linear weight: 1.
			c horizontal matchParent.
			c vertical matchParent ].
	programEditor := AodProgramEditor new.
	programEditor 
		background: Color blue muchLighter;
		constraintsDo: [ :c |
			c linear weight: 4.
			c horizontal matchParent.
			c vertical matchParent ].
	canvasContainer := AodCanvasContainer new.
	canvasContainer constraintsDo: [ :c |
			c linear weight: 7.
			c horizontal matchParent.
			c vertical matchParent ].
		
	"an auxiliary element to help position property list and program editor verticaly"
	sidebarContainer := BlElement new.
	sidebarContainer 
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
			c linear weight: 4.
			c horizontal matchParent.
			c vertical matchParent ].
		
	commandIssueListener := AodCommandIssueListener new.
	self addEventFilter: commandIssueListener.
	
	sidebarContainer
		addChild: propertyList;
		addChild: programEditor.
		
	self
		addChild: canvasContainer;
		addChild: sidebarContainer
]
