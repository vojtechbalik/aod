"
For handles, event positions need to be calculated differently, because the dragged element is not the one being moved. The dragged element (the handle) is moved along with the selected element (see AodSelection).
"
Class {
	#name : #AodHandlePullHandler,
	#superclass : #BlPullHandler,
	#instVars : [
		'handleElement'
	],
	#category : #'Aod-UI-Handles'
}

{ #category : #'event handling' }
AodHandlePullHandler >> dragEvent: anEvent [
	| dragPosition dragDelta aNewPosition |
	dragPosition := anEvent position.
	dragDelta := dragPosition - (dragStartPosition ifNil: [ dragStartPosition := dragPosition ]).
	
	dragDelta := self computePullDelta: dragDelta.
	
	aNewPosition := ((originalPosition ifNil: [ originalPosition := handleElement handle value ]) + dragDelta).

	anEvent consumed: true.

	anEvent currentTarget dispatchEvent: (BlPullEvent new
		initialPosition: originalPosition;
		oldPosition: dragPosition;
		newPosition: aNewPosition;
		delta: dragDelta)
]

{ #category : #'event handling' }
AodHandlePullHandler >> dragStartEvent: anEvent [
	anEvent consumed: true.

	"drag start position in global coords"
	dragStartPosition := anEvent position.

	"original Handle (tied to Shape) position"
	originalPosition := handleElement handle value.

	anEvent currentTarget dispatchEvent: BlPullStartEvent new
]

{ #category : #'api - hooks' }
AodHandlePullHandler >> onInstalledIn: anElement [
	self assert: (anElement isKindOf: AodHandleElement).
	
	handleElement := anElement
]

{ #category : #'api - hooks' }
AodHandlePullHandler >> onUninstalledIn: anElement [
	handleElement := nil
]
