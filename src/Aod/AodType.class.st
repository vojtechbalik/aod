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
