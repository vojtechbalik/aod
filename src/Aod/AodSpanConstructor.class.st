Class {
	#name : #AodSpanConstructor,
	#superclass : #AodActor,
	#category : #'Aod-Language-Actor'
}

{ #category : #arguments }
AodSpanConstructor class >> argumentCount [
	^ 2
]

{ #category : #arguments }
AodSpanConstructor class >> argumentTypes [
	^ { AodType anchor . AodType anchor }
]

{ #category : #generating }
AodSpanConstructor class >> expandOn: aGenerator [
	| start length |
	length := aGenerator pop.
	start := aGenerator pop.
	
	aGenerator raw: (AodSpan new 
		start: start;
		length: length;
		yourself)
]

{ #category : #accessing }
AodSpanConstructor class >> identifier [
	^ #span
]

{ #category : #accessing }
AodSpanConstructor class >> returnType [
	^ AodType span
]

{ #category : #generated }
AodSpanConstructor >> acceptVisitor: aVisitor [
  ^aVisitor visitSpanConstructor: self
]
