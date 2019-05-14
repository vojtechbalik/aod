"
abstract class for objects meant to manage communication with rubric text editing objects
"
Class {
	#name : #AodRubricEditorManager,
	#superclass : #Object,
	#category : #'Aod-UI-ProgramEditor-Rubric'
}

{ #category : #'as yet unclassified' }
AodRubricEditorManager >> onTextAcceptedInView [
]

{ #category : #'as yet unclassified' }
AodRubricEditorManager >> onTextChangedInView [
]

{ #category : #'as yet unclassified' }
AodRubricEditorManager >> subscribeTo: aTextMorph [
	aTextMorph announcer when: RubTextAccepted send: #onTextAcceptedInView to: self.
	aTextMorph announcer when: RubTextChanged send: #onTextChangedInView to: self
]

{ #category : #'as yet unclassified' }
AodRubricEditorManager >> unsubscribeFrom: aTextMorph [
	aTextMorph announcer unsubscribe: self.
]
