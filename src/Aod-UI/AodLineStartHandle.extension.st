Extension { #name : #AodLineStartHandle }

{ #category : #'*Aod-UI' }
AodLineStartHandle >> layoutPosition [
	^ self value - model layoutPosition
]
