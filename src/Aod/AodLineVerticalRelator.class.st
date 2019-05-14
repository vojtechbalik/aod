Class {
	#name : #AodLineVerticalRelator,
	#superclass : #AodLineRelator,
	#category : #'Aod-Language-Relators'
}

{ #category : #arguments }
AodLineVerticalRelator class >> argumentCount [
	^ 1
]

{ #category : #arguments }
AodLineVerticalRelator class >> argumentTypes [
	^ { AodType line }
]

{ #category : #generating }
AodLineVerticalRelator class >> expandOn: aGenerator [
	| line |
	line := aGenerator pop.
	
	aGenerator
					raw: line;
				push: AodLineStartTransformer;
			push: AodPointXTransformer;
					raw: line;
				push: AodLineEndTransformer;
			push: AodPointXTransformer;
		push: AodAnchorEqRelator 
]

{ #category : #accessing }
AodLineVerticalRelator class >> identifier [
	^ #isVertical
]

{ #category : #accessing }
AodLineVerticalRelator class >> returnType [
	^ AodType constraint
]
