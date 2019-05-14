Class {
	#name : #AodCommandIssueListener,
	#superclass : #BlBasicEventHandler,
	#instVars : [
		'drawing'
	],
	#category : #'Aod-UI-Commands'
}

{ #category : #accessing }
AodCommandIssueListener >> drawing [
	^ drawing
]

{ #category : #accessing }
AodCommandIssueListener >> drawing: anObject [
	drawing := anObject
]

{ #category : #accessing }
AodCommandIssueListener >> eventClass [ 
	^ AodCommandIssueEvent
]

{ #category : #'api - event managing' }
AodCommandIssueListener >> handleEvent: anEvent [
	anEvent consumed: true.
	drawing ifNotNil: [ :d | d applyCommand: anEvent command ]
]

{ #category : #'api - event managing' }
AodCommandIssueListener >> wantsEvent: anEvent [
	^ anEvent class == self eventClass or: [ anEvent class inheritsFrom: self eventClass ]
]
