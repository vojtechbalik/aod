Class {
	#name : #AodAnchorLeqRelator,
	#superclass : #AodAnchorRelator,
	#category : #'Aod-Language-Relators'
}

{ #category : #generating }
AodAnchorLeqRelator class >> expandOn: aGenerator [
	aGenerator generateAnchorLeq
]

{ #category : #accessing }
AodAnchorLeqRelator class >> identifier [
	^ #anchorLeq
]

{ #category : #generated }
AodAnchorLeqRelator >> acceptVisitor: aVisitor [
  ^aVisitor visitAnchorLeqRelator: self
]
