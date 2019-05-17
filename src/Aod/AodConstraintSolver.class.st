Class {
	#name : #AodConstraintSolver,
	#superclass : #Object,
	#instVars : [
		'builder',
		'editing'
	],
	#category : #'Aod-Solver'
}

{ #category : #adding }
AodConstraintSolver >> addConstraint [
	^ builder
]

{ #category : #adding }
AodConstraintSolver >> addConstraint: aConstraint [
	self subclassResponsibility 
]

{ #category : #adding }
AodConstraintSolver >> addConstraints: aCollection [
	aCollection do: [ :c | self addConstraint: c ]
]

{ #category : #initialization }
AodConstraintSolver >> initialize [
	super initialize.
	
	builder := AodConstraintBuilderOnSolver default
		solver: self;
		yourself
]

{ #category : #adding }
AodConstraintSolver >> removeConstraint: aConstraint [
	self subclassResponsibility
]

{ #category : #removing }
AodConstraintSolver >> removeConstraints: aCollection [
	aCollection do: [ :c | self removeConstraint: c ]
]
