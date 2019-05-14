"
needs to know about the drawing (to resolve shapes)
"
Class {
	#name : #AodProgramTextStyler,
	#superclass : #BlTextStyler,
	#category : #'Aod-UI-ProgramEditor'
}

{ #category : #private }
AodProgramTextStyler >> privateStyle: aText [
	| highlighter |
	highlighter := AodProgramHighlighter new.
	highlighter targetText: aText.
	[ (AodProgram parserClass parse: aText) acceptVisitor: highlighter ]
		on: Error
		do: [ 
			aText monospace.
			aText foreground: Color red ].
	^ aText
]
