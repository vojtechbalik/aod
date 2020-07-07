Class {
	#name : #AodPointHandleElement,
	#superclass : #AodHandleElement,
	#category : #'Aod-UI-Handles'
}

{ #category : #initialization }
AodPointHandleElement >> initialize [
	super initialize.
	
	self addEventHandler: AodHandlePullHandler new.
	self 
		when: BlPullStartEvent 
		do: [ self fireEvent: (AodStartEditCommand via: handle) asIssueEvent ].
	self 
		when: BlPullEvent
		do: [ :e |
			self fireEvent: (AodSuggestEditCommand value: e newPosition) asIssueEvent.
			self requestLayout ].
	self
		when: BlPullEndEvent 
		do: [ :e |
			self fireEvent: (AodEndEditCommand new) asIssueEvent ]
]

{ #category : #layout }
AodPointHandleElement >> onMeasure: anExtentSpec [
	super onMeasure: anExtentSpec.
	
	self updateFromModel
]

{ #category : #'private - layout' }
AodPointHandleElement >> updateFromModel [
	self relocate: handle layoutPosition - (self extent / 2)
]
