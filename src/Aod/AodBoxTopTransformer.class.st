Class {
	#name : #AodBoxTopTransformer,
	#superclass : #AodBoxTransformer,
	#category : #'Aod-Language-Transformers'
}

{ #category : #generating }
AodBoxTopTransformer class >> expandOn: aGenerator [
	aGenerator
		push: AodBoxPositionTransformer;
		push: AodPointYTransformer
]

{ #category : #accessing }
AodBoxTopTransformer class >> identifier [
	^ #top
]

{ #category : #accessing }
AodBoxTopTransformer class >> returnType [
	^ AodType anchor
]

{ #category : #generated }
AodBoxTopTransformer >> acceptVisitor: aVisitor [
  ^aVisitor visitBoxTopTransformer: self
]
