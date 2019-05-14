Class {
	#name : #AodCommandFailure,
	#superclass : #AodCommandResult,
	#category : #'Aod-Command'
}

{ #category : #'as yet unclassified' }
AodCommandFailure >> resultOn: s [
	s << 'failure'
]
