Class {
	#name : #AodDummySolver,
	#superclass : #AodConstraintSolver,
	#instVars : [
		'constraints',
		'models',
		'editedAnchors',
		'suggestions'
	],
	#category : #'Aod-Solver'
}

{ #category : #adding }
AodDummySolver >> addAnchorEdit: anAnchor [
	editedAnchors := editedAnchors copyWith: anAnchor
]

{ #category : #adding }
AodDummySolver >> addConstraint: aConstraint [
	constraints add: aConstraint
]

{ #category : #adding }
AodDummySolver >> addVessel: aModel [
	models add: aModel.
	aModel addTo: self
]

{ #category : #accessing }
AodDummySolver >> constraints [ 	
	^ constraints
]

{ #category : #editing }
AodDummySolver >> edit: aModel [
	self flag: 'change this wtf, probably the callbacks in the models to #editIn:'.
	editing := true.
	aModel editIn: self.
	suggestions := Array new: editedAnchors size
]

{ #category : #'as yet unclassified' }
AodDummySolver >> endEdit [
	editedAnchors := Array new: 0.
	suggestions := nil.
	editing := false
]

{ #category : #initialization }
AodDummySolver >> initialize [
	super initialize.
	
	constraints := IdentitySet new.
	models := IdentitySet new.
	editedAnchors := Array new: 0.
	editing := false
]

{ #category : #testing }
AodDummySolver >> isEditing [
	^ editing
]

{ #category : #adding }
AodDummySolver >> removeConstraint: aConstraint [
	constraints 
		remove: aConstraint
		ifAbsent: [ self error: 'constraint not in solver' ]
]

{ #category : #adding }
AodDummySolver >> removeVessel: aModel [
	models remove: aModel ifAbsent: [ self error: 'model not in solver' ].
	aModel removeFrom: self
]

{ #category : #actions }
AodDummySolver >> resolve [
	suggestions with: editedAnchors do: [ :constant :anchor |
		self assert: constant isNumber.
		anchor impl value: constant ].
	
	suggestions := Array new: editedAnchors size
]

{ #category : #'as yet unclassified' }
AodDummySolver >> suggest: constant for: anAnchor [
	| index |
	index := editedAnchors indexOf: anAnchor ifAbsent: [ self error: 'anchor not edited' ].
	
	suggestions at: index put: constant
]
