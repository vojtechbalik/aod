Class {
	#name : #AodListDistributeAbsoluteRelator,
	#superclass : #AodListRelator,
	#category : #'Aod-Language-Relators'
}

{ #category : #arguments }
AodListDistributeAbsoluteRelator class >> argumentCount [
	^ 1
]

{ #category : #arguments }
AodListDistributeAbsoluteRelator class >> argumentTypes [
	^ { AodType list }
]

{ #category : #generating }
AodListDistributeAbsoluteRelator class >> expandOn: aGenerator [
	| array first last |
	array := aGenerator pop.
	first := array first.
	last := array last.
	
	2 to: array size do: [ :index |
		aGenerator
				raw: (array at: index);
							raw: last;
							raw: first;
						push: AodAnchorSubOperator;
						raw: array size - 1;
					push: AodAnchorDivOperator;
					raw: (array at: index - 1);
				push: AodAnchorAddOperator;
			push: AodAnchorEqRelator ]
				
]

{ #category : #accessing }
AodListDistributeAbsoluteRelator class >> identifier [
	^ #distribute_absolute
]

{ #category : #accessing }
AodListDistributeAbsoluteRelator class >> returnType [
	^ AodType constraint
]

{ #category : #generated }
AodListDistributeAbsoluteRelator >> acceptVisitor: aVisitor [
  ^aVisitor visitListDistributeAbsoluteRelator: self
]
