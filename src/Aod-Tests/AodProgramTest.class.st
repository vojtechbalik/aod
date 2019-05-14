Class {
	#name : #AodProgramTest,
	#superclass : #TestCase,
	#instVars : [
		'builder'
	],
	#category : #'Aod-Tests'
}

{ #category : #running }
AodProgramTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	builder := AodConstraintBuilder default.
]

{ #category : #tests }
AodProgramTest >> testReferences [
	| program computed expected |
	program := AodProgram new.
	program constraints: { 
		builder
					shape: 1 asAodReference;
				push: AodBoxLeftTransformer;
					shape: 1 asAodReference;
				push: AodBoxWidthTransformer;
			push: AodAnchorAddOperator;
				shape: 'second' asAodReference;
			push: AodBoxLeftTransformer;
		push: AodAnchorLeqRelator;
		build.
		
		builder 
				shape: 3 asAodReference;
				shape: 'fourth' asAodReference;
			push: AodLeftOfRelator;
			build }.
			
	computed := program references asSet.
	
	expected := ({ 1 . 'second' . 3 . 'fourth'} collect: #asAodReference) asSet.
	
	self assert: computed equals: expected.
		
	



]
