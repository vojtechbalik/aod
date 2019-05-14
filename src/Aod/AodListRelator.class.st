Class {
	#name : #AodListRelator,
	#superclass : #AodRelator,
	#category : #'Aod-Language-Relators'
}

{ #category : #generated }
AodListRelator >> acceptVisitor: aVisitor [
  ^aVisitor visitListRelator: self
]
