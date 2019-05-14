"
i could make this object itself be array, so that it is faster
"
Class {
	#name : #AodActor,
	#superclass : #AodType,
	#instVars : [
		'arguments'
	],
	#classInstVars : [
		'argumentTypes'
	],
	#category : #'Aod-Language-Actor'
}

{ #category : #'as yet unclassified' }
AodActor class >> aodWriteOn: aStream [
	aStream << self identifier
]

{ #category : #accessing }
AodActor class >> args: aSequence [
	^ self arguments: aSequence
]

{ #category : #arguments }
AodActor class >> argumentCount [
	"this method is separate from argumentTypes for efficiency reasons. therefore defining it as ^ self argumentTypes size is defeating its purpose"
	self subclassResponsibility 
]

{ #category : #private }
AodActor class >> argumentTypeAt: index [
	^ self argumentTypes at: index
]

{ #category : #arguments }
AodActor class >> argumentTypes [
	self subclassResponsibility 
]

{ #category : #accessing }
AodActor class >> arguments: aSequence [
	^ self new
		arguments: aSequence;
		yourself
]

{ #category : #generating }
AodActor class >> expandOn: aGenerator [
	self subclassResponsibility
]

{ #category : #'visitor generation' }
AodActor class >> formatMethod: aString [
	^ BISimpleFormatter format: (RBParser parseMethod: aString)
]

{ #category : #'visitor generation' }
AodActor class >> generateAcceptMethodOn: aStream [
	aStream 
		<< 'acceptVisitor:' << self visitorIdentifier 
		<< '^' << self visitorIdentifier << ' '.
	self generateVisitMethodNameOn: aStream.
	aStream
		<< 'self'
]

{ #category : #'visitor generation' }
AodActor class >> generateTrait [
	self assert: (self isValidTraitName: self visitorTraitName) description: 'invalid trait name ' , self visitorTraitName.
	
	^ Trait named: self visitorTraitName uses: #() category: self category
]

{ #category : #'visitor generation' }
AodActor class >> generateVisitMethodBodyOn: aStream [
	aStream
		<< '^self '.
	self superclass generateVisitMethodNameOn: aStream.
	aStream
		<< self nodeIdentifier.
]

{ #category : #'visitor generation' }
AodActor class >> generateVisitMethodHeaderOn: aStream [
	self generateVisitMethodNameOn: aStream.
	aStream
		<< self nodeIdentifier
]

{ #category : #'visitor generation' }
AodActor class >> generateVisitMethodNameOn: aStream [
	aStream 
		<< 'visit' << self nameWithoutPrefix << $:
]

{ #category : #'visitor generation' }
AodActor class >> generateVisitorPattern [
	"generates #acceptVisitor: methods for me and my subclasses and also an ActorVisitor trait with all the corresponding methods
	
	does NOT delete old methods/trait when re-generating, to be safe"
	
	"	* get all subclasses
		* strip Aod from their names
		* generate the methods
		* somehow also generate the visitX methods, so that it respects the hierarchy
		* use RBParser to format code
		* use ClassDescription>>#compile:classified: to compile WriteStream (or a string, whetever, stream is better)"
		
	| trait visitMethod acceptMethod |
	trait := self generateTrait.
	
	visitMethod := String streamContents: [ :s |
		self generateVisitMethodHeaderOn: s.
		s << ' ' << self nodeIdentifier << ' arguments do: [ :arg | arg acceptVisitor: self ].'.
		s << '^' << self nodeIdentifier ].
	
	acceptMethod := String streamContents: [ :s | self generateAcceptMethodOn: s ].
	
	visitMethod := self formatMethod: visitMethod.
	acceptMethod := self formatMethod: acceptMethod.
	
	trait compile: visitMethod classified: self generatedMethodProtocol.
	self compile: acceptMethod classified: self generatedMethodProtocol.
	
	self subclassesDo: [ :s | s generateVisitorPatternWith: trait ]
	
	
]

{ #category : #'visitor generation' }
AodActor class >> generateVisitorPatternWith: aTrait [
	| visitMethod acceptMethod |
	visitMethod := String streamContents: [ :s |
		self generateVisitMethodHeaderOn: s.
		self generateVisitMethodBodyOn: s ].
	acceptMethod := String streamContents: [ :s |
		self generateAcceptMethodOn: s ].
	
	visitMethod := self formatMethod: visitMethod.
	acceptMethod := self formatMethod: acceptMethod.
	
	aTrait compile: visitMethod classified: self generatedMethodProtocol.
	self compile: acceptMethod classified: self generatedMethodProtocol.
	
	self subclassesDo: [ :s | s generateVisitorPatternWith: aTrait ]
]

{ #category : #'visitor generation' }
AodActor class >> generatedMethodProtocol [
	^ 'generated'
]

{ #category : #accessing }
AodActor class >> identifier [
	"needs to answer something, but make it something that cannot possibly match"
	^ #'~invalid~'
]

{ #category : #testing }
AodActor class >> isAtomic [
	^ false
]

{ #category : #testing }
AodActor class >> isVarArg [
	^ false
]

{ #category : #'instance creation' }
AodActor class >> lookup: aString [
	"be careful not to modify the subclasses collection, this saves us a lot of copies"
	| results |
	results := OrderedCollection new.
	self lookup: aString results: results.
	^ results
]

{ #category : #'instance creation' }
AodActor class >> lookup: aString results: aCollection [
	"be careful not to modify the subclasses collection. this is dangerous, but saves us a lot of copies"
	self identifier = aString
			ifTrue: [ aCollection add: self ].
	subclasses ifNil: [ ^ self ].
	subclasses do: [ :sub | sub lookup: aString results: aCollection ]
]

{ #category : #'visitor generation' }
AodActor class >> nameWithoutPrefix [
	self assert: (self name beginsWith: self prefix) description: self name, ' does not have prefix ', self prefix.
	^ self name copyFrom: 1 + self prefix size to: self name size
]

{ #category : #'visitor generation' }
AodActor class >> nodeIdentifier [
	^ 'anActor'
]

{ #category : #'visitor generation' }
AodActor class >> prefix [
	^ #Aod
]

{ #category : #'as yet unclassified' }
AodActor class >> pushOn: expressionBuilder [
	^ self isVarArg
		ifTrue: [ expressionBuilder pushVarArg: self ]
		ifFalse: [ expressionBuilder pushType: self ]
]

{ #category : #accessing }
AodActor class >> returnType [
	self subclassResponsibility
]

{ #category : #'visitor generation' }
AodActor class >> visitorIdentifier [
	^ 'aVisitor'
]

{ #category : #'visitor generation' }
AodActor class >> visitorTraitName [
	^ 'T' , self prefix , self nameWithoutPrefix, 'Visitor'
]

{ #category : #comparing }
AodActor >> = other [
	^ self class = other class 
		and: [ self arguments hasEqualElements: other arguments ]
]

{ #category : #generated }
AodActor >> acceptVisitor: aVisitor [
  ^aVisitor visitActor: self
]

{ #category : #arguments }
AodActor >> argumentAt: index [
	self validateArgumentIndex: index.
	
	^ arguments at: index
]

{ #category : #arguments }
AodActor >> argumentAt: index put: aNode [
	self validateArgumentIndex: index.
	
	aNode type = (self argumentTypeAt: index)
		ifFalse: [ ^ false ].
	
	arguments at: index put: aNode.
	
	^ true
]

{ #category : #accessing }
AodActor >> argumentCount [
	^ self aodType argumentCount
]

{ #category : #accessing }
AodActor >> argumentTypeAt: index [
	^ self aodType argumentTypeAt: index
]

{ #category : #accessing }
AodActor >> argumentTypes [
	^ self aodType argumentTypes
]

{ #category : #accessing }
AodActor >> arguments [
	^ arguments
]

{ #category : #accessing }
AodActor >> arguments: anObject [
	arguments := anObject
]

{ #category : #accessing }
AodActor >> identifier [
	^ self class identifier
]

{ #category : #initialization }
AodActor >> initialize [
	super initialize.
	
	arguments := Array new: self argumentCount.
]

{ #category : #testing }
AodActor >> isAtomic [
	^ self aodType isAtomic
]

{ #category : #'as yet unclassified' }
AodActor >> pushOn: expressionBuilder [
	^ expressionBuilder pushInstance: self
]

{ #category : #accessing }
AodActor >> returnType [
	^ self aodType returnType
]

{ #category : #arguments }
AodActor >> validateArgumentIndex: index [
	self assert: (index between: 1 and: self argumentCount).
]
