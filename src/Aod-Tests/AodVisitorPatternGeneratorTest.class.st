Class {
	#name : #AodVisitorPatternGeneratorTest,
	#superclass : #TestCase,
	#category : #'Aod-Tests'
}

{ #category : #formatting }
AodVisitorPatternGeneratorTest >> formatMethod: aString [
	^ BISimpleFormatter format: (RBParser parseMethod: aString)
]

{ #category : #accessing }
AodVisitorPatternGeneratorTest >> rootClass [
	^ AodActor
]

{ #category : #tests }
AodVisitorPatternGeneratorTest >> testGenerateAcceptMethod [
	| generated expected |
	generated := String streamContents: [ :s | AodAnchorAddOperator generateAcceptMethodOn: s ].
	expected := String streamContents: [ :s |
		s
			<< 'acceptVisitor:'
			<< self rootClass visitorIdentifier
			<< '^'
			<< self rootClass visitorIdentifier
			<< ' visitAnchorAddOperator: self' ].
	
	self validateMethod: generated with: expected
]

{ #category : #tests }
AodVisitorPatternGeneratorTest >> testGenerateVisitMethod [
	| generated expected |
	generated := String streamContents: [ :s | 
		AodAnchorAddOperator generateVisitMethodHeaderOn: s.
		AodAnchorAddOperator generateVisitMethodBodyOn: s ].
	expected := String streamContents: [ :s |
		s
			<< 'visitAnchorAddOperator:'
			<< self rootClass nodeIdentifier
			<< '^self'
			<< ' visitAnchorOperator:'
			<< self rootClass nodeIdentifier ].
	
	self validateMethod: generated with: expected
]

{ #category : #'as yet unclassified' }
AodVisitorPatternGeneratorTest >> validateMethod: generated with: expected [
	"assumes generated strings only use 'Character space' as whitespace"
	self assert: (self formatMethod: generated) equals: (self formatMethod: expected)
]
