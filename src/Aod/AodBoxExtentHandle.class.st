Class {
	#name : #AodBoxExtentHandle,
	#superclass : #AodPointHandle,
	#category : #'Aod-Language-Vessels'
}

{ #category : #accessing }
AodBoxExtentHandle >> layoutPosition [
	^ model extent value
]

{ #category : #'as yet unclassified' }
AodBoxExtentHandle >> suggest: aPoint in: solver [
	solver
		suggest: aPoint x for: model extent x;
		suggest: aPoint y for: model extent y;
		suggest: model position x value for: model position x;
		suggest: model position y value for: model position y
]

{ #category : #evaluating }
AodBoxExtentHandle >> value [
	^ model extent value
]
