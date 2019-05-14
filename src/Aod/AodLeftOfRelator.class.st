Class {
	#name : #AodLeftOfRelator,
	#superclass : #AodRelator,
	#category : #'Aod-Language-Relators'
}

{ #category : #accessing }
AodLeftOfRelator class >> argumentCount [
	^ 2
]

{ #category : #accessing }
AodLeftOfRelator class >> argumentTypes [
	^ {AodType box. AodType box}
]

{ #category : #generating }
AodLeftOfRelator class >> expandOn: aGenerator [
	| arg1 arg2 |
	arg2 := aGenerator pop.
	arg1 := aGenerator pop.
	
	aGenerator
				raw: arg1;
			push: AodBoxRightTransformer;
				raw: arg2;
			push: AodBoxLeftTransformer;
		push: AodAnchorLeqRelator 
				
]

{ #category : #accessing }
AodLeftOfRelator class >> identifier [
	^ #isLeftOf
]

{ #category : #accessing }
AodLeftOfRelator class >> returnType [
	^ AodType constraint
]

{ #category : #accessing }
AodLeftOfRelator class >> selector [
	^ #leftOf
]

{ #category : #generated }
AodLeftOfRelator >> acceptVisitor: aVisitor [
  ^aVisitor visitLeftOfRelator: self
]
