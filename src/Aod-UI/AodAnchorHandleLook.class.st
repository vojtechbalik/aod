Class {
	#name : #AodAnchorHandleLook,
	#superclass : #AodHandleLook,
	#category : #'Aod-UI-Handles'
}

{ #category : #initialization }
AodAnchorHandleLook >> initializeLook [
	super initializeLook.
	
	self widgetDo: [ :w |
		w constraintsDo: [ :c |
			c vertical matchParent.
			c horizontal matchParent ] ]
]
