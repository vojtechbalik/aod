Class {
	#name : #AodAnchorAddOperator,
	#superclass : #AodAnchorOperator,
	#category : #'Aod-Language-Operators'
}

{ #category : #generating }
AodAnchorAddOperator class >> expandOn: aGenerator [
	aGenerator generateAnchorAdd
]

{ #category : #accessing }
AodAnchorAddOperator class >> identifier [
	^ #anchorAdd
]

{ #category : #generated }
AodAnchorAddOperator >> acceptVisitor: aVisitor [
  ^aVisitor visitAnchorAddOperator: self
]
