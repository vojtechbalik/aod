Class {
	#name : #AodPointHandleElement,
	#superclass : #AodHandleElement,
	#category : #'Aod-UI-Handles'
}

{ #category : #layout }
AodPointHandleElement >> onMeasure: anExtentSpec [
	super onMeasure: anExtentSpec.
	
	self updateFromModel
]

{ #category : #'private - layout' }
AodPointHandleElement >> updateFromModel [
	self relocate: handle layoutPosition - (self extent / 2)
]
