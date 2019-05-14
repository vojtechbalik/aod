Class {
	#name : #AodCommandSuccess,
	#superclass : #AodCommandResult,
	#category : #'Aod-Command'
}

{ #category : #'as yet unclassified' }
AodCommandSuccess >> resultOn: s [
	s << 'success'
]
