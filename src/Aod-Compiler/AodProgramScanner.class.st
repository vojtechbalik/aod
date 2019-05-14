Class {
	#name : #AodProgramScanner,
	#superclass : #SmaCCScanner,
	#category : #'Aod-Compiler-Generated'
}

{ #category : #generated }
AodProgramScanner class >> states [
	^ #(#default)
]

{ #category : #generated }
AodProgramScanner >> emptySymbolTokenId [
	^ 50
]

{ #category : #generated }
AodProgramScanner >> errorTokenId [
	^ 51
]

{ #category : #generated }
AodProgramScanner >> scanForToken [
	self step.
	currentCharacter == $#
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	^ self scanForTokenX10
]

{ #category : #generated }
AodProgramScanner >> scanForTokenX1 [
	self recordMatch: #(5).
	self step.
	currentCharacter == $/
		ifTrue: [ [ self recordMatch: #(24).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
AodProgramScanner >> scanForTokenX10 [
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(18) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(19) ].
	currentCharacter == $*
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(17) ].
	currentCharacter == $-
		ifTrue:
			[ ^ self scanForTokenX6 ].
	currentCharacter == $.
		ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	currentCharacter == $/
		ifTrue:
			[ ^ self scanForTokenX1 ].
	currentCharacter == $0
		ifTrue:
			[ ^ self scanForTokenX3 ].
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(12) ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(11) ].
	currentCharacter == $<
		ifTrue:
			[ ^ self scanForTokenX8 ].
	^ self scanForTokenX9
]

{ #category : #generated }
AodProgramScanner >> scanForTokenX2 [
	[ self recordMatch: #(21 23).
	self step.
	currentCharacter between: $0 and: $9 ] whileTrue.
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ])
		ifTrue: [ [ self recordMatch: #(23).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
AodProgramScanner >> scanForTokenX3 [
	self recordMatch: #(21 23).
	self step.
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue: [ [ self recordMatch: #(23).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
AodProgramScanner >> scanForTokenX4 [
	[ self recordMatch: #(23).
	self step.
	(currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
		whileTrue
]

{ #category : #generated }
AodProgramScanner >> scanForTokenX5 [
	[ self recordMatch: #(22).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
AodProgramScanner >> scanForTokenX6 [
	self recordMatch: #(1).
	self step.
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	^ self reportLastMatch
]

{ #category : #generated }
AodProgramScanner >> scanForTokenX7 [
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	^ self reportLastMatch
]

{ #category : #generated }
AodProgramScanner >> scanForTokenX8 [
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	^ self reportLastMatch
]

{ #category : #generated }
AodProgramScanner >> scanForTokenX9 [
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	currentCharacter == $>
		ifTrue:
			[ ^ self scanForTokenX7 ].
	currentCharacter == $@
		ifTrue: [ ^ self recordAndReportMatch: #(16) ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(15) ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(13) ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(20) ].
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(14) ].
	(currentCharacter between: $1 and: $9)
		ifTrue:
			[ ^ self scanForTokenX2 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue:
			[ ^ self scanForTokenX5 ].
	currentCharacter isSafeForHTTP
		ifTrue:
			[ self scanForTokenX4 ].
	^ self reportLastMatch
]

{ #category : #generated }
AodProgramScanner >> tokenActions [
	^ #(nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil #whitespace nil #comment)
]
