Class {
	#name : #AodBoxBottomTransformer,
	#superclass : #AodBoxTransformer,
	#category : #'Aod-Language-Transformers'
}

{ #category : #'as yet unclassified' }
AodBoxBottomTransformer class >> expandOn: expander [
	| box |
	box := expander pop.
	
	expander
				raw: box;
			push: AodBoxVerticalTransformer;
		push: AodSpanEndTransformer
]

{ #category : #accessing }
AodBoxBottomTransformer class >> identifier [
	^ #bottom
]

{ #category : #accessing }
AodBoxBottomTransformer class >> returnType [
	^ AodType anchor
]

{ #category : #generated }
AodBoxBottomTransformer >> acceptVisitor: aVisitor [
  ^aVisitor visitBoxBottomTransformer: self
]
