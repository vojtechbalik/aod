Class {
	#name : #AodPropertyList,
	#superclass : #BrColumnedList,
	#instVars : [
		'drawing',
		'inspectBar',
		'shapeInspect'
	],
	#category : #'Aod-UI-Bloc'
}

{ #category : #initialization }
AodPropertyList >> defaultLayout [
	^ BlFrameLayout new
]

{ #category : #accessing }
AodPropertyList >> drawing: aDrawing [
	self assert: drawing isNil description: 'cannot change drawing'.
	drawing := aDrawing.
	
	drawing selection announcer weak
		when: AodSelectedAnnouncement send: #onSelect: to: self;
		when: AodDeselectedAnnouncement send: #onDeselect: to: self.
		
	inspectBar addChild: (BrButton new
		look: BrMaterialButtonLook;
		label: 'drawing';
		action: [ drawing inspect ]).
	
]

{ #category : #initialization }
AodPropertyList >> initialize [
	super initialize.
	
	inspectBar := BlElement new
		layout: BlFlowLayout horizontal;
		constraintsDo: [ :c |
			c frame vertical alignBottom.
			c frame horizontal alignRight.
			c vertical fitContent.
			c horizontal fitContent ];
		yourself.
	
	self addChild: inspectBar.
		
	shapeInspect := BrButton new
		look: BrMaterialButtonLook;
		label: 'shape';
		action: [ drawing selection shape inspect ].
	
	self column
		title: 'Property';
		stencil: [ :aProperty |
			BrListLabelStencil new text: aProperty label ].
		
	self column 
		title: 'Value';
		stencil: [ :aProperty |
			BrListLabelStencil new text: aProperty value asString ]
]

{ #category : #enumerating }
AodPropertyList >> onDeselect: anAnnouncement [
	self updateFromModel
]

{ #category : #enumerating }
AodPropertyList >> onSelect: anAnnouncement [
	self updateFromModel
]

{ #category : #'private - layout' }
AodPropertyList >> updateFromModel [
	drawing selection isSelecting
		ifTrue: [ 
			self display: drawing selection shape properties.
			(inspectBar hasChild: shapeInspect)
				ifFalse: [inspectBar addChild: shapeInspect ] ]
		ifFalse: [ 
			self display: #().
			(inspectBar hasChild: shapeInspect)
				ifTrue: [ inspectBar removeChild: shapeInspect ] ]
]
