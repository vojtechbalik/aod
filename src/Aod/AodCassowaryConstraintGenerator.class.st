Class {
	#name : #AodCassowaryConstraintGenerator,
	#superclass : #AodConstraintGenerator,
	#instVars : [
		'strengthLevels'
	],
	#category : #'Aod-Solver-Cassowary'
}

{ #category : #'as yet unclassified' }
AodCassowaryConstraintGenerator >> createSymbolicWeightLevel: anInteger [
	| weight |
	weight := ClSymbolicWeight new: strengthLevels.
	
	1 to: weight size do: [ :index |
		weight at: index put: 0.0 ].
	
	weight at: anInteger put: 1.0.
	
	^ weight
]

{ #category : #'as yet unclassified' }
AodCassowaryConstraintGenerator >> generateAnchorAdd [
	| arg1 arg2 |
	arg2 := self unwrapIfAnchor: self stackPop.
	arg1 := self unwrapIfAnchor: self stackPop.

	self stackPush: arg1 + arg2
]

{ #category : #'as yet unclassified' }
AodCassowaryConstraintGenerator >> generateAnchorDiv [
	| arg1 arg2 |
	arg2 := self unwrapIfAnchor: self stackPop.
	arg1 := self unwrapIfAnchor: self stackPop.

	self stackPush: arg1 / arg2
]

{ #category : #'as yet unclassified' }
AodCassowaryConstraintGenerator >> generateAnchorEq [
	| arg1 arg2 |
	arg2 := self unwrapIfAnchor: self stackPop.
	arg1 := self unwrapIfAnchor: self stackPop.

	self stackPush: (arg1 cnEqual: arg2)
]

{ #category : #'as yet unclassified' }
AodCassowaryConstraintGenerator >> generateAnchorLeq [
	| arg1 arg2 |
	arg2 := self unwrapIfAnchor: self stackPop.
	arg1 := self unwrapIfAnchor: self stackPop.

	self stackPush: (arg1 cnLEQ: arg2)
]

{ #category : #'as yet unclassified' }
AodCassowaryConstraintGenerator >> generateAnchorMul [
	| arg1 arg2 |
	arg2 := self unwrapIfAnchor: self stackPop.
	arg1 := self unwrapIfAnchor: self stackPop.

	self stackPush: arg1 * arg2
]

{ #category : #'as yet unclassified' }
AodCassowaryConstraintGenerator >> generateAnchorSub [
	| arg1 arg2 |
	arg2 := self unwrapIfAnchor: self stackPop.
	arg1 := self unwrapIfAnchor: self stackPop.

	self stackPush: arg1 - arg2
]

{ #category : #'as yet unclassified' }
AodCassowaryConstraintGenerator >> generateStay [
	self stackPop anchorsDo: [ :anchor |
		self stackPush: (ClStayConstraint new 
			variable: anchor impl;
			weight: 1.0;
			yourself) ]
]

{ #category : #'as yet unclassified' }
AodCassowaryConstraintGenerator >> generateStrength: aStrength [
	aStrength level = 0
		ifTrue: [ ^ ClStrength required ].
	aStrength level = 1
		ifTrue: [ ^ ClStrength strong ].
	aStrength level = 2
		ifTrue: [ ^ ClStrength medium ].
	aStrength level = 3
		ifTrue: [ ^ ClStrength weak ].
		
	self error: 'custom levels not yet supported'
		
]

{ #category : #accessing }
AodCassowaryConstraintGenerator >> strengthLevels: aNumber [
	self assert: aNumber = 3 description: 'only the default strengths are supported now'.
	strengthLevels := aNumber
]
