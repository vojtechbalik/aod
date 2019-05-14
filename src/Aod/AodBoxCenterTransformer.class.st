Class {
	#name : #AodBoxCenterTransformer,
	#superclass : #AodBoxTransformer,
	#category : #'Aod-Language-Transformers'
}

{ #category : #generating }
AodBoxCenterTransformer class >> expandOn: aGenerator [
	| box |
	
	box := aGenerator pop.
	
	aGenerator
					raw: box;
				push: AodBoxHorizontalTransformer;
			push: AodSpanMiddleTransformer;
					raw: box;
				push: AodBoxVerticalTransformer;
			push: AodSpanMiddleTransformer;
		push: AodPointConstructor
]

{ #category : #accessing }
AodBoxCenterTransformer class >> identifier [
	^ #center
]

{ #category : #accessing }
AodBoxCenterTransformer class >> returnType [
	^ AodType point
]

{ #category : #generated }
AodBoxCenterTransformer >> acceptVisitor: aVisitor [
  ^aVisitor visitBoxCenterTransformer: self
]
