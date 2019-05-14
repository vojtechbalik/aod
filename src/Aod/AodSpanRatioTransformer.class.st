"
hypothetical
"
Class {
	#name : #AodSpanRatioTransformer,
	#superclass : #AodSpanTransformer,
	#category : #'Aod-Language-Transformers'
}

{ #category : #generated }
AodSpanRatioTransformer >> acceptVisitor: aVisitor [
  ^aVisitor visitSpanRatioTransformer: self
]
