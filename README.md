# Aod

Aod is a prototype vector editor in Pharo, with support for linear constraints.

To load this project in Pharo8, run the following script in Playground. 

(Preferably, use a fresh image to ensure things go smoothly. Also, try to avoid the 32bit version on Linux, as in that case, Bloc has to use an alternative, not as optimized drawing backend.)
```
Metacello new 
	baseline: 'Aod';
	repository: 'github://vojtechbalik/aod/src';
	load
```

For a quick test if everything loaded correctly, execute the following in Playground.
```
AodElement openOn: AodDrawing new
```
An empty editor window should be opened.


![](empty_editor_window.png)

## Example
In this example, rectangles are constrained to lie next to one another in a sequence.
Run this example in playground and try to move shapes around to see how the editor reacts.

```
drawing := AodDrawing new.

1 to: 5 do: [ :index |
	drawing applyCommand: (AodAddShapeCommand new
		shape: (AodRectangle new
			propertyAt: #name put: index asWords;
			propertyAt: #id put: index;
			propertyAt: #color put: Color random)) ].

program :=
'
pointLeq(point(0, 0), #1.position);
sequenced(
	map(
		[#1, #2, #3, #4, #5],
		horizontal));'.

drawing applyCommand: (AodSetProgramCommand new
	program: (AodProgram fromText: program)).

AodElement openOn: drawing
```