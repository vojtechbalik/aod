Class {
	#name : #AodTypeComparingTest,
	#superclass : #TestCase,
	#category : #'Aod-Tests'
}

{ #category : #'as yet unclassified' }
AodTypeComparingTest >> testNotAodType [
	self deny: (AodAnchor isTypeEqualTo: Number).
	self deny: (AodAnchor isTypeCompatibleWith: Number).
]

{ #category : #'as yet unclassified' }
AodTypeComparingTest >> testSameType [
	self assert: (AodConstant isTypeEqualTo: AodConstant).
	self assert: (AodConstant isTypeCompatibleWith: AodConstant)
]

{ #category : #tests }
AodTypeComparingTest >> testSubtyping [
	"Anchor cannot act as a Constant"
	self deny: (AodAnchor isTypeEqualTo: AodConstant).
	self deny: (AodAnchor isTypeCompatibleWith: AodConstant).
	"a Constant is a special case of Anchor"
	self deny: (AodConstant isTypeEqualTo: AodAnchor).
	self assert: (AodConstant isTypeCompatibleWith: AodAnchor)
]
