Class {
	#name : #AodLineStartTransformer,
	#superclass : #AodLineTransformer,
	#category : #'Aod-Language-Transformers'
}

{ #category : #generating }
AodLineStartTransformer class >> expandOn: aGenerator [
	aGenerator raw: aGenerator pop start
]

{ #category : #accessing }
AodLineStartTransformer class >> identifier [
	^ #line_start
]

{ #category : #accessing }
AodLineStartTransformer class >> returnType [
	^ AodType point
]

{ #category : #generated }
AodLineStartTransformer >> acceptVisitor: aVisitor [
  ^aVisitor visitLineStartTransformer: self
]
