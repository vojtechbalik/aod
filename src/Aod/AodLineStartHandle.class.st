Class {
	#name : #AodLineStartHandle,
	#superclass : #AodPointHandle,
	#category : #'Aod-Language-Vessels'
}

{ #category : #'as yet unclassified' }
AodLineStartHandle >> suggest: aPoint in: solver [
	solver
		suggest: aPoint x for: model start x;
		suggest: aPoint y for: model start y;
		suggest: model end x value for: model end x;
		suggest: model end y value for: model end y
]

{ #category : #evaluating }
AodLineStartHandle >> value [
	^ model start value
]
