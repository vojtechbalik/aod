Class {
	#name : #AodSpanSpacingOperator,
	#superclass : #AodSpanOperator,
	#category : #'Aod-Language-Operators'
}

{ #category : #arguments }
AodSpanSpacingOperator class >> argumentCount [
	^ 2
]

{ #category : #arguments }
AodSpanSpacingOperator class >> argumentTypes [
	^ { AodType span . AodType span }
]

{ #category : #generating }
AodSpanSpacingOperator class >> expandOn: aGenerator [
	| first second |
	second := aGenerator pop.
	first := aGenerator pop.
	
	aGenerator
				raw: first;
			push: AodSpanEndTransformer;
					raw: second;
				push: AodSpanStartTransformer;
					raw: first;
				push: AodSpanEndTransformer;
			push: AodAnchorSubOperator;
		push: AodSpanConstructor
]

{ #category : #accessing }
AodSpanSpacingOperator class >> identifier [ 	
	^ #spacing
]

{ #category : #accessing }
AodSpanSpacingOperator class >> returnType [
	^ AodType span
]
