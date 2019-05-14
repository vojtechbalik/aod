Extension { #name : #Number }

{ #category : #'*Aod' }
Number >> aodType [
	^ AodType constant
]

{ #category : #'*Aod' }
Number >> aodWriteOn: aStream [
	aStream << self asInteger
]
