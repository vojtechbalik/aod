Class {
	#name : #AodSetProgramCommand,
	#superclass : #AodCommand,
	#instVars : [
		'program'
	],
	#category : #'Aod-Command'
}

{ #category : #hook }
AodSetProgramCommand >> applyOn: aDrawing [
	(program resolveReferencesWith: aDrawing)
		ifFalse: [ 
			self message: 'invalid reference encountered'.
			^ false ].
		
	^ [	aDrawing program: program.
		true ]
			on: Error
			do: [ :ex | 
				self message: 'invalid program'.
				ex return: false ]

]

{ #category : #'as yet unclassified' }
AodSetProgramCommand >> mayFail [
	^ true
]

{ #category : #accessing }
AodSetProgramCommand >> program [
	^ program
]

{ #category : #accessing }
AodSetProgramCommand >> program: anObject [
	program := anObject
]
