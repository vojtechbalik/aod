Class {
	#name : #AodSpanRelator,
	#superclass : #AodRelator,
	#category : #'Aod-Language-Relators'
}

{ #category : #generated }
AodSpanRelator >> acceptVisitor: aVisitor [
  ^aVisitor visitSpanRelator: self
]
