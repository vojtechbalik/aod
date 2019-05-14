Class {
	#name : #AodActorPrinter,
	#superclass : #Object,
	#traits : 'TAodActorVisitor',
	#classTraits : 'TAodActorVisitor classTrait',
	#instVars : [
		'stream'
	],
	#category : #'Aod-Language-Support'
}

{ #category : #accessing }
AodActorPrinter >> stream [
	^ stream
]

{ #category : #accessing }
AodActorPrinter >> stream: anObject [
	stream := anObject
]

{ #category : #generated }
AodActorPrinter >> visitActor: anActor [
	stream 
		<< anActor identifier
		<< $(.
	
	anActor argumentCount = 0
		ifTrue: [ 
			stream << $).
			^ self ].	
	
	1 to: anActor argumentCount - 1 do: [ :index |
		(anActor argumentAt: index) acceptVisitor: self.
		stream << $, << Character space ].
	
	(anActor argumentAt: anActor argumentCount) acceptVisitor: self.
	
	stream << $)
]

{ #category : #generated }
AodActorPrinter >> visitAnchorAddOperator: anActor [
	(anActor argumentAt: 1) acceptVisitor: self.
	stream << Character space << $+ << Character space.
	(anActor argumentAt: 2) acceptVisitor: self
]

{ #category : #generated }
AodActorPrinter >> visitAnchorDivOperator: anActor [
	(anActor argumentAt: 1) acceptVisitor: self.
	stream << Character space << $/ << Character space.
	(anActor argumentAt: 2) acceptVisitor: self
]

{ #category : #generated }
AodActorPrinter >> visitAnchorEqRelator: anActor [
	(anActor argumentAt: 1) acceptVisitor: self.
	stream << Character space << $= << Character space.
	(anActor argumentAt: 2) acceptVisitor: self
]

{ #category : #generated }
AodActorPrinter >> visitAnchorLeqRelator: anActor [
	(anActor argumentAt: 1) acceptVisitor: self.
	stream << Character space << $< << $= << Character space.
	(anActor argumentAt: 2) acceptVisitor: self
]

{ #category : #generated }
AodActorPrinter >> visitAnchorMulOperator: anActor [
	(anActor argumentAt: 1) acceptVisitor: self.
	stream << Character space << $* << Character space.
	(anActor argumentAt: 2) acceptVisitor: self
]

{ #category : #generated }
AodActorPrinter >> visitAnchorSubOperator: anActor [
	(anActor argumentAt: 1) acceptVisitor: self.
	stream << Character space << $- << Character space.
	(anActor argumentAt: 2) acceptVisitor: self
]

{ #category : #generated }
AodActorPrinter >> visitDataBinding: anActor [
	anActor data aodWriteOn: stream
]

{ #category : #generated }
AodActorPrinter >> visitListConstructor: anActor [
	stream << $[.
	"list always has atleast one element"
	(anActor argumentAt: 1) acceptVisitor: self.
	stream << $, << Character space.
	
	2 to: anActor arguments size do: [ :index |
		stream << $, << Character space.
		(anActor argumentAt: index) acceptVisitor: self ].
	
	stream << $]
  
]

{ #category : #generated }
AodActorPrinter >> visitTransformer: anActor [
	(anActor argumentAt: 1) acceptVisitor: self.
	stream << $. << anActor identifier
]
