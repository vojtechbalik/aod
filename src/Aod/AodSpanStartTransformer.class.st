Class {
	#name : #AodSpanStartTransformer,
	#superclass : #AodSpanTransformer,
	#category : #'Aod-Language-Transformers'
}

{ #category : #generating }
AodSpanStartTransformer class >> expandOn: aGenerator [
	| span |
	span := aGenerator pop.
	aGenerator
		raw: span start
]

{ #category : #accessing }
AodSpanStartTransformer class >> identifier [
	^ #start
]

{ #category : #generated }
AodSpanStartTransformer >> acceptVisitor: aVisitor [
  ^aVisitor visitSpanStartTransformer: self
]
