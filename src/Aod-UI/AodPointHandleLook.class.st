Class {
	#name : #AodPointHandleLook,
	#superclass : #AodHandleLook,
	#category : #'Aod-UI-Handles'
}

{ #category : #initialization }
AodPointHandleLook >> initializeLook [
	super initializeLook.
	
	self widgetDo: [ :w | 
		w geometry: BlEllipse new.
		w size: 15@15.
		"this is a hack, so that the first layout of a point handle is centered"
		w position: 0@0 extent: 15@15 ]
]
