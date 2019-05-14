Class {
	#name : #AodPointHandle,
	#superclass : #AodHandle,
	#category : #'Aod-UI-Handles'
}

{ #category : #'*Aod - UI' }
AodPointHandle >> asElement [
	^ super asElement
		look: AodPointHandleLook;
		yourself
]

{ #category : #'*Aod - UI' }
AodPointHandle >> elementClass [
	^ AodPointHandleElement
]
