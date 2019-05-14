Class {
	#name : #AodTransformer,
	#superclass : #AodActor,
	#category : #'Aod-Language-Actor'
}

{ #category : #arguments }
AodTransformer class >> argumentCount [
	^ 1
]

{ #category : #generated }
AodTransformer >> acceptVisitor: aVisitor [
  ^aVisitor visitTransformer: self
]
