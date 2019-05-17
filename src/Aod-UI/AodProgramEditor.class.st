Class {
	#name : #AodProgramEditor,
	#superclass : #BlElement,
	#instVars : [
		'drawing',
		'editor',
		'editorElement',
		'actions'
	],
	#category : #'Aod-UI-ProgramEditor'
}

{ #category : #adding }
AodProgramEditor >> addAction: aBlock named: aString [
	actions addChild: (BrButton new
		look: BrMaterialButtonLook;
		label: aString;
		action: [ aBlock cull: editor ])
	
]

{ #category : #initialization }
AodProgramEditor >> defaultLayout [ 
	^ BlFrameLayout new
]

{ #category : #accessing }
AodProgramEditor >> drawing [
	^ drawing
]

{ #category : #accessing }
AodProgramEditor >> drawing: anObject [
	drawing := anObject.
	
	drawing announcer weak
		when: AodProgramChanged
		send: #onProgramChanged
		to: self
]

{ #category : #accessing }
AodProgramEditor >> editor [
	^ editor
]

{ #category : #initialization }
AodProgramEditor >> initialize [
	super initialize.
	
	editor := BrTextEditor new.
	editor styler: AodProgramTextStyler new.
	editorElement := BrEditorElement new.
	editorElement 
		constraintsDo: [ :c |
			c vertical matchParent.
			c horizontal matchParent ];
		editor: editor.
	self addChild: editorElement.
	actions := BlElement new
		layout: BlFlowLayout horizontal;
		constraintsDo: [ :c |
			c frame vertical alignBottom.
			c frame horizontal alignRight.
			c vertical fitContent.
			c horizontal fitContent ];
		yourself.
	self addChild: actions.
	
	self addAction: [ self requestAccept ] named: 'accept'
	
]

{ #category : #'as yet unclassified' }
AodProgramEditor >> onProgramChanged [
	editor text: drawing program text asRopedText
]

{ #category : #removing }
AodProgramEditor >> removeActions [
	actions removeChildren
]

{ #category : #'as yet unclassified' }
AodProgramEditor >> requestAccept [
	| cmd |
	cmd := AodSetProgramCommand new.
	[ cmd program: (AodProgram fromText: editor text) ]
		on: SmaCCParserError, AodDSLError
		do: [ :ex |
			self inform: ex asString.
			^ self].
		
	self fireEvent: cmd asIssueEvent
]
