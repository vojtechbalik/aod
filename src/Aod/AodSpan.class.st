Class {
	#name : #AodSpan,
	#superclass : #AodDataType,
	#instVars : [
		'start',
		'length'
	],
	#category : #'Aod-Language-Core'
}

{ #category : #enumerating }
AodSpan >> anchorsDo: aBlock [
	start anchorsDo: aBlock.
	length anchorsDo: aBlock
]

{ #category : #converting }
AodSpan >> asHandle [
	"this might be useful to use to make visual editing of constraints possible"
]

{ #category : #accessing }
AodSpan >> length [
	^ length
]

{ #category : #accessing }
AodSpan >> length: anObject [
	length := anObject
]

{ #category : #accessing }
AodSpan >> start [
	^ start
]

{ #category : #accessing }
AodSpan >> start: anObject [
	start := anObject
]
