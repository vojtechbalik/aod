Extension { #name : #AodPointHandle }

{ #category : #'*Aod - UI' }
AodPointHandle >> asElement [
	^ super asElement
		look: AodPointHandleLook;
		yourself
]

{ #category : #'*Aod - UI' }
AodPointHandle >> elementClass [
	^ AodPointHandleElement
]
