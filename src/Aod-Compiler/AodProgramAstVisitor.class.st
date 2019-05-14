"
base visitor
"
Class {
	#name : #AodProgramAstVisitor,
	#superclass : #AodAstNodeVisitor,
	#category : #'Aod-Compiler-Visitors'
}

{ #category : #visiting }
AodProgramAstVisitor >> visitIdentifier: aNode [
	^ aNode identifier value
]

{ #category : #visiting }
AodProgramAstVisitor >> visitIntegerLiteral: aNode [
	^ aNode convertedValue 
		ifNil: [
			"this operation will never fail as parser ensures valid integer string" 
			aNode convertedValue: aNode integer value asInteger.
			aNode convertedValue ]
]
