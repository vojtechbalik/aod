Class {
	#name : #AodConstraintBuilderOnSolver,
	#superclass : #AodConstraintBuilder,
	#instVars : [
		'solver'
	],
	#category : #'Aod-Language-Support'
}

{ #category : #api }
AodConstraintBuilderOnSolver >> build [
	| result |
	result := super build.
	solver addConstraint: result.
	^ result
]

{ #category : #accessing }
AodConstraintBuilderOnSolver >> solver [
	^ solver
]

{ #category : #accessing }
AodConstraintBuilderOnSolver >> solver: anObject [
	solver := anObject
]
