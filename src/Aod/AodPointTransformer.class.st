Class {
	#name : #AodPointTransformer,
	#superclass : #AodTransformer,
	#category : #'Aod-Language-Transformers'
}

{ #category : #arguments }
AodPointTransformer class >> argumentTypes [
	^ { AodType point }
]

{ #category : #accessing }
AodPointTransformer class >> returnType [
	^ AodType anchor
]

{ #category : #generated }
AodPointTransformer >> acceptVisitor: aVisitor [
  ^aVisitor visitPointTransformer: self
]
