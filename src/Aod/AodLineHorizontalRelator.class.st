Class {
	#name : #AodLineHorizontalRelator,
	#superclass : #AodLineRelator,
	#category : #'Aod-Language-Relators'
}

{ #category : #arguments }
AodLineHorizontalRelator class >> argumentCount [
	^ 1
]

{ #category : #arguments }
AodLineHorizontalRelator class >> argumentTypes [
	^ { AodType line }
]

{ #category : #generating }
AodLineHorizontalRelator class >> expandOn: aGenerator [
	| line |
	line := aGenerator pop.
	
	aGenerator
					raw: line;
				push: AodLineStartTransformer;
			push: AodPointYTransformer;
					raw: line;
				push: AodLineEndTransformer;
			push: AodPointYTransformer;
		push: AodAnchorEqRelator 
]

{ #category : #accessing }
AodLineHorizontalRelator class >> identifier [
	^ #isHorizontal
]

{ #category : #accessing }
AodLineHorizontalRelator class >> returnType [
	^ AodType constraint
]
