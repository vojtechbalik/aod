Class {
	#name : #AodCassowaryConstraintGeneratorTest,
	#superclass : #TestCase,
	#instVars : [
		'generator',
		'builder',
		'b1',
		'b2',
		'solver',
		'b3',
		'generated'
	],
	#category : #'Aod-Tests'
}

{ #category : #running }
AodCassowaryConstraintGeneratorTest >> setUp [
	| block |
	super setUp.
	
	generator := AodCassowaryConstraintGenerator new.
	generator strengthLevels: AodStrengthDeclarations defaultNLevels.
	builder := AodConstraintBuilder default.
	b1 := AodBoxVessel new.
	b2 := AodBoxVessel new.
	b3 := AodBoxVessel new.
	
	
	block := [ :anchor | anchor impl: AodCassowaryAnchorImpl new ].
	b1 anchorsDo: block.
	b2 anchorsDo: block.
	b3 anchorsDo: block.
]

{ #category : #tests }
AodCassowaryConstraintGeneratorTest >> testComposability [
	| input |
	input := builder
							data: b1;
						push: AodBoxHorizontalTransformer;
					push: AodSpanMiddleTransformer;
							data: b2;
						push: AodBoxHorizontalTransformer;
					push: AodSpanMiddleTransformer;
				push: AodSpanConstructor;
			push: AodSpanLengthTransformer;
			data: 50;
		push: AodAnchorLeqRelator;
		build.
		
	generated := generator generate: input.
]

{ #category : #tests }
AodCassowaryConstraintGeneratorTest >> testComposite [
	| constraint expected generated |
	constraint := builder
			data: 5@5;
			data: b1 extent;
		push: AodPointLeqRelator;
		build.
		
	generated := generator generate: constraint.
	
	expected := { 
		5 cnLEQ: b1 extent x impl.
		5 cnLEQ: b1 extent y impl }.
		
	self assert: generated size equals: expected size.
	
	1 to: expected size do: [ :index |
		self assert: ((generated at: index) testEqual: (expected at: index)) ]
]

{ #category : #tests }
AodCassowaryConstraintGeneratorTest >> testGenerate [
	| generated expected |
	generated := builder
				left: b1;
					width: b1;
					height: b1;
				sub;
			add;
					left: b1;
					data: 4;
				div;
					data: 2;
					data: 3;
				mul;
			add;
		leq;
		build.
		
	generated := generator generate: generated.
	self assert: generated size equals: 1.
	generated := generated first.
		
	expected := b1 position x impl + (b1 extent x impl - b1 extent y impl) cnLEQ: (b1 position x impl / 4) + (2 * 3).
	
	self assert: (generated testEqual: expected)
	
				
					
]

{ #category : #tests }
AodCassowaryConstraintGeneratorTest >> testList [ 
	| input generated expected |
	input := builder
					data: b1;
					data: b2;
					data: b3;
					length: 3;
				push: AodListConstructor;
				actor: AodBoxHorizontalTransformer;
			push: AodListMapOperator;
		push: AodListSequencedRelator;
		build.
		
	generated := generator generate: input.
	
	expected := { 
		b1 position x impl + b1 extent x impl cnLEQ: b2 position x impl.
		b2 position x impl + b2 extent x impl cnLEQ: b3 position x impl }.
		
	self assert: generated size equals: 2.
	generated with: expected do: [ :a :b | self assert: (a testEqual: b) ]
]

{ #category : #tests }
AodCassowaryConstraintGeneratorTest >> testNonLinear1 [
	| constraint |
	constraint := builder
				data: 1;
				left: b1;
			div;
			data: 2;
		eq;
		build.
		
	self should: [ generator generate: constraint ] raise: Error
]

{ #category : #tests }
AodCassowaryConstraintGeneratorTest >> testNonLinear2 [
	| constraint |
	constraint := builder
				width: b1;
				left: b1;
			mul;
			data: 0;
		eq;
		build.
		
	self should: [ generator generate: constraint ] raise: Error
]

{ #category : #tests }
AodCassowaryConstraintGeneratorTest >> testNotExpanded [
	| constraint expected generated |
	constraint := builder
			data: b1;
			data: b2;
		push: AodLeftOfRelator;
		build.
	
	expected := b1 position x impl + b1 extent x impl cnLEQ: b2 position x impl.
	
	generated := generator generate: constraint.
	self assert: generated size equals: 1.
	generated := generated first.
	
	self assert: (generated testEqual: expected)
]

{ #category : #tests }
AodCassowaryConstraintGeneratorTest >> testReusable [
	| constraint1 constraint2 expected generated |
	constraint1 := builder
			data: 0@0;
				data: b1;
			push: AodBoxPositionTransformer;
		push: AodPointLeqRelator;
		build.
		
	constraint2 := builder
			data: b1;
			data: b2;
		push: AodLeftOfRelator;
		build.
		
	expected := { 
		0 cnLEQ: b1 position x impl.
		0 cnLEQ: b1 position y impl }.
	
	generated := generator generate: constraint1.
	
	1 to: expected size do: [ :index |
		self assert: ((generated at: index) testEqual: (expected at: index)) ].
	
	expected := { b1 position x impl + b1 extent x impl cnLEQ: b2 position x impl }.
	
	generated := generator generate: constraint2.
	
	1 to: expected size do: [ :index |
		self assert: ((generated at: index) testEqual: (expected at: index)) ].
	
]

{ #category : #tests }
AodCassowaryConstraintGeneratorTest >> testStrength [
	| constraint generated |
	constraint := builder
			data: b1;
			data: b2;
		push: AodLeftOfRelator;
		strengthLevel: 2;
		build.
	
	generated := generator generate: constraint.
	self assert: generated size equals: 1.
	generated := generated first.
	
	self assert: generated strength equals: ClStrength medium
]
