Class {
	#name : #AodSpanMiddleTransformer,
	#superclass : #AodSpanTransformer,
	#category : #'Aod-Language-Transformers'
}

{ #category : #generating }
AodSpanMiddleTransformer class >> expandOn: aGenerator [
	| span |
	span := aGenerator pop.
	
	aGenerator
				raw: span;
			push: AodSpanStartTransformer;
					raw: span;
				push: AodSpanLengthTransformer;
				raw: 2;
			push: AodAnchorDivOperator;
		push: AodAnchorAddOperator
]

{ #category : #accessing }
AodSpanMiddleTransformer class >> identifier [
	^ #middle
]

{ #category : #generated }
AodSpanMiddleTransformer >> acceptVisitor: aVisitor [
  ^aVisitor visitSpanMiddleTransformer: self
]
