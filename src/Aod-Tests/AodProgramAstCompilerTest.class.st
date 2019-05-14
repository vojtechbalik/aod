Class {
	#name : #AodProgramAstCompilerTest,
	#superclass : #TestCase,
	#instVars : [
		'parser',
		'compiler',
		'builder'
	],
	#category : #'Aod-Tests'
}

{ #category : #compiling }
AodProgramAstCompilerTest >> compileConstraint: aString [
	| parsed |
	parsed := parser parse: aString startingAt: parser startingStateForConstraint.
	^ parsed acceptVisitor: compiler
]

{ #category : #running }
AodProgramAstCompilerTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	parser := AodProgram parserClass.
	compiler := AodProgramAstCompiler new.
	builder := AodConstraintBuilder default.
]

{ #category : #tests }
AodProgramAstCompilerTest >> testAnchorActors [
	| input expected |
	input := 'anchorLeq(anchorAdd(1, 2), anchorAdd(3, 4))'.
	expected := builder
			data: 1;
			data: 2;
		push: AodAnchorAddOperator;
			data: 3;
			data: 4;
		push: AodAnchorAddOperator;
	push: AodAnchorLeqRelator;
	build.
	
	input := self compileConstraint: input.
	
	self assert: input equals: expected
]

{ #category : #tests }
AodProgramAstCompilerTest >> testAnchorOperators [
	| input expected |
	input := '1 + 2 <= 3 + 4'.
	expected := builder
			data: 1;
			data: 2;
		push: AodAnchorAddOperator;
			data: 3;
			data: 4;
		push: AodAnchorAddOperator;
	push: AodAnchorLeqRelator;
	build.
	
	input := self compileConstraint: input.
	
	self assert: input equals: expected
]

{ #category : #tests }
AodProgramAstCompilerTest >> testArray [
	| input expected |
	input := 'sequenced(map([#1, #2, #3], horizontal))'.
	expected := builder
				shape: 1 asAodReference;
				shape: 2 asAodReference;
				shape: 3 asAodReference;
				length: 3;
			push: AodListConstructor;
			actor: AodBoxHorizontalTransformer;
		push: AodListMapOperator;
	push: AodListSequencedRelator;
	build.
	
	input := self compileConstraint: input.
	
	self assert: input equals: expected
]

{ #category : #tests }
AodProgramAstCompilerTest >> testConnect [
	| input expected |
	input := 'connect_points(
					#1, 
					#2.center, 
					point(
						#3.horizontal.end, 
						#3.vertical.middle))'.
		
	expected := builder 
				shape: 1 asAodReference;
					shape: 2 asAodReference;
				push: AodBoxCenterTransformer;
							shape: 3 asAodReference;
						push: AodBoxHorizontalTransformer;
					push: AodSpanEndTransformer;
							shape: 3 asAodReference;
						push: AodBoxVerticalTransformer;
					push: AodSpanMiddleTransformer;
				push: AodPointConstructor;
			push: AodLineConnectPointsRelator;
			build.
	
	input := self compileConstraint: input.
	
	self assert: input equals: expected
				
				
]

{ #category : #tests }
AodProgramAstCompilerTest >> testInterweave [
	| input expected |
	input := 'interweave(map([#1, #2, #3], horizontal), isAfter)'.
	expected := builder
				shape: 1 asAodReference;
				shape: 2 asAodReference;
				shape: 3 asAodReference;
				length: 3;
			push: AodListConstructor;
			actor: AodBoxHorizontalTransformer;
		push: AodListMapOperator;
		actor: AodSpanIsAfterRelator;
	push: AodListInterweaveRelator;
	build.
	
	input := self compileConstraint: input.
	
	self assert: input equals: expected
]

{ #category : #tests }
AodProgramAstCompilerTest >> testProgram [
	| compiled expected |
	compiled := AodProgram fromText: '#1.left + #1.width <= @second.left;' asRopedText.
	
	expected := AodProgram new.
	expected constraints: { 
		builder
					shape: 1 asAodReference;
				push: AodBoxLeftTransformer;
					shape: 1 asAodReference;
				push: AodBoxWidthTransformer;
			push: AodAnchorAddOperator;
				shape: 'second' asAodReference;
			push: AodBoxLeftTransformer;
		push: AodAnchorLeqRelator;
		build }.
		
	self assert: compiled equals: expected
]
