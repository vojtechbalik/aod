"
a composite

subscribe to AodProgramChanged

textModel will be AodProgramManager (but doesn't have to be, only has to have #text and #text: methods).
it handles acceptedText. I act as a text model for the rubric scrolledTextMorph, but the text itself is stored in my textModel inst var.
"
Class {
	#name : #AodMainEditorManager,
	#superclass : #AodRubricEditorManager,
	#instVars : [
		'editorWindow',
		'textMorph',
		'textModel',
		'editorManagers',
		'announcer'
	],
	#category : #'Aod-UI-ProgramEditor-Rubric'
}

{ #category : #accessing }
AodMainEditorManager >> acceptedText [
	"get acceptedText. in my case, programManager holds it"
	^ textModel 
		ifNotNil: [ :tm | tm text ]
		ifNil: [ 'dummy text - textModel not set in MainEditorManager' asText ]
]

{ #category : #accessing }
AodMainEditorManager >> acceptedText: aText [
	"the manager returns false and doesn't set new program string when the program is invalid.
	 returning false from text model's 'setText' method causes it to not accept the string"
	^ textModel
		ifNotNil: [ :tm | textModel text: aText asString ]
		ifNil: [ true ]
]

{ #category : #'as yet unclassified' }
AodMainEditorManager >> acceptedTextChangedInModel [
	"calling this method triggers the view to synchronize itself with the accepted text in textModel"
	announcer announce: RubTextUpdatedInModel
]

{ #category : #adding }
AodMainEditorManager >> addEditorManager: anEditorManager [
	"check for duplicates"
	editorManagers add: anEditorManager.
	
	self isViewOpen 
		ifTrue: [ anEditorManager subscribeTo: textMorph ]
]

{ #category : #accessing }
AodMainEditorManager >> announcer [
	"needed to fit with RubScrolledTextMorph"
	^ announcer
]

{ #category : #initialization }
AodMainEditorManager >> initialize [
	announcer := Announcer new.
	editorManagers := OrderedCollection new.
	
	
]

{ #category : #testing }
AodMainEditorManager >> isViewOpen [
	^ textMorph isNotNil
]

{ #category : #'as yet unclassified' }
AodMainEditorManager >> manager: managerClass do: aBlock [
]

{ #category : #'as yet unclassified' }
AodMainEditorManager >> managersSubscribeTo: aTextMorph [
	editorManagers do: [ :em |
		em subscribeTo: aTextMorph ]
]

{ #category : #'as yet unclassified' }
AodMainEditorManager >> managersUnsubscribeFrom: aTextMorph [
	editorManagers do: [ :em |
		em unsubscribeFrom: aTextMorph ]
]

{ #category : #initialization }
AodMainEditorManager >> newScrolledTextMorph [
	| aTextMorph |
	
	aTextMorph := RubScrolledTextMorph new.
	aTextMorph
		setTextSelector: #acceptedText:;
		getTextSelector: #acceptedText;
		model: self;
		beWrapped;
		font: StandardFonts codeFont;
		autoAccept: false.
	"set (and implement) editing mode"

	^ aTextMorph
]

{ #category : #API }
AodMainEditorManager >> openEditorWindow [

	editorWindow ifNotNil: [ :ew |
		ew flash.
		^ self ].

	textMorph := self newScrolledTextMorph.
	self managersSubscribeTo: textMorph.
		
	editorWindow := (StandardWindow labelled: 'Aod constraints editor') model: self.
	textMorph 
		hResizing: #spaceFill;
		vResizing: #spaceFill.
	editorWindow addMorph: textMorph fullFrame: LayoutFrame identity.
	^ editorWindow openInWorld
	
]

{ #category : #accessing }
AodMainEditorManager >> textModel: aTextModel [
	textModel := aTextModel.
	self acceptedTextChangedInModel.
]

{ #category : #'model - updating' }
AodMainEditorManager >> windowIsClosing [
	self managersUnsubscribeFrom: textMorph.
	textMorph := nil.
	editorWindow := nil
]
