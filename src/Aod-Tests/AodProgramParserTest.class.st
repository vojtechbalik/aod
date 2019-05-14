Class {
	#name : #AodProgramParserTest,
	#superclass : #TestCase,
	#category : #'Aod-Tests'
}

{ #category : #accessing }
AodProgramParserTest >> parser [
	"must do this dynamically, as things would break when the parser is generated again"
	^ AodProgram parserClass
]

{ #category : #tests }
AodProgramParserTest >> testSimpleProgram [
	| input |
	input := 
'@A.left + @A.width <= #2.left : required;
#1.width = viewbox.width;'.
	self parser parse: input
]
