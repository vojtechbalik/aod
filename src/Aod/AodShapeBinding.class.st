Class {
	#name : #AodShapeBinding,
	#superclass : #AodDataBinding,
	#instVars : [
		'shape'
	],
	#category : #'Aod-Language-Actor'
}

{ #category : #generated }
AodShapeBinding >> acceptVisitor: aVisitor [
  ^aVisitor visitShapeBinding: self
]

{ #category : #testing }
AodShapeBinding >> isResolved [
	^ shape isNotNil
]

{ #category : #'as yet unclassified' }
AodShapeBinding >> resolveReferenceWith: aDrawing [
	shape := data resolveWith: aDrawing
]

{ #category : #accessing }
AodShapeBinding >> returnType [
	"if the reference has not yet been resolved, return a placeholder type (compatible with all types)"
	shape ifNil: [ ^ AodType placeholder ].
	
	^ shape model aodType
]

{ #category : #accessing }
AodShapeBinding >> shape [
	^ shape ifNil: [ self error: 'unresolved reference' ]
	
]
