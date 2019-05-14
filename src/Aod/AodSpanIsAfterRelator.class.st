Class {
	#name : #AodSpanIsAfterRelator,
	#superclass : #AodSpanRelator,
	#category : #'Aod-Language-Relators'
}

{ #category : #arguments }
AodSpanIsAfterRelator class >> argumentCount [
	^ 2
]

{ #category : #arguments }
AodSpanIsAfterRelator class >> argumentTypes [
	"use literal arrays to denote symbols correposing to classes of AodTypes
		ex. '^ #(AodAnchor AodAnchor)' would mean Actor taking 2 anchors as arguments"
	^ { AodType span . AodType span }
]

{ #category : #generating }
AodSpanIsAfterRelator class >> expandOn: aGenerator [
	| left right |
	right := aGenerator pop.
	left := aGenerator pop.
	
	aGenerator
				raw: left;
			push: AodSpanEndTransformer;
				raw: right;
			push: AodSpanStartTransformer;
		push: AodAnchorLeqRelator
]

{ #category : #accessing }
AodSpanIsAfterRelator class >> identifier [
	^ #isAfter
]

{ #category : #accessing }
AodSpanIsAfterRelator class >> returnType [
	^ AodType constraint
]

{ #category : #generated }
AodSpanIsAfterRelator >> acceptVisitor: aVisitor [
  ^aVisitor visitSpanIsAfterRelator: self
]
