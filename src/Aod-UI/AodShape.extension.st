Extension { #name : #AodShape }

{ #category : #'*Aod-UI' }
AodShape >> applyPropertiesTo: anElement [
	self propertyAt: #color ifAbsentPut: [ Color random ].
	
	self propertiesDo: [ :p | p applyOnElement: anElement ].
	
	announcer weak
		when: AodShapeUpdated send: #aodModelUpdated to: anElement
]

{ #category : #'*Aod-UI' }
AodShape >> asElement [
	self subclassResponsibility
]
