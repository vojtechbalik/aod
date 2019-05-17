Extension { #name : #AodLineVessel }

{ #category : #'*Aod-UI' }
AodLineVessel >> aboutToLayout: anElement [
	anElement fromAnchor position: start value.
	anElement toAnchor position: end value.
]

{ #category : #'*Aod-UI' }
AodLineVessel >> layoutExtent [
	^ ((start x value max: end x value) @ (start y value max: end y value)) - self layoutPosition
]

{ #category : #'*Aod-UI' }
AodLineVessel >> layoutPosition [
	^ (start x value min: end x value) @ (start y value min: end y value)
]
