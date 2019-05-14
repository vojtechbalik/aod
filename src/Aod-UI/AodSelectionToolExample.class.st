Class {
	#name : #AodSelectionToolExample,
	#superclass : #Object,
	#category : #'Aod-UI-Examples'
}

{ #category : #example }
AodSelectionToolExample >> example [
	<gtExample>
	| canvas shape command |
	"clicks are simulated in the middle of the element, so we need to set up the elements carefuly, so that the target of the click event is the one we want"
	canvas := BlElement new
		size: 100@100.
	shape := AodRectangle new asElement.
	shape
		size: 25@25;
		relocate: 0@0.
	
	canvas addChild: shape.
	canvas addEventHandler: AodSelectionTool new.
	canvas when: AodCommandIssueEvent do: [ :e | command := e command ].

	BlSpace simulateClickOn: shape.
	self assert: command equals: (AodSelectCommand on: shape aodModel).
	command := nil.
	BlSpace simulateClickOn: canvas.
	self assert: command equals: (AodTryDeselectCommand new).
	
	^ canvas
]
