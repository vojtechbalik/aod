Class {
	#name : #AodActorPrinterTest,
	#superclass : #TestCase,
	#instVars : [
		'builder',
		'printer'
	],
	#category : #'Aod-Tests'
}

{ #category : #running }
AodActorPrinterTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	builder := AodConstraintBuilder default.
	printer := AodActorPrinter new
]

{ #category : #tests }
AodActorPrinterTest >> testReferences [
	| input generated expected shape1 shape2 idRef nameRef |
	shape1 := AodRectangle new.
	shape1 propertyAt: #id put: 1.
	shape2 := AodRectangle new.
	shape2 propertyAt: #id put: 2.
	"name is preferred to id when printing out"
	shape2 propertyAt: #name put: 'second'.
	idRef := 3 asAodReference.
	nameRef := 'fourth' asAodReference.
	
	input := builder
					shape: shape1;
				push: AodBoxLeftTransformer;
					shape: shape2;
				push: AodBoxWidthTransformer;
			push: AodAnchorAddOperator;
					shape: idRef;
				push: AodBoxTopTransformer;
					shape: nameRef;
				push: AodBoxHeightTransformer;
			push: AodAnchorSubOperator;
		push: AodAnchorEqRelator;
		build.

	expected := 
'#1.left + @second.width = #3.top - @fourth.height'.
	
	generated := String streamContents: [ :s | 
		printer stream: s.
		input relator acceptVisitor: printer ].
	
	
	self assert: generated equals: expected
]

{ #category : #tests }
AodActorPrinterTest >> testSimple [
	| input generated expected |
	input := builder 
				shape: 1 asAodReference;
				shape: 2 asAodReference;
			push: AodLeftOfRelator;
			build.
			
	expected := 'isLeftOf(#1, #2)'.
	
	generated := String streamContents: [ :s | 
		printer stream: s.
		input relator acceptVisitor: printer ].
	
	self assert: generated equals: expected
]
