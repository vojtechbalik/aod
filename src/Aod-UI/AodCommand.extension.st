Extension { #name : #AodCommand }

{ #category : #'*Aod-UI' }
AodCommand >> asIssueEvent [
	^ AodCommandIssueEvent new
		command: self;
		yourself
]
