Class {
	#name : #AodDataBinding,
	#superclass : #AodActor,
	#instVars : [
		'data'
	],
	#category : #'Aod-Language-Actor'
}

{ #category : #arguments }
AodDataBinding class >> argumentCount [
	^ 0
]

{ #category : #arguments }
AodDataBinding class >> argumentTypes [
	^ #()
]

{ #category : #'as yet unclassified' }
AodDataBinding class >> bind: data [
	^ self new 
		data: data;
		yourself 
]

{ #category : #accessing }
AodDataBinding class >> returnType [
	self error: 'cannot tell'
]

{ #category : #comparing }
AodDataBinding >> = other [
	^ super = other and: [ data = other data ]
]

{ #category : #generated }
AodDataBinding >> acceptVisitor: aVisitor [
  ^aVisitor visitDataBinding: self
]

{ #category : #accessing }
AodDataBinding >> data [
	^ data
]

{ #category : #accessing }
AodDataBinding >> data: anObject [
	data := anObject
]

{ #category : #accessing }
AodDataBinding >> returnType [
	^ data aodType
]
