Class {
	#name : #AodBoxVessel,
	#superclass : #AodVessel,
	#instVars : [
		'position',
		'extent'
	],
	#category : #'Aod-Language-Vessels'
}

{ #category : #adding }
AodBoxVessel >> addTo: solver [
	constraints := {
		solver addConstraint
				data: self position;
			push: AodStayRelator;
			build.
		
		solver addConstraint
				data: self extent;
			push: AodStayRelator;
			strengthLevel: 2;
			build.
	 
		solver addConstraint
				data: 10 @ 10;
					data: self;
				push: AodBoxExtentTransformer;
			push: AodPointLeqRelator;
			build }.
]

{ #category : #enumerating }
AodBoxVessel >> anchorsDo: aBlock [
	position anchorsDo: aBlock.
	extent anchorsDo: aBlock
]

{ #category : #'as yet unclassified' }
AodBoxVessel >> buildHandles [
	^ {		AodBoxPositionHandle on: self.
			AodBoxExtentHandle on: self }
]

{ #category : #'as yet unclassified' }
AodBoxVessel >> editIn: solver [
	position editIn: solver.
	extent editIn: solver
]

{ #category : #accessing }
AodBoxVessel >> extent [
	^ extent
]

{ #category : #accessing }
AodBoxVessel >> extent: anObject [
	extent := anObject
]

{ #category : #initialization }
AodBoxVessel >> initialize [
	super initialize.
	
	position := AodPoint x: AodAnchor new y: AodAnchor new.
	extent := AodPoint x: AodAnchor new y: AodAnchor new.
	
	position value: 0@0.
	extent value: 50@50.
]

{ #category : #'as yet unclassified' }
AodBoxVessel >> layoutExtent [
	^ extent value
]

{ #category : #accessing }
AodBoxVessel >> layoutPosition [
	^ position value
]

{ #category : #accessing }
AodBoxVessel >> position [
	^ position
]

{ #category : #accessing }
AodBoxVessel >> position: anObject [
	position := anObject
]

{ #category : #adding }
AodBoxVessel >> removeFrom: aSolver [
	aSolver removeConstraints: constraints
]
