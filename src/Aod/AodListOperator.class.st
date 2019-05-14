Class {
	#name : #AodListOperator,
	#superclass : #AodOperator,
	#category : #'Aod-Language-Operators'
}

{ #category : #generated }
AodListOperator >> acceptVisitor: aVisitor [
  ^aVisitor visitListOperator: self
]
