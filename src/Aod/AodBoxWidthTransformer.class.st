Class {
	#name : #AodBoxWidthTransformer,
	#superclass : #AodBoxTransformer,
	#category : #'Aod-Language-Transformers'
}

{ #category : #generating }
AodBoxWidthTransformer class >> expandOn: aGenerator [
	aGenerator
		push: AodBoxExtentTransformer;
		push: AodPointXTransformer
]

{ #category : #accessing }
AodBoxWidthTransformer class >> identifier [
	^ #width
]

{ #category : #accessing }
AodBoxWidthTransformer class >> returnType [
	^ AodType anchor
]

{ #category : #generated }
AodBoxWidthTransformer >> acceptVisitor: aVisitor [
  ^aVisitor visitBoxWidthTransformer: self
]
