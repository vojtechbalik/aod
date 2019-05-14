Class {
	#name : #AodOperator,
	#superclass : #AodActor,
	#category : #'Aod-Language-Actor'
}

{ #category : #generated }
AodOperator >> acceptVisitor: aVisitor [
  ^aVisitor visitOperator: self
]
