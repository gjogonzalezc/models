
m
(weights/Initializer/random_uniform/shapeConst*
valueB *
_class
loc:@weights*
dtype0
o
&weights/Initializer/random_uniform/minConst*
valueB
 *׳ݿ*
_class
loc:@weights*
dtype0
o
&weights/Initializer/random_uniform/maxConst*
valueB
 *׳�?*
_class
loc:@weights*
dtype0
�
0weights/Initializer/random_uniform/RandomUniformRandomUniform(weights/Initializer/random_uniform/shape*

seed *
T0*
_class
loc:@weights*
dtype0*
seed2 
�
&weights/Initializer/random_uniform/subSub&weights/Initializer/random_uniform/max&weights/Initializer/random_uniform/min*
T0*
_class
loc:@weights
�
&weights/Initializer/random_uniform/mulMul0weights/Initializer/random_uniform/RandomUniform&weights/Initializer/random_uniform/sub*
T0*
_class
loc:@weights
�
"weights/Initializer/random_uniformAdd&weights/Initializer/random_uniform/mul&weights/Initializer/random_uniform/min*
T0*
_class
loc:@weights
~
weights
VariableV2"/device:CPU:0*
shape: *
shared_name *
_class
loc:@weights*
dtype0*
	container 
�
weights/AssignAssignweights"weights/Initializer/random_uniform"/device:CPU:0*
use_locking(*
T0*
_class
loc:@weights*
validate_shape(
U
weights/readIdentityweights"/device:CPU:0*
T0*
_class
loc:@weights
g
%bias/Initializer/random_uniform/shapeConst*
dtype0*
valueB *
_class
	loc:@bias
i
#bias/Initializer/random_uniform/minConst*
valueB
 *׳ݿ*
_class
	loc:@bias*
dtype0
i
#bias/Initializer/random_uniform/maxConst*
valueB
 *׳�?*
_class
	loc:@bias*
dtype0
�
-bias/Initializer/random_uniform/RandomUniformRandomUniform%bias/Initializer/random_uniform/shape*

seed *
T0*
_class
	loc:@bias*
dtype0*
seed2 
�
#bias/Initializer/random_uniform/subSub#bias/Initializer/random_uniform/max#bias/Initializer/random_uniform/min*
T0*
_class
	loc:@bias
�
#bias/Initializer/random_uniform/mulMul-bias/Initializer/random_uniform/RandomUniform#bias/Initializer/random_uniform/sub*
T0*
_class
	loc:@bias
�
bias/Initializer/random_uniformAdd#bias/Initializer/random_uniform/mul#bias/Initializer/random_uniform/min*
_class
	loc:@bias*
T0
x
bias
VariableV2"/device:CPU:0*
shared_name *
_class
	loc:@bias*
dtype0*
	container *
shape: 
�
bias/AssignAssignbiasbias/Initializer/random_uniform"/device:CPU:0*
use_locking(*
T0*
_class
	loc:@bias*
validate_shape(
L
	bias/readIdentitybias"/device:CPU:0*
_class
	loc:@bias*
T0
O

x_observedPlaceholder"/device:CPU:0*
dtype0*
shape:���������
<
mulMulweights/read
x_observed"/device:CPU:0*
T0
2
addAddmul	bias/read"/device:CPU:0*
T0
O

y_observedPlaceholder"/device:CPU:0*
dtype0*
shape:���������
3
subSubadd
y_observed"/device:CPU:0*
T0
-
SquareSquaresub"/device:CPU:0*
T0
B
ConstConst"/device:CPU:0*
valueB: *
dtype0
P
MeanMeanSquareConst"/device:CPU:0*

Tidx0*
	keep_dims( *
T0
G
gradients/ShapeConst"/device:CPU:0*
valueB *
dtype0
O
gradients/grad_ys_0Const"/device:CPU:0*
valueB
 *  �?*
dtype0
f
gradients/FillFillgradients/Shapegradients/grad_ys_0"/device:CPU:0*
T0*

index_type0
^
!gradients/Mean_grad/Reshape/shapeConst"/device:CPU:0*
dtype0*
valueB:

gradients/Mean_grad/ReshapeReshapegradients/Fill!gradients/Mean_grad/Reshape/shape"/device:CPU:0*
T0*
Tshape0
R
gradients/Mean_grad/ShapeShapeSquare"/device:CPU:0*
T0*
out_type0
�
gradients/Mean_grad/TileTilegradients/Mean_grad/Reshapegradients/Mean_grad/Shape"/device:CPU:0*

Tmultiples0*
T0
T
gradients/Mean_grad/Shape_1ShapeSquare"/device:CPU:0*
T0*
out_type0
S
gradients/Mean_grad/Shape_2Const"/device:CPU:0*
dtype0*
valueB 
V
gradients/Mean_grad/ConstConst"/device:CPU:0*
valueB: *
dtype0
�
gradients/Mean_grad/ProdProdgradients/Mean_grad/Shape_1gradients/Mean_grad/Const"/device:CPU:0*

Tidx0*
	keep_dims( *
T0
X
gradients/Mean_grad/Const_1Const"/device:CPU:0*
valueB: *
dtype0
�
gradients/Mean_grad/Prod_1Prodgradients/Mean_grad/Shape_2gradients/Mean_grad/Const_1"/device:CPU:0*

Tidx0*
	keep_dims( *
T0
V
gradients/Mean_grad/Maximum/yConst"/device:CPU:0*
dtype0*
value	B :
y
gradients/Mean_grad/MaximumMaximumgradients/Mean_grad/Prod_1gradients/Mean_grad/Maximum/y"/device:CPU:0*
T0
w
gradients/Mean_grad/floordivFloorDivgradients/Mean_grad/Prodgradients/Mean_grad/Maximum"/device:CPU:0*
T0
e
gradients/Mean_grad/CastCastgradients/Mean_grad/floordiv"/device:CPU:0*

DstT0*

SrcT0
r
gradients/Mean_grad/truedivRealDivgradients/Mean_grad/Tilegradients/Mean_grad/Cast"/device:CPU:0*
T0
u
gradients/Square_grad/ConstConst^gradients/Mean_grad/truediv"/device:CPU:0*
valueB
 *   @*
dtype0
Z
gradients/Square_grad/MulMulsubgradients/Square_grad/Const"/device:CPU:0*
T0
r
gradients/Square_grad/Mul_1Mulgradients/Mean_grad/truedivgradients/Square_grad/Mul"/device:CPU:0*
T0
N
gradients/sub_grad/ShapeShapeadd"/device:CPU:0*
T0*
out_type0
W
gradients/sub_grad/Shape_1Shape
y_observed"/device:CPU:0*
out_type0*
T0
�
(gradients/sub_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/sub_grad/Shapegradients/sub_grad/Shape_1"/device:CPU:0*
T0
�
gradients/sub_grad/SumSumgradients/Square_grad/Mul_1(gradients/sub_grad/BroadcastGradientArgs"/device:CPU:0*
T0*

Tidx0*
	keep_dims( 
}
gradients/sub_grad/ReshapeReshapegradients/sub_grad/Sumgradients/sub_grad/Shape"/device:CPU:0*
T0*
Tshape0
�
gradients/sub_grad/Sum_1Sumgradients/Square_grad/Mul_1*gradients/sub_grad/BroadcastGradientArgs:1"/device:CPU:0*
T0*

Tidx0*
	keep_dims( 
O
gradients/sub_grad/NegNeggradients/sub_grad/Sum_1"/device:CPU:0*
T0
�
gradients/sub_grad/Reshape_1Reshapegradients/sub_grad/Neggradients/sub_grad/Shape_1"/device:CPU:0*
T0*
Tshape0
v
#gradients/sub_grad/tuple/group_depsNoOp^gradients/sub_grad/Reshape^gradients/sub_grad/Reshape_1"/device:CPU:0
�
+gradients/sub_grad/tuple/control_dependencyIdentitygradients/sub_grad/Reshape$^gradients/sub_grad/tuple/group_deps"/device:CPU:0*-
_class#
!loc:@gradients/sub_grad/Reshape*
T0
�
-gradients/sub_grad/tuple/control_dependency_1Identitygradients/sub_grad/Reshape_1$^gradients/sub_grad/tuple/group_deps"/device:CPU:0*
T0*/
_class%
#!loc:@gradients/sub_grad/Reshape_1
N
gradients/add_grad/ShapeShapemul"/device:CPU:0*
out_type0*
T0
R
gradients/add_grad/Shape_1Const"/device:CPU:0*
dtype0*
valueB 
�
(gradients/add_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/add_grad/Shapegradients/add_grad/Shape_1"/device:CPU:0*
T0
�
gradients/add_grad/SumSum+gradients/sub_grad/tuple/control_dependency(gradients/add_grad/BroadcastGradientArgs"/device:CPU:0*
T0*

Tidx0*
	keep_dims( 
}
gradients/add_grad/ReshapeReshapegradients/add_grad/Sumgradients/add_grad/Shape"/device:CPU:0*
T0*
Tshape0
�
gradients/add_grad/Sum_1Sum+gradients/sub_grad/tuple/control_dependency*gradients/add_grad/BroadcastGradientArgs:1"/device:CPU:0*
T0*

Tidx0*
	keep_dims( 
�
gradients/add_grad/Reshape_1Reshapegradients/add_grad/Sum_1gradients/add_grad/Shape_1"/device:CPU:0*
Tshape0*
T0
v
#gradients/add_grad/tuple/group_depsNoOp^gradients/add_grad/Reshape^gradients/add_grad/Reshape_1"/device:CPU:0
�
+gradients/add_grad/tuple/control_dependencyIdentitygradients/add_grad/Reshape$^gradients/add_grad/tuple/group_deps"/device:CPU:0*
T0*-
_class#
!loc:@gradients/add_grad/Reshape
�
-gradients/add_grad/tuple/control_dependency_1Identitygradients/add_grad/Reshape_1$^gradients/add_grad/tuple/group_deps"/device:CPU:0*
T0*/
_class%
#!loc:@gradients/add_grad/Reshape_1
P
gradients/mul_grad/ShapeConst"/device:CPU:0*
dtype0*
valueB 
W
gradients/mul_grad/Shape_1Shape
x_observed"/device:CPU:0*
T0*
out_type0
�
(gradients/mul_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/mul_grad/Shapegradients/mul_grad/Shape_1"/device:CPU:0*
T0
n
gradients/mul_grad/MulMul+gradients/add_grad/tuple/control_dependency
x_observed"/device:CPU:0*
T0
�
gradients/mul_grad/SumSumgradients/mul_grad/Mul(gradients/mul_grad/BroadcastGradientArgs"/device:CPU:0*

Tidx0*
	keep_dims( *
T0
}
gradients/mul_grad/ReshapeReshapegradients/mul_grad/Sumgradients/mul_grad/Shape"/device:CPU:0*
Tshape0*
T0
r
gradients/mul_grad/Mul_1Mulweights/read+gradients/add_grad/tuple/control_dependency"/device:CPU:0*
T0
�
gradients/mul_grad/Sum_1Sumgradients/mul_grad/Mul_1*gradients/mul_grad/BroadcastGradientArgs:1"/device:CPU:0*
T0*

Tidx0*
	keep_dims( 
�
gradients/mul_grad/Reshape_1Reshapegradients/mul_grad/Sum_1gradients/mul_grad/Shape_1"/device:CPU:0*
T0*
Tshape0
v
#gradients/mul_grad/tuple/group_depsNoOp^gradients/mul_grad/Reshape^gradients/mul_grad/Reshape_1"/device:CPU:0
�
+gradients/mul_grad/tuple/control_dependencyIdentitygradients/mul_grad/Reshape$^gradients/mul_grad/tuple/group_deps"/device:CPU:0*
T0*-
_class#
!loc:@gradients/mul_grad/Reshape
�
-gradients/mul_grad/tuple/control_dependency_1Identitygradients/mul_grad/Reshape_1$^gradients/mul_grad/tuple/group_deps"/device:CPU:0*
T0*/
_class%
#!loc:@gradients/mul_grad/Reshape_1
Y
GradientDescent/learning_rateConst"/device:CPU:0*
valueB
 *���<*
dtype0
�
3GradientDescent/update_weights/ApplyGradientDescentApplyGradientDescentweightsGradientDescent/learning_rate+gradients/mul_grad/tuple/control_dependency"/device:CPU:0*
_class
loc:@weights*
use_locking( *
T0
�
0GradientDescent/update_bias/ApplyGradientDescentApplyGradientDescentbiasGradientDescent/learning_rate-gradients/add_grad/tuple/control_dependency_1"/device:CPU:0*
T0*
_class
	loc:@bias*
use_locking( 
�
GradientDescentNoOp1^GradientDescent/update_bias/ApplyGradientDescent4^GradientDescent/update_weights/ApplyGradientDescent"/device:CPU:0
:
initNoOp^bias/Assign^weights/Assign"/device:CPU:0
6
	loss/tagsConst*
valueB
 Bloss*
dtype0
/
lossScalarSummary	loss/tagsMean*
T0
1
Merge/MergeSummaryMergeSummaryloss*
N
8

save/ConstConst*
valueB Bmodel*
dtype0
R
save/SaveV2/tensor_namesConst*"
valueBBbiasBweights*
dtype0
K
save/SaveV2/shape_and_slicesConst*
dtype0*
valueBB B 
z
save/SaveV2SaveV2
save/Constsave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesbiasweights*
dtypes
2
e
save/control_dependencyIdentity
save/Const^save/SaveV2*
T0*
_class
loc:@save/Const
d
save/RestoreV2/tensor_namesConst"/device:CPU:0*"
valueBBbiasBweights*
dtype0
]
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*
valueBB B *
dtype0
�
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*
dtypes
2
�
save/AssignAssignbiassave/RestoreV2"/device:CPU:0*
use_locking(*
T0*
_class
	loc:@bias*
validate_shape(
�
save/Assign_1Assignweightssave/RestoreV2:1"/device:CPU:0*
use_locking(*
T0*
_class
loc:@weights*
validate_shape(
E
save/restore_allNoOp^save/Assign^save/Assign_1"/device:CPU:0"