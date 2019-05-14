Class {
	#name : #AodBoxSpanTransformer,
	#superclass : #AodBoxTransformer,
	#category : #'Aod-Language-Transformers'
}

{ #category : #generated }
AodBoxSpanTransformer >> acceptVisitor: aVisitor [
  ^aVisitor visitBoxSpanTransformer: self
]
