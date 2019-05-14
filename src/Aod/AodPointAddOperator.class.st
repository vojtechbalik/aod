Class {
	#name : #AodPointAddOperator,
	#superclass : #AodPointOperator,
	#category : #'Aod-Language-Operators'
}

{ #category : #generating }
AodPointAddOperator class >> expandOn: aGenerator [
	| a b |
	b := aGenerator pop.
	a := aGenerator pop.
	
	aGenerator
				raw: a;
			push: AodPointXTransformer;
				raw: b;
			push: AodPointXTransformer;
		push: AodAnchorAddOperator;
				raw: a;
			push: AodPointYTransformer;
				raw: b;
			push: AodPointYTransformer;
		push: AodAnchorAddOperator;
	push: AodPointConstructor
		
]

{ #category : #accessing }
AodPointAddOperator class >> identifier [
	^ #pointAdd
]

{ #category : #generated }
AodPointAddOperator >> acceptVisitor: aVisitor [
  ^aVisitor visitPointAddOperator: self
]
