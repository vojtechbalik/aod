Class {
	#name : #AodLineVessel,
	#superclass : #AodVessel,
	#instVars : [
		'start',
		'end'
	],
	#category : #'Aod-Language-Vessels'
}

{ #category : #'as yet unclassified' }
AodLineVessel >> aboutToLayout: anElement [
	anElement fromAnchor position: start value.
	anElement toAnchor position: end value.
]

{ #category : #adding }
AodLineVessel >> addTo: solver [
	solver addConstraint
			data: self;
		push: AodStayRelator;
		build.
]

{ #category : #enumerating }
AodLineVessel >> anchorsDo: aBlock [
	start anchorsDo: aBlock.
	end anchorsDo: aBlock. 
]

{ #category : #'as yet unclassified' }
AodLineVessel >> buildHandles [
	^ {		AodLineStartHandle on: self.
			AodLineEndHandle on: self }
]

{ #category : #'as yet unclassified' }
AodLineVessel >> editIn: solver [
	start editIn: solver.
	end editIn: solver.
]

{ #category : #accessing }
AodLineVessel >> end [
	^ end
]

{ #category : #initialization }
AodLineVessel >> initialize [
	super initialize.
	
	start := AodPoint x: AodAnchor new y: AodAnchor new.
	end := AodPoint x: AodAnchor new y: AodAnchor new.
	
	start value: 0@0.
	end value: 50@50
]

{ #category : #'as yet unclassified' }
AodLineVessel >> layoutExtent [
	^ ((start x value max: end x value) @ (start y value max: end y value)) - self layoutPosition
]

{ #category : #accessing }
AodLineVessel >> layoutPosition [
	^ (start x value min: end x value) @ (start y value min: end y value)
]

{ #category : #adding }
AodLineVessel >> removeFrom: solver [
]

{ #category : #accessing }
AodLineVessel >> start [
	^ start
]
