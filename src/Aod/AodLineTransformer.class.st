Class {
	#name : #AodLineTransformer,
	#superclass : #AodTransformer,
	#category : #'Aod-Language-Transformers'
}

{ #category : #arguments }
AodLineTransformer class >> argumentTypes [
	"use literal arrays to denote symbols correposing to classes of AodTypes
		ex. '^ #(AodAnchor AodAnchor)' would mean Actor taking 2 anchors as arguments"
	^ { AodType line }
]

{ #category : #generated }
AodLineTransformer >> acceptVisitor: aVisitor [
  ^aVisitor visitLineTransformer: self
]
