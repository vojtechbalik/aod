Extension { #name : #AodEllipse }

{ #category : #'*Aod-UI' }
AodEllipse >> asElement [
	| result |
	result := BlElement new
		geometry: BlEllipse new;
		aodModel: self;
		yourself.
	self applyPropertiesTo: result.
	^ result
]
