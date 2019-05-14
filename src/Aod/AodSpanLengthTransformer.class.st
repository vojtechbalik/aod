Class {
	#name : #AodSpanLengthTransformer,
	#superclass : #AodSpanTransformer,
	#category : #'Aod-Language-Transformers'
}

{ #category : #generating }
AodSpanLengthTransformer class >> expandOn: aGenerator [
	aGenerator
		raw: aGenerator pop length
]

{ #category : #accessing }
AodSpanLengthTransformer class >> identifier [
	^ #length
]

{ #category : #generated }
AodSpanLengthTransformer >> acceptVisitor: aVisitor [
  ^aVisitor visitSpanLengthTransformer: self
]
