Class {
	#name : #AodProgramChanged,
	#superclass : #AodDrawingAnnouncement,
	#instVars : [
		'program'
	],
	#category : #'Aod-Program'
}

{ #category : #'as yet unclassified' }
AodProgramChanged class >> program: aProgram [
	^ self new
		program: aProgram;
		yourself
]

{ #category : #accessing }
AodProgramChanged >> program [
	^ program
]

{ #category : #accessing }
AodProgramChanged >> program: anObject [
	program := anObject
]
