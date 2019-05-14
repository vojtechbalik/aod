Class {
	#name : #AodAnchorRelator,
	#superclass : #AodRelator,
	#category : #'Aod-Language-Relators'
}

{ #category : #accessing }
AodAnchorRelator class >> argumentCount [
	^ 2
]

{ #category : #accessing }
AodAnchorRelator class >> argumentTypes [
	^ {AodType anchor. AodType anchor}
]

{ #category : #testing }
AodAnchorRelator class >> isAtomic [
	^ true
]

{ #category : #accessing }
AodAnchorRelator class >> returnType [
	^ AodType constraint
]

{ #category : #generated }
AodAnchorRelator >> acceptVisitor: aVisitor [
  ^aVisitor visitAnchorRelator: self
]
