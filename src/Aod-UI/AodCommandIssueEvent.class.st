Class {
	#name : #AodCommandIssueEvent,
	#superclass : #BlEvent,
	#instVars : [
		'command'
	],
	#category : #'Aod-UI-Commands'
}

{ #category : #accessing }
AodCommandIssueEvent >> command [
	^ command
]

{ #category : #accessing }
AodCommandIssueEvent >> command: anObject [
	command := anObject
]
