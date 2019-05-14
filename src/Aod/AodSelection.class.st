Class {
	#name : #AodSelection,
	#superclass : #Object,
	#instVars : [
		'shape',
		'handles',
		'announcer'
	],
	#category : #'Aod-Selection'
}

{ #category : #'as yet unclassified' }
AodSelection >> announceState [
	announcer announce: (self isSelecting
		ifTrue: [ AodSelectedAnnouncement new ]
		ifFalse: [ AodDeselectedAnnouncement new ])
]

{ #category : #accessing }
AodSelection >> announcer [
	^ announcer
]

{ #category : #enumerating }
AodSelection >> deselect [
	shape := nil.
	handles := nil.
	announcer announce: AodDeselectedAnnouncement new
]

{ #category : #accessing }
AodSelection >> handles [
	^ handles
]

{ #category : #initialization }
AodSelection >> initialize [
	super initialize.
	
	announcer := Announcer new
]

{ #category : #testing }
AodSelection >> isSelecting [
	^ shape isNotNil 
]

{ #category : #enumerating }
AodSelection >> select: aShape [
	shape := aShape.
	handles := shape vessel buildHandles.
	announcer announce: AodSelectedAnnouncement new
]

{ #category : #accessing }
AodSelection >> shape [
	^ shape
]

{ #category : #accessing }
AodSelection >> shape: anObject [
	shape := anObject.
	handles := shape model buildHandles
]
