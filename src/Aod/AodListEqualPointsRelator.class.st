Class {
	#name : #AodListEqualPointsRelator,
	#superclass : #AodListRelator,
	#category : #'Aod-Language-Relators'
}

{ #category : #arguments }
AodListEqualPointsRelator class >> argumentCount [
	^ 1
]

{ #category : #arguments }
AodListEqualPointsRelator class >> argumentTypes [
	^ { AodType list }
]

{ #category : #generating }
AodListEqualPointsRelator class >> expandOn: aGenerator [
	| array |
	array := aGenerator pop.
	
	aGenerator
				raw: array;
				raw: AodPointEqRelator;
			push: AodListInterweaveRelator
]

{ #category : #accessing }
AodListEqualPointsRelator class >> identifier [
	^ #equal_points
]

{ #category : #accessing }
AodListEqualPointsRelator class >> returnType [
	^ AodType constraint
]

{ #category : #generated }
AodListEqualPointsRelator >> acceptVisitor: aVisitor [
  ^aVisitor visitListEqualAnchorsRelator: self
]
