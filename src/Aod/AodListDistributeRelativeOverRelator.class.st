Class {
	#name : #AodListDistributeRelativeOverRelator,
	#superclass : #AodListRelator,
	#category : #'Aod-Language-Relators'
}

{ #category : #arguments }
AodListDistributeRelativeOverRelator class >> argumentCount [
	^ 2
]

{ #category : #arguments }
AodListDistributeRelativeOverRelator class >> argumentTypes [
	^ { AodType list . AodType list }
]

{ #category : #generating }
AodListDistributeRelativeOverRelator class >> expandOn: aGenerator [
	| array over |
	over := aGenerator pop.
	array := aGenerator pop.
	
	array do: [ :elem |
		aGenerator
				raw: elem;
					raw: over;
					raw: array size;
				push: AodAnchorDivOperator;
			push: AodAnchorEqRelator ]
]

{ #category : #accessing }
AodListDistributeRelativeOverRelator class >> identifier [
	^ #distribute_relative_over
]

{ #category : #accessing }
AodListDistributeRelativeOverRelator class >> returnType [
	^ AodType constraint
]

{ #category : #generated }
AodListDistributeRelativeOverRelator >> acceptVisitor: aVisitor [
  ^aVisitor visitListDistributeRelativeOverRelator: self
]
