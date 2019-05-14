Class {
	#name : #AodListPairsMapOperator,
	#superclass : #AodListOperator,
	#category : #'Aod-Language-Operators'
}

{ #category : #arguments }
AodListPairsMapOperator class >> argumentCount [
	^ 2
]

{ #category : #arguments }
AodListPairsMapOperator class >> argumentTypes [
	^ { AodType list . AodType actor }
]

{ #category : #generating }
AodListPairsMapOperator class >> expandOn: aGenerator [
	| list actor |
	actor := aGenerator pop.
	list := aGenerator pop.
	
	list size >= 2
		ifFalse: [ AodDSLError signal: 'list must have atleast 2 elements to map pairs' ].
	
	list overlappingPairsDo: [ :a :b |
		aGenerator
				raw: a;
				raw: b;
			push: actor	].

	aGenerator
			raw: list size - 1;
		push: AodListConstructor 
]

{ #category : #accessing }
AodListPairsMapOperator class >> identifier [ 
	^ #pairs_map
]

{ #category : #accessing }
AodListPairsMapOperator class >> returnType [
	^ AodType list
]
