Extension { #name : #AodProgram }

{ #category : #'*Aod-Compiler' }
AodProgram class >> fromText: aText [
	| ast compiler result |
	ast := self parserClass parse: aText asString.
	compiler := AodProgramAstCompiler new.
	result := ast acceptVisitor: compiler.
	result text: aText.
	^ result
]

{ #category : #'*Aod-Compiler' }
AodProgram class >> parserClass [
	^ self class environment at: #AodProgramParser
]
