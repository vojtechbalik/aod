"
A trait for Aod model objects having properties
"
Trait {
	#name : #TAodPropertyDictionary,
	#category : #'Aod-Property'
}

{ #category : #testing }
TAodPropertyDictionary >> hasProperty: aProperty [
	^ self propertyDictionary includesKey: aProperty asSymbol
]

{ #category : #properties }
TAodPropertyDictionary >> properties [
	^ self propertyDictionary values
]

{ #category : #enumerating }
TAodPropertyDictionary >> propertiesCollect: aBlock [
	^ self propertyDictionary values collect: aBlock
]

{ #category : #enumerating }
TAodPropertyDictionary >> propertiesDo: aBlock [
	self propertyDictionary valuesDo: aBlock
]

{ #category : #enumerating }
TAodPropertyDictionary >> propertiesSelect: aBlock [
	^ self propertyDictionary values select: aBlock
]

{ #category : #properties }
TAodPropertyDictionary >> propertyAt: aProperty [
	^ self propertyAt: aProperty asSymbol ifAbsent: [ nil ]
]

{ #category : #accessing }
TAodPropertyDictionary >> propertyAt: aProperty ifAbsent: aBlock [
	^ self propertyDictionary at: aProperty asSymbol ifAbsent: aBlock
]

{ #category : #accessing }
TAodPropertyDictionary >> propertyAt: aProperty ifAbsentPut: aBlock [
	^ self propertyDictionary 
		at: aProperty asSymbol 
		ifAbsentPut: [ (self propertyLabeled: aProperty asSymbol) value: aBlock value ]
]

{ #category : #accessing }
TAodPropertyDictionary >> propertyAt: aProperty ifPresent: aBlock [
	^ self propertyDictionary at: aProperty asSymbol ifPresent: aBlock
]

{ #category : #properties }
TAodPropertyDictionary >> propertyAt: aLabelOrPropertyClass put: aValue [
	self propertyDictionary at: aLabelOrPropertyClass asSymbol
		ifPresent: [ :property |
			self assert: property isMutable description: 'cannot change immutable property'.
			property value: aValue ]
		ifAbsentPut: [ (self propertyLabeled: aLabelOrPropertyClass) value: aValue ]
]

{ #category : #'private - properties' }
TAodPropertyDictionary >> propertyDictionary [
	"return a Dictionary"
	^ self explicitRequirement
]

{ #category : #'as yet unclassified' }
TAodPropertyDictionary >> propertyLabeled: aSymbol [
	"find a property class with aSymbol as its selector"
	^ AodProperty lookup: aSymbol
]

{ #category : #removing }
TAodPropertyDictionary >> removeProperty: aSelector [
	self propertyDictionary
		removeKey: aSelector
		ifAbsent: [ self error: 'no property at #', aSelector ].
		
	
]
