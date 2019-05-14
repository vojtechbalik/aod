Class {
	#name : #AodAnchorSubOperator,
	#superclass : #AodAnchorOperator,
	#category : #'Aod-Language-Operators'
}

{ #category : #generating }
AodAnchorSubOperator class >> expandOn: aGenerator [
	aGenerator generateAnchorSub
]

{ #category : #accessing }
AodAnchorSubOperator class >> identifier [
	^ #anchorSub
]

{ #category : #generated }
AodAnchorSubOperator >> acceptVisitor: aVisitor [
  ^aVisitor visitAnchorSubOperator: self
]
