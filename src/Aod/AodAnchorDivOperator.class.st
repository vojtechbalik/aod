Class {
	#name : #AodAnchorDivOperator,
	#superclass : #AodAnchorOperator,
	#category : #'Aod-Language-Operators'
}

{ #category : #generating }
AodAnchorDivOperator class >> expandOn: aGenerator [
	aGenerator generateAnchorDiv
]

{ #category : #accessing }
AodAnchorDivOperator class >> identifier [
	^ #anchorDiv
]

{ #category : #generated }
AodAnchorDivOperator >> acceptVisitor: aVisitor [
  ^aVisitor visitAnchorDivOperator: self
]
