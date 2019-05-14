Class {
	#name : #AodLineEndTransformer,
	#superclass : #AodLineTransformer,
	#category : #'Aod-Language-Transformers'
}

{ #category : #generating }
AodLineEndTransformer class >> expandOn: aGenerator [
	aGenerator raw: aGenerator pop end
]

{ #category : #accessing }
AodLineEndTransformer class >> identifier [
	^ #line_end
]

{ #category : #accessing }
AodLineEndTransformer class >> returnType [
	^ AodType point
]

{ #category : #generated }
AodLineEndTransformer >> acceptVisitor: aVisitor [
  ^aVisitor visitLineEndTransformer: self
]
