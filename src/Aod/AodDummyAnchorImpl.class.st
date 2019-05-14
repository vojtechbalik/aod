"
i wrap a number to act as an anchorImpl
"
Class {
	#name : #AodDummyAnchorImpl,
	#superclass : #Object,
	#instVars : [
		'number'
	],
	#category : #'Aod-Solver'
}

{ #category : #initialization }
AodDummyAnchorImpl >> initialize [
	super initialize.
	number := 0
]

{ #category : #accessing }
AodDummyAnchorImpl >> value [
	^ number
]

{ #category : #accessing }
AodDummyAnchorImpl >> value: aNumber [
	number := aNumber
]
