Class {
	#name : #AodLineConnectPointsRelator,
	#superclass : #AodLineRelator,
	#category : #'Aod-Language-Relators'
}

{ #category : #arguments }
AodLineConnectPointsRelator class >> argumentCount [
	^ 3
]

{ #category : #arguments }
AodLineConnectPointsRelator class >> argumentTypes [
	^ { AodType line .  AodType point . AodType point }
]

{ #category : #generating }
AodLineConnectPointsRelator class >> expandOn: aGenerator [
	| line start end |
	end := aGenerator pop.
	start := aGenerator pop.
	line := aGenerator pop.
	
	aGenerator
				raw: line;
			push: AodLineStartTransformer;
			raw: start;
		push: AodPointEqRelator;
				raw: line;
			push: AodLineEndTransformer;
			raw: end;
		push: AodPointEqRelator
				
]

{ #category : #accessing }
AodLineConnectPointsRelator class >> identifier [
	^ #connect_points
]

{ #category : #accessing }
AodLineConnectPointsRelator class >> returnType [
	^ AodType constraint
]
