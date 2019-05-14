Class {
	#name : #AodConnectLinesRelator,
	#superclass : #AodLineRelator,
	#category : #'Aod-Language-Relators'
}

{ #category : #arguments }
AodConnectLinesRelator class >> argumentCount [
	^ 2
]

{ #category : #arguments }
AodConnectLinesRelator class >> argumentTypes [
	^ { AodType line . AodType line }
]

{ #category : #generating }
AodConnectLinesRelator class >> expandOn: aGenerator [
	| first second |
	second := aGenerator pop.
	first := aGenerator pop.
	
	aGenerator
				raw: first;
			push: AodLineEndTransformer;
				raw: second;
			push: AodLineStartTransformer;
		push: AodPointEqRelator
			
]

{ #category : #accessing }
AodConnectLinesRelator class >> identifier [
	^ #connect_lines
]

{ #category : #accessing }
AodConnectLinesRelator class >> returnType [
	^ AodType constraint
]
