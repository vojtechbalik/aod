Trait {
	#name : #TAodActorVisitor,
	#category : #'Aod-Language-Actor'
}

{ #category : #generated }
TAodActorVisitor >> visitActor: anActor [
  anActor arguments do: [:arg |  arg acceptVisitor: self ].
  ^anActor
]

{ #category : #generated }
TAodActorVisitor >> visitActorBinding: anActor [
  ^self visitDataBinding: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitAnchorAddOperator: anActor [
  ^self visitAnchorOperator: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitAnchorDivOperator: anActor [
  ^self visitAnchorOperator: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitAnchorEqRelator: anActor [
  ^self visitAnchorRelator: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitAnchorLeqRelator: anActor [
  ^self visitAnchorRelator: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitAnchorMulOperator: anActor [
  ^self visitAnchorOperator: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitAnchorOperator: anActor [
  ^self visitOperator: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitAnchorRelator: anActor [
  ^self visitRelator: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitAnchorSubOperator: anActor [
  ^self visitAnchorOperator: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitArrayConstructor: anActor [
  ^self visitActor: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitArrayInterweave: anActor [
  ^self visitArrayTransformer: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitArrayMapTransformer: anActor [
  ^self visitArrayTransformer: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitArrayNthTransformer: anActor [
  ^self visitArrayTransformer: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitArrayRelator: anActor [
  ^self visitRelator: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitArraySequencedRelator: anActor [
  ^self visitArrayRelator: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitArrayTransformer: anActor [
  ^self visitTransformer: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitBoxBottomTransformer: anActor [
  ^self visitBoxTransformer: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitBoxCenterTransformer: anActor [
  ^self visitBoxTransformer: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitBoxExtentTransformer: anActor [
  ^self visitBoxTransformer: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitBoxHeightTransformer: anActor [
  ^self visitBoxTransformer: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitBoxHorizontalTransformer: anActor [
  ^self visitBoxSpanTransformer: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitBoxLeftTransformer: anActor [
  ^self visitBoxTransformer: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitBoxPositionTransformer: anActor [
  ^self visitBoxTransformer: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitBoxRightTransformer: anActor [
  ^self visitBoxTransformer: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitBoxSpanTransformer: anActor [
  ^self visitBoxTransformer: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitBoxTopTransformer: anActor [
  ^self visitBoxTransformer: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitBoxTransformer: anActor [
  ^self visitTransformer: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitBoxVerticalTransformer: anActor [
  ^self visitBoxSpanTransformer: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitBoxWidthTransformer: anActor [
  ^self visitBoxTransformer: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitConnectCentersRelator: anActor [
  ^self visitRelator: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitDataBinding: anActor [
  ^self visitActor: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitDynamicActor: anActor [
  ^self visitActor: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitLeftOfRelator: anActor [
  ^self visitRelator: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitLineEndTransformer: anActor [
  ^self visitLineTransformer: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitLineStartTransformer: anActor [
  ^self visitLineTransformer: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitLineTransformer: anActor [
  ^self visitTransformer: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitListConstructor: anActor [
  ^self visitActor: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitListDistributeAbsoluteRelator: anActor [
  ^self visitListRelator: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitListDistributeRelativeOverRelator: anActor [
  ^self visitListRelator: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitListEqualAnchorsRelator: anActor [
  ^self visitListRelator: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitListInterweaveRelator: anActor [
  ^self visitListRelator: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitListMapOperator: anActor [
  ^self visitListOperator: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitListOperator: anActor [
  ^self visitActor: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitListRelator: anActor [
  ^self visitRelator: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitListSequencedRelator: anActor [
  ^self visitListRelator: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitOperator: anActor [
  ^self visitActor: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitPointAddOperator: anActor [
  ^self visitPointOperator: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitPointConstructor: anActor [
  ^self visitActor: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitPointEqRelator: anActor [
  ^self visitRelator: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitPointLeqRelator: anActor [
  ^self visitRelator: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitPointOperator: anActor [
  ^self visitOperator: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitPointTransformer: anActor [
  ^self visitTransformer: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitPointXTransformer: anActor [
  ^self visitPointTransformer: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitPointYTransformer: anActor [
  ^self visitPointTransformer: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitRelator: anActor [
  ^self visitActor: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitShapeBinding: anActor [
  ^self visitDataBinding: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitSpanCenterTransformer: anActor [
  ^self visitSpanTransformer: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitSpanConstructor: anActor [
  ^self visitActor: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitSpanEndTransformer: anActor [
  ^self visitSpanTransformer: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitSpanIsAfterRelator: anActor [
  ^self visitSpanRelator: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitSpanLengthTransformer: anActor [
  ^self visitSpanTransformer: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitSpanMiddleTransformer: anActor [
  ^self visitSpanTransformer: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitSpanRatioTransformer: anActor [
  ^self visitSpanTransformer: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitSpanRelator: anActor [
  ^self visitRelator: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitSpanStartTransformer: anActor [
  ^self visitSpanTransformer: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitSpanTransformer: anActor [
  ^self visitTransformer: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitStayRelator: anActor [
  ^self visitRelator: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitTestActor: anActor [
  ^self visitActor: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitTestRecursiveActor: anActor [
  ^self visitTestActor: anActor
]

{ #category : #generated }
TAodActorVisitor >> visitTransformer: anActor [
  ^self visitActor: anActor
]
