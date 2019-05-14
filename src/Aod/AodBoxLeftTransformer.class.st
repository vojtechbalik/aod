Class {
	#name : #AodBoxLeftTransformer,
	#superclass : #AodBoxTransformer,
	#category : #'Aod-Language-Transformers'
}

{ #category : #generating }
AodBoxLeftTransformer class >> expandOn: aGenerator [
	aGenerator
		push: AodBoxPositionTransformer;
		push: AodPointXTransformer
]

{ #category : #accessing }
AodBoxLeftTransformer class >> identifier [
	^ #left
]

{ #category : #accessing }
AodBoxLeftTransformer class >> returnType [
	^ AodType anchor
]

{ #category : #generated }
AodBoxLeftTransformer >> acceptVisitor: aVisitor [
  ^aVisitor visitBoxLeftTransformer: self
]
