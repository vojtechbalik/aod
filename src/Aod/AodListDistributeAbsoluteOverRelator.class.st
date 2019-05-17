Class {
	#name : #AodListDistributeAbsoluteOverRelator,
	#superclass : #AodListRelator,
	#category : #'Aod-Language-Relators'
}

{ #category : #arguments }
AodListDistributeAbsoluteOverRelator class >> argumentCount [
	^ 2
]

{ #category : #arguments }
AodListDistributeAbsoluteOverRelator class >> argumentTypes [
	^ { AodType list . AodType span }
]

{ #category : #generating }
AodListDistributeAbsoluteOverRelator class >> expandOn: aGenerator [
	| list span |
	span := aGenerator pop.
	list := aGenerator pop.
	
	self assert: list size >= 2.
	
	"the first anchor is equal to span's start"
	aGenerator
			raw: list first;
				raw: span;
			push: AodSpanStartTransformer;
		push: AodAnchorEqRelator.
		
	"the last anchor is equal to span's end"
	aGenerator
			raw: list last;
				raw: span;
			push: AodSpanEndTransformer;
		push: AodAnchorEqRelator.
	
	list size < 3
		ifTrue: [ ^ self ].	
		
	"anchors in between: a_i = span.start + (i-1)*span.length/(n-1)"
	2 to: list size - 1 do: [ :index |
		aGenerator
				raw: (list at: index);
						raw: span;
					push: AodSpanStartTransformer;
								raw: span;
							push: AodSpanLengthTransformer;
							raw: list size - 1;
						push: AodAnchorDivOperator;
						raw: index - 1;
					push: AodAnchorMulOperator;
				push: AodAnchorAddOperator;
			push: AodAnchorEqRelator ]
					
				
			
		
	




]

{ #category : #accessing }
AodListDistributeAbsoluteOverRelator class >> identifier [
	^ #distribute_absolute_over
]

{ #category : #accessing }
AodListDistributeAbsoluteOverRelator class >> returnType [
	^ AodType constraint
]

{ #category : #generated }
AodListDistributeAbsoluteOverRelator >> acceptVisitor: aVisitor [
  ^aVisitor visitListDistributeAbsoluteRelator: self
]
