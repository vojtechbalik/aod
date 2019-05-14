"
select nodes in the AST
"
Class {
	#name : #AodNodeSelector,
	#superclass : #AodAstNodeVisitor,
	#instVars : [
		'selectBlock',
		'selectedNodes'
	],
	#category : #'Aod-Compiler-Visitors'
}

{ #category : #enumerating }
AodNodeSelector >> select: aBlock in: ast [
	"usual #select: semantics"
	selectBlock := aBlock.
	selectedNodes := OrderedCollection new.
	
	ast acceptVisitor: self.
	
	^ selectedNodes
]

{ #category : #visiting }
AodNodeSelector >> visitBase: aNode [
	(selectBlock value: aNode)
		ifTrue: [ selectedNodes add: aNode ].
	
	"this visits all children nodes with this visitor"
	self visitSmaCCParseNode: aNode.
]
