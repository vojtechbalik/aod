Class {
	#name : #AodCassowaryConstraintSolver,
	#superclass : #AodConstraintSolver,
	#instVars : [
		'cassowary',
		'generator',
		'models',
		'constraints'
	],
	#category : #'Aod-Solver-Cassowary'
}

{ #category : #adding }
AodCassowaryConstraintSolver >> addAnchorEdit: anAnchor [
	cassowary addEditVar: anAnchor impl strength: ClStrength strong
]

{ #category : #adding }
AodCassowaryConstraintSolver >> addConstraint: aConstraint [
	"use a generator, add the constraint and store the translated cassowary object so it can be deleted"
	| generated |
	generated := generator generate: aConstraint.
	generated do: [ :cassConstraint |
		 cassowary addConstraint: cassConstraint ].
	constraints at: aConstraint put: generated
	
]

{ #category : #adding }
AodCassowaryConstraintSolver >> addVessel: aVessel [
	"book-keeping"
	aVessel anchorsDo: [ :anchor |
		anchor impl: (self newAnchorImpl value: anchor impl value) ].
	
	aVessel addTo: self
]

{ #category : #accessing }
AodCassowaryConstraintSolver >> constraints [
	^ constraints keys
]

{ #category : #editing }
AodCassowaryConstraintSolver >> edit: aModel [
	editing := true.
	aModel editIn: self.
	cassowary beginEdit
]

{ #category : #manipulating }
AodCassowaryConstraintSolver >> endEdit [
	cassowary endEdit.
	editing := false.
	
	cassowary reset
]

{ #category : #initialization }
AodCassowaryConstraintSolver >> initialize [
	super initialize.
	cassowary := ClSimplexSolver new.
	cassowary autoSolve: true.
	editing := false.
	generator := AodCassowaryConstraintGenerator new.
	constraints := IdentityDictionary new
]

{ #category : #testing }
AodCassowaryConstraintSolver >> isEditing [
	^ editing
]

{ #category : #'instance creation' }
AodCassowaryConstraintSolver >> newAnchorImpl [
	^ AodCassowaryAnchorImpl new
]

{ #category : #adding }
AodCassowaryConstraintSolver >> removeConstraint: aConstraint [
	| generated |
	generated := constraints
		at: aConstraint
		ifAbsent: [ AodError signal ].
		
	generated do: [ :cassConstraint |
		cassowary removeConstraint: cassConstraint ].
	
	constraints removeKey: aConstraint
]

{ #category : #removing }
AodCassowaryConstraintSolver >> removeVessel: aVessel [
	aVessel removeFrom: self.
	aVessel anchorsDo: [ :anchor |
		anchor impl: anchor impl value ].
	"how to know what constraints are associated with it?"
	"book-keeping"
]

{ #category : #actions }
AodCassowaryConstraintSolver >> resolve [
	"handle both solves and resolves?"
	cassowary resolve
]

{ #category : #private }
AodCassowaryConstraintSolver >> suggest: aNumber for: anAnchor [

	cassowary suggestValue: anAnchor impl newValue: aNumber.
]
