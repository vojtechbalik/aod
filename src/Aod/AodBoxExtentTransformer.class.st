Class {
	#name : #AodBoxExtentTransformer,
	#superclass : #AodBoxTransformer,
	#category : #'Aod-Language-Transformers'
}

{ #category : #generating }
AodBoxExtentTransformer class >> expandOn: aGenerator [
	aGenerator
		raw: aGenerator pop extent
]

{ #category : #accessing }
AodBoxExtentTransformer class >> identifier [
	^ #extent
]

{ #category : #accessing }
AodBoxExtentTransformer class >> returnType [
	^ AodType point
]

{ #category : #generated }
AodBoxExtentTransformer >> acceptVisitor: aVisitor [
  ^aVisitor visitBoxExtentTransformer: self
]
