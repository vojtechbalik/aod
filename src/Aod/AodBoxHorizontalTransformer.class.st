Class {
	#name : #AodBoxHorizontalTransformer,
	#superclass : #AodBoxSpanTransformer,
	#category : #'Aod-Language-Transformers'
}

{ #category : #generating }
AodBoxHorizontalTransformer class >> expandOn: aGenerator [
	| box |
	box := aGenerator pop.
	
	aGenerator
				raw: box;
			push: AodBoxLeftTransformer;
				raw: box;
			push: AodBoxWidthTransformer;
		push: AodSpanConstructor
]

{ #category : #accessing }
AodBoxHorizontalTransformer class >> identifier [
	^ #horizontal
]

{ #category : #accessing }
AodBoxHorizontalTransformer class >> returnType [
	^ AodType span
]

{ #category : #generated }
AodBoxHorizontalTransformer >> acceptVisitor: aVisitor [
  ^aVisitor visitBoxHorizontalTransformer: self
]
