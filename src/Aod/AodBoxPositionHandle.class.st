Class {
	#name : #AodBoxPositionHandle,
	#superclass : #AodPointHandle,
	#category : #'Aod-Language-Vessels'
}

{ #category : #accessing }
AodBoxPositionHandle >> layoutPosition [
	^ 0@0
]

{ #category : #'as yet unclassified' }
AodBoxPositionHandle >> suggest: aPoint in: solver [
	solver
		suggest: aPoint x for: model position x;
		suggest: aPoint y for: model position y;
		suggest: model extent x value for: model extent x;
		suggest: model extent y value for: model extent y
]

{ #category : #evaluating }
AodBoxPositionHandle >> value [
	^ model position value
]
