Class {
	#name : #AodConstant,
	#superclass : #AodAnchor,
	#category : #'Aod-Language-Core'
}

{ #category : #'instance creation' }
AodConstant class >> new [
	self error: 'plain Pharo numbers serve as AodConstants, I only exist to model the type. Do not instantiate me'
]
