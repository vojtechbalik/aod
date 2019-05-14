Extension { #name : #ClLinearConstraint }

{ #category : #'*Aod-Tests' }
ClLinearConstraint >> testEqual: other [
	^ self class = other class and: [ self expression = other expression ]
]
