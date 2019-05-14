Class {
	#name : #AodBaseNodeVisitor,
	#superclass : #SmaCCParseNodeVisitor,
	#category : #'Aod-Compiler-Generated'
}

{ #category : #generated }
AodBaseNodeVisitor >> visitActorExpression: anActorExpression [
	^ self visitValue: anActorExpression
]

{ #category : #generated }
AodBaseNodeVisitor >> visitActorReference: anActorReference [
	^ self visitReference: anActorReference
]

{ #category : #generated }
AodBaseNodeVisitor >> visitAddOperator: anAddOperator [
	^ self visitBinaryOperator: anAddOperator
]

{ #category : #generated }
AodBaseNodeVisitor >> visitArgumentList: anArgumentList [
	^ self visitBase: anArgumentList
]

{ #category : #generated }
AodBaseNodeVisitor >> visitBase: aBase [
	^ self visitSmaCCParseNode: aBase
]

{ #category : #generated }
AodBaseNodeVisitor >> visitBasicActorReference: aBasicActorReference [
	^ self visitBase: aBasicActorReference
]

{ #category : #generated }
AodBaseNodeVisitor >> visitBinaryOperator: aBinaryOperator [
	^ self visitLinearExpression: aBinaryOperator
]

{ #category : #generated }
AodBaseNodeVisitor >> visitConstraint: aConstraint [
	^ self visitBase: aConstraint
]

{ #category : #generated }
AodBaseNodeVisitor >> visitDivOperator: aDivOperator [
	^ self visitBinaryOperator: aDivOperator
]

{ #category : #generated }
AodBaseNodeVisitor >> visitDotExpression: aDotExpression [
	^ self visitValue: aDotExpression
]

{ #category : #generated }
AodBaseNodeVisitor >> visitEqRelator: anEqRelator [
	^ self visitRelator: anEqRelator
]

{ #category : #generated }
AodBaseNodeVisitor >> visitIdReference: anIdReference [
	^ self visitShapeReference: anIdReference
]

{ #category : #generated }
AodBaseNodeVisitor >> visitIdentifier: anIdentifier [
	^ self visitBase: anIdentifier
]

{ #category : #generated }
AodBaseNodeVisitor >> visitInteger: anInteger [
	^ self visitValue: anInteger
]

{ #category : #generated }
AodBaseNodeVisitor >> visitIntegerLiteral: anIntegerLiteral [
	^ self visitBase: anIntegerLiteral
]

{ #category : #generated }
AodBaseNodeVisitor >> visitLeqRelator: aLeqRelator [
	^ self visitRelator: aLeqRelator
]

{ #category : #generated }
AodBaseNodeVisitor >> visitLinearExpression: aLinearExpression [
	^ self visitValue: aLinearExpression
]

{ #category : #generated }
AodBaseNodeVisitor >> visitList: aList [
	^ self visitBase: aList
]

{ #category : #generated }
AodBaseNodeVisitor >> visitMulOperator: aMulOperator [
	^ self visitBinaryOperator: aMulOperator
]

{ #category : #generated }
AodBaseNodeVisitor >> visitNameReference: aNameReference [
	^ self visitShapeReference: aNameReference
]

{ #category : #generated }
AodBaseNodeVisitor >> visitPoint: aPoint [
	^ self visitBase: aPoint
]

{ #category : #generated }
AodBaseNodeVisitor >> visitProgram: aProgram [
	^ self visitBase: aProgram
]

{ #category : #generated }
AodBaseNodeVisitor >> visitReference: aReference [
	^ self visitValue: aReference
]

{ #category : #generated }
AodBaseNodeVisitor >> visitRelator: aRelator [
	^ self visitBase: aRelator
]

{ #category : #generated }
AodBaseNodeVisitor >> visitShapeReference: aShapeReference [
	^ self visitReference: aShapeReference
]

{ #category : #generated }
AodBaseNodeVisitor >> visitSpan: aSpan [
	^ self visitBase: aSpan
]

{ #category : #generated }
AodBaseNodeVisitor >> visitStrength: aStrength [
	^ self visitBase: aStrength
]

{ #category : #generated }
AodBaseNodeVisitor >> visitSubOperator: aSubOperator [
	^ self visitBinaryOperator: aSubOperator
]

{ #category : #generated }
AodBaseNodeVisitor >> visitValue: aValue [
	^ self visitBase: aValue
]
