"
compatible with any type, i.e. acts as a subtype of any type
"
Class {
	#name : #AodPlaceholderType,
	#superclass : #AodType,
	#category : #'Aod-Language-Core'
}

{ #category : #'as yet unclassified' }
AodPlaceholderType class >> isTypeCompatibleWith: other [
	^ true
]

{ #category : #'instance creation' }
AodPlaceholderType class >> new [
	self error: 'I am not meant to be instantiated'
]
