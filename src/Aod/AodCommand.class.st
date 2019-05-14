Class {
	#name : #AodCommand,
	#superclass : #Object,
	#instVars : [
		'message'
	],
	#category : #'Aod-Command'
}

{ #category : #hook }
AodCommand >> applyOn: aDrawing [
	"return true for success, false for failure"
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
AodCommand >> mayFail [
	^ false
]

{ #category : #accessing }
AodCommand >> message [
	^ message
]

{ #category : #accessing }
AodCommand >> message: anObject [
	message := anObject
]
