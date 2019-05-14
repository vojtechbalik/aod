Class {
	#name : #AodPointConstructor,
	#superclass : #AodActor,
	#category : #'Aod-Language-Actor'
}

{ #category : #arguments }
AodPointConstructor class >> argumentCount [
	^ 2
]

{ #category : #arguments }
AodPointConstructor class >> argumentTypes [
	^ { AodType anchor . AodType anchor }
]

{ #category : #generating }
AodPointConstructor class >> expandOn: aGenerator [
	| x y |
	y := aGenerator pop.
	x := aGenerator pop.
	
	aGenerator raw: (AodPoint x: x y: y)
]

{ #category : #accessing }
AodPointConstructor class >> identifier [
	^ #point
]

{ #category : #accessing }
AodPointConstructor class >> returnType [
	^ AodType point
]

{ #category : #generated }
AodPointConstructor >> acceptVisitor: aVisitor [
  ^aVisitor visitPointConstructor: self
]
