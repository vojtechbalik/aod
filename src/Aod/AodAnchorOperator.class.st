Class {
	#name : #AodAnchorOperator,
	#superclass : #AodOperator,
	#category : #'Aod-Language-Operators'
}

{ #category : #accessing }
AodAnchorOperator class >> argumentCount [
	^ 2
]

{ #category : #accessing }
AodAnchorOperator class >> argumentTypes [
	^ { AodType anchor. AodType anchor }
]

{ #category : #testing }
AodAnchorOperator class >> isAtomic [
	^ true
]

{ #category : #accessing }
AodAnchorOperator class >> returnType [
	^ AodType anchor
]

{ #category : #generated }
AodAnchorOperator >> acceptVisitor: aVisitor [
  ^aVisitor visitAnchorOperator: self
]
