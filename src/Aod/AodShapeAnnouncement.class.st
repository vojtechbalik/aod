Class {
	#name : #AodShapeAnnouncement,
	#superclass : #AodDrawingAnnouncement,
	#instVars : [
		'shape'
	],
	#category : #'Aod-Shape'
}

{ #category : #accessing }
AodShapeAnnouncement class >> shape: aShape [
	^ self new
		shape: aShape;
		yourself
]

{ #category : #accessing }
AodShapeAnnouncement >> shape [
	^ shape
]

{ #category : #accessing }
AodShapeAnnouncement >> shape: anObject [
	shape := anObject
]
