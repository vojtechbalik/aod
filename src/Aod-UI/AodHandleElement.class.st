Class {
	#name : #AodHandleElement,
	#superclass : #BlElement,
	#instVars : [
		'handle'
	],
	#category : #'Aod-UI-Handles'
}

{ #category : #accessing }
AodHandleElement >> handle [
	^ handle
]

{ #category : #accessing }
AodHandleElement >> handle: anObject [
	handle := anObject.
	self updateFromModel 
]

{ #category : #initialization }
AodHandleElement >> initialize [
	super initialize.
	
	self viewModel: (BrInteractiveModel new
			withHover;
			withPress)
	
]

{ #category : #'private - layout' }
AodHandleElement >> updateFromModel [
	self subclassResponsibility
	
]
