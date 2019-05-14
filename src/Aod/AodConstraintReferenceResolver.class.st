Class {
	#name : #AodConstraintReferenceResolver,
	#superclass : #Object,
	#traits : 'TAodActorVisitor',
	#classTraits : 'TAodActorVisitor classTrait',
	#instVars : [
		'drawing'
	],
	#category : #'Aod-Language-Support'
}

{ #category : #accessing }
AodConstraintReferenceResolver >> drawing [
	^ drawing
]

{ #category : #accessing }
AodConstraintReferenceResolver >> drawing: anObject [
	drawing := anObject
]

{ #category : #generated }
AodConstraintReferenceResolver >> visitActor: anActor [
  	^ anActor arguments 
		allSatisfy: [ :arg | arg acceptVisitor: self ]
]

{ #category : #generated }
AodConstraintReferenceResolver >> visitShapeBinding: anActor [
 	anActor resolveReferenceWith: drawing.
	^ anActor isResolved
]
