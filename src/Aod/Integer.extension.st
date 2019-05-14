Extension { #name : #Integer }

{ #category : #'*Aod' }
Integer >> asAodReference [
	^ AodIdReference new 	
		id: self;
		yourself
]
