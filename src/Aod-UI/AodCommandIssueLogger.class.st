Class {
	#name : #AodCommandIssueLogger,
	#superclass : #BlBasicEventHandler,
	#instVars : [
		'drawing'
	],
	#category : #'Aod-UI-Commands'
}

{ #category : #accessing }
AodCommandIssueLogger >> eventClass [ 
	^ AodCommandIssueEvent
]

{ #category : #'api - event managing' }
AodCommandIssueLogger >> handleEvent: anEvent [
	self inform: anEvent command printString
]

{ #category : #'api - event managing' }
AodCommandIssueLogger >> wantsEvent: anEvent [
	^ anEvent class == self eventClass or: [ anEvent class inheritsFrom: self eventClass ]
]
