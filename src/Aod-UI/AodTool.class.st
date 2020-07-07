Class {
	#name : #AodTool,
	#superclass : #BlEventListener,
	#traits : 'TBlEventTarget',
	#classTraits : 'TBlEventTarget classTrait',
	#instVars : [
		'eventDispatcher'
	],
	#category : #'Aod-UI-Bloc'
}

{ #category : #accessing }
AodTool class >> label [
	"answer string representing what the tool should be labelled in GUI"
	^ self subclassResponsibility 
]

{ #category : #accessing }
AodTool >> eventDispatcher [
	^ eventDispatcher
]

{ #category : #initialization }
AodTool >> initialize [
	super initialize.
	
	eventDispatcher := BlDirectEventDispatcher on: self
]

{ #category : #accessing }
AodTool >> label [
	^ self class label
]
