Extension { #name : #AodRectangle }

{ #category : #'*Aod-UI' }
AodRectangle >> asElement [
	| result |
	result := BlElement new
		geometry: BlRectangle new;
		aodModel: self;
		yourself.
	self applyPropertiesTo: result.
	^ result
]
