Class {
	#name : #AodStayConstraint,
	#superclass : #AodConstraint,
	#category : #'Aod-Program'
}

{ #category : #'as yet unclassified' }
AodStayConstraint class >> defaultStrength [
	^ AodStrength level: 3
]

{ #category : #accessing }
AodStayConstraint >> strength: aStrength [
	aStrength isRequired not
		ifFalse: [ AodDSLError signal: 'stay constraint cannot have required strength' ].
	^ super strength: aStrength
]
