Class {
	#name : #AodBoxVTransformer,
	#superclass : #AodBoxTransformer,
	#category : #'Aod-Language-Transformers'
}

{ #category : #generating }
AodBoxVTransformer class >> expandOn: aGenerator [
	aGenerator push: AodBoxVerticalTransformer
]

{ #category : #accessing }
AodBoxVTransformer class >> identifier [
	^ #v
]

{ #category : #accessing }
AodBoxVTransformer class >> returnType [
	^ AodType span
]
