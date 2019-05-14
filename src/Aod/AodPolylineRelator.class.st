Class {
	#name : #AodPolylineRelator,
	#superclass : #AodLineRelator,
	#category : #'Aod-Language-Relators'
}

{ #category : #arguments }
AodPolylineRelator class >> argumentCount [
	^ 1
]

{ #category : #arguments }
AodPolylineRelator class >> argumentTypes [
	^ { AodType list }
]

{ #category : #generating }
AodPolylineRelator class >> expandOn: aGenerator [
	| list |
	list := aGenerator pop.
	
	aGenerator
			raw: list;
			raw: AodConnectLinesRelator;
		push: AodListInterweaveRelator
]

{ #category : #accessing }
AodPolylineRelator class >> identifier [
	^ #polyline
]

{ #category : #accessing }
AodPolylineRelator class >> returnType [
	^ AodType constraint
]
