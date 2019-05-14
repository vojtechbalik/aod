Class {
	#name : #AodBoxTransformer,
	#superclass : #AodTransformer,
	#category : #'Aod-Language-Transformers'
}

{ #category : #accessing }
AodBoxTransformer class >> argumentCount [
	^ 1
]

{ #category : #accessing }
AodBoxTransformer class >> argumentTypes [
	^ {AodType box}
]

{ #category : #generated }
AodBoxTransformer >> acceptVisitor: aVisitor [
  ^aVisitor visitBoxTransformer: self
]
