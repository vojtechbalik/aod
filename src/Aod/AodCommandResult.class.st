Class {
	#name : #AodCommandResult,
	#superclass : #AodDrawingAnnouncement,
	#instVars : [
		'command'
	],
	#category : #'Aod-Command'
}

{ #category : #accessing }
AodCommandResult >> command [
	^ command
]

{ #category : #accessing }
AodCommandResult >> command: anObject [
	command := anObject
]

{ #category : #printing }
AodCommandResult >> printString [
	^ String streamContents: [ :s |
		s << self command class printString.
		s << Character space.
		self resultOn: s.
		command message ifNotNil: [ 
			s << $: << Character space << command message ] ]
]

{ #category : #'as yet unclassified' }
AodCommandResult >> resultOn: s [
	self subclassResponsibility
]
