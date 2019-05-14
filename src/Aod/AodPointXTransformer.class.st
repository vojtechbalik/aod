Class {
	#name : #AodPointXTransformer,
	#superclass : #AodPointTransformer,
	#category : #'Aod-Language-Transformers'
}

{ #category : #generating }
AodPointXTransformer class >> expandOn: aGenerator [
	aGenerator
		raw: aGenerator pop x
]

{ #category : #accessing }
AodPointXTransformer class >> identifier [
	^ #x
]

{ #category : #generated }
AodPointXTransformer >> acceptVisitor: aVisitor [
  ^aVisitor visitPointXTransformer: self
]
