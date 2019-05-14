Class {
	#name : #AodSpanEndTransformer,
	#superclass : #AodSpanTransformer,
	#category : #'Aod-Language-Transformers'
}

{ #category : #generating }
AodSpanEndTransformer class >> expandOn: aGenerator [
	| span |
	span := aGenerator pop.
	
	aGenerator
				raw: span;
			push: AodSpanStartTransformer;
				raw: span;
			push: AodSpanLengthTransformer;
		push: AodAnchorAddOperator
		
]

{ #category : #accessing }
AodSpanEndTransformer class >> identifier [
	^ #end
]

{ #category : #generated }
AodSpanEndTransformer >> acceptVisitor: aVisitor [
  ^aVisitor visitSpanEndTransformer: self
]
