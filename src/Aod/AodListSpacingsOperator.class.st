Class {
	#name : #AodListSpacingsOperator,
	#superclass : #AodListOperator,
	#category : #'Aod-Language-Operators'
}

{ #category : #arguments }
AodListSpacingsOperator class >> argumentCount [
	^ 1
]

{ #category : #arguments }
AodListSpacingsOperator class >> argumentTypes [
	^ { AodType list }
]

{ #category : #generating }
AodListSpacingsOperator class >> expandOn: aGenerator [
	| list |
	list := aGenerator pop.
	
	aGenerator
			raw: list;
			raw: AodSpanSpacingOperator;
		push: AodListPairsMapOperator
]

{ #category : #accessing }
AodListSpacingsOperator class >> identifier [
	^ #spacings
]

{ #category : #accessing }
AodListSpacingsOperator class >> returnType [
	^ AodType list
]
