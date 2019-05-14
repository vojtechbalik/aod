Trait {
	#name : #TAodExpressionBuilder,
	#category : #'Aod-Language-Support'
}

{ #category : #adding }
TAodExpressionBuilder >> push: anActorOrActorType [
	^ anActorOrActorType pushOn: self
]
