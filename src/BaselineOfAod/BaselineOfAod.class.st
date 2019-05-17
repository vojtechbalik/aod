Class {
	#name : #BaselineOfAod,
	#superclass : #BaselineOf,
	#category : #BaselineOfAod
}

{ #category : #baselines }
BaselineOfAod >> baseline: spec [
	<baseline>
	
	spec for: #common do: [ spec
		baseline: 'Brick' with: [ spec
			repository: 'github://pharo-graphics/Brick/src' ];
		
		baseline: 'SmaCC' with: [ spec
			repository: 'github://SmaCCRefactoring/SmaCC' ];
		
		package: 'Aod' with: [ spec 
			requires: #('Cassowary') ];
		
		package: 'Cassowary' with: [ spec 
			requires: #() ];
		
		package: 'Aod-Compiler' with: [ spec
			requires: #('Aod' 'SmaCC') ];
		
		package: 'Aod-UI' with: [ spec
			requires: #('Aod' 'Aod-Compiler' 'SmaCC') ];
		
		package: 'Aod-Tests' with: [ spec 
			requires: #('Aod' 'Cassowary' 'Aod-Compiler') ] ]
]
