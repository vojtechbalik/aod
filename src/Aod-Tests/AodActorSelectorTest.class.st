Class {
	#name : #AodActorSelectorTest,
	#superclass : #TestCase,
	#instVars : [
		'selector'
	],
	#category : #'Aod-Tests'
}

{ #category : #running }
AodActorSelectorTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	selector := AodActorSelector new.
]

{ #category : #tests }
AodActorSelectorTest >> testSelectIn [
	| constraint selected expected |
	constraint := AodConstraint builder
				shape: 1 asAodReference;
				shape: 'name' asAodReference;
			push: AodLeftOfRelator;
			build.
	
	selected := selector select: AodShapeBinding in: constraint relator.
	selected := (selected collect: #data) asSet.
	
	expected := { 1 asAodReference . 'name' asAodReference } asSet.
	
	self assert: selected equals: expected.
]
