Class {
	#name : #AodBaseNode,
	#superclass : #SmaCCParseNode,
	#category : #'Aod-Compiler-Generated'
}

{ #category : #generated }
AodBaseNode >> acceptVisitor: aBaseVisitor [
	^ aBaseVisitor visitBase: self
]
