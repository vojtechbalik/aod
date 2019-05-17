Class {
	#name : #AodConstraintBuilder,
	#superclass : #Object,
	#traits : 'TAodExpressionBuilder',
	#classTraits : 'TAodExpressionBuilder classTrait',
	#instVars : [
		'stack',
		'strength',
		'hasFailed',
		'strengthsDeclaration',
		'onFailBlock'
	],
	#category : #'Aod-Language-Support'
}

{ #category : #accessing }
AodConstraintBuilder class >> default [
	^ self new
		strengthsDeclaration: AodStrengthDeclarations default;
		yourself
]

{ #category : #'as yet unclassified' }
AodConstraintBuilder >> actor: anActorClass [
	stack addLast: (AodActorBinding bind: anActorClass).
	
	^ true
]

{ #category : #api }
AodConstraintBuilder >> add [
	^ self push: AodAnchorAddOperator
]

{ #category : #api }
AodConstraintBuilder >> build [
	| result |
	self validate
		ifFalse: [ self error: 'invalid constraint' ].
	result := self stackTop returnType new.
	
	result relator: self pop.
		
	strength 
		ifNotNil: [ :s | result strength: s ]
		ifNil: [ result strength: result defaultStrength ].
		
	self reset.
	
	^ result
]

{ #category : #accessing }
AodConstraintBuilder >> data: data [
	^ self push: (AodDataBinding bind: data)
]

{ #category : #api }
AodConstraintBuilder >> div [
	^ self push: AodAnchorDivOperator
]

{ #category : #api }
AodConstraintBuilder >> eq [
	^ self push: AodAnchorEqRelator
]

{ #category : #asserting }
AodConstraintBuilder >> fail [
	hasFailed := true.
	^ false
]

{ #category : #accessing }
AodConstraintBuilder >> hasFailed [
	^ hasFailed
]

{ #category : #accessing }
AodConstraintBuilder >> hasFailed: anObject [
	hasFailed := anObject
]

{ #category : #api }
AodConstraintBuilder >> height: anObject [
	^ self pushBoxTransformer: AodBoxHeightTransformer with: anObject
]

{ #category : #initialization }
AodConstraintBuilder >> initialize [
	super initialize.

	stack := OrderedCollection new.
	onFailBlock := [ ].
	self reset
]

{ #category : #api }
AodConstraintBuilder >> left: anObject [
	^ self pushBoxTransformer: AodBoxLeftTransformer with: anObject
]

{ #category : #accessing }
AodConstraintBuilder >> length: anInteger [
	"length for vararg actors"
	stack addLast: anInteger.
	
	^ true
]

{ #category : #api }
AodConstraintBuilder >> leq [
	^ self push: AodAnchorLeqRelator
]

{ #category : #api }
AodConstraintBuilder >> mul [
	^ self push: AodAnchorMulOperator
]

{ #category : #accessing }
AodConstraintBuilder >> onFailBlock [
	^ onFailBlock
]

{ #category : #accessing }
AodConstraintBuilder >> onFailBlock: anObject [
	onFailBlock := anObject
]

{ #category : #clipping }
AodConstraintBuilder >> pop [
	^ stack removeLast
]

{ #category : #'as yet unclassified' }
AodConstraintBuilder >> pushBoxTransformer: aTransformer with: aBox [
	^ (self data: aBox) and: [ self push: aTransformer ]
]

{ #category : #'as yet unclassified' }
AodConstraintBuilder >> pushInstance: anActor [
	"it is expected that the instance already has arguments and all set up"
	stack addLast: anActor.
	^ true
]

{ #category : #api }
AodConstraintBuilder >> pushType: anActorType [
	| args |
	args := Array new: anActorType argumentCount.
	anActorType argumentCount to: 1 by: -1 do: [ :index |
		| arg |
		stack ifEmpty: [ ^ self fail ].
		arg := self pop.
		(arg returnType isTypeCompatibleWith: (anActorType argumentTypeAt: index))
			ifFalse: [ ^ self fail ].
		args at: index put: arg ].
	
	^ self pushInstance: (anActorType arguments: args).
]

{ #category : #'as yet unclassified' }
AodConstraintBuilder >> pushVarArg: aVarArgActorClass [
	| length args |
	length := self pop.
	
	length > 0
		ifFalse: [ AodDSLError signal: 'list must have atleast one element' ].
	
	args := Array new: length.
	
	"check that arguments have the same type?"
	
	length to: 1 by: -1 do: [ :index |
		| arg |
		stack ifEmpty: [ ^ self fail ].
		arg := self pop.
		args at: index put: arg ].
	
	^ self pushInstance: (aVarArgActorClass arguments: args)
]

{ #category : #initialization }
AodConstraintBuilder >> reset [
	stack removeAll.
	strength := nil.
	hasFailed := false
]

{ #category : #accessing }
AodConstraintBuilder >> shape: aReference [
	^ self push: (AodShapeBinding bind: aReference)
]

{ #category : #accessing }
AodConstraintBuilder >> stack [
	^ stack
]

{ #category : #accessing }
AodConstraintBuilder >> stack: anObject [
	stack := anObject
]

{ #category : #accessing }
AodConstraintBuilder >> stackTop [
	^ stack last
]

{ #category : #accessing }
AodConstraintBuilder >> strength [
	^ strength
]

{ #category : #accessing }
AodConstraintBuilder >> strength: anObject [
	strength := anObject
]

{ #category : #'as yet unclassified' }
AodConstraintBuilder >> strengthLevel: anInteger [
	self assert: (anInteger between: 0 and: strengthsDeclaration nLevels).
	
	strength := AodStrength level: anInteger
]

{ #category : #'as yet unclassified' }
AodConstraintBuilder >> strengthName: aString [
	| level |
	level := strengthsDeclaration 
		named: aString 
		ifAbsent: [ AodDSLError signal: 'no strength under that name' ].
	
	self strengthLevel: level
]

{ #category : #accessing }
AodConstraintBuilder >> strengthsDeclaration [
	^ strengthsDeclaration
]

{ #category : #accessing }
AodConstraintBuilder >> strengthsDeclaration: anObject [
	strengthsDeclaration := anObject
]

{ #category : #api }
AodConstraintBuilder >> sub [
	^ self push: AodAnchorSubOperator
]

{ #category : #api }
AodConstraintBuilder >> top: anObject [
	^ self pushBoxTransformer: AodBoxTopTransformer with: anObject
]

{ #category : #accessing }
AodConstraintBuilder >> validate [
	^ stack size = 1
		and: [ (self stackTop returnType isConstraintType)
			and: [ hasFailed not ] ]
		
	
		
	
]

{ #category : #api }
AodConstraintBuilder >> width: anObject [
	^ self pushBoxTransformer: AodBoxWidthTransformer with: anObject
]
