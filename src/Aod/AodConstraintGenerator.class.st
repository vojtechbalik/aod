"
only needs to deal with atomics -- the Generateables using which everything in the language is expressed
"
Class {
	#name : #AodConstraintGenerator,
	#superclass : #Object,
	#traits : 'TAodActorVisitor + TAodExpressionBuilder',
	#classTraits : 'TAodActorVisitor classTrait + TAodExpressionBuilder classTrait',
	#instVars : [
		'stack'
	],
	#category : #'Aod-Language-Support'
}

{ #category : #translating }
AodConstraintGenerator >> generate: aConstraint [
	"only use visitor mechanism as a switch for atomics. don't wanna waste too much time walking the inheritance tree."
	| result |
	self generateActor: aConstraint relator.
	result := stack collect: [ :each | 
		each strength: (self generateStrength: aConstraint strength) ].
	stack removeAll.
	^ result
]

{ #category : #'as yet unclassified' }
AodConstraintGenerator >> generateActor: anActor [
	anActor acceptVisitor: self
		
		
]

{ #category : #'as yet unclassified' }
AodConstraintGenerator >> generateAnchorAdd [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
AodConstraintGenerator >> generateAnchorDiv [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
AodConstraintGenerator >> generateAnchorEq [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
AodConstraintGenerator >> generateAnchorLeq [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
AodConstraintGenerator >> generateAnchorMul [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
AodConstraintGenerator >> generateAnchorSub [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
AodConstraintGenerator >> generateStay [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
AodConstraintGenerator >> generateStrength: aStrength [
	self subclassResponsibility
]

{ #category : #initialization }
AodConstraintGenerator >> initialize [
	super initialize.
	
	stack := OrderedCollection new
]

{ #category : #clipping }
AodConstraintGenerator >> pop [
	^ self stackPop
]

{ #category : #'as yet unclassified' }
AodConstraintGenerator >> pushInstance: anActorInstance [
	self error: 'should not be called'
]

{ #category : #'as yet unclassified' }
AodConstraintGenerator >> pushType: anActorType [
	anActorType expandOn: self
]

{ #category : #'as yet unclassified' }
AodConstraintGenerator >> pushVarArg: aType [
	self pushType: aType
]

{ #category : #'as yet unclassified' }
AodConstraintGenerator >> raw: anObject [
	self stackPush: anObject
]

{ #category : #'as yet unclassified' }
AodConstraintGenerator >> stackPop [
	^ stack removeLast
]

{ #category : #'as yet unclassified' }
AodConstraintGenerator >> stackPush: anObject [
	^ stack addLast: anObject
]

{ #category : #accessing }
AodConstraintGenerator >> stackTop [
	^ stack last
]

{ #category : #'as yet unclassified' }
AodConstraintGenerator >> unwrapIfAnchor: anObject [
	^ anObject aodType = AodType anchor
		ifTrue: [ anObject impl ]
		ifFalse: [ anObject ]
]

{ #category : #generated }
AodConstraintGenerator >> visitActor: anActor [
	self visitArguments: anActor.
	self push: anActor aodType.
	
	^ self stackTop
]

{ #category : #visiting }
AodConstraintGenerator >> visitArguments: anActor [
	anActor arguments do: [ :arg | arg acceptVisitor: self ]
]

{ #category : #generated }
AodConstraintGenerator >> visitDataBinding: anActor [
	self raw: anActor data
]

{ #category : #visiting }
AodConstraintGenerator >> visitListConstructor: anActor [
	self visitArguments: anActor.
	"need to add arrays size to stack"
	self raw: anActor arguments size.
	self push: anActor aodType.
	
	^ self stackTop
]

{ #category : #generated }
AodConstraintGenerator >> visitShapeBinding: anActor [
	self raw: anActor shape vessel
]
