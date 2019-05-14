Class {
	#name : #AodDrawingAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'drawing'
	],
	#category : #'Aod-Core'
}

{ #category : #accessing }
AodDrawingAnnouncement >> drawing [
	^ drawing
]

{ #category : #accessing }
AodDrawingAnnouncement >> drawing: anObject [
	drawing := anObject
]
