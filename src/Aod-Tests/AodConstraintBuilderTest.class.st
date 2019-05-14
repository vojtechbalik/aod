Class {
	#name : #AodConstraintBuilderTest,
	#superclass : #TestCase,
	#instVars : [
		'builder',
		'shape',
		'b1',
		'b2',
		'b3'
	],
	#category : #'Aod-Tests'
}

{ #category : #running }
AodConstraintBuilderTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	builder := AodConstraintBuilder new.
	b1 := AodBoxVessel new.
	b2 := AodBoxVessel new.
	b3 := AodBoxVessel new.
]

{ #category : #tests }
AodConstraintBuilderTest >> testList [
	self 
					assert: (builder data: b1);
					assert: (builder data: b2);
					assert: (builder data: b3);
					assert: (builder length: 3);
				assert: (builder push: AodListConstructor);
				assert: (builder actor: AodBoxHorizontalTransformer);
			assert: (builder push: AodListMapOperator);
		assert: (builder push: AodListSequencedRelator).
	
	builder build.
]

{ #category : #tests }
AodConstraintBuilderTest >> testReset [
	"test that the builder is reusable"
	self 
				assert: (builder left: b1);
				assert: (builder width: b1);
			assert: builder add;
			assert: (builder left: b2);
		assert: builder leq.
	builder build.
	
	self
			assert: (builder data: b1);
			assert: (builder data: b2);
		assert: (builder push: AodLeftOfRelator).
			
	builder build.

	self 
			assert: (builder data: b1);
			assert: (builder width: b2);
		deny: (builder push: AodLeftOfRelator);
		should: [ builder build ] raise: Error.
]

{ #category : #tests }
AodConstraintBuilderTest >> testTooFewArguments [
	self 
			assert: (builder data: b1);
		deny: (builder push: AodLeftOfRelator);
		should: [ builder build ] raise: Error.
]

{ #category : #tests }
AodConstraintBuilderTest >> testTooManyArguments [
	self 
			assert: (builder data: b1);
			assert: (builder data: b2);
		assert: (builder push: AodLeftOfRelator);
			assert: (builder data: b1);
		should: [ builder build ] raise: Error.
]

{ #category : #tests }
AodConstraintBuilderTest >> testTypeMismatch [
	self 
			assert: (builder left: b1);
			assert: (builder data: b2);
		deny: builder leq.
	self should: [ builder build ] raise: Error.
]

{ #category : #tests }
AodConstraintBuilderTest >> testValidAtomics [
	self 
				assert: (builder left: b1);
				assert: (builder width: b1);
			assert: builder add;
			assert: (builder left: b2);
		assert: builder leq.
	
	builder build
]

{ #category : #tests }
AodConstraintBuilderTest >> testValidComposed [
	self
			assert: (builder data: b1);
			assert: (builder data: b2);
		assert: (builder push: AodLeftOfRelator).
	
	builder build
]

{ #category : #tests }
AodConstraintBuilderTest >> testValidWithNumbers [
	self
			assert: (builder width: b1);
			assert: (builder data: 50);
		assert: builder eq.
		
	builder build
]

{ #category : #tests }
AodConstraintBuilderTest >> testValidWithShapes [
	| s1 s2 |
	s1 := AodRectangle new.
	s2 := AodRectangle new.
	
	self
			assert: (builder shape: s1);
			assert: (builder shape: s2);
		assert: (builder push: AodLeftOfRelator).
	
	builder build
]

{ #category : #tests }
AodConstraintBuilderTest >> testVarArg [
	| constraint |
	constraint := builder
			data: 1;
			data: 2;
			data: 3;
			length: 3;
		push: AodListConstructor.
		
	self assert: builder hasFailed not.
	self assert: builder stackTop arguments size equals: 3
]
