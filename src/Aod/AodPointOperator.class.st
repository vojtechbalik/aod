Class {
	#name : #AodPointOperator,
	#superclass : #AodOperator,
	#category : #'Aod-Language-Operators'
}

{ #category : #arguments }
AodPointOperator class >> argumentCount [
	^ 2
]

{ #category : #arguments }
AodPointOperator class >> argumentTypes [
	^ { AodType point . AodType point }
]

{ #category : #accessing }
AodPointOperator class >> returnType [
	^ AodType point
]

{ #category : #generated }
AodPointOperator >> acceptVisitor: aVisitor [
  ^aVisitor visitPointOperator: self
]
