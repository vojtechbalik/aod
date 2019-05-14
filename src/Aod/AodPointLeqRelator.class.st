Class {
	#name : #AodPointLeqRelator,
	#superclass : #AodPointRelator,
	#category : #'Aod-Language-Relators'
}

{ #category : #arguments }
AodPointLeqRelator class >> argumentCount [
	^ 2
]

{ #category : #arguments }
AodPointLeqRelator class >> argumentTypes [
	^ { AodType point. AodType point }
]

{ #category : #generating }
AodPointLeqRelator class >> expandOn: aGenerator [
	| arg1 arg2 |
	arg2 := aGenerator pop.
	arg1 := aGenerator pop.
	
	aGenerator
				raw: arg1 x;
				raw: arg2 x;
			push: AodAnchorLeqRelator;
				raw: arg1 y;
				raw: arg2 y;
			push: AodAnchorLeqRelator
]

{ #category : #accessing }
AodPointLeqRelator class >> identifier [
	^ #pointLeq
]

{ #category : #accessing }
AodPointLeqRelator class >> returnType [
	^ AodType constraint
]

{ #category : #generated }
AodPointLeqRelator >> acceptVisitor: aVisitor [
  ^aVisitor visitPointLeqRelator: self
]
