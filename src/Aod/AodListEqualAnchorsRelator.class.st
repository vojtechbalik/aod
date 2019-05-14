Class {
	#name : #AodListEqualAnchorsRelator,
	#superclass : #AodListRelator,
	#category : #'Aod-Language-Relators'
}

{ #category : #arguments }
AodListEqualAnchorsRelator class >> argumentCount [
	^ 1
]

{ #category : #arguments }
AodListEqualAnchorsRelator class >> argumentTypes [
	^ { AodType list }
]

{ #category : #generating }
AodListEqualAnchorsRelator class >> expandOn: aGenerator [
	| array |
	array := aGenerator pop.
	
	aGenerator
				raw: array;
				raw: AodAnchorEqRelator;
			push: AodListInterweaveRelator
]

{ #category : #accessing }
AodListEqualAnchorsRelator class >> identifier [
	^ #equal_anchors
]

{ #category : #accessing }
AodListEqualAnchorsRelator class >> returnType [
	^ AodType constraint
]

{ #category : #generated }
AodListEqualAnchorsRelator >> acceptVisitor: aVisitor [
  ^aVisitor visitListEqualAnchorsRelator: self
]
