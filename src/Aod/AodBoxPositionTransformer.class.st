Class {
	#name : #AodBoxPositionTransformer,
	#superclass : #AodBoxTransformer,
	#category : #'Aod-Language-Transformers'
}

{ #category : #generating }
AodBoxPositionTransformer class >> expandOn: aGenerator [
	aGenerator
		raw: aGenerator pop position
]

{ #category : #accessing }
AodBoxPositionTransformer class >> identifier [
	^ #position
]

{ #category : #generating }
AodBoxPositionTransformer class >> returnType [ 
	^ AodType point
]

{ #category : #generated }
AodBoxPositionTransformer >> acceptVisitor: aVisitor [
  ^aVisitor visitBoxPositionTransformer: self
]
