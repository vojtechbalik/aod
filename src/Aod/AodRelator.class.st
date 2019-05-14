Class {
	#name : #AodRelator,
	#superclass : #AodActor,
	#category : #'Aod-Language-Actor'
}

{ #category : #accessing }
AodRelator class >> selector [
	"so that it can never match an identifier"
	^ #'-notAnIdentifier-'
]

{ #category : #generated }
AodRelator >> acceptVisitor: aVisitor [
  ^aVisitor visitRelator: self
]
