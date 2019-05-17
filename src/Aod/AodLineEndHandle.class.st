Class {
	#name : #AodLineEndHandle,
	#superclass : #AodPointHandle,
	#category : #'Aod-Language-Vessels'
}

{ #category : #'as yet unclassified' }
AodLineEndHandle >> suggest: aPoint in: solver [
	solver
		suggest: aPoint x for: model end x;
		suggest: aPoint y for: model end y;
		suggest: model start x value for: model start x;
		suggest: model start y value for: model start y 
]

{ #category : #evaluating }
AodLineEndHandle >> value [
	^ model end value
]
