Class {
	#name : #AodSpanTransformer,
	#superclass : #AodTransformer,
	#category : #'Aod-Language-Transformers'
}

{ #category : #arguments }
AodSpanTransformer class >> argumentTypes [
	^ { AodType span }
]

{ #category : #accessing }
AodSpanTransformer class >> returnType [
	^ AodType anchor
]

{ #category : #generated }
AodSpanTransformer >> acceptVisitor: aVisitor [
  ^aVisitor visitSpanTransformer: self
]
