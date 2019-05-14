Class {
	#name : #AodNotifyingAbsolutePositionAnchor,
	#superclass : #BlAbsolutePositionAnchor,
	#instVars : [
		'moveDispatched'
	],
	#category : #'Aod-UI-Canvas'
}

{ #category : #accessing }
AodNotifyingAbsolutePositionAnchor >> dispatchMoveEvent [
	"I dispatch anchor moved event"

	moveDispatched
		ifTrue: [ ^ self ].
	moveDispatched := true.
	
	[ self dispatchEvent: (BlGeometryAnchorMoved new anchor: self) ]
		ensure: [ moveDispatched := false ]
]

{ #category : #accessing }
AodNotifyingAbsolutePositionAnchor >> initialize [
	super initialize.
	
	moveDispatched := false
]

{ #category : #accessing }
AodNotifyingAbsolutePositionAnchor >> position: aPoint [
	position := aPoint.
	self dispatchMoveEvent
]
