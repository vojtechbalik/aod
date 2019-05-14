Extension { #name : #BlElement }

{ #category : #'*Aod-UI' }
BlElement >> aodModel [
	"if this gets too complex, aodController to encapsulate all the related behaviour"
	^ self userData at: #aodModel ifAbsent: nil
]

{ #category : #'*Aod-UI' }
BlElement >> aodModel: aModel [
	"if this gets too complex, aodController to encapsulate all the related behaviour"
	self userData at: #aodModel put: aModel
]

{ #category : #'*Aod-UI' }
BlElement >> aodModelUpdated [
	self aodModel applyPropertiesTo: self
]

{ #category : #'*Aod-UI' }
BlElement >> isAodSelectable [
	^ true
]

{ #category : #'*Aod-UI' }
BlElement >> vessel [
	^ self constraints aod vessel
]
