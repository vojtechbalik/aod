Extension { #name : #AodLineEndHandle }

{ #category : #'*Aod-UI' }
AodLineEndHandle >> layoutPosition [
	^ self value - model layoutPosition
]
