Class {
	#name : #AodPointNode,
	#superclass : #AodBaseNode,
	#instVars : [
		'xValueNode',
		'yValueNode'
	],
	#category : #'Aod-Compiler'
}

{ #category : #generated }
AodPointNode >> acceptVisitor: aBaseVisitor [
	^ aBaseVisitor visitPoint: self
]

{ #category : #generated }
AodPointNode >> nodeVariables [
	^ #(#xValueNode #yValueNode)
]

{ #category : #generated }
AodPointNode >> xValueNode [
	^ xValueNode
]

{ #category : #generated }
AodPointNode >> xValueNode: anAodBaseNode [
	self xValueNode notNil
		ifTrue: [ self xValueNode parent: nil ].
	xValueNode := anAodBaseNode.
	self xValueNode notNil
		ifTrue: [ self xValueNode parent: self ]
]

{ #category : #generated }
AodPointNode >> yValueNode [
	^ yValueNode
]

{ #category : #generated }
AodPointNode >> yValueNode: anAodBaseNode [
	self yValueNode notNil
		ifTrue: [ self yValueNode parent: nil ].
	yValueNode := anAodBaseNode.
	self yValueNode notNil
		ifTrue: [ self yValueNode parent: self ]
]
