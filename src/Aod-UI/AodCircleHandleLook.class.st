Class {
	#name : #AodCircleHandleLook,
	#superclass : #BrLook,
	#category : #'Aod-UI-Handles'
}

{ #category : #initialization }
AodCircleHandleLook >> initialize [
	super initialize.
	
	self addChangeProperty: #(widget geometry) with: [ BlEllipse new ].
	self addChangeProperty: #(widget size) with: [ 15@15 ] 
]
