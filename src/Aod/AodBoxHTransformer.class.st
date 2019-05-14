Class {
	#name : #AodBoxHTransformer,
	#superclass : #AodBoxTransformer,
	#category : #'Aod-Language-Transformers'
}

{ #category : #generating }
AodBoxHTransformer class >> expandOn: aGenerator [
	aGenerator push: AodBoxHorizontalTransformer
]

{ #category : #accessing }
AodBoxHTransformer class >> identifier [
	^ #h
]

{ #category : #accessing }
AodBoxHTransformer class >> returnType [
	^ AodType span
]
