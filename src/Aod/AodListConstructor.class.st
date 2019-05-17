Class {
	#name : #AodListConstructor,
	#superclass : #AodConstructor,
	#category : #'Aod-Language-Actor'
}

{ #category : #arguments }
AodListConstructor class >> argumentCount [
	^ 1
]

{ #category : #arguments }
AodListConstructor class >> argumentTypes [
	^ { AodType data }
]

{ #category : #generating }
AodListConstructor class >> expandOn: aGenerator [
	| length array |
	length := aGenerator pop.
	array := Array new: length.
	
	length to: 1 by: -1 do: [ :index |
		array at: index put: aGenerator pop ].
	
	aGenerator raw: array
]

{ #category : #accessing }
AodListConstructor class >> identifier [
	^ #list
]

{ #category : #testing }
AodListConstructor class >> isVarArg [
	^ true
]

{ #category : #accessing }
AodListConstructor class >> returnType [
	^ AodType list
]

{ #category : #generated }
AodListConstructor >> acceptVisitor: aVisitor [
  ^aVisitor visitListConstructor: self
]

{ #category : #arguments }
AodListConstructor >> validateArgumentIndex: anInteger [
	self assert: (anInteger between: 1 and: arguments size).
]
