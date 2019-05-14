Extension { #name : #AodLine }

{ #category : #'*Aod-UI' }
AodLine >> applyPropertiesTo: anElement [
	super applyPropertiesTo: anElement.
	
	"line has no background visually in Bloc, only border, so color has to be set differently"
	anElement border: (anElement border copyWithPaint: (self propertyAt: AodColorProperty) value)
]

{ #category : #'*Aod-UI' }
AodLine >> asElement [
	| result |
	result := BlLineElement new
		fromAnchor: (AodNotifyingAbsolutePositionAnchor position: 0@0);
		toAnchor: (AodNotifyingAbsolutePositionAnchor position: 40@40);
		border: (BlBorder builder width: 4; build);
		aodModel: self;
		yourself.
	self applyPropertiesTo: result.
	^ result
]
