Class {
	#name : #AodList,
	#superclass : #AodType,
	#category : #'Aod-Language-Core'
}

{ #category : #'instance creation' }
AodList class >> new [
	self error: 'I am not to be instantiated. Use any SequenceableCollection.'
]
