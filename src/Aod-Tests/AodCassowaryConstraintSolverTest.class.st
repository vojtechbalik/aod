Class {
	#name : #AodCassowaryConstraintSolverTest,
	#superclass : #TestCase,
	#instVars : [
		'builder',
		'solver',
		'b1',
		'b2'
	],
	#category : #'Aod-Tests'
}

{ #category : #running }
AodCassowaryConstraintSolverTest >> setUp [
	super setUp.
	
	builder := AodConstraintBuilder default.
	solver := AodCassowaryConstraintSolver new.
	
	b1 := AodBoxVessel new.
	b2 := AodBoxVessel new.
]

{ #category : #tests }
AodCassowaryConstraintSolverTest >> testAddRemove [
	| constraints |
	constraints := { 
		builder
				data: b1;
			push: AodStayRelator;
			strengthLevel: 2;
			build.
		builder
				data: b2;
			push: AodStayRelator;
			strengthLevel: 3;
			build.
		builder
				data: b1;
				data: b2;
			push: AodLeftOfRelator;
			build }.
	
	solver 
		addVessel: b1;
		addVessel: b2.
	
	solver
		addConstraint: (constraints at: 1);
		addConstraint: (constraints at: 2);
		addConstraint: (constraints at: 3).
		
	self 
		assert: solver constraints asIdentitySet 
		equals: (constraints asIdentitySet 
			addAll: b1 constraints;
			addAll: b2 constraints;
			yourself).
			
	solver removeConstraints: constraints.
	
	self 
		assert: solver constraints asIdentitySet
		equals: (b1 constraints, b2 constraints) asIdentitySet.
		
	solver
		removeVessel: b1;
		removeVessel: b2.
		
	self assert: solver constraints isEmpty.
		
	
]
