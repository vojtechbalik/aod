Class {
	#name : #AodDrawing,
	#superclass : #Object,
	#traits : 'TAodPropertyDictionary',
	#classTraits : 'TAodPropertyDictionary classTrait',
	#instVars : [
		'shapes',
		'announcer',
		'propertyDict',
		'program',
		'constraintSolver',
		'selection',
		'currentEdit',
		'commandLog'
	],
	#category : #'Aod-Core'
}

{ #category : #'as yet unclassified' }
AodDrawing >> addProperty: aProperty [
	self propertyDictionary at: aProperty label 
		ifPresent: [ self error: 'property already present, use #resetProperty: instead' ]
		ifAbsentPut: [ aProperty ]
]

{ #category : #shapes }
AodDrawing >> addShape: aShape [
	self 
		addShape: aShape 
		onConflict: [ :selector | 
			self error: 'conflicting property at #', selector ].
]

{ #category : #shapes }
AodDrawing >> addShape: aShape onConflict: aBlock [
	shapes add: aShape onConflict: [ :selector | ^ aBlock cull: selector ].
	constraintSolver addVessel: aShape vessel.
	self onShapeAdded: aShape
]

{ #category : #announce }
AodDrawing >> announce: aDrawingAnnouncement [
	aDrawingAnnouncement drawing: self.
	
	announcer announce: aDrawingAnnouncement	
]

{ #category : #'as yet unclassified' }
AodDrawing >> announceState [
	"announce all my state"
	self shapesDo: [ :s | announcer announce: (AodShapeAdded shape: s) ].
	announcer announce: (AodProgramChanged program: self program).
	
	selection announceState
]

{ #category : #accessing }
AodDrawing >> announcer [
	^ announcer
]

{ #category : #commands }
AodDrawing >> applyCommand: aCommand [
	| result |
	commandLog addLast: aCommand.
	result := aCommand applyOn: self.
	
	aCommand mayFail
		ifFalse: [ ^ self ].
	
	result := result
		ifTrue: AodCommandSuccess new
		ifFalse: AodCommandFailure new. 
		
	result command: aCommand.
	self announce: result
]

{ #category : #'as yet unclassified' }
AodDrawing >> canvasLayoutChanged [
	"position or size of some shape has changed"
	self announce: AodCanvasLayoutChanged new
]

{ #category : #accessing }
AodDrawing >> constraintSolver [
	^ constraintSolver 
]

{ #category : #accessing }
AodDrawing >> constraintSolver: aSolver [
	self shapesDo: [ :shape | constraintSolver removeVessel: shape vessel ].
	constraintSolver := aSolver.
	self shapesDo: [ :shape | constraintSolver addVessel: shape vessel ].
	constraintSolver addConstraints: program constraints.
]

{ #category : #accessing }
AodDrawing >> currentEdit [
	^ currentEdit
]

{ #category : #accessing }
AodDrawing >> currentEdit: anObject [
	currentEdit := anObject
]

{ #category : #'as yet unclassified' }
AodDrawing >> defaultConstraintSolver [
	^ AodCassowaryConstraintSolver new
]

{ #category : #initialization }
AodDrawing >> initialize [
	super initialize.
	
	shapes := AodShapeManager new.
	announcer := Announcer new.
	propertyDict := Dictionary new.
	program := AodProgram new.
	selection := AodSelection new.
	commandLog := OrderedCollection new.
		
	constraintSolver := self defaultConstraintSolver
]

{ #category : #'instance creation' }
AodDrawing >> newCompiler [
	^ AodCompiler new
		drawing: self;
		yourself
]

{ #category : #'program - hooks' }
AodDrawing >> onProgramChanged: aProgram [
	self announce: AodCanvasLayoutChanged new.
	self announce: (AodProgramChanged program: aProgram)
]

{ #category : #'shapes - hooks' }
AodDrawing >> onShapeAdded: aShape [
	self announce: (AodShapeAdded shape: aShape)
]

{ #category : #'shapes - hooks' }
AodDrawing >> onShapeRemoved: aShape [
	self announce: (AodShapeRemoved shape: aShape)
]

{ #category : #accessing }
AodDrawing >> program [
	^ program
]

{ #category : #accessing }
AodDrawing >> program: aProgram [
	self assert: aProgram isNotNil.
	
	constraintSolver removeConstraints: program constraints.
	
	"if there was an error adding the constraints, the program is invalid. in that case, reinitialize a new solver with the old program"
	[ constraintSolver addConstraints: aProgram constraints ]
		on: Error
		do: [ :ex |
			self reinitializeSolverWith: program.
			ex pass ].
	
	program := aProgram.
	
		
	self onProgramChanged: program
]

{ #category : #properties }
AodDrawing >> properties [
	^ self propertyDictionary values
]

{ #category : #accessing }
AodDrawing >> propertyAt: aSelector ifAbsent: aBlock [
	^ self propertyDictionary at: aSelector ifAbsent: aBlock
]

{ #category : #'private - properties' }
AodDrawing >> propertyDictionary [
	"return a Dictionary"
	^ propertyDict
]

{ #category : #'as yet unclassified' }
AodDrawing >> reinitializeSolverWith: aProgram [
	"solvers state is corrupted. it needs to be recreated. aProgram MUST be valid."
	constraintSolver := constraintSolver species new.
	self shapesDo: [ :shape | constraintSolver addVessel: shape vessel ].
	constraintSolver addConstraints: aProgram constraints
	
]

{ #category : #shapes }
AodDrawing >> removeShape: aShape [
	shapes remove: aShape.
	constraintSolver removeVessel: aShape vessel.
	self onShapeRemoved: aShape
]

{ #category : #'as yet unclassified' }
AodDrawing >> requestState [
	"announce all my state"
	self shapesDo: [ :s | announcer announce: (AodShapeAdded shape: s) ].
	"announce program after shapes, because to properly translate constraints, the visual version of shapes needs to be already in place"
	announcer announce: (AodProgramChanged program: self program)
]

{ #category : #accessing }
AodDrawing >> selection [
	^ selection
]

{ #category : #shapes }
AodDrawing >> shapeBy: aSelector at: aKey [
	"for some selectors, a collection might be returned"
	^ self shapeBy: aSelector at: aKey ifAbsent: [ nil ]
]

{ #category : #shapes }
AodDrawing >> shapeBy: aSelector at: aKey do: doBlock ifAbsent: absentBlock [
	| shape |
	shape := self shapeBy: aSelector at: aKey ifAbsent: absentBlock.
	doBlock value: shape.
	shape propertiesChanged
]

{ #category : #shapes }
AodDrawing >> shapeBy: aSelector at: aKey ifAbsent: aBlock [
	"for some selectors, a collection might be returned"
	^ shapes by: aSelector at: aKey ifAbsent: aBlock
]

{ #category : #shapes }
AodDrawing >> shapeCount [
	^ shapes registeredCount
]

{ #category : #'as yet unclassified' }
AodDrawing >> shapeManager [
	^ shapes
]

{ #category : #shapes }
AodDrawing >> shapesDo: aBlock [
	shapes do: aBlock
]

{ #category : #shapes }
AodDrawing >> shapesRemoveAll [
	self shapesDo: [ :each | self removeShape: each ].
]
