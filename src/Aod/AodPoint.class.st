Class {
	#name : #AodPoint,
	#superclass : #AodDataType,
	#instVars : [
		'x',
		'y'
	],
	#category : #'Aod-Language-Core'
}

{ #category : #'instance creation' }
AodPoint class >> x: x y: y [
	^ self new
		x: x;
		y: y
]

{ #category : #enumerating }
AodPoint >> anchorsDo: aBlock [
	aBlock value: x.
	aBlock value: y
]

{ #category : #'as yet unclassified' }
AodPoint >> editIn: solver [
	x editIn: solver.
	y editIn: solver.
]

{ #category : #evaluating }
AodPoint >> value [
	^ x value @ y value
]

{ #category : #accessing }
AodPoint >> value: aPoint [
	x value: aPoint x.
	y value: aPoint y
]

{ #category : #accessing }
AodPoint >> x [
	^ x
]

{ #category : #accessing }
AodPoint >> x: anObject [
	x := anObject
]

{ #category : #accessing }
AodPoint >> y [
	^ y
]

{ #category : #accessing }
AodPoint >> y: anObject [
	y := anObject
]
