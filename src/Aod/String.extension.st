Extension { #name : #String }

{ #category : #'*Aod' }
String >> asAodReference [
	^ AodNameReference new
		name: self;
		yourself
]
