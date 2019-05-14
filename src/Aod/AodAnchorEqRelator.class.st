Class {
	#name : #AodAnchorEqRelator,
	#superclass : #AodAnchorRelator,
	#category : #'Aod-Language-Relators'
}

{ #category : #generating }
AodAnchorEqRelator class >> expandOn: aGenerator [
	aGenerator generateAnchorEq
]

{ #category : #accessing }
AodAnchorEqRelator class >> identifier [
	^ #anchorEq
]

{ #category : #generated }
AodAnchorEqRelator >> acceptVisitor: aVisitor [
  ^aVisitor visitAnchorEqRelator: self
]
