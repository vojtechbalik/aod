Extension { #name : #Point }

{ #category : #'*Aod' }
Point >> aodType [
	^ AodType point
]

{ #category : #'*Aod' }
Point >> aodWriteOn: aStream [
	aStream << 'point('.
	x aodWriteOn: aStream.
	aStream << $, << Character space.
	y aodWriteOn: aStream.
	aStream << $)
]
