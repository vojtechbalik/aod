Class {
	#name : #AodActorSelector,
	#superclass : #Object,
	#traits : 'TAodActorVisitor',
	#classTraits : 'TAodActorVisitor classTrait',
	#instVars : [
		'selector',
		'result'
	],
	#category : #'Aod-Language-Support'
}

{ #category : #selection }
AodActorSelector >> select: anActorType in: anActor [
	selector := anActorType.
	result := OrderedCollection new.
	anActor acceptVisitor: self.
	^ result
]

{ #category : #generated }
AodActorSelector >> visitActor: anActor [
	anActor aodType = selector
		ifTrue: [ result add: anActor ].
  	anActor arguments do: [:arg |  arg acceptVisitor: self ].
  ^anActor
]
