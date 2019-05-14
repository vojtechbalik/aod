Class {
	#name : #AodListSequencedRelator,
	#superclass : #AodListRelator,
	#category : #'Aod-Language-Relators'
}

{ #category : #arguments }
AodListSequencedRelator class >> argumentCount [
	^ 1
]

{ #category : #arguments }
AodListSequencedRelator class >> argumentTypes [
	^ { AodType list }
]

{ #category : #generating }
AodListSequencedRelator class >> expandOn: aGenerator [
	| array |
	array := aGenerator pop.
	
	aGenerator
			raw: array;
			raw: AodSpanIsAfterRelator;
		push: AodListInterweaveRelator
]

{ #category : #accessing }
AodListSequencedRelator class >> identifier [
	^ #sequenced
]

{ #category : #accessing }
AodListSequencedRelator class >> returnType [
	^ AodType constraint
]

{ #category : #generated }
AodListSequencedRelator >> acceptVisitor: aVisitor [
  ^aVisitor visitListSequencedRelator: self
]
