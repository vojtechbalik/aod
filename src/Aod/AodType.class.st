"
somehow I need to hold the actual anchors (or do I?)

the solver can act in some way when AodAnchor instance is added (create it's own specific one)
but then with constraints, the Types need to know the specific ones, how else would I know which is which?

when  constraints are added to solver, the types that they constrain already need to be ""in"" the solver too.
(not for cassowary, but this is a good invariant to have)

so one way to do this
	AodAnchor is the one constraints work with, no matter how. The solver knows what to do when an anchor is added. AodAnchor also owns the solver specific anchor. (Otherwise I would need some kind of mapping).
"
Class {
	#name : #AodType,
	#superclass : #Object,
	#category : #'Aod-Language-Core'
}

{ #category : #accessing }
AodType class >> actor [
	^ AodActor
]

{ #category : #accessing }
AodType class >> anchor [
	^ AodAnchor
]

{ #category : #'instance creation' }
AodType class >> box [
	^ AodBoxVessel
]

{ #category : #accessing }
AodType class >> constant [
	^ AodConstant
]

{ #category : #'as yet unclassified' }
AodType class >> constraint [
	^ AodConstraint
]

{ #category : #accessing }
AodType class >> data [
	^ AodDataType
]

{ #category : #testing }
AodType class >> isConstraintType [
	^ false
]

{ #category : #'as yet unclassified' }
AodType class >> isTypeCompatibleWith: aClass [
	self withAllSuperclassesDo: [ :sprcls | 
		sprcls == aClass
			ifTrue: [ ^ true ] ].
		
	^ false
]

{ #category : #'as yet unclassified' }
AodType class >> isTypeEqualTo: aClass [
	^ self == aClass
]

{ #category : #'instance creation' }
AodType class >> line [
	^ AodLineVessel
]

{ #category : #private }
AodType class >> list [
	^ AodList
]

{ #category : #'as yet unclassified' }
AodType class >> placeholder [
	^ AodPlaceholderType
]

{ #category : #accessing }
AodType class >> point [
	^ AodPoint
]

{ #category : #accessing }
AodType class >> span [
	^ AodSpan
]

{ #category : #'as yet unclassified' }
AodType class >> stayConstraint [
	^ AodStayConstraint 
]

{ #category : #'as yet unclassified' }
AodType >> aodType [
	^ self class
]
