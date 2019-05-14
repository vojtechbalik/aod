Class {
	#name : #AodSpanNode,
	#superclass : #AodBaseNode,
	#instVars : [
		'startValueNode',
		'endValueNode'
	],
	#category : #'Aod-Compiler'
}

{ #category : #generated }
AodSpanNode >> acceptVisitor: aBaseVisitor [
	^ aBaseVisitor visitSpan: self
]

{ #category : #generated }
AodSpanNode >> endValueNode [
	^ endValueNode
]

{ #category : #generated }
AodSpanNode >> endValueNode: anAodBaseNode [
	self endValueNode notNil
		ifTrue: [ self endValueNode parent: nil ].
	endValueNode := anAodBaseNode.
	self endValueNode notNil
		ifTrue: [ self endValueNode parent: self ]
]

{ #category : #generated }
AodSpanNode >> nodeVariables [
	^ #(#startValueNode #endValueNode)
]

{ #category : #generated }
AodSpanNode >> startValueNode [
	^ startValueNode
]

{ #category : #generated }
AodSpanNode >> startValueNode: anAodBaseNode [
	self startValueNode notNil
		ifTrue: [ self startValueNode parent: nil ].
	startValueNode := anAodBaseNode.
	self startValueNode notNil
		ifTrue: [ self startValueNode parent: self ]
]
