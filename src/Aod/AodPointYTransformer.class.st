Class {
	#name : #AodPointYTransformer,
	#superclass : #AodPointTransformer,
	#category : #'Aod-Language-Transformers'
}

{ #category : #generating }
AodPointYTransformer class >> expandOn: aGenerator [
	aGenerator
		raw: aGenerator pop y
]

{ #category : #accessing }
AodPointYTransformer class >> identifier [
	^ #y
]

{ #category : #generated }
AodPointYTransformer >> acceptVisitor: aVisitor [
  ^aVisitor visitPointYTransformer: self
]
