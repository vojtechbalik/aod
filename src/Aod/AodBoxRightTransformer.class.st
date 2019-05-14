Class {
	#name : #AodBoxRightTransformer,
	#superclass : #AodBoxTransformer,
	#category : #'Aod-Language-Transformers'
}

{ #category : #'as yet unclassified' }
AodBoxRightTransformer class >> expandOn: expander [
	| box |
	box := expander pop.
	
	expander
				raw: box;
			push: AodBoxHorizontalTransformer;
		push: AodSpanEndTransformer
]

{ #category : #accessing }
AodBoxRightTransformer class >> identifier [
	^ #right
]

{ #category : #accessing }
AodBoxRightTransformer class >> returnType [
	^ AodType anchor
]

{ #category : #generated }
AodBoxRightTransformer >> acceptVisitor: aVisitor [
  ^aVisitor visitBoxRightTransformer: self
]
