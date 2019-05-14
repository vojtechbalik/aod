Class {
	#name : #AodStayRelator,
	#superclass : #AodRelator,
	#category : #'Aod-Language-Actor'
}

{ #category : #arguments }
AodStayRelator class >> argumentCount [
	^ 1
]

{ #category : #arguments }
AodStayRelator class >> argumentTypes [
	^ { AodType data }
]

{ #category : #generating }
AodStayRelator class >> expandOn: aGenerator [
	aGenerator generateStay
]

{ #category : #accessing }
AodStayRelator class >> identifier [
	^ #stay
]

{ #category : #accessing }
AodStayRelator class >> returnType [
	^ AodType stayConstraint
]

{ #category : #generated }
AodStayRelator >> acceptVisitor: aVisitor [
  ^aVisitor visitStayRelator: self
]
