Class {
	#name : #AodAnchorMulOperator,
	#superclass : #AodAnchorOperator,
	#category : #'Aod-Language-Operators'
}

{ #category : #generating }
AodAnchorMulOperator class >> expandOn: aGenerator [
	aGenerator generateAnchorMul
]

{ #category : #accessing }
AodAnchorMulOperator class >> identifier [
	^ #anchorMul
]

{ #category : #generated }
AodAnchorMulOperator >> acceptVisitor: aVisitor [
  ^aVisitor visitAnchorMulOperator: self
]
