Class {
	#name : #AodListInterweaveRelator,
	#superclass : #AodListRelator,
	#category : #'Aod-Language-Relators'
}

{ #category : #arguments }
AodListInterweaveRelator class >> argumentCount [
	^ 2
]

{ #category : #arguments }
AodListInterweaveRelator class >> argumentTypes [
	^ { AodType list . AodType actor }
]

{ #category : #generating }
AodListInterweaveRelator class >> expandOn: aGenerator [
	| array actor |
	actor := aGenerator pop.
	array := aGenerator pop.
	
	array size >= 2 
		ifFalse: [ AodDSLError signal: 'list must have atleast 2 elements to interweave' ].
	
	array overlappingPairsDo: [ :a :b |
		aGenerator
				raw: a;
				raw: b;
			push: actor	]
	
	
]

{ #category : #accessing }
AodListInterweaveRelator class >> identifier [
	^ #interweave
]

{ #category : #accessing }
AodListInterweaveRelator class >> returnType [
	^ AodType constraint
]

{ #category : #generated }
AodListInterweaveRelator >> acceptVisitor: aVisitor [
  ^aVisitor visitListInterweaveRelator: self
]
