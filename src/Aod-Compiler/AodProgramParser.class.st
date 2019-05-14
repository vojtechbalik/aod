Class {
	#name : #AodProgramParser,
	#superclass : #SmaCCParser,
	#category : #'Aod-Compiler-Generated'
}

{ #category : #'generated-accessing' }
AodProgramParser class >> cacheId [
	^'2019-05-13T05:36:45.97171+02:00'
]

{ #category : #generated }
AodProgramParser class >> definitionComment [
"<integer>		:	0 | ([1-9] [0-9]*)	;
<whitespace>	: 	\s+				;
<identifier>		:	\w+				;
<comment>		:	\/\/ [^\r\n]* 		;

%nonassoc ""="" ""<="" "">="";
%left ""->"";
%left ""+"" ""-""	;
%left ""*"" ""/""	;
%left ""."";
	
%root Base;
%prefix Aod;
%suffix Node;

%hierarchy Value (Reference Integer LinearExpression ActorExpression DotExpression);
%hierarchy LinearExpression (BinaryOperator);
%hierarchy Reference (ShapeReference ActorReference);
%hierarchy ShapeReference (IdReference NameReference);
%hierarchy BinaryOperator (AddOperator SubOperator MulOperator DivOperator);
%hierarchy Relator (EqRelator LeqRelator);

# cache for converted integers
%attributes IntegerLiteral (convertedValue);

%start Program Constraint Value;

Program
	: 	( Constraint 'constraintNode' "";"" 'constraintSeparator' (  Constraint 'constraintNode' "";"" 'constraintSeparator' ) * ) ?	{{Program}}
	;
	
Constraint
	:	Value 'relationNode' "":""  'strengthSeparator' Strength 'strengthNode'					{{Constraint}}
	|	Value 'relationNode'															{{Constraint}}
	;
	
Strength
	:	Identifier 'identifierNode'								{{Strength}}
	;
	
Value
	:	Reference
	|	ActorExpression
	|	DotExpression
	|	Integer
	|	LinearExpression
	| 	Point
	| 	List
	|	Span
	|	""("" Value "")""
	;

Point
	:	""{"" Value 'xValueNode' "","" Value 'yValueNode' ""}""			{{Point}}
	;

Span
	:	Value 'startValueNode' ""->"" Value 'endValueNode'		{{Span}}
	;
	
List
	:	""["" ArgumentList 'argumentListNode' ""]""				{{List}}
	;
	
ActorExpression
	: 	BasicActorReference 'actorReferenceNode' ""("" ArgumentList 'argumentListNode' "")""				{{ActorExpression}}
	;

ArgumentList
	:	( Value 'argumentNode' ( "","" Value 'argumentNode')  *  ) ?							{{ArgumentList}}
	;

# convert value tokens to values - this will make AST usable both ways, as it will not contain SmaCCTokens
Identifier
	:	<identifier> 'identifier'											{{Identifier}}
	;													

Integer
	:	IntegerLiteral 'integerLiteralNode'									{{Integer}}
	;
	
IntegerLiteral
	:	<integer> 'integer'												{{IntegerLiteral}}
	;

Reference
	:	ActorReference
	| 	ShapeReference
	;

ActorReference
	: 	BasicActorReference 'actorReferenceNode'					{{ActorReference}}	
	;

BasicActorReference
	:	Identifier 'identifierNode'									{{BasicActorReference}}
	;
	
ShapeReference
	:	""@"" 'operator' Identifier 'identifierNode'						{{NameReference}}
	|	""#"" 'operator' IntegerLiteral 'identifierNode'							{{IdReference}}
	;
	
DotExpression
	:	Value 'valueNode' ""."" 'operator' BasicActorReference 'actorReferenceNode'		{{DotExpression}}
	;
	
LinearExpression
	:	Value 'leftNode' ""+"" 'operator' Value 'rightNode'		{{AddOperator}}
	|	Value 'leftNode' ""-"" 'operator' Value 'rightNode'		{{SubOperator}}
	|	Value 'leftNode' ""*"" 'operator' Value 'rightNode'		{{MulOperator}}
	|	Value 'leftNode' ""/"" 'operator' Value 'rightNode'		{{DivOperator}}
	| 	Value 'leftNode' ""="" 'operator' Value 'rightNode'				{{EqRelator}}
	|	Value  'leftNode' ""<="" 'operator' Value  'rightNode'			{{LeqRelator}}
	|	Value  'rightNode' "">="" 'operator' Value  'leftNode'			{{LeqRelator}}
	;"
]

{ #category : #'generated-accessing' }
AodProgramParser class >> scannerClass [
	^AodProgramScanner
]

{ #category : #generated }
AodProgramParser class >> startingStateForConstraint [
	^ 2
]

{ #category : #generated }
AodProgramParser class >> startingStateForProgram [
	^ 1
]

{ #category : #generated }
AodProgramParser class >> startingStateForValue [
	^ 3
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionForActorExpression1: nodes [
	| result |
	result := AodActorExpressionNode new.
	result actorReferenceNode: (nodes at: 1).
	result argumentListNode: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionForActorReference1: nodes [
	| result |
	result := AodActorReferenceNode new.
	result actorReferenceNode: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionForArgumentList1: nodes [
	| result |
	result := AodArgumentListNode new.
	result addNodes: (nodes at: 1) to: result argumentNodes.
	^ result
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionForBasicActorReference1: nodes [
	| result |
	result := AodBasicActorReferenceNode new.
	result identifierNode: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionForConstraint1: nodes [
	| result |
	result := AodConstraintNode new.
	result relationNode: (nodes at: 1).
	result strengthSeparator: (nodes at: 2).
	result strengthNode: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionForConstraint2: nodes [
	| result |
	result := AodConstraintNode new.
	result relationNode: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionForDotExpression1: nodes [
	| result |
	result := AodDotExpressionNode new.
	result valueNode: (nodes at: 1).
	result operator: (nodes at: 2).
	result actorReferenceNode: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionForIdentifier1: nodes [
	| result |
	result := AodIdentifierNode new.
	result identifier: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionForInteger1: nodes [
	| result |
	result := AodIntegerNode new.
	result integerLiteralNode: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionForIntegerLiteral1: nodes [
	| result |
	result := AodIntegerLiteralNode new.
	result integer: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionForLinearExpression1: nodes [
	| result |
	result := AodAddOperatorNode new.
	result leftNode: (nodes at: 1).
	result operator: (nodes at: 2).
	result rightNode: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionForLinearExpression2: nodes [
	| result |
	result := AodSubOperatorNode new.
	result leftNode: (nodes at: 1).
	result operator: (nodes at: 2).
	result rightNode: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionForLinearExpression3: nodes [
	| result |
	result := AodMulOperatorNode new.
	result leftNode: (nodes at: 1).
	result operator: (nodes at: 2).
	result rightNode: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionForLinearExpression4: nodes [
	| result |
	result := AodDivOperatorNode new.
	result leftNode: (nodes at: 1).
	result operator: (nodes at: 2).
	result rightNode: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionForLinearExpression5: nodes [
	| result |
	result := AodEqRelatorNode new.
	result leftNode: (nodes at: 1).
	result operator: (nodes at: 2).
	result rightNode: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionForLinearExpression6: nodes [
	| result |
	result := AodLeqRelatorNode new.
	result leftNode: (nodes at: 1).
	result operator: (nodes at: 2).
	result rightNode: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionForLinearExpression7: nodes [
	| result |
	result := AodLeqRelatorNode new.
	result rightNode: (nodes at: 1).
	result operator: (nodes at: 2).
	result leftNode: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionForList1: nodes [
	| result |
	result := AodListNode new.
	result argumentListNode: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionForPoint1: nodes [
	| result |
	result := AodPointNode new.
	result xValueNode: (nodes at: 2).
	result yValueNode: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionForProgram1: nodes [
	| result |
	result := AodProgramNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result constraintNodes.
	result
		addTokens: ((nodes at: 1) at: 2)
		to: result constraintSeparators.
	^ result
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionForShapeReference1: nodes [
	| result |
	result := AodNameReferenceNode new.
	result operator: (nodes at: 1).
	result identifierNode: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionForShapeReference2: nodes [
	| result |
	result := AodIdReferenceNode new.
	result operator: (nodes at: 1).
	result identifierNode: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionForSpan1: nodes [
	| result |
	result := AodSpanNode new.
	result startValueNode: (nodes at: 1).
	result endValueNode: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionForStrength1: nodes [
	| result |
	result := AodStrengthNode new.
	result identifierNode: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionForValue1: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionFor__Constraint__constraintNode_______constraintSeparator__1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionFor__Constraint__constraintNode_______constraintSeparator___2: nodes [
	| result |
	result := nodes at: 1.
	self add: ((nodes at: 2) at: 1) to: (result at: 1).
	self add: ((nodes at: 2) at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionFor__Constraint__constraintNode_______constraintSeparator____Constraint__constraintNode_______constraintSeparator____1: nodes [
	| result |
	result := nodes at: 3.
	self addFirst: (nodes at: 1) to: (result at: 1).
	self addFirst: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionFor__Constraint__constraintNode_______constraintSeparator____Constraint__constraintNode_______constraintSeparator_____1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionFor__Constraint__constraintNode_______constraintSeparator____Constraint__constraintNode_______constraintSeparator_____2: nodes [
	| result |
	result := nodes at: 1.
	^ result
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionFor__Value__argumentNode________Value__argumentNode____1: nodes [
	| result |
	result := nodes at: 2.
	self addFirst: (nodes at: 1) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionFor__Value__argumentNode________Value__argumentNode_____1: nodes [
	| result |
	result := OrderedCollection new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
AodProgramParser >> reduceActionFor______Value__argumentNode___2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result
]

{ #category : #generated }
AodProgramParser >> reduceTable [
^#(
	#(53 0 #reduceActionFor__Constraint__constraintNode_______constraintSeparator____Constraint__constraintNode_______constraintSeparator_____1:) 
	#(44 0 #reduceActionFor__Value__argumentNode________Value__argumentNode_____1:) 
	#(46 1 #reduceActionForIntegerLiteral1:) 
	#(30 1 #reduceActionForIdentifier1:) 
	#(53 1 #reduceActionFor__Constraint__constraintNode_______constraintSeparator____Constraint__constraintNode_______constraintSeparator_____2:) 
	#(40 1 #reduceActionForBasicActorReference1:) 
	#(45 1 #reduceActionForValue1:) 
	#(48 1 #reduceActionForActorReference1:) 
	#(47 1 #reduceActionForConstraint2:) 
	#(34 1 #reduceActionForInteger1:) 
	#(31 1 #reduceActionForValue1:) 
	#(52 1 #reduceActionForProgram1:) 
	#(49 2 #reduceActionForShapeReference2:) 
	#(44 1 #reduceActionFor__Constraint__constraintNode_______constraintSeparator____Constraint__constraintNode_______constraintSeparator_____2:) 
	#(39 1 #reduceActionForArgumentList1:) 
	#(42 0 #reduceActionFor__Value__argumentNode________Value__argumentNode_____1:) 
	#(49 2 #reduceActionForShapeReference1:) 
	#(25 0 #reduceActionFor__Constraint__constraintNode_______constraintSeparator____Constraint__constraintNode_______constraintSeparator_____1:) 
	#(37 3 #reduceActionForList1:) 
	#(43 2 #reduceActionFor__Value__argumentNode________Value__argumentNode____1:) 
	#(45 3 #liftSecondValue:) 
	#(35 3 #reduceActionForLinearExpression2:) 
	#(35 3 #reduceActionForLinearExpression3:) 
	#(35 3 #reduceActionForLinearExpression1:) 
	#(38 3 #reduceActionForSpan1:) 
	#(35 3 #reduceActionForLinearExpression4:) 
	#(35 3 #reduceActionForLinearExpression5:) 
	#(35 3 #reduceActionForLinearExpression6:) 
	#(33 3 #reduceActionForDotExpression1:) 
	#(35 3 #reduceActionForLinearExpression7:) 
	#(47 3 #reduceActionForConstraint1:) 
	#(29 1 #reduceActionForStrength1:) 
	#(26 3 #reduceActionFor__Constraint__constraintNode_______constraintSeparator____Constraint__constraintNode_______constraintSeparator____1:) 
	#(42 2 #reduceActionFor______Value__argumentNode___2:) 
	#(32 4 #reduceActionForActorExpression1:) 
	#(25 2 #reduceActionFor__Constraint__constraintNode_______constraintSeparator___2:) 
	#(41 2 #liftSecondValue:) 
	#(36 5 #reduceActionForPoint1:) 
	#(27 2 #reduceActionFor__Constraint__constraintNode_______constraintSeparator__1:)
	).
]

{ #category : #generated }
AodProgramParser >> symbolNames [
	^ #('"-"' '"*"' '"+"' '"->"' '"/"' '"="' '"<="' '"."' '"#"' '">="' '";"' '":"' '"]"' '"}"' '"["' '"@"' '","' '"("' '")"' '"{"' '<integer>' '<whitespace>' '<identifier>' '<comment>' '( Constraint ''constraintNode'' ";" ''constraintSeparator'')*' '( Constraint ''constraintNode'' ";" ''constraintSeparator'' ( Constraint ''constraintNode'' ";" ''constraintSeparator'')*)' '( Constraint ''constraintNode'' ";" ''constraintSeparator'')' 'B e g i n' 'Strength' 'Identifier' 'Reference' 'ActorExpression' 'DotExpression' 'Integer' 'LinearExpression' 'Point' 'List' 'Span' 'ArgumentList' 'BasicActorReference' '( "," Value ''argumentNode'')' '( "," Value ''argumentNode'')*' '( Value ''argumentNode'' ( "," Value ''argumentNode'')*)' '( Value ''argumentNode'' ( "," Value ''argumentNode'')*)?' 'Value' 'IntegerLiteral' 'Constraint' 'ActorReference' 'ShapeReference' 'E O F' 'error' 'Program' '( Constraint ''constraintNode'' ";" ''constraintSeparator'' ( Constraint ''constraintNode'' ";" ''constraintSeparator'')*)?')
]

{ #category : #generated }
AodProgramParser >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #AodProgramNode #AodStrengthNode #AodIdentifierNode #AodReferenceNode #AodActorExpressionNode #AodDotExpressionNode #AodIntegerNode #AodTypedNode #AodPointNode #AodListNode #AodSpanNode #AodArgumentListNode #AodBasicActorReferenceNode #AodBaseNode #OrderedCollection #OrderedCollection #OrderedCollection #AodBaseNode #AodIntegerLiteralNode #AodConstraintNode #AodActorReferenceNode #AodShapeReferenceNode #SmaCCToken #SmaCCToken #AodProgramNode #OrderedCollection)
]

{ #category : #generated }
AodProgramParser >> transitionTable [
^#(
#[1 0 17 0 9 0 21 0 15 0 25 0 16 0 29 0 18 0 33 0 20 0 37 0 21 0 41 0 23 0 45 0 26 0 49 0 30 0 53 0 31 0 57 0 32 0 61 0 33 0 65 0 34 0 69 0 35 0 73 0 36 0 77 0 37 0 81 0 38 0 85 0 40 0 89 0 45 0 93 0 46 0 97 0 47 0 101 0 48 0 105 0 49 0 6 0 50 0 109 0 52 0 113 0 53] 
#[1 0 117 0 9 0 121 0 15 0 125 0 16 0 129 0 18 0 133 0 20 0 137 0 21 0 141 0 23 0 145 0 30 0 149 0 31 0 153 0 32 0 157 0 33 0 161 0 34 0 165 0 35 0 169 0 36 0 173 0 37 0 177 0 38 0 181 0 40 0 185 0 45 0 189 0 46 0 193 0 47 0 197 0 48 0 201 0 49] 
#[1 0 205 0 9 0 209 0 15 0 213 0 16 0 217 0 18 0 221 0 20 0 225 0 21 0 229 0 23 0 233 0 30 0 237 0 31 0 241 0 32 0 245 0 33 0 249 0 34 0 253 0 35 1 1 0 36 1 5 0 37 1 9 0 38 1 13 0 40 1 17 0 45 1 21 0 46 1 25 0 48 1 29 0 49] 
#[1 0 37 0 21 1 33 0 46] 
#[1 1 37 0 9 0 10 0 13 1 41 0 15 1 45 0 16 1 49 0 18 1 53 0 20 1 57 0 21 1 61 0 23 1 65 0 30 1 69 0 31 1 73 0 32 1 77 0 33 1 81 0 34 1 85 0 35 1 89 0 36 1 93 0 37 1 97 0 38 1 101 0 39 1 105 0 40 1 109 0 43 1 113 0 44 1 117 0 45 1 121 0 46 1 125 0 48 1 129 0 49] 
#[1 1 133 0 23 1 137 0 30] 
#[1 1 141 0 9 1 145 0 15 1 149 0 16 1 153 0 18 1 157 0 20 1 161 0 21 1 165 0 23 1 169 0 30 1 173 0 31 1 177 0 32 1 181 0 33 1 185 0 34 1 189 0 35 1 193 0 36 1 197 0 37 1 201 0 38 1 205 0 40 1 209 0 45 1 213 0 46 1 217 0 48 1 221 0 49] 
#[1 1 225 0 9 1 229 0 15 1 233 0 16 1 237 0 18 1 241 0 20 1 245 0 21 1 249 0 23 1 253 0 30 2 1 0 31 2 5 0 32 2 9 0 33 2 13 0 34 2 17 0 35 2 21 0 36 2 25 0 37 2 29 0 38 2 33 0 40 2 37 0 45 2 41 0 46 2 45 0 48 2 49 0 49] 
#[0 0 14 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 11 0 12] 
#[0 0 18 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 11 0 12 0 18] 
#[0 0 22 0 50] 
#[0 0 26 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 11 0 12 0 18] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 11 0 12] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 11 0 12] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 11 0 12] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 11 0 12] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 11 0 12] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 11 0 12] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 11 0 12] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 11 0 12] 
#[1 0 34 0 1 0 34 0 2 0 34 0 3 0 34 0 4 0 34 0 5 0 34 0 6 0 34 0 7 0 34 0 8 0 34 0 10 0 34 0 11 0 34 0 12 2 53 0 18] 
#[1 2 57 0 1 2 61 0 2 2 65 0 3 2 69 0 4 2 73 0 5 2 77 0 6 2 81 0 7 2 85 0 8 2 89 0 10 0 38 0 11 2 93 0 12] 
#[0 0 42 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 11 0 12] 
#[0 2 97 0 11] 
#[0 0 46 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 11 0 12] 
#[0 0 46 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 11 0 12] 
#[0 0 0 0 50] 
#[0 0 50 0 50] 
#[1 0 137 0 21 2 101 0 46] 
#[1 1 37 0 9 0 10 0 13 1 41 0 15 1 45 0 16 1 49 0 18 1 53 0 20 1 57 0 21 1 61 0 23 1 65 0 30 1 69 0 31 1 73 0 32 1 77 0 33 1 81 0 34 1 85 0 35 1 89 0 36 1 93 0 37 1 97 0 38 2 105 0 39 1 105 0 40 1 109 0 43 1 113 0 44 1 117 0 45 1 121 0 46 1 125 0 48 1 129 0 49] 
#[1 2 109 0 23 2 113 0 30] 
#[1 1 141 0 9 1 145 0 15 1 149 0 16 1 153 0 18 1 157 0 20 1 161 0 21 1 165 0 23 1 169 0 30 1 173 0 31 1 177 0 32 1 181 0 33 1 185 0 34 1 189 0 35 1 193 0 36 1 197 0 37 1 201 0 38 1 205 0 40 2 117 0 45 1 213 0 46 1 217 0 48 1 221 0 49] 
#[1 1 225 0 9 1 229 0 15 1 233 0 16 1 237 0 18 1 241 0 20 1 245 0 21 1 249 0 23 1 253 0 30 2 1 0 31 2 5 0 32 2 9 0 33 2 13 0 34 2 17 0 35 2 21 0 36 2 25 0 37 2 29 0 38 2 33 0 40 2 121 0 45 2 41 0 46 2 45 0 48 2 49 0 49] 
#[0 0 14 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 12 0 50] 
#[0 0 18 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 12 0 18 0 50] 
#[0 0 26 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 12 0 18 0 50] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 12 0 50] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 12 0 50] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 12 0 50] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 12 0 50] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 12 0 50] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 12 0 50] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 12 0 50] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 12 0 50] 
#[1 0 34 0 1 0 34 0 2 0 34 0 3 0 34 0 4 0 34 0 5 0 34 0 6 0 34 0 7 0 34 0 8 0 34 0 10 0 34 0 12 2 125 0 18 0 34 0 50] 
#[1 2 129 0 1 2 133 0 2 2 137 0 3 2 141 0 4 2 145 0 5 2 149 0 6 2 153 0 7 2 157 0 8 2 161 0 10 2 165 0 12 0 38 0 50] 
#[0 0 42 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 12 0 50] 
#[0 0 0 0 50] 
#[0 0 46 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 12 0 50] 
#[0 0 46 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 12 0 50] 
#[1 0 225 0 21 2 169 0 46] 
#[1 1 37 0 9 0 10 0 13 1 41 0 15 1 45 0 16 1 49 0 18 1 53 0 20 1 57 0 21 1 61 0 23 1 65 0 30 1 69 0 31 1 73 0 32 1 77 0 33 1 81 0 34 1 85 0 35 1 89 0 36 1 93 0 37 1 97 0 38 2 173 0 39 1 105 0 40 1 109 0 43 1 113 0 44 1 117 0 45 1 121 0 46 1 125 0 48 1 129 0 49] 
#[1 2 177 0 23 2 181 0 30] 
#[1 1 141 0 9 1 145 0 15 1 149 0 16 1 153 0 18 1 157 0 20 1 161 0 21 1 165 0 23 1 169 0 30 1 173 0 31 1 177 0 32 1 181 0 33 1 185 0 34 1 189 0 35 1 193 0 36 1 197 0 37 1 201 0 38 1 205 0 40 2 185 0 45 1 213 0 46 1 217 0 48 1 221 0 49] 
#[1 1 225 0 9 1 229 0 15 1 233 0 16 1 237 0 18 1 241 0 20 1 245 0 21 1 249 0 23 1 253 0 30 2 1 0 31 2 5 0 32 2 9 0 33 2 13 0 34 2 17 0 35 2 21 0 36 2 25 0 37 2 29 0 38 2 33 0 40 2 189 0 45 2 41 0 46 2 45 0 48 2 49 0 49] 
#[0 0 14 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 50] 
#[0 0 18 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 18 0 50] 
#[0 0 26 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 18 0 50] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 50] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 50] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 50] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 50] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 50] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 50] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 50] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 50] 
#[1 0 34 0 1 0 34 0 2 0 34 0 3 0 34 0 4 0 34 0 5 0 34 0 6 0 34 0 7 0 34 0 8 0 34 0 10 2 193 0 18 0 34 0 50] 
#[1 2 197 0 1 2 201 0 2 2 205 0 3 2 209 0 4 2 213 0 5 2 217 0 6 2 221 0 7 2 225 0 8 2 229 0 10 0 0 0 50] 
#[0 0 42 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 50] 
#[0 0 46 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 50] 
#[0 0 46 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 50] 
#[0 0 54 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 11 0 12] 
#[1 1 57 0 21 2 233 0 46] 
#[1 1 37 0 9 0 10 0 13 1 41 0 15 1 45 0 16 1 49 0 18 1 53 0 20 1 57 0 21 1 61 0 23 1 65 0 30 1 69 0 31 1 73 0 32 1 77 0 33 1 81 0 34 1 85 0 35 1 89 0 36 1 93 0 37 1 97 0 38 2 237 0 39 1 105 0 40 1 109 0 43 1 113 0 44 1 117 0 45 1 121 0 46 1 125 0 48 1 129 0 49] 
#[1 2 241 0 23 2 245 0 30] 
#[1 1 141 0 9 1 145 0 15 1 149 0 16 1 153 0 18 1 157 0 20 1 161 0 21 1 165 0 23 1 169 0 30 1 173 0 31 1 177 0 32 1 181 0 33 1 185 0 34 1 189 0 35 1 193 0 36 1 197 0 37 1 201 0 38 1 205 0 40 2 249 0 45 1 213 0 46 1 217 0 48 1 221 0 49] 
#[1 1 225 0 9 1 229 0 15 1 233 0 16 1 237 0 18 1 241 0 20 1 245 0 21 1 249 0 23 1 253 0 30 2 1 0 31 2 5 0 32 2 9 0 33 2 13 0 34 2 17 0 35 2 21 0 36 2 25 0 37 2 29 0 38 2 33 0 40 2 253 0 45 2 41 0 46 2 45 0 48 2 49 0 49] 
#[0 0 14 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 13 0 17] 
#[0 0 18 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 13 0 17 0 18] 
#[0 0 26 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 13 0 17 0 18] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 13 0 17] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 13 0 17] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 13 0 17] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 13 0 17] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 13 0 17] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 13 0 17] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 13 0 17] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 13 0 17] 
#[0 3 1 0 13] 
#[1 0 34 0 1 0 34 0 2 0 34 0 3 0 34 0 4 0 34 0 5 0 34 0 6 0 34 0 7 0 34 0 8 0 34 0 10 0 34 0 13 0 34 0 17 3 5 0 18] 
#[0 0 58 0 13] 
#[0 0 62 0 13] 
#[1 3 9 0 1 3 13 0 2 3 17 0 3 3 21 0 4 3 25 0 5 3 29 0 6 3 33 0 7 3 37 0 8 3 41 0 10 0 66 0 13 0 66 0 17 3 45 0 42] 
#[0 0 42 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 13 0 17] 
#[0 0 46 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 13 0 17] 
#[0 0 46 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 13 0 17] 
#[0 0 18 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 11 0 12] 
#[0 0 70 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 11 0 12] 
#[1 1 161 0 21 3 49 0 46] 
#[1 1 37 0 9 0 10 0 13 1 41 0 15 1 45 0 16 1 49 0 18 1 53 0 20 1 57 0 21 1 61 0 23 1 65 0 30 1 69 0 31 1 73 0 32 1 77 0 33 1 81 0 34 1 85 0 35 1 89 0 36 1 93 0 37 1 97 0 38 3 53 0 39 1 105 0 40 1 109 0 43 1 113 0 44 1 117 0 45 1 121 0 46 1 125 0 48 1 129 0 49] 
#[1 3 57 0 23 3 61 0 30] 
#[1 1 141 0 9 1 145 0 15 1 149 0 16 1 153 0 18 1 157 0 20 1 161 0 21 1 165 0 23 1 169 0 30 1 173 0 31 1 177 0 32 1 181 0 33 1 185 0 34 1 189 0 35 1 193 0 36 1 197 0 37 1 201 0 38 1 205 0 40 3 65 0 45 1 213 0 46 1 217 0 48 1 221 0 49] 
#[1 1 225 0 9 1 229 0 15 1 233 0 16 1 237 0 18 1 241 0 20 1 245 0 21 1 249 0 23 1 253 0 30 2 1 0 31 2 5 0 32 2 9 0 33 2 13 0 34 2 17 0 35 2 21 0 36 2 25 0 37 2 29 0 38 2 33 0 40 3 69 0 45 2 41 0 46 2 45 0 48 2 49 0 49] 
#[0 0 14 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 19] 
#[0 0 18 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 18 0 19] 
#[0 0 26 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 18 0 19] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 19] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 19] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 19] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 19] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 19] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 19] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 19] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 19] 
#[1 0 34 0 1 0 34 0 2 0 34 0 3 0 34 0 4 0 34 0 5 0 34 0 6 0 34 0 7 0 34 0 8 0 34 0 10 3 73 0 18 0 34 0 19] 
#[1 3 77 0 1 3 81 0 2 3 85 0 3 3 89 0 4 3 93 0 5 3 97 0 6 3 101 0 7 3 105 0 8 3 109 0 10 3 113 0 19] 
#[0 0 42 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 19] 
#[0 0 46 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 19] 
#[0 0 46 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 19] 
#[1 1 245 0 21 3 117 0 46] 
#[1 1 37 0 9 0 10 0 13 1 41 0 15 1 45 0 16 1 49 0 18 1 53 0 20 1 57 0 21 1 61 0 23 1 65 0 30 1 69 0 31 1 73 0 32 1 77 0 33 1 81 0 34 1 85 0 35 1 89 0 36 1 93 0 37 1 97 0 38 3 121 0 39 1 105 0 40 1 109 0 43 1 113 0 44 1 117 0 45 1 121 0 46 1 125 0 48 1 129 0 49] 
#[1 3 125 0 23 3 129 0 30] 
#[1 1 141 0 9 1 145 0 15 1 149 0 16 1 153 0 18 1 157 0 20 1 161 0 21 1 165 0 23 1 169 0 30 1 173 0 31 1 177 0 32 1 181 0 33 1 185 0 34 1 189 0 35 1 193 0 36 1 197 0 37 1 201 0 38 1 205 0 40 3 133 0 45 1 213 0 46 1 217 0 48 1 221 0 49] 
#[1 1 225 0 9 1 229 0 15 1 233 0 16 1 237 0 18 1 241 0 20 1 245 0 21 1 249 0 23 1 253 0 30 2 1 0 31 2 5 0 32 2 9 0 33 2 13 0 34 2 17 0 35 2 21 0 36 2 25 0 37 2 29 0 38 2 33 0 40 3 137 0 45 2 41 0 46 2 45 0 48 2 49 0 49] 
#[0 0 14 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17] 
#[0 0 18 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17 0 18] 
#[0 0 26 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17 0 18] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17] 
#[1 0 34 0 1 0 34 0 2 0 34 0 3 0 34 0 4 0 34 0 5 0 34 0 6 0 34 0 7 0 34 0 8 0 34 0 10 0 34 0 17 3 141 0 18] 
#[1 3 145 0 1 3 149 0 2 3 153 0 3 3 157 0 4 3 161 0 5 3 165 0 6 3 169 0 7 3 173 0 8 3 177 0 10 3 181 0 17] 
#[0 0 42 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17] 
#[0 0 46 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17] 
#[0 0 46 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17] 
#[1 3 185 0 9 3 189 0 15 3 193 0 16 3 197 0 18 0 10 0 19 3 201 0 20 3 205 0 21 3 209 0 23 3 213 0 30 3 217 0 31 3 221 0 32 3 225 0 33 3 229 0 34 3 233 0 35 3 237 0 36 3 241 0 37 3 245 0 38 3 249 0 39 3 253 0 40 4 1 0 43 4 5 0 44 4 9 0 45 4 13 0 46 4 17 0 48 4 21 0 49] 
#[1 0 17 0 9 0 21 0 15 0 25 0 16 0 29 0 18 0 33 0 20 0 37 0 21 0 41 0 23 0 49 0 30 0 53 0 31 0 57 0 32 0 61 0 33 0 65 0 34 0 69 0 35 0 73 0 36 0 77 0 37 0 81 0 38 0 85 0 40 4 25 0 45 0 93 0 46 0 101 0 48 0 105 0 49] 
#[1 0 17 0 9 0 21 0 15 0 25 0 16 0 29 0 18 0 33 0 20 0 37 0 21 0 41 0 23 0 49 0 30 0 53 0 31 0 57 0 32 0 61 0 33 0 65 0 34 0 69 0 35 0 73 0 36 0 77 0 37 0 81 0 38 0 85 0 40 4 29 0 45 0 93 0 46 0 101 0 48 0 105 0 49] 
#[1 0 17 0 9 0 21 0 15 0 25 0 16 0 29 0 18 0 33 0 20 0 37 0 21 0 41 0 23 0 49 0 30 0 53 0 31 0 57 0 32 0 61 0 33 0 65 0 34 0 69 0 35 0 73 0 36 0 77 0 37 0 81 0 38 0 85 0 40 4 33 0 45 0 93 0 46 0 101 0 48 0 105 0 49] 
#[1 0 17 0 9 0 21 0 15 0 25 0 16 0 29 0 18 0 33 0 20 0 37 0 21 0 41 0 23 0 49 0 30 0 53 0 31 0 57 0 32 0 61 0 33 0 65 0 34 0 69 0 35 0 73 0 36 0 77 0 37 0 81 0 38 0 85 0 40 4 37 0 45 0 93 0 46 0 101 0 48 0 105 0 49] 
#[1 0 17 0 9 0 21 0 15 0 25 0 16 0 29 0 18 0 33 0 20 0 37 0 21 0 41 0 23 0 49 0 30 0 53 0 31 0 57 0 32 0 61 0 33 0 65 0 34 0 69 0 35 0 73 0 36 0 77 0 37 0 81 0 38 0 85 0 40 4 41 0 45 0 93 0 46 0 101 0 48 0 105 0 49] 
#[1 0 17 0 9 0 21 0 15 0 25 0 16 0 29 0 18 0 33 0 20 0 37 0 21 0 41 0 23 0 49 0 30 0 53 0 31 0 57 0 32 0 61 0 33 0 65 0 34 0 69 0 35 0 73 0 36 0 77 0 37 0 81 0 38 0 85 0 40 4 45 0 45 0 93 0 46 0 101 0 48 0 105 0 49] 
#[1 0 17 0 9 0 21 0 15 0 25 0 16 0 29 0 18 0 33 0 20 0 37 0 21 0 41 0 23 0 49 0 30 0 53 0 31 0 57 0 32 0 61 0 33 0 65 0 34 0 69 0 35 0 73 0 36 0 77 0 37 0 81 0 38 0 85 0 40 4 49 0 45 0 93 0 46 0 101 0 48 0 105 0 49] 
#[1 1 133 0 23 4 53 0 30 4 57 0 40] 
#[1 0 17 0 9 0 21 0 15 0 25 0 16 0 29 0 18 0 33 0 20 0 37 0 21 0 41 0 23 0 49 0 30 0 53 0 31 0 57 0 32 0 61 0 33 0 65 0 34 0 69 0 35 0 73 0 36 0 77 0 37 0 81 0 38 0 85 0 40 4 61 0 45 0 93 0 46 0 101 0 48 0 105 0 49] 
#[1 4 65 0 23 4 69 0 29 4 73 0 30] 
#[1 0 74 0 9 0 74 0 15 0 74 0 16 0 74 0 18 0 74 0 20 0 74 0 21 0 74 0 23 4 77 0 25 0 74 0 50] 
#[0 0 54 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 12 0 50] 
#[0 4 81 0 13] 
#[0 0 18 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 12 0 50] 
#[0 0 70 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 12 0 50] 
#[1 3 77 0 1 3 81 0 2 3 85 0 3 3 89 0 4 3 93 0 5 3 97 0 6 3 101 0 7 3 105 0 8 3 109 0 10 4 85 0 19] 
#[1 3 145 0 1 3 149 0 2 3 153 0 3 3 157 0 4 3 161 0 5 3 165 0 6 3 169 0 7 3 173 0 8 3 177 0 10 4 89 0 17] 
#[1 3 185 0 9 3 189 0 15 3 193 0 16 3 197 0 18 0 10 0 19 3 201 0 20 3 205 0 21 3 209 0 23 3 213 0 30 3 217 0 31 3 221 0 32 3 225 0 33 3 229 0 34 3 233 0 35 3 237 0 36 3 241 0 37 3 245 0 38 4 93 0 39 3 253 0 40 4 1 0 43 4 5 0 44 4 9 0 45 4 13 0 46 4 17 0 48 4 21 0 49] 
#[1 0 117 0 9 0 121 0 15 0 125 0 16 0 129 0 18 0 133 0 20 0 137 0 21 0 141 0 23 0 145 0 30 0 149 0 31 0 153 0 32 0 157 0 33 0 161 0 34 0 165 0 35 0 169 0 36 0 173 0 37 0 177 0 38 0 181 0 40 4 97 0 45 0 189 0 46 0 197 0 48 0 201 0 49] 
#[1 0 117 0 9 0 121 0 15 0 125 0 16 0 129 0 18 0 133 0 20 0 137 0 21 0 141 0 23 0 145 0 30 0 149 0 31 0 153 0 32 0 157 0 33 0 161 0 34 0 165 0 35 0 169 0 36 0 173 0 37 0 177 0 38 0 181 0 40 4 101 0 45 0 189 0 46 0 197 0 48 0 201 0 49] 
#[1 0 117 0 9 0 121 0 15 0 125 0 16 0 129 0 18 0 133 0 20 0 137 0 21 0 141 0 23 0 145 0 30 0 149 0 31 0 153 0 32 0 157 0 33 0 161 0 34 0 165 0 35 0 169 0 36 0 173 0 37 0 177 0 38 0 181 0 40 4 105 0 45 0 189 0 46 0 197 0 48 0 201 0 49] 
#[1 0 117 0 9 0 121 0 15 0 125 0 16 0 129 0 18 0 133 0 20 0 137 0 21 0 141 0 23 0 145 0 30 0 149 0 31 0 153 0 32 0 157 0 33 0 161 0 34 0 165 0 35 0 169 0 36 0 173 0 37 0 177 0 38 0 181 0 40 4 109 0 45 0 189 0 46 0 197 0 48 0 201 0 49] 
#[1 0 117 0 9 0 121 0 15 0 125 0 16 0 129 0 18 0 133 0 20 0 137 0 21 0 141 0 23 0 145 0 30 0 149 0 31 0 153 0 32 0 157 0 33 0 161 0 34 0 165 0 35 0 169 0 36 0 173 0 37 0 177 0 38 0 181 0 40 4 113 0 45 0 189 0 46 0 197 0 48 0 201 0 49] 
#[1 0 117 0 9 0 121 0 15 0 125 0 16 0 129 0 18 0 133 0 20 0 137 0 21 0 141 0 23 0 145 0 30 0 149 0 31 0 153 0 32 0 157 0 33 0 161 0 34 0 165 0 35 0 169 0 36 0 173 0 37 0 177 0 38 0 181 0 40 4 117 0 45 0 189 0 46 0 197 0 48 0 201 0 49] 
#[1 0 117 0 9 0 121 0 15 0 125 0 16 0 129 0 18 0 133 0 20 0 137 0 21 0 141 0 23 0 145 0 30 0 149 0 31 0 153 0 32 0 157 0 33 0 161 0 34 0 165 0 35 0 169 0 36 0 173 0 37 0 177 0 38 0 181 0 40 4 121 0 45 0 189 0 46 0 197 0 48 0 201 0 49] 
#[1 2 109 0 23 4 125 0 30 4 129 0 40] 
#[1 0 117 0 9 0 121 0 15 0 125 0 16 0 129 0 18 0 133 0 20 0 137 0 21 0 141 0 23 0 145 0 30 0 149 0 31 0 153 0 32 0 157 0 33 0 161 0 34 0 165 0 35 0 169 0 36 0 173 0 37 0 177 0 38 0 181 0 40 4 133 0 45 0 189 0 46 0 197 0 48 0 201 0 49] 
#[1 4 137 0 23 4 141 0 29 4 145 0 30] 
#[0 0 54 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 50] 
#[0 4 149 0 13] 
#[0 0 18 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 50] 
#[0 0 70 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 50] 
#[1 3 77 0 1 3 81 0 2 3 85 0 3 3 89 0 4 3 93 0 5 3 97 0 6 3 101 0 7 3 105 0 8 3 109 0 10 4 153 0 19] 
#[1 3 145 0 1 3 149 0 2 3 153 0 3 3 157 0 4 3 161 0 5 3 165 0 6 3 169 0 7 3 173 0 8 3 177 0 10 4 157 0 17] 
#[1 3 185 0 9 3 189 0 15 3 193 0 16 3 197 0 18 0 10 0 19 3 201 0 20 3 205 0 21 3 209 0 23 3 213 0 30 3 217 0 31 3 221 0 32 3 225 0 33 3 229 0 34 3 233 0 35 3 237 0 36 3 241 0 37 3 245 0 38 4 161 0 39 3 253 0 40 4 1 0 43 4 5 0 44 4 9 0 45 4 13 0 46 4 17 0 48 4 21 0 49] 
#[1 0 205 0 9 0 209 0 15 0 213 0 16 0 217 0 18 0 221 0 20 0 225 0 21 0 229 0 23 0 233 0 30 0 237 0 31 0 241 0 32 0 245 0 33 0 249 0 34 0 253 0 35 1 1 0 36 1 5 0 37 1 9 0 38 1 13 0 40 4 165 0 45 1 21 0 46 1 25 0 48 1 29 0 49] 
#[1 0 205 0 9 0 209 0 15 0 213 0 16 0 217 0 18 0 221 0 20 0 225 0 21 0 229 0 23 0 233 0 30 0 237 0 31 0 241 0 32 0 245 0 33 0 249 0 34 0 253 0 35 1 1 0 36 1 5 0 37 1 9 0 38 1 13 0 40 4 169 0 45 1 21 0 46 1 25 0 48 1 29 0 49] 
#[1 0 205 0 9 0 209 0 15 0 213 0 16 0 217 0 18 0 221 0 20 0 225 0 21 0 229 0 23 0 233 0 30 0 237 0 31 0 241 0 32 0 245 0 33 0 249 0 34 0 253 0 35 1 1 0 36 1 5 0 37 1 9 0 38 1 13 0 40 4 173 0 45 1 21 0 46 1 25 0 48 1 29 0 49] 
#[1 0 205 0 9 0 209 0 15 0 213 0 16 0 217 0 18 0 221 0 20 0 225 0 21 0 229 0 23 0 233 0 30 0 237 0 31 0 241 0 32 0 245 0 33 0 249 0 34 0 253 0 35 1 1 0 36 1 5 0 37 1 9 0 38 1 13 0 40 4 177 0 45 1 21 0 46 1 25 0 48 1 29 0 49] 
#[1 0 205 0 9 0 209 0 15 0 213 0 16 0 217 0 18 0 221 0 20 0 225 0 21 0 229 0 23 0 233 0 30 0 237 0 31 0 241 0 32 0 245 0 33 0 249 0 34 0 253 0 35 1 1 0 36 1 5 0 37 1 9 0 38 1 13 0 40 4 181 0 45 1 21 0 46 1 25 0 48 1 29 0 49] 
#[1 0 205 0 9 0 209 0 15 0 213 0 16 0 217 0 18 0 221 0 20 0 225 0 21 0 229 0 23 0 233 0 30 0 237 0 31 0 241 0 32 0 245 0 33 0 249 0 34 0 253 0 35 1 1 0 36 1 5 0 37 1 9 0 38 1 13 0 40 4 185 0 45 1 21 0 46 1 25 0 48 1 29 0 49] 
#[1 0 205 0 9 0 209 0 15 0 213 0 16 0 217 0 18 0 221 0 20 0 225 0 21 0 229 0 23 0 233 0 30 0 237 0 31 0 241 0 32 0 245 0 33 0 249 0 34 0 253 0 35 1 1 0 36 1 5 0 37 1 9 0 38 1 13 0 40 4 189 0 45 1 21 0 46 1 25 0 48 1 29 0 49] 
#[1 2 177 0 23 4 193 0 30 4 197 0 40] 
#[1 0 205 0 9 0 209 0 15 0 213 0 16 0 217 0 18 0 221 0 20 0 225 0 21 0 229 0 23 0 233 0 30 0 237 0 31 0 241 0 32 0 245 0 33 0 249 0 34 0 253 0 35 1 1 0 36 1 5 0 37 1 9 0 38 1 13 0 40 4 201 0 45 1 21 0 46 1 25 0 48 1 29 0 49] 
#[0 0 54 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 13 0 17] 
#[0 4 205 0 13] 
#[0 0 18 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 13 0 17] 
#[0 0 70 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 13 0 17] 
#[1 3 77 0 1 3 81 0 2 3 85 0 3 3 89 0 4 3 93 0 5 3 97 0 6 3 101 0 7 3 105 0 8 3 109 0 10 4 209 0 19] 
#[1 3 145 0 1 3 149 0 2 3 153 0 3 3 157 0 4 3 161 0 5 3 165 0 6 3 169 0 7 3 173 0 8 3 177 0 10 4 213 0 17] 
#[0 0 78 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 11 0 12] 
#[1 3 185 0 9 3 189 0 15 3 193 0 16 3 197 0 18 0 10 0 19 3 201 0 20 3 205 0 21 3 209 0 23 3 213 0 30 3 217 0 31 3 221 0 32 3 225 0 33 3 229 0 34 3 233 0 35 3 237 0 36 3 241 0 37 3 245 0 38 4 217 0 39 3 253 0 40 4 1 0 43 4 5 0 44 4 9 0 45 4 13 0 46 4 17 0 48 4 21 0 49] 
#[1 1 37 0 9 1 41 0 15 1 45 0 16 1 49 0 18 1 53 0 20 1 57 0 21 1 61 0 23 1 65 0 30 1 69 0 31 1 73 0 32 1 77 0 33 1 81 0 34 1 85 0 35 1 89 0 36 1 93 0 37 1 97 0 38 1 105 0 40 4 221 0 45 1 121 0 46 1 125 0 48 1 129 0 49] 
#[1 1 37 0 9 1 41 0 15 1 45 0 16 1 49 0 18 1 53 0 20 1 57 0 21 1 61 0 23 1 65 0 30 1 69 0 31 1 73 0 32 1 77 0 33 1 81 0 34 1 85 0 35 1 89 0 36 1 93 0 37 1 97 0 38 1 105 0 40 4 225 0 45 1 121 0 46 1 125 0 48 1 129 0 49] 
#[1 1 37 0 9 1 41 0 15 1 45 0 16 1 49 0 18 1 53 0 20 1 57 0 21 1 61 0 23 1 65 0 30 1 69 0 31 1 73 0 32 1 77 0 33 1 81 0 34 1 85 0 35 1 89 0 36 1 93 0 37 1 97 0 38 1 105 0 40 4 229 0 45 1 121 0 46 1 125 0 48 1 129 0 49] 
#[1 1 37 0 9 1 41 0 15 1 45 0 16 1 49 0 18 1 53 0 20 1 57 0 21 1 61 0 23 1 65 0 30 1 69 0 31 1 73 0 32 1 77 0 33 1 81 0 34 1 85 0 35 1 89 0 36 1 93 0 37 1 97 0 38 1 105 0 40 4 233 0 45 1 121 0 46 1 125 0 48 1 129 0 49] 
#[1 1 37 0 9 1 41 0 15 1 45 0 16 1 49 0 18 1 53 0 20 1 57 0 21 1 61 0 23 1 65 0 30 1 69 0 31 1 73 0 32 1 77 0 33 1 81 0 34 1 85 0 35 1 89 0 36 1 93 0 37 1 97 0 38 1 105 0 40 4 237 0 45 1 121 0 46 1 125 0 48 1 129 0 49] 
#[1 1 37 0 9 1 41 0 15 1 45 0 16 1 49 0 18 1 53 0 20 1 57 0 21 1 61 0 23 1 65 0 30 1 69 0 31 1 73 0 32 1 77 0 33 1 81 0 34 1 85 0 35 1 89 0 36 1 93 0 37 1 97 0 38 1 105 0 40 4 241 0 45 1 121 0 46 1 125 0 48 1 129 0 49] 
#[1 1 37 0 9 1 41 0 15 1 45 0 16 1 49 0 18 1 53 0 20 1 57 0 21 1 61 0 23 1 65 0 30 1 69 0 31 1 73 0 32 1 77 0 33 1 81 0 34 1 85 0 35 1 89 0 36 1 93 0 37 1 97 0 38 1 105 0 40 4 245 0 45 1 121 0 46 1 125 0 48 1 129 0 49] 
#[1 2 241 0 23 4 249 0 30 4 253 0 40] 
#[1 1 37 0 9 1 41 0 15 1 45 0 16 1 49 0 18 1 53 0 20 1 57 0 21 1 61 0 23 1 65 0 30 1 69 0 31 1 73 0 32 1 77 0 33 1 81 0 34 1 85 0 35 1 89 0 36 1 93 0 37 1 97 0 38 1 105 0 40 5 1 0 45 1 121 0 46 1 125 0 48 1 129 0 49] 
#[1 0 82 0 13 5 5 0 17 5 9 0 41] 
#[0 0 54 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 19] 
#[0 5 13 0 13] 
#[0 0 18 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 19] 
#[0 0 70 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 19] 
#[1 3 77 0 1 3 81 0 2 3 85 0 3 3 89 0 4 3 93 0 5 3 97 0 6 3 101 0 7 3 105 0 8 3 109 0 10 5 17 0 19] 
#[1 3 145 0 1 3 149 0 2 3 153 0 3 3 157 0 4 3 161 0 5 3 165 0 6 3 169 0 7 3 173 0 8 3 177 0 10 5 21 0 17] 
#[1 3 185 0 9 3 189 0 15 3 193 0 16 3 197 0 18 0 10 0 19 3 201 0 20 3 205 0 21 3 209 0 23 3 213 0 30 3 217 0 31 3 221 0 32 3 225 0 33 3 229 0 34 3 233 0 35 3 237 0 36 3 241 0 37 3 245 0 38 5 25 0 39 3 253 0 40 4 1 0 43 4 5 0 44 4 9 0 45 4 13 0 46 4 17 0 48 4 21 0 49] 
#[1 1 141 0 9 1 145 0 15 1 149 0 16 1 153 0 18 1 157 0 20 1 161 0 21 1 165 0 23 1 169 0 30 1 173 0 31 1 177 0 32 1 181 0 33 1 185 0 34 1 189 0 35 1 193 0 36 1 197 0 37 1 201 0 38 1 205 0 40 5 29 0 45 1 213 0 46 1 217 0 48 1 221 0 49] 
#[1 1 141 0 9 1 145 0 15 1 149 0 16 1 153 0 18 1 157 0 20 1 161 0 21 1 165 0 23 1 169 0 30 1 173 0 31 1 177 0 32 1 181 0 33 1 185 0 34 1 189 0 35 1 193 0 36 1 197 0 37 1 201 0 38 1 205 0 40 5 33 0 45 1 213 0 46 1 217 0 48 1 221 0 49] 
#[1 1 141 0 9 1 145 0 15 1 149 0 16 1 153 0 18 1 157 0 20 1 161 0 21 1 165 0 23 1 169 0 30 1 173 0 31 1 177 0 32 1 181 0 33 1 185 0 34 1 189 0 35 1 193 0 36 1 197 0 37 1 201 0 38 1 205 0 40 5 37 0 45 1 213 0 46 1 217 0 48 1 221 0 49] 
#[1 1 141 0 9 1 145 0 15 1 149 0 16 1 153 0 18 1 157 0 20 1 161 0 21 1 165 0 23 1 169 0 30 1 173 0 31 1 177 0 32 1 181 0 33 1 185 0 34 1 189 0 35 1 193 0 36 1 197 0 37 1 201 0 38 1 205 0 40 5 41 0 45 1 213 0 46 1 217 0 48 1 221 0 49] 
#[1 1 141 0 9 1 145 0 15 1 149 0 16 1 153 0 18 1 157 0 20 1 161 0 21 1 165 0 23 1 169 0 30 1 173 0 31 1 177 0 32 1 181 0 33 1 185 0 34 1 189 0 35 1 193 0 36 1 197 0 37 1 201 0 38 1 205 0 40 5 45 0 45 1 213 0 46 1 217 0 48 1 221 0 49] 
#[1 1 141 0 9 1 145 0 15 1 149 0 16 1 153 0 18 1 157 0 20 1 161 0 21 1 165 0 23 1 169 0 30 1 173 0 31 1 177 0 32 1 181 0 33 1 185 0 34 1 189 0 35 1 193 0 36 1 197 0 37 1 201 0 38 1 205 0 40 5 49 0 45 1 213 0 46 1 217 0 48 1 221 0 49] 
#[1 1 141 0 9 1 145 0 15 1 149 0 16 1 153 0 18 1 157 0 20 1 161 0 21 1 165 0 23 1 169 0 30 1 173 0 31 1 177 0 32 1 181 0 33 1 185 0 34 1 189 0 35 1 193 0 36 1 197 0 37 1 201 0 38 1 205 0 40 5 53 0 45 1 213 0 46 1 217 0 48 1 221 0 49] 
#[1 3 57 0 23 5 57 0 30 5 61 0 40] 
#[1 1 141 0 9 1 145 0 15 1 149 0 16 1 153 0 18 1 157 0 20 1 161 0 21 1 165 0 23 1 169 0 30 1 173 0 31 1 177 0 32 1 181 0 33 1 185 0 34 1 189 0 35 1 193 0 36 1 197 0 37 1 201 0 38 1 205 0 40 5 65 0 45 1 213 0 46 1 217 0 48 1 221 0 49] 
#[0 0 86 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 11 0 12] 
#[0 0 54 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17] 
#[0 5 69 0 13] 
#[0 0 18 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17] 
#[0 0 70 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17] 
#[1 3 77 0 1 3 81 0 2 3 85 0 3 3 89 0 4 3 93 0 5 3 97 0 6 3 101 0 7 3 105 0 8 3 109 0 10 5 73 0 19] 
#[1 3 145 0 1 3 149 0 2 3 153 0 3 3 157 0 4 3 161 0 5 3 165 0 6 3 169 0 7 3 173 0 8 3 177 0 10 5 77 0 17] 
#[1 3 185 0 9 3 189 0 15 3 193 0 16 3 197 0 18 0 10 0 19 3 201 0 20 3 205 0 21 3 209 0 23 3 213 0 30 3 217 0 31 3 221 0 32 3 225 0 33 3 229 0 34 3 233 0 35 3 237 0 36 3 241 0 37 3 245 0 38 5 81 0 39 3 253 0 40 4 1 0 43 4 5 0 44 4 9 0 45 4 13 0 46 4 17 0 48 4 21 0 49] 
#[1 1 225 0 9 1 229 0 15 1 233 0 16 1 237 0 18 1 241 0 20 1 245 0 21 1 249 0 23 1 253 0 30 2 1 0 31 2 5 0 32 2 9 0 33 2 13 0 34 2 17 0 35 2 21 0 36 2 25 0 37 2 29 0 38 2 33 0 40 5 85 0 45 2 41 0 46 2 45 0 48 2 49 0 49] 
#[1 1 225 0 9 1 229 0 15 1 233 0 16 1 237 0 18 1 241 0 20 1 245 0 21 1 249 0 23 1 253 0 30 2 1 0 31 2 5 0 32 2 9 0 33 2 13 0 34 2 17 0 35 2 21 0 36 2 25 0 37 2 29 0 38 2 33 0 40 5 89 0 45 2 41 0 46 2 45 0 48 2 49 0 49] 
#[1 1 225 0 9 1 229 0 15 1 233 0 16 1 237 0 18 1 241 0 20 1 245 0 21 1 249 0 23 1 253 0 30 2 1 0 31 2 5 0 32 2 9 0 33 2 13 0 34 2 17 0 35 2 21 0 36 2 25 0 37 2 29 0 38 2 33 0 40 5 93 0 45 2 41 0 46 2 45 0 48 2 49 0 49] 
#[1 1 225 0 9 1 229 0 15 1 233 0 16 1 237 0 18 1 241 0 20 1 245 0 21 1 249 0 23 1 253 0 30 2 1 0 31 2 5 0 32 2 9 0 33 2 13 0 34 2 17 0 35 2 21 0 36 2 25 0 37 2 29 0 38 2 33 0 40 5 97 0 45 2 41 0 46 2 45 0 48 2 49 0 49] 
#[1 1 225 0 9 1 229 0 15 1 233 0 16 1 237 0 18 1 241 0 20 1 245 0 21 1 249 0 23 1 253 0 30 2 1 0 31 2 5 0 32 2 9 0 33 2 13 0 34 2 17 0 35 2 21 0 36 2 25 0 37 2 29 0 38 2 33 0 40 5 101 0 45 2 41 0 46 2 45 0 48 2 49 0 49] 
#[1 1 225 0 9 1 229 0 15 1 233 0 16 1 237 0 18 1 241 0 20 1 245 0 21 1 249 0 23 1 253 0 30 2 1 0 31 2 5 0 32 2 9 0 33 2 13 0 34 2 17 0 35 2 21 0 36 2 25 0 37 2 29 0 38 2 33 0 40 5 105 0 45 2 41 0 46 2 45 0 48 2 49 0 49] 
#[1 1 225 0 9 1 229 0 15 1 233 0 16 1 237 0 18 1 241 0 20 1 245 0 21 1 249 0 23 1 253 0 30 2 1 0 31 2 5 0 32 2 9 0 33 2 13 0 34 2 17 0 35 2 21 0 36 2 25 0 37 2 29 0 38 2 33 0 40 5 109 0 45 2 41 0 46 2 45 0 48 2 49 0 49] 
#[1 3 125 0 23 5 113 0 30 5 117 0 40] 
#[1 1 225 0 9 1 229 0 15 1 233 0 16 1 237 0 18 1 241 0 20 1 245 0 21 1 249 0 23 1 253 0 30 2 1 0 31 2 5 0 32 2 9 0 33 2 13 0 34 2 17 0 35 2 21 0 36 2 25 0 37 2 29 0 38 2 33 0 40 5 121 0 45 2 41 0 46 2 45 0 48 2 49 0 49] 
#[1 5 125 0 9 5 129 0 15 5 133 0 16 5 137 0 18 5 141 0 20 5 145 0 21 5 149 0 23 5 153 0 30 5 157 0 31 5 161 0 32 5 165 0 33 5 169 0 34 5 173 0 35 5 177 0 36 5 181 0 37 5 185 0 38 5 189 0 40 5 193 0 45 5 197 0 46 5 201 0 48 5 205 0 49] 
#[1 3 205 0 21 5 209 0 46] 
#[1 1 37 0 9 0 10 0 13 1 41 0 15 1 45 0 16 1 49 0 18 1 53 0 20 1 57 0 21 1 61 0 23 1 65 0 30 1 69 0 31 1 73 0 32 1 77 0 33 1 81 0 34 1 85 0 35 1 89 0 36 1 93 0 37 1 97 0 38 5 213 0 39 1 105 0 40 1 109 0 43 1 113 0 44 1 117 0 45 1 121 0 46 1 125 0 48 1 129 0 49] 
#[1 5 217 0 23 5 221 0 30] 
#[1 1 141 0 9 1 145 0 15 1 149 0 16 1 153 0 18 1 157 0 20 1 161 0 21 1 165 0 23 1 169 0 30 1 173 0 31 1 177 0 32 1 181 0 33 1 185 0 34 1 189 0 35 1 193 0 36 1 197 0 37 1 201 0 38 1 205 0 40 5 225 0 45 1 213 0 46 1 217 0 48 1 221 0 49] 
#[1 1 225 0 9 1 229 0 15 1 233 0 16 1 237 0 18 1 241 0 20 1 245 0 21 1 249 0 23 1 253 0 30 2 1 0 31 2 5 0 32 2 9 0 33 2 13 0 34 2 17 0 35 2 21 0 36 2 25 0 37 2 29 0 38 2 33 0 40 5 229 0 45 2 41 0 46 2 45 0 48 2 49 0 49] 
#[0 0 14 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17 0 19] 
#[0 0 18 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17 0 18 0 19] 
#[0 0 26 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17 0 18 0 19] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17 0 19] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17 0 19] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17 0 19] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17 0 19] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17 0 19] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17 0 19] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17 0 19] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17 0 19] 
#[0 5 233 0 19] 
#[1 0 34 0 1 0 34 0 2 0 34 0 3 0 34 0 4 0 34 0 5 0 34 0 6 0 34 0 7 0 34 0 8 0 34 0 10 0 34 0 17 5 237 0 18 0 34 0 19] 
#[0 0 58 0 19] 
#[0 0 62 0 19] 
#[1 5 241 0 1 5 245 0 2 5 249 0 3 5 253 0 4 6 1 0 5 6 5 0 6 6 9 0 7 6 13 0 8 6 17 0 10 0 66 0 17 0 66 0 19 6 21 0 42] 
#[0 0 42 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17 0 19] 
#[0 0 46 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17 0 19] 
#[0 0 46 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17 0 19] 
#[1 0 90 0 1 2 61 0 2 0 90 0 3 0 90 0 4 2 73 0 5 0 90 0 6 0 90 0 7 2 85 0 8 0 90 0 10 0 90 0 11 0 90 0 12] 
#[1 0 94 0 1 0 94 0 2 0 94 0 3 0 94 0 4 0 94 0 5 0 94 0 6 0 94 0 7 2 85 0 8 0 94 0 10 0 94 0 11 0 94 0 12] 
#[1 0 98 0 1 2 61 0 2 0 98 0 3 0 98 0 4 2 73 0 5 0 98 0 6 0 98 0 7 2 85 0 8 0 98 0 10 0 98 0 11 0 98 0 12] 
#[1 2 57 0 1 2 61 0 2 2 65 0 3 0 102 0 4 2 73 0 5 0 102 0 6 0 102 0 7 2 85 0 8 0 102 0 10 0 102 0 11 0 102 0 12] 
#[1 0 106 0 1 0 106 0 2 0 106 0 3 0 106 0 4 0 106 0 5 0 106 0 6 0 106 0 7 2 85 0 8 0 106 0 10 0 106 0 11 0 106 0 12] 
#[1 2 57 0 1 2 61 0 2 2 65 0 3 2 69 0 4 2 73 0 5 2 85 0 8 0 110 0 11 0 110 0 12] 
#[1 2 57 0 1 2 61 0 2 2 65 0 3 2 69 0 4 2 73 0 5 2 85 0 8 0 114 0 11 0 114 0 12] 
#[0 0 26 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 11 0 12] 
#[0 0 118 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 11 0 12] 
#[1 2 57 0 1 2 61 0 2 2 65 0 3 2 69 0 4 2 73 0 5 2 85 0 8 0 122 0 11 0 122 0 12] 
#[0 0 18 0 11] 
#[0 0 126 0 11] 
#[0 0 130 0 11] 
#[1 0 17 0 9 0 21 0 15 0 25 0 16 0 29 0 18 0 33 0 20 0 37 0 21 0 41 0 23 6 25 0 27 0 49 0 30 0 53 0 31 0 57 0 32 0 61 0 33 0 65 0 34 0 69 0 35 0 73 0 36 0 77 0 37 0 81 0 38 0 85 0 40 0 89 0 45 0 93 0 46 6 29 0 47 0 101 0 48 0 105 0 49 0 134 0 50] 
#[0 0 78 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 12 0 50] 
#[0 0 86 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 12 0 50] 
#[1 5 125 0 9 5 129 0 15 5 133 0 16 5 137 0 18 5 141 0 20 5 145 0 21 5 149 0 23 5 153 0 30 5 157 0 31 5 161 0 32 5 165 0 33 5 169 0 34 5 173 0 35 5 177 0 36 5 181 0 37 5 185 0 38 5 189 0 40 6 33 0 45 5 197 0 46 5 201 0 48 5 205 0 49] 
#[0 6 37 0 19] 
#[1 0 90 0 1 2 133 0 2 0 90 0 3 0 90 0 4 2 145 0 5 0 90 0 6 0 90 0 7 2 157 0 8 0 90 0 10 0 90 0 12 0 90 0 50] 
#[1 0 94 0 1 0 94 0 2 0 94 0 3 0 94 0 4 0 94 0 5 0 94 0 6 0 94 0 7 2 157 0 8 0 94 0 10 0 94 0 12 0 94 0 50] 
#[1 0 98 0 1 2 133 0 2 0 98 0 3 0 98 0 4 2 145 0 5 0 98 0 6 0 98 0 7 2 157 0 8 0 98 0 10 0 98 0 12 0 98 0 50] 
#[1 2 129 0 1 2 133 0 2 2 137 0 3 0 102 0 4 2 145 0 5 0 102 0 6 0 102 0 7 2 157 0 8 0 102 0 10 0 102 0 12 0 102 0 50] 
#[1 0 106 0 1 0 106 0 2 0 106 0 3 0 106 0 4 0 106 0 5 0 106 0 6 0 106 0 7 2 157 0 8 0 106 0 10 0 106 0 12 0 106 0 50] 
#[1 2 129 0 1 2 133 0 2 2 137 0 3 2 141 0 4 2 145 0 5 2 157 0 8 0 110 0 12 0 110 0 50] 
#[1 2 129 0 1 2 133 0 2 2 137 0 3 2 141 0 4 2 145 0 5 2 157 0 8 0 114 0 12 0 114 0 50] 
#[0 0 26 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 12 0 50] 
#[0 0 118 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 12 0 50] 
#[1 2 129 0 1 2 133 0 2 2 137 0 3 2 141 0 4 2 145 0 5 2 157 0 8 0 122 0 12 0 122 0 50] 
#[0 0 18 0 50] 
#[0 0 126 0 50] 
#[0 0 130 0 50] 
#[0 0 78 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 50] 
#[0 0 86 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 50] 
#[1 5 125 0 9 5 129 0 15 5 133 0 16 5 137 0 18 5 141 0 20 5 145 0 21 5 149 0 23 5 153 0 30 5 157 0 31 5 161 0 32 5 165 0 33 5 169 0 34 5 173 0 35 5 177 0 36 5 181 0 37 5 185 0 38 5 189 0 40 6 41 0 45 5 197 0 46 5 201 0 48 5 205 0 49] 
#[0 6 45 0 19] 
#[1 0 90 0 1 2 201 0 2 0 90 0 3 0 90 0 4 2 213 0 5 0 90 0 6 0 90 0 7 2 225 0 8 0 90 0 10 0 90 0 50] 
#[1 0 94 0 1 0 94 0 2 0 94 0 3 0 94 0 4 0 94 0 5 0 94 0 6 0 94 0 7 2 225 0 8 0 94 0 10 0 94 0 50] 
#[1 0 98 0 1 2 201 0 2 0 98 0 3 0 98 0 4 2 213 0 5 0 98 0 6 0 98 0 7 2 225 0 8 0 98 0 10 0 98 0 50] 
#[1 2 197 0 1 2 201 0 2 2 205 0 3 0 102 0 4 2 213 0 5 0 102 0 6 0 102 0 7 2 225 0 8 0 102 0 10 0 102 0 50] 
#[1 0 106 0 1 0 106 0 2 0 106 0 3 0 106 0 4 0 106 0 5 0 106 0 6 0 106 0 7 2 225 0 8 0 106 0 10 0 106 0 50] 
#[1 2 197 0 1 2 201 0 2 2 205 0 3 2 209 0 4 2 213 0 5 2 225 0 8 0 110 0 50] 
#[1 2 197 0 1 2 201 0 2 2 205 0 3 2 209 0 4 2 213 0 5 2 225 0 8 0 114 0 50] 
#[0 0 26 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 50] 
#[0 0 118 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 50] 
#[1 2 197 0 1 2 201 0 2 2 205 0 3 2 209 0 4 2 213 0 5 2 225 0 8 0 122 0 50] 
#[0 0 78 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 13 0 17] 
#[0 0 86 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 13 0 17] 
#[1 5 125 0 9 5 129 0 15 5 133 0 16 5 137 0 18 5 141 0 20 5 145 0 21 5 149 0 23 5 153 0 30 5 157 0 31 5 161 0 32 5 165 0 33 5 169 0 34 5 173 0 35 5 177 0 36 5 181 0 37 5 185 0 38 5 189 0 40 6 49 0 45 5 197 0 46 5 201 0 48 5 205 0 49] 
#[0 6 53 0 19] 
#[1 0 90 0 1 3 13 0 2 0 90 0 3 0 90 0 4 3 25 0 5 0 90 0 6 0 90 0 7 3 37 0 8 0 90 0 10 0 90 0 13 0 90 0 17] 
#[1 0 94 0 1 0 94 0 2 0 94 0 3 0 94 0 4 0 94 0 5 0 94 0 6 0 94 0 7 3 37 0 8 0 94 0 10 0 94 0 13 0 94 0 17] 
#[1 0 98 0 1 3 13 0 2 0 98 0 3 0 98 0 4 3 25 0 5 0 98 0 6 0 98 0 7 3 37 0 8 0 98 0 10 0 98 0 13 0 98 0 17] 
#[1 3 9 0 1 3 13 0 2 3 17 0 3 0 102 0 4 3 25 0 5 0 102 0 6 0 102 0 7 3 37 0 8 0 102 0 10 0 102 0 13 0 102 0 17] 
#[1 0 106 0 1 0 106 0 2 0 106 0 3 0 106 0 4 0 106 0 5 0 106 0 6 0 106 0 7 3 37 0 8 0 106 0 10 0 106 0 13 0 106 0 17] 
#[1 3 9 0 1 3 13 0 2 3 17 0 3 3 21 0 4 3 25 0 5 3 37 0 8 0 110 0 13 0 110 0 17] 
#[1 3 9 0 1 3 13 0 2 3 17 0 3 3 21 0 4 3 25 0 5 3 37 0 8 0 114 0 13 0 114 0 17] 
#[0 0 26 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 13 0 17] 
#[0 0 118 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 13 0 17] 
#[1 3 9 0 1 3 13 0 2 3 17 0 3 3 21 0 4 3 25 0 5 3 37 0 8 0 122 0 13 0 122 0 17] 
#[1 1 37 0 9 1 41 0 15 1 45 0 16 1 49 0 18 1 53 0 20 1 57 0 21 1 61 0 23 1 65 0 30 1 69 0 31 1 73 0 32 1 77 0 33 1 81 0 34 1 85 0 35 1 89 0 36 1 93 0 37 1 97 0 38 1 105 0 40 6 57 0 45 1 121 0 46 1 125 0 48 1 129 0 49] 
#[0 0 138 0 13 0 17] 
#[0 0 78 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 19] 
#[0 0 86 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 19] 
#[1 5 125 0 9 5 129 0 15 5 133 0 16 5 137 0 18 5 141 0 20 5 145 0 21 5 149 0 23 5 153 0 30 5 157 0 31 5 161 0 32 5 165 0 33 5 169 0 34 5 173 0 35 5 177 0 36 5 181 0 37 5 185 0 38 5 189 0 40 6 61 0 45 5 197 0 46 5 201 0 48 5 205 0 49] 
#[0 6 65 0 19] 
#[1 0 90 0 1 3 81 0 2 0 90 0 3 0 90 0 4 3 93 0 5 0 90 0 6 0 90 0 7 3 105 0 8 0 90 0 10 0 90 0 19] 
#[1 0 94 0 1 0 94 0 2 0 94 0 3 0 94 0 4 0 94 0 5 0 94 0 6 0 94 0 7 3 105 0 8 0 94 0 10 0 94 0 19] 
#[1 0 98 0 1 3 81 0 2 0 98 0 3 0 98 0 4 3 93 0 5 0 98 0 6 0 98 0 7 3 105 0 8 0 98 0 10 0 98 0 19] 
#[1 3 77 0 1 3 81 0 2 3 85 0 3 0 102 0 4 3 93 0 5 0 102 0 6 0 102 0 7 3 105 0 8 0 102 0 10 0 102 0 19] 
#[1 0 106 0 1 0 106 0 2 0 106 0 3 0 106 0 4 0 106 0 5 0 106 0 6 0 106 0 7 3 105 0 8 0 106 0 10 0 106 0 19] 
#[1 3 77 0 1 3 81 0 2 3 85 0 3 3 89 0 4 3 93 0 5 3 105 0 8 0 110 0 19] 
#[1 3 77 0 1 3 81 0 2 3 85 0 3 3 89 0 4 3 93 0 5 3 105 0 8 0 114 0 19] 
#[0 0 26 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 19] 
#[0 0 118 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 19] 
#[1 3 77 0 1 3 81 0 2 3 85 0 3 3 89 0 4 3 93 0 5 3 105 0 8 0 122 0 19] 
#[0 0 78 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17] 
#[0 0 86 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17] 
#[1 5 125 0 9 5 129 0 15 5 133 0 16 5 137 0 18 5 141 0 20 5 145 0 21 5 149 0 23 5 153 0 30 5 157 0 31 5 161 0 32 5 165 0 33 5 169 0 34 5 173 0 35 5 177 0 36 5 181 0 37 5 185 0 38 5 189 0 40 6 69 0 45 5 197 0 46 5 201 0 48 5 205 0 49] 
#[0 6 73 0 19] 
#[1 0 90 0 1 3 149 0 2 0 90 0 3 0 90 0 4 3 161 0 5 0 90 0 6 0 90 0 7 3 173 0 8 0 90 0 10 0 90 0 17] 
#[1 0 94 0 1 0 94 0 2 0 94 0 3 0 94 0 4 0 94 0 5 0 94 0 6 0 94 0 7 3 173 0 8 0 94 0 10 0 94 0 17] 
#[1 0 98 0 1 3 149 0 2 0 98 0 3 0 98 0 4 3 161 0 5 0 98 0 6 0 98 0 7 3 173 0 8 0 98 0 10 0 98 0 17] 
#[1 3 145 0 1 3 149 0 2 3 153 0 3 0 102 0 4 3 161 0 5 0 102 0 6 0 102 0 7 3 173 0 8 0 102 0 10 0 102 0 17] 
#[1 0 106 0 1 0 106 0 2 0 106 0 3 0 106 0 4 0 106 0 5 0 106 0 6 0 106 0 7 3 173 0 8 0 106 0 10 0 106 0 17] 
#[1 3 145 0 1 3 149 0 2 3 153 0 3 3 157 0 4 3 161 0 5 3 173 0 8 0 110 0 17] 
#[1 3 145 0 1 3 149 0 2 3 153 0 3 3 157 0 4 3 161 0 5 3 173 0 8 0 114 0 17] 
#[0 0 26 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17] 
#[0 0 118 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17] 
#[1 3 145 0 1 3 149 0 2 3 153 0 3 3 157 0 4 3 161 0 5 3 173 0 8 0 122 0 17] 
#[1 5 145 0 21 6 77 0 46] 
#[1 1 37 0 9 0 10 0 13 1 41 0 15 1 45 0 16 1 49 0 18 1 53 0 20 1 57 0 21 1 61 0 23 1 65 0 30 1 69 0 31 1 73 0 32 1 77 0 33 1 81 0 34 1 85 0 35 1 89 0 36 1 93 0 37 1 97 0 38 6 81 0 39 1 105 0 40 1 109 0 43 1 113 0 44 1 117 0 45 1 121 0 46 1 125 0 48 1 129 0 49] 
#[1 6 85 0 23 6 89 0 30] 
#[1 1 141 0 9 1 145 0 15 1 149 0 16 1 153 0 18 1 157 0 20 1 161 0 21 1 165 0 23 1 169 0 30 1 173 0 31 1 177 0 32 1 181 0 33 1 185 0 34 1 189 0 35 1 193 0 36 1 197 0 37 1 201 0 38 1 205 0 40 6 93 0 45 1 213 0 46 1 217 0 48 1 221 0 49] 
#[1 1 225 0 9 1 229 0 15 1 233 0 16 1 237 0 18 1 241 0 20 1 245 0 21 1 249 0 23 1 253 0 30 2 1 0 31 2 5 0 32 2 9 0 33 2 13 0 34 2 17 0 35 2 21 0 36 2 25 0 37 2 29 0 38 2 33 0 40 6 97 0 45 2 41 0 46 2 45 0 48 2 49 0 49] 
#[0 0 14 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 14] 
#[0 0 18 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 14 0 18] 
#[0 0 26 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 14 0 18] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 14] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 14] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 14] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 14] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 14] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 14] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 14] 
#[0 0 30 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 14] 
#[1 0 34 0 1 0 34 0 2 0 34 0 3 0 34 0 4 0 34 0 5 0 34 0 6 0 34 0 7 0 34 0 8 0 34 0 10 0 34 0 14 6 101 0 18] 
#[1 6 105 0 1 6 109 0 2 6 113 0 3 6 117 0 4 6 121 0 5 6 125 0 6 6 129 0 7 6 133 0 8 6 137 0 10 6 141 0 14] 
#[0 0 42 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 14] 
#[0 0 46 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 14] 
#[0 0 46 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 14] 
#[0 0 54 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17 0 19] 
#[0 6 145 0 13] 
#[0 0 18 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17 0 19] 
#[0 0 70 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17 0 19] 
#[1 3 77 0 1 3 81 0 2 3 85 0 3 3 89 0 4 3 93 0 5 3 97 0 6 3 101 0 7 3 105 0 8 3 109 0 10 6 149 0 19] 
#[1 3 145 0 1 3 149 0 2 3 153 0 3 3 157 0 4 3 161 0 5 3 165 0 6 3 169 0 7 3 173 0 8 3 177 0 10 6 153 0 17] 
#[0 0 142 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 11 0 12] 
#[1 3 185 0 9 3 189 0 15 3 193 0 16 3 197 0 18 0 10 0 19 3 201 0 20 3 205 0 21 3 209 0 23 3 213 0 30 3 217 0 31 3 221 0 32 3 225 0 33 3 229 0 34 3 233 0 35 3 237 0 36 3 241 0 37 3 245 0 38 6 157 0 39 3 253 0 40 4 1 0 43 4 5 0 44 4 9 0 45 4 13 0 46 4 17 0 48 4 21 0 49] 
#[1 3 185 0 9 3 189 0 15 3 193 0 16 3 197 0 18 3 201 0 20 3 205 0 21 3 209 0 23 3 213 0 30 3 217 0 31 3 221 0 32 3 225 0 33 3 229 0 34 3 233 0 35 3 237 0 36 3 241 0 37 3 245 0 38 3 253 0 40 6 161 0 45 4 13 0 46 4 17 0 48 4 21 0 49] 
#[1 3 185 0 9 3 189 0 15 3 193 0 16 3 197 0 18 3 201 0 20 3 205 0 21 3 209 0 23 3 213 0 30 3 217 0 31 3 221 0 32 3 225 0 33 3 229 0 34 3 233 0 35 3 237 0 36 3 241 0 37 3 245 0 38 3 253 0 40 6 165 0 45 4 13 0 46 4 17 0 48 4 21 0 49] 
#[1 3 185 0 9 3 189 0 15 3 193 0 16 3 197 0 18 3 201 0 20 3 205 0 21 3 209 0 23 3 213 0 30 3 217 0 31 3 221 0 32 3 225 0 33 3 229 0 34 3 233 0 35 3 237 0 36 3 241 0 37 3 245 0 38 3 253 0 40 6 169 0 45 4 13 0 46 4 17 0 48 4 21 0 49] 
#[1 3 185 0 9 3 189 0 15 3 193 0 16 3 197 0 18 3 201 0 20 3 205 0 21 3 209 0 23 3 213 0 30 3 217 0 31 3 221 0 32 3 225 0 33 3 229 0 34 3 233 0 35 3 237 0 36 3 241 0 37 3 245 0 38 3 253 0 40 6 173 0 45 4 13 0 46 4 17 0 48 4 21 0 49] 
#[1 3 185 0 9 3 189 0 15 3 193 0 16 3 197 0 18 3 201 0 20 3 205 0 21 3 209 0 23 3 213 0 30 3 217 0 31 3 221 0 32 3 225 0 33 3 229 0 34 3 233 0 35 3 237 0 36 3 241 0 37 3 245 0 38 3 253 0 40 6 177 0 45 4 13 0 46 4 17 0 48 4 21 0 49] 
#[1 3 185 0 9 3 189 0 15 3 193 0 16 3 197 0 18 3 201 0 20 3 205 0 21 3 209 0 23 3 213 0 30 3 217 0 31 3 221 0 32 3 225 0 33 3 229 0 34 3 233 0 35 3 237 0 36 3 241 0 37 3 245 0 38 3 253 0 40 6 181 0 45 4 13 0 46 4 17 0 48 4 21 0 49] 
#[1 3 185 0 9 3 189 0 15 3 193 0 16 3 197 0 18 3 201 0 20 3 205 0 21 3 209 0 23 3 213 0 30 3 217 0 31 3 221 0 32 3 225 0 33 3 229 0 34 3 233 0 35 3 237 0 36 3 241 0 37 3 245 0 38 3 253 0 40 6 185 0 45 4 13 0 46 4 17 0 48 4 21 0 49] 
#[1 5 217 0 23 6 189 0 30 6 193 0 40] 
#[1 3 185 0 9 3 189 0 15 3 193 0 16 3 197 0 18 3 201 0 20 3 205 0 21 3 209 0 23 3 213 0 30 3 217 0 31 3 221 0 32 3 225 0 33 3 229 0 34 3 233 0 35 3 237 0 36 3 241 0 37 3 245 0 38 3 253 0 40 6 197 0 45 4 13 0 46 4 17 0 48 4 21 0 49] 
#[1 6 201 0 17 0 82 0 19 6 205 0 41] 
#[0 0 146 0 9 0 15 0 16 0 18 0 20 0 21 0 23 0 50] 
#[0 6 209 0 11] 
#[1 6 105 0 1 6 109 0 2 6 113 0 3 6 117 0 4 6 121 0 5 6 125 0 6 6 129 0 7 6 133 0 8 6 137 0 10 6 213 0 14] 
#[0 0 142 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 12 0 50] 
#[1 6 105 0 1 6 109 0 2 6 113 0 3 6 117 0 4 6 121 0 5 6 125 0 6 6 129 0 7 6 133 0 8 6 137 0 10 6 217 0 14] 
#[0 0 142 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 50] 
#[1 6 105 0 1 6 109 0 2 6 113 0 3 6 117 0 4 6 121 0 5 6 125 0 6 6 129 0 7 6 133 0 8 6 137 0 10 6 221 0 14] 
#[0 0 142 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 13 0 17] 
#[1 3 9 0 1 3 13 0 2 3 17 0 3 3 21 0 4 3 25 0 5 3 29 0 6 3 33 0 7 3 37 0 8 3 41 0 10 0 150 0 13 0 150 0 17] 
#[1 6 105 0 1 6 109 0 2 6 113 0 3 6 117 0 4 6 121 0 5 6 125 0 6 6 129 0 7 6 133 0 8 6 137 0 10 6 225 0 14] 
#[0 0 142 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 19] 
#[1 6 105 0 1 6 109 0 2 6 113 0 3 6 117 0 4 6 121 0 5 6 125 0 6 6 129 0 7 6 133 0 8 6 137 0 10 6 229 0 14] 
#[0 0 142 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17] 
#[0 0 54 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 14] 
#[0 6 233 0 13] 
#[0 0 18 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 14] 
#[0 0 70 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 14] 
#[1 3 77 0 1 3 81 0 2 3 85 0 3 3 89 0 4 3 93 0 5 3 97 0 6 3 101 0 7 3 105 0 8 3 109 0 10 6 237 0 19] 
#[1 3 145 0 1 3 149 0 2 3 153 0 3 3 157 0 4 3 161 0 5 3 165 0 6 3 169 0 7 3 173 0 8 3 177 0 10 6 241 0 17] 
#[1 3 185 0 9 3 189 0 15 3 193 0 16 3 197 0 18 0 10 0 19 3 201 0 20 3 205 0 21 3 209 0 23 3 213 0 30 3 217 0 31 3 221 0 32 3 225 0 33 3 229 0 34 3 233 0 35 3 237 0 36 3 241 0 37 3 245 0 38 6 245 0 39 3 253 0 40 4 1 0 43 4 5 0 44 4 9 0 45 4 13 0 46 4 17 0 48 4 21 0 49] 
#[1 5 125 0 9 5 129 0 15 5 133 0 16 5 137 0 18 5 141 0 20 5 145 0 21 5 149 0 23 5 153 0 30 5 157 0 31 5 161 0 32 5 165 0 33 5 169 0 34 5 173 0 35 5 177 0 36 5 181 0 37 5 185 0 38 5 189 0 40 6 249 0 45 5 197 0 46 5 201 0 48 5 205 0 49] 
#[1 5 125 0 9 5 129 0 15 5 133 0 16 5 137 0 18 5 141 0 20 5 145 0 21 5 149 0 23 5 153 0 30 5 157 0 31 5 161 0 32 5 165 0 33 5 169 0 34 5 173 0 35 5 177 0 36 5 181 0 37 5 185 0 38 5 189 0 40 6 253 0 45 5 197 0 46 5 201 0 48 5 205 0 49] 
#[1 5 125 0 9 5 129 0 15 5 133 0 16 5 137 0 18 5 141 0 20 5 145 0 21 5 149 0 23 5 153 0 30 5 157 0 31 5 161 0 32 5 165 0 33 5 169 0 34 5 173 0 35 5 177 0 36 5 181 0 37 5 185 0 38 5 189 0 40 7 1 0 45 5 197 0 46 5 201 0 48 5 205 0 49] 
#[1 5 125 0 9 5 129 0 15 5 133 0 16 5 137 0 18 5 141 0 20 5 145 0 21 5 149 0 23 5 153 0 30 5 157 0 31 5 161 0 32 5 165 0 33 5 169 0 34 5 173 0 35 5 177 0 36 5 181 0 37 5 185 0 38 5 189 0 40 7 5 0 45 5 197 0 46 5 201 0 48 5 205 0 49] 
#[1 5 125 0 9 5 129 0 15 5 133 0 16 5 137 0 18 5 141 0 20 5 145 0 21 5 149 0 23 5 153 0 30 5 157 0 31 5 161 0 32 5 165 0 33 5 169 0 34 5 173 0 35 5 177 0 36 5 181 0 37 5 185 0 38 5 189 0 40 7 9 0 45 5 197 0 46 5 201 0 48 5 205 0 49] 
#[1 5 125 0 9 5 129 0 15 5 133 0 16 5 137 0 18 5 141 0 20 5 145 0 21 5 149 0 23 5 153 0 30 5 157 0 31 5 161 0 32 5 165 0 33 5 169 0 34 5 173 0 35 5 177 0 36 5 181 0 37 5 185 0 38 5 189 0 40 7 13 0 45 5 197 0 46 5 201 0 48 5 205 0 49] 
#[1 5 125 0 9 5 129 0 15 5 133 0 16 5 137 0 18 5 141 0 20 5 145 0 21 5 149 0 23 5 153 0 30 5 157 0 31 5 161 0 32 5 165 0 33 5 169 0 34 5 173 0 35 5 177 0 36 5 181 0 37 5 185 0 38 5 189 0 40 7 17 0 45 5 197 0 46 5 201 0 48 5 205 0 49] 
#[1 6 85 0 23 7 21 0 30 7 25 0 40] 
#[1 5 125 0 9 5 129 0 15 5 133 0 16 5 137 0 18 5 141 0 20 5 145 0 21 5 149 0 23 5 153 0 30 5 157 0 31 5 161 0 32 5 165 0 33 5 169 0 34 5 173 0 35 5 177 0 36 5 181 0 37 5 185 0 38 5 189 0 40 7 29 0 45 5 197 0 46 5 201 0 48 5 205 0 49] 
#[0 0 154 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 11 0 12] 
#[0 0 78 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17 0 19] 
#[0 0 86 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17 0 19] 
#[1 5 125 0 9 5 129 0 15 5 133 0 16 5 137 0 18 5 141 0 20 5 145 0 21 5 149 0 23 5 153 0 30 5 157 0 31 5 161 0 32 5 165 0 33 5 169 0 34 5 173 0 35 5 177 0 36 5 181 0 37 5 185 0 38 5 189 0 40 7 33 0 45 5 197 0 46 5 201 0 48 5 205 0 49] 
#[0 7 37 0 19] 
#[1 0 90 0 1 5 245 0 2 0 90 0 3 0 90 0 4 6 1 0 5 0 90 0 6 0 90 0 7 6 13 0 8 0 90 0 10 0 90 0 17 0 90 0 19] 
#[1 0 94 0 1 0 94 0 2 0 94 0 3 0 94 0 4 0 94 0 5 0 94 0 6 0 94 0 7 6 13 0 8 0 94 0 10 0 94 0 17 0 94 0 19] 
#[1 0 98 0 1 5 245 0 2 0 98 0 3 0 98 0 4 6 1 0 5 0 98 0 6 0 98 0 7 6 13 0 8 0 98 0 10 0 98 0 17 0 98 0 19] 
#[1 5 241 0 1 5 245 0 2 5 249 0 3 0 102 0 4 6 1 0 5 0 102 0 6 0 102 0 7 6 13 0 8 0 102 0 10 0 102 0 17 0 102 0 19] 
#[1 0 106 0 1 0 106 0 2 0 106 0 3 0 106 0 4 0 106 0 5 0 106 0 6 0 106 0 7 6 13 0 8 0 106 0 10 0 106 0 17 0 106 0 19] 
#[1 5 241 0 1 5 245 0 2 5 249 0 3 5 253 0 4 6 1 0 5 6 13 0 8 0 110 0 17 0 110 0 19] 
#[1 5 241 0 1 5 245 0 2 5 249 0 3 5 253 0 4 6 1 0 5 6 13 0 8 0 114 0 17 0 114 0 19] 
#[0 0 26 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17 0 19] 
#[0 0 118 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17 0 19] 
#[1 5 241 0 1 5 245 0 2 5 249 0 3 5 253 0 4 6 1 0 5 6 13 0 8 0 122 0 17 0 122 0 19] 
#[1 3 185 0 9 3 189 0 15 3 193 0 16 3 197 0 18 3 201 0 20 3 205 0 21 3 209 0 23 3 213 0 30 3 217 0 31 3 221 0 32 3 225 0 33 3 229 0 34 3 233 0 35 3 237 0 36 3 241 0 37 3 245 0 38 3 253 0 40 7 41 0 45 4 13 0 46 4 17 0 48 4 21 0 49] 
#[0 0 138 0 17 0 19] 
#[0 0 158 0 9 0 15 0 16 0 18 0 20 0 21 0 23 0 50] 
#[0 0 154 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 12 0 50] 
#[0 0 154 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 50] 
#[0 0 154 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 13 0 17] 
#[0 0 154 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 19] 
#[0 0 154 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17] 
#[0 0 78 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 14] 
#[0 0 86 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 14] 
#[1 5 125 0 9 5 129 0 15 5 133 0 16 5 137 0 18 5 141 0 20 5 145 0 21 5 149 0 23 5 153 0 30 5 157 0 31 5 161 0 32 5 165 0 33 5 169 0 34 5 173 0 35 5 177 0 36 5 181 0 37 5 185 0 38 5 189 0 40 7 45 0 45 5 197 0 46 5 201 0 48 5 205 0 49] 
#[0 7 49 0 19] 
#[1 0 90 0 1 6 109 0 2 0 90 0 3 0 90 0 4 6 121 0 5 0 90 0 6 0 90 0 7 6 133 0 8 0 90 0 10 0 90 0 14] 
#[1 0 94 0 1 0 94 0 2 0 94 0 3 0 94 0 4 0 94 0 5 0 94 0 6 0 94 0 7 6 133 0 8 0 94 0 10 0 94 0 14] 
#[1 0 98 0 1 6 109 0 2 0 98 0 3 0 98 0 4 6 121 0 5 0 98 0 6 0 98 0 7 6 133 0 8 0 98 0 10 0 98 0 14] 
#[1 6 105 0 1 6 109 0 2 6 113 0 3 0 102 0 4 6 121 0 5 0 102 0 6 0 102 0 7 6 133 0 8 0 102 0 10 0 102 0 14] 
#[1 0 106 0 1 0 106 0 2 0 106 0 3 0 106 0 4 0 106 0 5 0 106 0 6 0 106 0 7 6 133 0 8 0 106 0 10 0 106 0 14] 
#[1 6 105 0 1 6 109 0 2 6 113 0 3 6 117 0 4 6 121 0 5 6 133 0 8 0 110 0 14] 
#[1 6 105 0 1 6 109 0 2 6 113 0 3 6 117 0 4 6 121 0 5 6 133 0 8 0 114 0 14] 
#[0 0 26 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 14] 
#[0 0 118 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 14] 
#[1 6 105 0 1 6 109 0 2 6 113 0 3 6 117 0 4 6 121 0 5 6 133 0 8 0 122 0 14] 
#[1 6 105 0 1 6 109 0 2 6 113 0 3 6 117 0 4 6 121 0 5 6 125 0 6 6 129 0 7 6 133 0 8 6 137 0 10 7 53 0 14] 
#[0 0 142 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17 0 19] 
#[1 5 241 0 1 5 245 0 2 5 249 0 3 5 253 0 4 6 1 0 5 6 5 0 6 6 9 0 7 6 13 0 8 6 17 0 10 0 150 0 17 0 150 0 19] 
#[1 6 105 0 1 6 109 0 2 6 113 0 3 6 117 0 4 6 121 0 5 6 125 0 6 6 129 0 7 6 133 0 8 6 137 0 10 7 57 0 14] 
#[0 0 142 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 14] 
#[0 0 154 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 17 0 19] 
#[0 0 154 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 14]
	).
]
