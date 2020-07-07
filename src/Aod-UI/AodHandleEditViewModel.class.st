Class {
	#name : #AodHandleEditViewModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'dragStartPosition',
		'originalPosition'
	],
	#category : #'Aod-UI-Handles'
}

{ #category : #'dnd handlers' }
AodHandleEditViewModel >> dragEndEvent: anEvent [
	anEvent consumed: true.
	
	self fireEvent: (AodEndEditCommand new) asIssueEvent
]

{ #category : #'dnd handlers' }
AodHandleEditViewModel >> dragEvent: anEvent [
	| dragPosition dragDelta client |
	client := self widget.
	
	dragPosition := anEvent position.
	dragDelta := dragPosition - dragStartPosition.
	
	self fireEvent: (AodSuggestEditCommand value: originalPosition + dragDelta) asIssueEvent.
	
	client requestLayout.
	
	anEvent consumed: true.
]

{ #category : #'dnd handlers' }
AodHandleEditViewModel >> dragStartEvent: anEvent [
	| client handle |
	anEvent consumed: true.
	
	client := self widget.
	
	"it needs to be related to a canvas element, which maps 1:1 to in-model coordinates"
	dragStartPosition := anEvent position.
	
	handle := client handle.
	originalPosition := handle value.
	
	self fireEvent: (AodStartEditCommand via: handle) asIssueEvent
]

{ #category : #initialization }
AodHandleEditViewModel >> initializeListeners [
	super initializeListeners.
	
	self when: BlDragStartEvent do: [ :e | self dragStartEvent: e ].
	self when: BlDragEvent do: [ :e | self dragEvent: e ].
	self when: BlDragEndEvent do: [ :e | self dragEndEvent: e ]
]
