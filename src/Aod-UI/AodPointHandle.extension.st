Extension { #name : #AodPointHandle }

{ #category : #'*Aod-UI' }
AodPointHandle >> asElement [
	^ super asElement
		look: AodHandleLook + AodCircleHandleLook;
		yourself
]

{ #category : #'*Aod-UI' }
AodPointHandle >> elementClass [
	^ AodPointHandleElement
]
