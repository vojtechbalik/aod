Class {
	#name : #AodConnectCentersRelator,
	#superclass : #AodLineRelator,
	#category : #'Aod-Language-Relators'
}

{ #category : #arguments }
AodConnectCentersRelator class >> argumentCount [
	^ 3
]

{ #category : #arguments }
AodConnectCentersRelator class >> argumentTypes [
	^ { AodType line . AodType box . AodType box }
]

{ #category : #generating }
AodConnectCentersRelator class >> expandOn: aGenerator [
	| line box1 box2 |
	box2 := aGenerator pop.
	box1 := aGenerator pop.
	line := aGenerator pop.
	
	aGenerator
					raw: line;
				push: AodLineStartTransformer;
					raw: box1;
				push: AodBoxCenterTransformer;
			push: AodPointEqRelator;
					raw: line;
				push: AodLineEndTransformer;
					raw: box2;
				push: AodBoxCenterTransformer;
			push: AodPointEqRelator
			
		
	


]

{ #category : #accessing }
AodConnectCentersRelator class >> identifier [
	^ #connect_centers
]

{ #category : #accessing }
AodConnectCentersRelator class >> returnType [
	^ AodType constraint
]

{ #category : #generated }
AodConnectCentersRelator >> acceptVisitor: aVisitor [
  ^aVisitor visitConnectCentersRelator: self
]
