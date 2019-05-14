"
backup program editor
"
Class {
	#name : #AodRubProgramEditor,
	#superclass : #Object,
	#instVars : [
		'textModel',
		'textMorph',
		'onTextAcceptBlock',
		'onTextChangedBlock',
		'emphasisManager'
	],
	#category : #'Aod-UI-ProgramEditor-Rubric'
}

{ #category : #'instance creation' }
AodRubProgramEditor class >> open [
	^ self new open
]

{ #category : #building }
AodRubProgramEditor >> buildTextMorph [
	textModel := RubScrolledTextModel new
		interactionModel: self;
		yourself.
	textMorph := textModel newScrolledText.
	textMorph
		beWrapped;
		font: StandardFonts codeFont.
		"set (and implement) editing mode"
		
	textMorph announcer
		when: RubTextAccepted send: #textAcceptedInView to: self;
		when: RubTextChanged send: #textChangedInView to: self.
]

{ #category : #emphasizing }
AodRubProgramEditor >> emphasizeIntervals: interval with: attr [
	emphasisManager emphasizeIntervals: interval with: attr
]

{ #category : #initialization }
AodRubProgramEditor >> initialize [
	super initialize.
	emphasisManager := AodEmphasesManager on: self.
]

{ #category : #testing }
AodRubProgramEditor >> isOpen [
	^ textMorph isNotNil
]

{ #category : #'instance creation' }
AodRubProgramEditor >> newScrolledText [
	| scrolledText |
	scrolledText := self textModel
		newScrolledText
		withGhostText: 'this is a test.';
		yourself.
	^ scrolledText
]

{ #category : #protocol }
AodRubProgramEditor >> okToClose [
	"prompt for saving"
	^ true
]

{ #category : #enumerating }
AodRubProgramEditor >> onTextAcceptedDo: aBlock [
	"the block will be called with a string representing the whole text in the editor"
	onTextAcceptBlock := aBlock
]

{ #category : #enumerating }
AodRubProgramEditor >> onTextChangedDo: aBlock [
	onTextChangedBlock := aBlock
]

{ #category : #opening }
AodRubProgramEditor >> open [
	| window |
	self buildTextMorph.
	window := (StandardWindow labelled: 'Aod constraints editor') model: self.
	self textMorph 
		hResizing: #spaceFill;
		vResizing: #spaceFill.
	window addMorph: self textMorph fullFrame: LayoutFrame identity.
	^ window openInWorld
]

{ #category : #accessing }
AodRubProgramEditor >> text [
	^ textModel getText
]

{ #category : #accessing }
AodRubProgramEditor >> text: aStringOrText [
	textModel setText: aStringOrText asText.
]

{ #category : #hooks }
AodRubProgramEditor >> textAcceptedInView [
	onTextAcceptBlock ifNotNil: [ onTextAcceptBlock cull: textModel getString ]
]

{ #category : #hooks }
AodRubProgramEditor >> textChangedInView [
	onTextChangedBlock ifNotNil: [ onTextChangedBlock cull: textModel getString ]
]

{ #category : #accessing }
AodRubProgramEditor >> textModel [
	^ textModel
]

{ #category : #accessing }
AodRubProgramEditor >> textMorph [
	^ textMorph
]

{ #category : #'model - updating' }
AodRubProgramEditor >> windowIsClosing [
	textModel := nil.
	textMorph := nil.
]
