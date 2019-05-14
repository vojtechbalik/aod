"
keeps track of emphases of a text. an emphasis in my case means an attribute appliead over array of intervals. i manage such emphases by keeping them under a #label. Emphasizing with a given label erases an emphasis under the same label (if there is one).

if I can make TextColors with priorities, then this could very well handle them too and could be used for syntax highlighting. (maybe order in which they're applied could be used and i wouldn't have to bother with custom attributes)

TO REWORK

at the moment, only one emphasis supported
"
Class {
	#name : #AodEmphasesManager,
	#superclass : #AodRubricEditorManager,
	#instVars : [
		'shape',
		'textMorph',
		'compiler',
		'ignoreAnnouncements'
	],
	#category : #'Aod-UI-ProgramEditor-Rubric'
}

{ #category : #'instance creation' }
AodEmphasesManager class >> on: aDrawing [
	^ self new
		drawing: aDrawing;
		yourself
]

{ #category : #'as yet unclassified' }
AodEmphasesManager >> clearEmphasesIn: aText [
	aText removeAttribute: self textAttribute
	
		
	
		
	
]

{ #category : #accessing }
AodEmphasesManager >> compiler: aCompiler [
	compiler := aCompiler
]

{ #category : #emphasizing }
AodEmphasesManager >> emphasizeIntervals: intervals with: aTextAttribute [
	| paragraph text |
	"if the editor is not open, there's nothing to emphasize"
	"in the same vein, if a shape is selected and after that editor is opened. the emphasis is not there"
	"there should be a distinct notion of a selected shape somewhere"
	textMorph ifNil: [ ^ self ].
	
	paragraph := textMorph paragraph.
	text := paragraph text.
	"clear existing attributes? but not something like font style. I (the styler) should know about what i'm adding in there, so i should delete them and leave the rest alone (should be cheap with run array)"
	
	paragraph disableDrawingWhile: [ 
		self clearEmphasesIn: text.
		"wrap this with paragraph disableDrawingWhile?"
		intervals
			pairsDo:
				[ :start :stop | text addAttribute: aTextAttribute from: start to: stop ]. 
		paragraph recomposeFrom: 1 to: text size delta: 0.
		textMorph textArea paragraphWasComposedFrom: 1 to: text size.
		textMorph textArea paragraphReplacedTextFrom: 1 to: text size with: text ].
]

{ #category : #'as yet unclassified' }
AodEmphasesManager >> ignoreAnnouncementsWhile: aBlock [
	ignoreAnnouncements := true.
	aBlock value.
	ignoreAnnouncements := false.
]

{ #category : #initialization }
AodEmphasesManager >> initialize [
	super initialize.
	ignoreAnnouncements := false
	
]

{ #category : #'as yet unclassified' }
AodEmphasesManager >> intervalsIn: ast forShape: aShape [
	| nodesToEmphasize intervals |
	
	"find nodes in ast referencing to it"
	nodesToEmphasize := AodNodeSelector new
		select: [ :node |
			(node isKindOf: AodShapeReferenceNode) and: [ node shape == aShape ] ]
		in: ast.
	
	intervals := OrderedCollection new.
		
	nodesToEmphasize do: [ :node |
		"I assume things will not be nil and that tokens are annotated"
		intervals add: node startPosition.
		intervals add: node stopPosition. ].
	
	^ intervals 
]

{ #category : #testing }
AodEmphasesManager >> isViewOpen [
	^ textMorph isNotNil
]

{ #category : #'label-events' }
AodEmphasesManager >> onTextChanged: anAnnouncement [
	"applying emphasis, I suspect, triggers onTextChanged: too, hence infinite loop"

	ignoreAnnouncements ifFalse: [ self reapplyEmphasis ]
]

{ #category : #'label-events' }
AodEmphasesManager >> reapplyEmphasis [
	"get currentAst from the manager"
	"the intervals have to be reworked for every ast, so emphasis is given by NodeSelector. the selector is applied to currentAst to workout the intervals"
	"apply the intervals"
	| ast intervals |
	self isViewOpen
		ifFalse: [ ^ self ].
	
	self ignoreAnnouncementsWhile: [ 
		ast := compiler resolvedReferencesFrom: textMorph text asString onError: [ ^ self ].
		intervals := shape 
			ifNil: [ #() ]
			ifNotNil: [ self intervalsIn: ast forShape: shape ].
		self emphasizeIntervals: intervals with: self textAttribute ]
]

{ #category : #accessing }
AodEmphasesManager >> shape: aShape [
	"set shape to be emphasized. setting shape to nil clears the emphasis"
	shape := aShape.
	
	self reapplyEmphasis
]

{ #category : #'as yet unclassified' }
AodEmphasesManager >> subscribeTo: aTextArea [
	"or scrolledText (it resends this announcement)"
	aTextArea announcer when: RubTextChanged send: #onTextChanged: to: self.
	textMorph := aTextArea.
	self reapplyEmphasis
]

{ #category : #accessing }
AodEmphasesManager >> textAttribute [
	"return the attribute to be used for emphasizing"
	^ TextColor red
]

{ #category : #'as yet unclassified' }
AodEmphasesManager >> unsubscribeFrom: aTextArea [
	aTextArea announcer unsubscribe: self.
	textMorph := nil
]
