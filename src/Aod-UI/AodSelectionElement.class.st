Class {
	#name : #AodSelectionElement,
	#superclass : #BlElement,
	#instVars : [
		'selection',
		'handles'
	],
	#category : #'Aod-UI-Selection'
}

{ #category : #initialization }
AodSelectionElement >> defaultBackground [ 
	^ BlTransparentBackground new
]

{ #category : #initialization }
AodSelectionElement >> defaultBorder [
	^ BlBorder builder
		dashed;
		width: 1;
		paint: Color black;
		build
]

{ #category : #initialization }
AodSelectionElement >> defaultOutskirts [
	^ BlOutskirts outside
]

{ #category : #initialization }
AodSelectionElement >> defaultVisibility [
	^ BlVisibility gone
]

{ #category : #initialization }
AodSelectionElement >> initialize [
	super initialize.
	
	self clipChildren: false
]

{ #category : #testing }
AodSelectionElement >> isSelecting [
	^ selection isNotNil and: [ selection isSelecting ]
]

{ #category : #enumerating }
AodSelectionElement >> onDeselect: anAnnouncement [
	handles ifNotNil: [ self removeChildren: handles ].
	handles := nil.
	self visibility: BlVisibility gone
]

{ #category : #enumerating }
AodSelectionElement >> onSelect: anAnnouncement [
	handles := selection handles collect: #asElement.
	self addChildren: handles.
	self visibility: BlVisibility visible.
	
	self updateFromModel.
	self requestLayout
]

{ #category : #accessing }
AodSelectionElement >> selection [
	^ selection
]

{ #category : #accessing }
AodSelectionElement >> selection: anObject [
	selection := anObject.
	selection announcer weak
		when: AodSelectedAnnouncement send: #onSelect: to: self;
		when: AodDeselectedAnnouncement send: #onDeselect: to: self.
	
	
]

{ #category : #'private - layout' }
AodSelectionElement >> updateFromModel [
	| model |
	selection ifNil: [ ^ self ].
	selection isSelecting ifFalse: [ ^ self ].
	model := selection shape vessel.
	self relocate: model layoutPosition.
	self size: model layoutExtent.
	handles do: [ :h | h updateFromModel ]
]
