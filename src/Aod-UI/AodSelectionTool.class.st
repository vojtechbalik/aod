"
selection tool
"
Class {
	#name : #AodSelectionTool,
	#superclass : #AodTool,
	#category : #'Aod-UI-Selection'
}

{ #category : #accessing }
AodSelectionTool class >> label [
	"answer string representing what the tool should be labelled in GUI"
	^ 'Select'
]

{ #category : #'mouse handlers' }
AodSelectionTool >> clickEvent: anEvent [
	"if clicked on something selectable, select it, if not deselect or do nothing"
	| aodModel |
	anEvent consumed: true.
	aodModel := anEvent target aodModel.
	(aodModel isKindOf: AodShape)
		ifTrue: [ anEvent currentTarget fireEvent: (AodSelectCommand on: aodModel) asIssueEvent ]
		ifFalse: [ anEvent currentTarget fireEvent: AodTryDeselectCommand new asIssueEvent ].
		
	anEvent target requestLayout
]
