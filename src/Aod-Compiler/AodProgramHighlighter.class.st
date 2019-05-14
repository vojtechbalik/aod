Class {
	#name : #AodProgramHighlighter,
	#superclass : #AodAstNodeVisitor,
	#instVars : [
		'targetText'
	],
	#category : #'Aod-Compiler-Visitors'
}

{ #category : #accessing }
AodProgramHighlighter >> targetText: anObject [
	targetText := anObject
]

{ #category : #generated }
AodProgramHighlighter >> visitProgram: aNode [
	targetText 
		monospace.
	
	aNode constraintNodes do: [ :each | each acceptVisitor: self ]
]

{ #category : #generated }
AodProgramHighlighter >> visitShapeReference: aNode [
	(targetText from: aNode startPosition to: aNode stopPosition)
		foreground: Color orange
]
