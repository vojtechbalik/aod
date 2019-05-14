Class {
	#name : #AodBoxVerticalTransformer,
	#superclass : #AodBoxSpanTransformer,
	#category : #'Aod-Language-Transformers'
}

{ #category : #generating }
AodBoxVerticalTransformer class >> expandOn: aGenerator [
	| box |
	box := aGenerator pop.
	
	aGenerator
				raw: box;
			push: AodBoxTopTransformer;
				raw: box;
			push: AodBoxHeightTransformer;
		push: AodSpanConstructor
]

{ #category : #accessing }
AodBoxVerticalTransformer class >> identifier [
	^ #vertical
]

{ #category : #accessing }
AodBoxVerticalTransformer class >> returnType [
	^ AodType span
]

{ #category : #generated }
AodBoxVerticalTransformer >> acceptVisitor: aVisitor [
  ^aVisitor visitBoxVerticalTransformer: self
]
