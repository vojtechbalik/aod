Class {
	#name : #AodHandleLook,
	#superclass : #BrInteractiveCommonLook,
	#category : #'Aod-UI-Handles'
}

{ #category : #initialization }
AodHandleLook >> initialize [
	super initialize.
	
	self default: [ :aWidget |
		aWidget 
			opacity: 0.1;
			background: Color blue ].
	self hovered: [ :aWidget |
		aWidget 
			opacity: 0.3;
			background: Color blue ].
	self pressed: [ :aWidget |
		aWidget 
			opacity: 0.5;
			background: Color red ]
]
