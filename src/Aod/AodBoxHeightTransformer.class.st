Class {
	#name : #AodBoxHeightTransformer,
	#superclass : #AodBoxTransformer,
	#category : #'Aod-Language-Transformers'
}

{ #category : #generating }
AodBoxHeightTransformer class >> expandOn: aGenerator [
	aGenerator
		push: AodBoxExtentTransformer;
		push: AodPointYTransformer
]

{ #category : #accessing }
AodBoxHeightTransformer class >> identifier [
	^ #height
]

{ #category : #accessing }
AodBoxHeightTransformer class >> returnType [
	^ AodType anchor
]

{ #category : #generated }
AodBoxHeightTransformer >> acceptVisitor: aVisitor [
  ^aVisitor visitBoxHeightTransformer: self
]
