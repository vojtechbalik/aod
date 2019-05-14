Class {
	#name : #AodListMapOperator,
	#superclass : #AodListOperator,
	#category : #'Aod-Language-Operators'
}

{ #category : #arguments }
AodListMapOperator class >> argumentCount [
	^ 2
]

{ #category : #arguments }
AodListMapOperator class >> argumentTypes [
	^ { AodType list . AodType actor }
]

{ #category : #generating }
AodListMapOperator class >> expandOn: aGenerator [
	| actor array |
	actor := aGenerator pop.
	array := aGenerator pop.
	
	array do: [ :elem |
		aGenerator 
				raw: elem;
			push: actor ].
		
	aGenerator
			raw: array size;
		push: AodListConstructor
]

{ #category : #accessing }
AodListMapOperator class >> identifier [
	^ #map
]

{ #category : #accessing }
AodListMapOperator class >> returnType [
	^ AodType list
]

{ #category : #generated }
AodListMapOperator >> acceptVisitor: aVisitor [
  ^aVisitor visitListMapOperator: self
]
