Class {
	#name : #AodActorBinding,
	#superclass : #AodDataBinding,
	#category : #'Aod-Language-Actor'
}

{ #category : #generated }
AodActorBinding >> acceptVisitor: aVisitor [
  ^aVisitor visitActorBinding: self
]

{ #category : #accessing }
AodActorBinding >> returnType [
	^ AodType actor
]
