Class {
	#name : #AodPointEqRelator,
	#superclass : #AodPointRelator,
	#category : #'Aod-Language-Relators'
}

{ #category : #arguments }
AodPointEqRelator class >> argumentCount [
	^ 2
]

{ #category : #arguments }
AodPointEqRelator class >> argumentTypes [
	^ { AodType point . AodType point }
]

{ #category : #generating }
AodPointEqRelator class >> expandOn: aGenerator [
	| arg1 arg2 |
	arg2 := aGenerator pop.
	arg1 := aGenerator pop.
	
	aGenerator
				raw: arg1 x;
				raw: arg2 x;
			push: AodAnchorEqRelator;
				raw: arg1 y;
				raw: arg2 y;
			push: AodAnchorEqRelator
]

{ #category : #accessing }
AodPointEqRelator class >> identifier [
	^ #pointEq
]

{ #category : #accessing }
AodPointEqRelator class >> returnType [
	^ AodType constraint
]

{ #category : #generated }
AodPointEqRelator >> acceptVisitor: aVisitor [
  ^aVisitor visitPointEqRelator: self
]
