Class {
	#name : #AodConstraintReferenceResolverTest,
	#superclass : #TestCase,
	#category : #'Aod-Tests'
}

{ #category : #tests }
AodConstraintReferenceResolverTest >> testInvalidReference [
	| drawing constraint |
	"an empty drawing"
	drawing := AodDrawing new.
	
	constraint := AodConstraint builder
			shape: 1 asAodReference;
			shape: 2 asAodReference;
		push: AodLeftOfRelator;
		build.
		
	self deny: (constraint resolveReferencesWith: drawing)
]

{ #category : #tests }
AodConstraintReferenceResolverTest >> testResolveConstraint [
	| drawing constraint shape1 shape2 idRefActor nameRefActor resolver |
	drawing := AodDrawing new.
	shape1 := (AodRectangle new
		propertyAt: #name put: 'first').
	shape2 := (AodRectangle new
		propertyAt: #name put: 'second').
		
	drawing addShape: shape1.
	drawing addShape: shape2.
	
	"id's are assigned automatically by the drawing"
	idRefActor := AodShapeBinding bind: (shape1 propertyAt: #id) value asAodReference.
	nameRefActor := AodShapeBinding bind: 'second' asAodReference.
	
	constraint := AodConstraint builder
			push: idRefActor;
			push: nameRefActor;
		push: AodLeftOfRelator;
		build.
	
	resolver := AodConstraintReferenceResolver new.
	resolver drawing: drawing.
	
	self assert: (constraint resolveReferencesUsing: resolver).
	
	self assert: idRefActor shape equals: shape1.
	self assert: nameRefActor shape equals: shape2.
]
