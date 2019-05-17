Extension { #name : #AodHandle }

{ #category : #'*Aod-UI' }
AodHandle >> asElement [
	^ self elementClass new
		handle: self;
		yourself
]
