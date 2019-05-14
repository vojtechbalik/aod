"
my job is to transform a Program/Constraint into AodConstraint expressed using Actors
"
Class {
	#name : #AodProgramAstCompiler,
	#superclass : #AodProgramAstVisitor,
	#instVars : [
		'builder',
		'program'
	],
	#category : #'Aod-Compiler-Visitors'
}

{ #category : #'as yet unclassified' }
AodProgramAstCompiler >> fetchActor: aString [
	^ (AodActor lookup: aString)
		ifEmpty: [ AodDSLError signal: 'no actor under identifier ', aString ]
]

{ #category : #initialization }
AodProgramAstCompiler >> initialize [
	super initialize.

	builder := AodConstraintBuilder default.
	builder 
		onFailBlock: [ self error: 'failure building a constraint' ]
]

{ #category : #generated }
AodProgramAstCompiler >> visitActorExpression: aNode [
	aNode argumentListNode acceptVisitor: self.
	builder push: (aNode actorReferenceNode acceptVisitor: self)
	
]

{ #category : #generated }
AodProgramAstCompiler >> visitActorReference: aNode [
	builder actor: (aNode actorReferenceNode acceptVisitor: self)
]

{ #category : #visiting }
AodProgramAstCompiler >> visitAddOperator: aNode [
	aNode leftNode acceptVisitor: self.
	aNode rightNode acceptVisitor: self.
	builder push: AodAnchorAddOperator
]

{ #category : #generated }
AodProgramAstCompiler >> visitArgumentList: aNode [
	aNode argumentNodes do: [ :arg | arg acceptVisitor: self ]
]

{ #category : #generated }
AodProgramAstCompiler >> visitBasicActorReference: aNode [
	| actors |
	actors := self fetchActor: (aNode identifierNode acceptVisitor: self).
	self assert: actors size = 1 description: 'overloading actors not supported yet'.
	^ actors first
]

{ #category : #generated }
AodProgramAstCompiler >> visitConstraint: aNode [
	builder reset.
	
	aNode strengthNode
		ifNil: [ builder strengthLevel: 0 ]
		ifNotNil: [ :node | node acceptVisitor: self ].
	aNode relationNode acceptVisitor: self.
	
	builder validate
		ifFalse: [ AodDSLError signal: 'invalid constraint' ].
	
	^ builder build
	
]

{ #category : #visiting }
AodProgramAstCompiler >> visitDivOperator: aNode [
	aNode leftNode acceptVisitor: self.
	aNode rightNode acceptVisitor: self.
	builder push: AodAnchorDivOperator
]

{ #category : #generated }
AodProgramAstCompiler >> visitDotExpression: aNode [
	aNode valueNode acceptVisitor: self.
	builder push: (aNode actorReferenceNode acceptVisitor: self)
]

{ #category : #visiting }
AodProgramAstCompiler >> visitEqRelator: aNode [
	aNode leftNode acceptVisitor: self.
	aNode rightNode acceptVisitor: self.
	builder push: AodAnchorEqRelator
]

{ #category : #visiting }
AodProgramAstCompiler >> visitIdReference: aNode [
	| id |
	id := aNode identifierNode acceptVisitor: self.
	builder shape: id asAodReference
]

{ #category : #visiting }
AodProgramAstCompiler >> visitInteger: aNode [
	| value |
	value := aNode integerLiteralNode acceptVisitor: self.
	
	builder data: value
]

{ #category : #visiting }
AodProgramAstCompiler >> visitLeqRelator: aNode [
	aNode leftNode acceptVisitor: self.
	aNode rightNode acceptVisitor: self.
	builder push: AodAnchorLeqRelator
]

{ #category : #generated }
AodProgramAstCompiler >> visitList: aList [
	aList argumentListNode acceptVisitor: self.
	
	"aList argumentListNode argumentNodes isNotEmpty
		ifFalse: [ AodDSLError signal: 'cannot create an empty list' ]."
	
	builder
			length: aList argumentListNode argumentNodes size;
		push: AodListConstructor
		
	
]

{ #category : #visiting }
AodProgramAstCompiler >> visitMulOperator: aNode [
	aNode leftNode acceptVisitor: self.
	aNode rightNode acceptVisitor: self.
	builder push: AodAnchorMulOperator
]

{ #category : #visiting }
AodProgramAstCompiler >> visitNameReference: aNode [
	| name |
	name := aNode identifierNode acceptVisitor: self.
	builder shape: name asAodReference
]

{ #category : #generated }
AodProgramAstCompiler >> visitProgram: aNode [
	| constraints |
	program := AodProgram new.
	
	constraints := aNode constraintNodes collect: [ :c | 
		c acceptVisitor: self ].
	
	program constraints: constraints.
	
	^ program
]

{ #category : #generated }
AodProgramAstCompiler >> visitSpan: aNode [	
	"span is defined as a start and a length, we need to build length from start and end"
			aNode startValueNode acceptVisitor: self.
				aNode endValueNode acceptVisitor: self.
				aNode startValueNode acceptVisitor: self.
	builder
			push: AodAnchorSubOperator;
		push: AodSpanConstructor
]

{ #category : #generated }
AodProgramAstCompiler >> visitStrength: aNode [
	| name |
	name := aNode identifierNode acceptVisitor: self.
	builder strengthName: name
]

{ #category : #visiting }
AodProgramAstCompiler >> visitSubOperator: aNode [
	aNode leftNode acceptVisitor: self.
	aNode rightNode acceptVisitor: self.
	builder push: AodAnchorSubOperator
]
