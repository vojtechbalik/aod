"
a type serving as a representation of a visual element
"
Class {
	#name : #AodVessel,
	#superclass : #AodDataType,
	#instVars : [
		'constraints'
	],
	#category : #'Aod-Language-Vessels'
}

{ #category : #adding }
AodVessel >> addTo: solver [
	"add constraints representing invariants of a model"
	self subclassResponsibility 
]

{ #category : #accessing }
AodVessel >> constraints [
	^ constraints
]

{ #category : #'as yet unclassified' }
AodVessel >> layoutExtent [
	self subclassResponsibility 
]

{ #category : #accessing }
AodVessel >> layoutPosition [
	self subclassResponsibility
]

{ #category : #adding }
AodVessel >> removeFrom: solver [
	self subclassResponsibility 
]
