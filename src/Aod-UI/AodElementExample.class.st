Class {
	#name : #AodElementExample,
	#superclass : #Object,
	#category : #'Aod-UI-Examples'
}

{ #category : #'as yet unclassified' }
AodElementExample >> binaryTreeExample [
	<gtExample>
	| drawing program elem |
	program := AodProgram fromText: self binaryTreeProgramString.
	drawing := AodDrawing new.
	
	elem := AodElement openOn: drawing.
	
	drawing applyCommand: (AodAddShapeCommand new
		shape: (AodRectangle new 
			propertyAt: #name put: 'root')).
			
	6 timesRepeat: [ drawing applyCommand: (AodAddShapeCommand new
		shape: AodRectangle new) ].
	
	1 to: 6 do: [ :index |
		drawing applyCommand: (AodAddShapeCommand new
			shape: (AodLine new
				propertyAt: #color put: Color black;
				propertyAt: #name put: 'line', index asString)) ].
	
	drawing applyCommand: (AodSetProgramCommand new
		program: program).
		
	elem
]

{ #category : #'as yet unclassified' }
AodElementExample >> binaryTreeProgramString [
	^ 'pointLeq(
	point(0, 0),
	@root.position);

equal_anchors(
	map(
		[#2, #3],
		top));

equal_anchors(
	map(
		[#4, #5, #6, #7],
		top));

sequenced(
	map(
		[#2, #3],
		horizontal));

sequenced(
	map(
		[#4, #5, #6, #7],
		horizontal));

sequenced(
	map(
		[#1, #2, #4],
		vertical));

isAfter(#3.vertical, #4.vertical);

#1.h.middle = (#2.left -> #3.right).middle;

#2.h.middle = (#4.left -> #5.right).middle;

#3.h.middle = (#6.left -> #7.right).middle;

equal_anchors(
	map(
		spacings(
			map(
				[#4, #5, #6, #7],
				horizontal)),
		length));

spacing(#4.h, #5.h).length = 40;

connect_points(
	@line1, 
	point(
		@root.h.middle,
		@root.v.end),
	point(
		#2.h.middle,
		#2.v.start));
		
connect_points(
	@line2, 
	point(
		@root.h.middle,
		@root.v.end),
	point(
		#3.h.middle,
		#3.v.start));

connect_points(
	@line3, 
	point(
		#2.h.middle,
		#2.v.end),
	point(
		#4.h.middle,
		#4.v.start));

connect_points(
	@line4, 
	point(
		#2.h.middle,
		#2.v.end),
	point(
		#5.h.middle,
		#5.v.start));

connect_points(
	@line5, 
	point(
		#3.h.middle,
		#3.v.end),
	point(
		#6.h.middle,
		#6.v.start));

connect_points(
	@line6, 
	point(
		#3.h.middle,
		#3.v.end),
	point(
		#7.h.middle,
		#7.v.start));'
	
]
