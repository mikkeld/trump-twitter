       �K"	   oZX�Abrain.Event:2!ɛK�     ���*	#,"oZX�A"��

{
placeholders/PlaceholderPlaceholder*'
_output_shapes
:���������*
shape:���������*
dtype0
u
placeholders/Placeholder_1Placeholder*#
_output_shapes
:���������*
shape:���������*
dtype0
u
placeholders/Placeholder_2Placeholder*#
_output_shapes
:���������*
shape:���������*
dtype0
p
embeddings/random_uniform/shapeConst*
_output_shapes
:*
valueB"�: d   *
dtype0
b
embeddings/random_uniform/minConst*
_output_shapes
: *
valueB
 *  ��*
dtype0
b
embeddings/random_uniform/maxConst*
_output_shapes
: *
valueB
 *  �?*
dtype0
�
'embeddings/random_uniform/RandomUniformRandomUniformembeddings/random_uniform/shape*
T0* 
_output_shapes
:
��d*

seed *
dtype0*
seed2 
�
embeddings/random_uniform/subSubembeddings/random_uniform/maxembeddings/random_uniform/min*
T0*
_output_shapes
: 
�
embeddings/random_uniform/mulMul'embeddings/random_uniform/RandomUniformembeddings/random_uniform/sub*
T0* 
_output_shapes
:
��d
�
embeddings/random_uniformAddembeddings/random_uniform/mulembeddings/random_uniform/min*
T0* 
_output_shapes
:
��d
�
embeddings/Variable
VariableV2* 
_output_shapes
:
��d*
	container *
shape:
��d*
dtype0*
shared_name 
�
embeddings/Variable/AssignAssignembeddings/Variableembeddings/random_uniform*
T0*&
_class
loc:@embeddings/Variable*
validate_shape(*
use_locking(* 
_output_shapes
:
��d
�
embeddings/Variable/readIdentityembeddings/Variable*
T0*&
_class
loc:@embeddings/Variable* 
_output_shapes
:
��d
�
embeddings/embedding_lookupGatherembeddings/Variable/readplaceholders/Placeholder*+
_output_shapes
:���������d*
Tparams0*
Tindices0*
validate_indices(*&
_class
loc:@embeddings/Variable
L

model/RankConst*
_output_shapes
: *
value	B :*
dtype0
S
model/range/startConst*
_output_shapes
: *
value	B :*
dtype0
S
model/range/deltaConst*
_output_shapes
: *
value	B :*
dtype0
n
model/rangeRangemodel/range/start
model/Rankmodel/range/delta*
_output_shapes
:*

Tidx0
f
model/concat/values_0Const*
_output_shapes
:*
valueB"       *
dtype0
S
model/concat/axisConst*
_output_shapes
: *
value	B : *
dtype0
�
model/concatConcatV2model/concat/values_0model/rangemodel/concat/axis*
T0*
_output_shapes
:*
N*

Tidx0
�
model/transpose	Transposeembeddings/embedding_lookupmodel/concat*
T0*+
_output_shapes
:���������d*
Tperm0
^
model/rnn/ShapeShapemodel/transpose*
T0*
_output_shapes
:*
out_type0
g
model/rnn/strided_slice/stackConst*
_output_shapes
:*
valueB:*
dtype0
i
model/rnn/strided_slice/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
i
model/rnn/strided_slice/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
�
model/rnn/strided_sliceStridedSlicemodel/rnn/Shapemodel/rnn/strided_slice/stackmodel/rnn/strided_slice/stack_1model/rnn/strided_slice/stack_2*
T0*
Index0*
new_axis_mask *

begin_mask *
ellipsis_mask *
_output_shapes
: *
shrink_axis_mask*
end_mask 
i
model/rnn/strided_slice_1/stackConst*
_output_shapes
:*
valueB:*
dtype0
k
!model/rnn/strided_slice_1/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
k
!model/rnn/strided_slice_1/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
�
model/rnn/strided_slice_1StridedSlicemodel/rnn/Shapemodel/rnn/strided_slice_1/stack!model/rnn/strided_slice_1/stack_1!model/rnn/strided_slice_1/stack_2*
T0*
Index0*
new_axis_mask *

begin_mask *
ellipsis_mask *
_output_shapes
: *
shrink_axis_mask*
end_mask 
k
)model/rnn/GRUCellZeroState/ExpandDims/dimConst*
_output_shapes
: *
value	B : *
dtype0
�
%model/rnn/GRUCellZeroState/ExpandDims
ExpandDimsmodel/rnn/strided_slice)model/rnn/GRUCellZeroState/ExpandDims/dim*
T0*
_output_shapes
:*

Tdim0
k
 model/rnn/GRUCellZeroState/ConstConst*
_output_shapes
:*
valueB:�*
dtype0
h
&model/rnn/GRUCellZeroState/concat/axisConst*
_output_shapes
: *
value	B : *
dtype0
�
!model/rnn/GRUCellZeroState/concatConcatV2%model/rnn/GRUCellZeroState/ExpandDims model/rnn/GRUCellZeroState/Const&model/rnn/GRUCellZeroState/concat/axis*
T0*
_output_shapes
:*
N*

Tidx0
m
+model/rnn/GRUCellZeroState/ExpandDims_1/dimConst*
_output_shapes
: *
value	B : *
dtype0
�
'model/rnn/GRUCellZeroState/ExpandDims_1
ExpandDimsmodel/rnn/strided_slice+model/rnn/GRUCellZeroState/ExpandDims_1/dim*
T0*
_output_shapes
:*

Tdim0
m
"model/rnn/GRUCellZeroState/Const_1Const*
_output_shapes
:*
valueB:�*
dtype0
k
&model/rnn/GRUCellZeroState/zeros/ConstConst*
_output_shapes
: *
valueB
 *    *
dtype0
�
 model/rnn/GRUCellZeroState/zerosFill!model/rnn/GRUCellZeroState/concat&model/rnn/GRUCellZeroState/zeros/Const*
T0*(
_output_shapes
:����������
`
model/rnn/Shape_1Shapemodel/transpose*
T0*
_output_shapes
:*
out_type0
i
model/rnn/strided_slice_2/stackConst*
_output_shapes
:*
valueB: *
dtype0
k
!model/rnn/strided_slice_2/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
k
!model/rnn/strided_slice_2/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
�
model/rnn/strided_slice_2StridedSlicemodel/rnn/Shape_1model/rnn/strided_slice_2/stack!model/rnn/strided_slice_2/stack_1!model/rnn/strided_slice_2/stack_2*
T0*
Index0*
new_axis_mask *

begin_mask *
ellipsis_mask *
_output_shapes
: *
shrink_axis_mask*
end_mask 
i
model/rnn/strided_slice_3/stackConst*
_output_shapes
:*
valueB:*
dtype0
k
!model/rnn/strided_slice_3/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
k
!model/rnn/strided_slice_3/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
�
model/rnn/strided_slice_3StridedSlicemodel/rnn/Shape_1model/rnn/strided_slice_3/stack!model/rnn/strided_slice_3/stack_1!model/rnn/strided_slice_3/stack_2*
T0*
Index0*
new_axis_mask *

begin_mask *
ellipsis_mask *
_output_shapes
: *
shrink_axis_mask*
end_mask 
Z
model/rnn/ExpandDims/dimConst*
_output_shapes
: *
value	B : *
dtype0
�
model/rnn/ExpandDims
ExpandDimsmodel/rnn/strided_slice_3model/rnn/ExpandDims/dim*
T0*
_output_shapes
:*

Tdim0
Z
model/rnn/ConstConst*
_output_shapes
:*
valueB:�*
dtype0
W
model/rnn/concat/axisConst*
_output_shapes
: *
value	B : *
dtype0
�
model/rnn/concatConcatV2model/rnn/ExpandDimsmodel/rnn/Constmodel/rnn/concat/axis*
T0*
_output_shapes
:*
N*

Tidx0
Z
model/rnn/zeros/ConstConst*
_output_shapes
: *
valueB
 *    *
dtype0
s
model/rnn/zerosFillmodel/rnn/concatmodel/rnn/zeros/Const*
T0*(
_output_shapes
:����������
P
model/rnn/timeConst*
_output_shapes
: *
value	B : *
dtype0
�
model/rnn/TensorArrayTensorArrayV3model/rnn/strided_slice_2*
dynamic_size( *
dtype0*
_output_shapes

:: *
element_shape:*5
tensor_array_name model/rnn/dynamic_rnn/output_0*
clear_after_read(
�
model/rnn/TensorArray_1TensorArrayV3model/rnn/strided_slice_2*
dynamic_size( *
dtype0*
_output_shapes

:: *
element_shape:*4
tensor_array_namemodel/rnn/dynamic_rnn/input_0*
clear_after_read(
q
"model/rnn/TensorArrayUnstack/ShapeShapemodel/transpose*
T0*
_output_shapes
:*
out_type0
z
0model/rnn/TensorArrayUnstack/strided_slice/stackConst*
_output_shapes
:*
valueB: *
dtype0
|
2model/rnn/TensorArrayUnstack/strided_slice/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
|
2model/rnn/TensorArrayUnstack/strided_slice/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
�
*model/rnn/TensorArrayUnstack/strided_sliceStridedSlice"model/rnn/TensorArrayUnstack/Shape0model/rnn/TensorArrayUnstack/strided_slice/stack2model/rnn/TensorArrayUnstack/strided_slice/stack_12model/rnn/TensorArrayUnstack/strided_slice/stack_2*
T0*
Index0*
new_axis_mask *

begin_mask *
ellipsis_mask *
_output_shapes
: *
shrink_axis_mask*
end_mask 
j
(model/rnn/TensorArrayUnstack/range/startConst*
_output_shapes
: *
value	B : *
dtype0
j
(model/rnn/TensorArrayUnstack/range/deltaConst*
_output_shapes
: *
value	B :*
dtype0
�
"model/rnn/TensorArrayUnstack/rangeRange(model/rnn/TensorArrayUnstack/range/start*model/rnn/TensorArrayUnstack/strided_slice(model/rnn/TensorArrayUnstack/range/delta*#
_output_shapes
:���������*

Tidx0
�
Dmodel/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3TensorArrayScatterV3model/rnn/TensorArray_1"model/rnn/TensorArrayUnstack/rangemodel/transposemodel/rnn/TensorArray_1:1*
T0*"
_class
loc:@model/transpose*
_output_shapes
: 
�
model/rnn/while/EnterEntermodel/rnn/time*
T0*
_output_shapes
: *
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
is_constant( 
�
model/rnn/while/Enter_1Entermodel/rnn/TensorArray:1*
T0*
_output_shapes
: *
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
is_constant( 
�
model/rnn/while/Enter_2Enter model/rnn/GRUCellZeroState/zeros*
T0*(
_output_shapes
:����������*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
is_constant( 
�
model/rnn/while/MergeMergemodel/rnn/while/Entermodel/rnn/while/NextIteration*
T0*
_output_shapes
: : *
N
�
model/rnn/while/Merge_1Mergemodel/rnn/while/Enter_1model/rnn/while/NextIteration_1*
T0*
_output_shapes
: : *
N
�
model/rnn/while/Merge_2Mergemodel/rnn/while/Enter_2model/rnn/while/NextIteration_2*
T0**
_output_shapes
:����������: *
N
�
model/rnn/while/Less/EnterEntermodel/rnn/strided_slice_2*
T0*
_output_shapes
: *
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
is_constant(
p
model/rnn/while/LessLessmodel/rnn/while/Mergemodel/rnn/while/Less/Enter*
T0*
_output_shapes
: 
R
model/rnn/while/LoopCondLoopCondmodel/rnn/while/Less*
_output_shapes
: 
�
model/rnn/while/SwitchSwitchmodel/rnn/while/Mergemodel/rnn/while/LoopCond*
T0*(
_class
loc:@model/rnn/while/Merge*
_output_shapes
: : 
�
model/rnn/while/Switch_1Switchmodel/rnn/while/Merge_1model/rnn/while/LoopCond*
T0**
_class 
loc:@model/rnn/while/Merge_1*
_output_shapes
: : 
�
model/rnn/while/Switch_2Switchmodel/rnn/while/Merge_2model/rnn/while/LoopCond*
T0**
_class 
loc:@model/rnn/while/Merge_2*<
_output_shapes*
(:����������:����������
_
model/rnn/while/IdentityIdentitymodel/rnn/while/Switch:1*
T0*
_output_shapes
: 
c
model/rnn/while/Identity_1Identitymodel/rnn/while/Switch_1:1*
T0*
_output_shapes
: 
u
model/rnn/while/Identity_2Identitymodel/rnn/while/Switch_2:1*
T0*(
_output_shapes
:����������
�
'model/rnn/while/TensorArrayReadV3/EnterEntermodel/rnn/TensorArray_1*
T0*
_output_shapes
:*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
is_constant(
�
)model/rnn/while/TensorArrayReadV3/Enter_1EnterDmodel/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*
T0*
_output_shapes
: *
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
is_constant(
�
!model/rnn/while/TensorArrayReadV3TensorArrayReadV3'model/rnn/while/TensorArrayReadV3/Entermodel/rnn/while/Identity)model/rnn/while/TensorArrayReadV3/Enter_1*'
_output_shapes
:���������d*
dtype0
�
:rnn/gru_cell/gates/kernel/Initializer/random_uniform/shapeConst*
_output_shapes
:*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
valueB"d     *
dtype0
�
8rnn/gru_cell/gates/kernel/Initializer/random_uniform/minConst*
_output_shapes
: *,
_class"
 loc:@rnn/gru_cell/gates/kernel*
valueB
 *|x�*
dtype0
�
8rnn/gru_cell/gates/kernel/Initializer/random_uniform/maxConst*
_output_shapes
: *,
_class"
 loc:@rnn/gru_cell/gates/kernel*
valueB
 *|x=*
dtype0
�
Brnn/gru_cell/gates/kernel/Initializer/random_uniform/RandomUniformRandomUniform:rnn/gru_cell/gates/kernel/Initializer/random_uniform/shape*
T0*
dtype0*
seed2 * 
_output_shapes
:
��*,
_class"
 loc:@rnn/gru_cell/gates/kernel*

seed 
�
8rnn/gru_cell/gates/kernel/Initializer/random_uniform/subSub8rnn/gru_cell/gates/kernel/Initializer/random_uniform/max8rnn/gru_cell/gates/kernel/Initializer/random_uniform/min*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
_output_shapes
: 
�
8rnn/gru_cell/gates/kernel/Initializer/random_uniform/mulMulBrnn/gru_cell/gates/kernel/Initializer/random_uniform/RandomUniform8rnn/gru_cell/gates/kernel/Initializer/random_uniform/sub*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel* 
_output_shapes
:
��
�
4rnn/gru_cell/gates/kernel/Initializer/random_uniformAdd8rnn/gru_cell/gates/kernel/Initializer/random_uniform/mul8rnn/gru_cell/gates/kernel/Initializer/random_uniform/min*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel* 
_output_shapes
:
��
�
rnn/gru_cell/gates/kernel
VariableV2*
dtype0*,
_class"
 loc:@rnn/gru_cell/gates/kernel* 
_output_shapes
:
��*
shared_name *
shape:
��*
	container 
�
 rnn/gru_cell/gates/kernel/AssignAssignrnn/gru_cell/gates/kernel4rnn/gru_cell/gates/kernel/Initializer/random_uniform*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
��
p
rnn/gru_cell/gates/kernel/readIdentityrnn/gru_cell/gates/kernel*
T0* 
_output_shapes
:
��
�
4model/rnn/while/rnn/gru_cell/gates/gates/concat/axisConst^model/rnn/while/Identity*
_output_shapes
: *
value	B :*
dtype0
�
/model/rnn/while/rnn/gru_cell/gates/gates/concatConcatV2!model/rnn/while/TensorArrayReadV3model/rnn/while/Identity_24model/rnn/while/rnn/gru_cell/gates/gates/concat/axis*
T0*(
_output_shapes
:����������*
N*

Tidx0
�
5model/rnn/while/rnn/gru_cell/gates/gates/MatMul/EnterEnterrnn/gru_cell/gates/kernel/read*
T0* 
_output_shapes
:
��*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
is_constant(
�
/model/rnn/while/rnn/gru_cell/gates/gates/MatMulMatMul/model/rnn/while/rnn/gru_cell/gates/gates/concat5model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter*
T0*(
_output_shapes
:����������*
transpose_b( *
transpose_a( 
�
)rnn/gru_cell/gates/bias/Initializer/ConstConst*
_output_shapes	
:�**
_class 
loc:@rnn/gru_cell/gates/bias*
valueB�*  �?*
dtype0
�
rnn/gru_cell/gates/bias
VariableV2*
dtype0**
_class 
loc:@rnn/gru_cell/gates/bias*
_output_shapes	
:�*
shared_name *
shape:�*
	container 
�
rnn/gru_cell/gates/bias/AssignAssignrnn/gru_cell/gates/bias)rnn/gru_cell/gates/bias/Initializer/Const*
T0**
_class 
loc:@rnn/gru_cell/gates/bias*
validate_shape(*
use_locking(*
_output_shapes	
:�
g
rnn/gru_cell/gates/bias/readIdentityrnn/gru_cell/gates/bias*
T0*
_output_shapes	
:�
�
6model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/EnterEnterrnn/gru_cell/gates/bias/read*
T0*
_output_shapes	
:�*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
is_constant(
�
0model/rnn/while/rnn/gru_cell/gates/gates/BiasAddBiasAdd/model/rnn/while/rnn/gru_cell/gates/gates/MatMul6model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter*
T0*
data_formatNHWC*(
_output_shapes
:����������
�
*model/rnn/while/rnn/gru_cell/gates/SigmoidSigmoid0model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd*
T0*(
_output_shapes
:����������
�
(model/rnn/while/rnn/gru_cell/gates/ConstConst^model/rnn/while/Identity*
_output_shapes
: *
value	B :*
dtype0
�
2model/rnn/while/rnn/gru_cell/gates/split/split_dimConst^model/rnn/while/Identity*
_output_shapes
: *
value	B :*
dtype0
�
(model/rnn/while/rnn/gru_cell/gates/splitSplit2model/rnn/while/rnn/gru_cell/gates/split/split_dim*model/rnn/while/rnn/gru_cell/gates/Sigmoid*
T0*<
_output_shapes*
(:����������:����������*
	num_split
�
*model/rnn/while/rnn/gru_cell/candidate/mulMul(model/rnn/while/rnn/gru_cell/gates/splitmodel/rnn/while/Identity_2*
T0*(
_output_shapes
:����������
�
>rnn/gru_cell/candidate/kernel/Initializer/random_uniform/shapeConst*
_output_shapes
:*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
valueB"d     *
dtype0
�
<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/minConst*
_output_shapes
: *0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
valueB
 *����*
dtype0
�
<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/maxConst*
_output_shapes
: *0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
valueB
 *���=*
dtype0
�
Frnn/gru_cell/candidate/kernel/Initializer/random_uniform/RandomUniformRandomUniform>rnn/gru_cell/candidate/kernel/Initializer/random_uniform/shape*
T0*
dtype0*
seed2 * 
_output_shapes
:
��*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*

seed 
�
<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/subSub<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/max<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/min*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
_output_shapes
: 
�
<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/mulMulFrnn/gru_cell/candidate/kernel/Initializer/random_uniform/RandomUniform<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/sub*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel* 
_output_shapes
:
��
�
8rnn/gru_cell/candidate/kernel/Initializer/random_uniformAdd<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/mul<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/min*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel* 
_output_shapes
:
��
�
rnn/gru_cell/candidate/kernel
VariableV2*
dtype0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel* 
_output_shapes
:
��*
shared_name *
shape:
��*
	container 
�
$rnn/gru_cell/candidate/kernel/AssignAssignrnn/gru_cell/candidate/kernel8rnn/gru_cell/candidate/kernel/Initializer/random_uniform*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
��
x
"rnn/gru_cell/candidate/kernel/readIdentityrnn/gru_cell/candidate/kernel*
T0* 
_output_shapes
:
��
�
<model/rnn/while/rnn/gru_cell/candidate/candidate/concat/axisConst^model/rnn/while/Identity*
_output_shapes
: *
value	B :*
dtype0
�
7model/rnn/while/rnn/gru_cell/candidate/candidate/concatConcatV2!model/rnn/while/TensorArrayReadV3*model/rnn/while/rnn/gru_cell/candidate/mul<model/rnn/while/rnn/gru_cell/candidate/candidate/concat/axis*
T0*(
_output_shapes
:����������*
N*

Tidx0
�
=model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/EnterEnter"rnn/gru_cell/candidate/kernel/read*
T0* 
_output_shapes
:
��*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
is_constant(
�
7model/rnn/while/rnn/gru_cell/candidate/candidate/MatMulMatMul7model/rnn/while/rnn/gru_cell/candidate/candidate/concat=model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter*
T0*(
_output_shapes
:����������*
transpose_b( *
transpose_a( 
�
-rnn/gru_cell/candidate/bias/Initializer/ConstConst*
_output_shapes	
:�*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
valueB�*    *
dtype0
�
rnn/gru_cell/candidate/bias
VariableV2*
dtype0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
_output_shapes	
:�*
shared_name *
shape:�*
	container 
�
"rnn/gru_cell/candidate/bias/AssignAssignrnn/gru_cell/candidate/bias-rnn/gru_cell/candidate/bias/Initializer/Const*
T0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
validate_shape(*
use_locking(*
_output_shapes	
:�
o
 rnn/gru_cell/candidate/bias/readIdentityrnn/gru_cell/candidate/bias*
T0*
_output_shapes	
:�
�
>model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/EnterEnter rnn/gru_cell/candidate/bias/read*
T0*
_output_shapes	
:�*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
is_constant(
�
8model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAddBiasAdd7model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul>model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter*
T0*
data_formatNHWC*(
_output_shapes
:����������
�
+model/rnn/while/rnn/gru_cell/candidate/TanhTanh8model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd*
T0*(
_output_shapes
:����������
�
 model/rnn/while/rnn/gru_cell/mulMul*model/rnn/while/rnn/gru_cell/gates/split:1model/rnn/while/Identity_2*
T0*(
_output_shapes
:����������
�
"model/rnn/while/rnn/gru_cell/sub/xConst^model/rnn/while/Identity*
_output_shapes
: *
valueB
 *  �?*
dtype0
�
 model/rnn/while/rnn/gru_cell/subSub"model/rnn/while/rnn/gru_cell/sub/x*model/rnn/while/rnn/gru_cell/gates/split:1*
T0*(
_output_shapes
:����������
�
"model/rnn/while/rnn/gru_cell/mul_1Mul model/rnn/while/rnn/gru_cell/sub+model/rnn/while/rnn/gru_cell/candidate/Tanh*
T0*(
_output_shapes
:����������
�
 model/rnn/while/rnn/gru_cell/addAdd model/rnn/while/rnn/gru_cell/mul"model/rnn/while/rnn/gru_cell/mul_1*
T0*(
_output_shapes
:����������
�
9model/rnn/while/TensorArrayWrite/TensorArrayWriteV3/EnterEntermodel/rnn/TensorArray*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*3
_class)
'%loc:@model/rnn/while/rnn/gru_cell/add*
is_constant(
�
3model/rnn/while/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV39model/rnn/while/TensorArrayWrite/TensorArrayWriteV3/Entermodel/rnn/while/Identity model/rnn/while/rnn/gru_cell/addmodel/rnn/while/Identity_1*
T0*3
_class)
'%loc:@model/rnn/while/rnn/gru_cell/add*
_output_shapes
: 
r
model/rnn/while/add/yConst^model/rnn/while/Identity*
_output_shapes
: *
value	B :*
dtype0
l
model/rnn/while/addAddmodel/rnn/while/Identitymodel/rnn/while/add/y*
T0*
_output_shapes
: 
d
model/rnn/while/NextIterationNextIterationmodel/rnn/while/add*
T0*
_output_shapes
: 
�
model/rnn/while/NextIteration_1NextIteration3model/rnn/while/TensorArrayWrite/TensorArrayWriteV3*
T0*
_output_shapes
: 
�
model/rnn/while/NextIteration_2NextIteration model/rnn/while/rnn/gru_cell/add*
T0*(
_output_shapes
:����������
U
model/rnn/while/ExitExitmodel/rnn/while/Switch*
T0*
_output_shapes
: 
Y
model/rnn/while/Exit_1Exitmodel/rnn/while/Switch_1*
T0*
_output_shapes
: 
k
model/rnn/while/Exit_2Exitmodel/rnn/while/Switch_2*
T0*(
_output_shapes
:����������
�
,model/rnn/TensorArrayStack/TensorArraySizeV3TensorArraySizeV3model/rnn/TensorArraymodel/rnn/while/Exit_1*
_output_shapes
: *(
_class
loc:@model/rnn/TensorArray
�
&model/rnn/TensorArrayStack/range/startConst*
_output_shapes
: *(
_class
loc:@model/rnn/TensorArray*
value	B : *
dtype0
�
&model/rnn/TensorArrayStack/range/deltaConst*
_output_shapes
: *(
_class
loc:@model/rnn/TensorArray*
value	B :*
dtype0
�
 model/rnn/TensorArrayStack/rangeRange&model/rnn/TensorArrayStack/range/start,model/rnn/TensorArrayStack/TensorArraySizeV3&model/rnn/TensorArrayStack/range/delta*#
_output_shapes
:���������*(
_class
loc:@model/rnn/TensorArray*

Tidx0
�
.model/rnn/TensorArrayStack/TensorArrayGatherV3TensorArrayGatherV3model/rnn/TensorArray model/rnn/TensorArrayStack/rangemodel/rnn/while/Exit_1*,
_output_shapes
:����������*%
element_shape:����������*
dtype0*(
_class
loc:@model/rnn/TensorArray
\
model/rnn/Const_1Const*
_output_shapes
:*
valueB:�*
dtype0
P
model/rnn/RankConst*
_output_shapes
: *
value	B :*
dtype0
W
model/rnn/range/startConst*
_output_shapes
: *
value	B :*
dtype0
W
model/rnn/range/deltaConst*
_output_shapes
: *
value	B :*
dtype0
~
model/rnn/rangeRangemodel/rnn/range/startmodel/rnn/Rankmodel/rnn/range/delta*
_output_shapes
:*

Tidx0
l
model/rnn/concat_1/values_0Const*
_output_shapes
:*
valueB"       *
dtype0
Y
model/rnn/concat_1/axisConst*
_output_shapes
: *
value	B : *
dtype0
�
model/rnn/concat_1ConcatV2model/rnn/concat_1/values_0model/rnn/rangemodel/rnn/concat_1/axis*
T0*
_output_shapes
:*
N*

Tidx0
�
model/rnn/transpose	Transpose.model/rnn/TensorArrayStack/TensorArrayGatherV3model/rnn/concat_1*
T0*,
_output_shapes
:����������*
Tperm0
�
-dense/kernel/Initializer/random_uniform/shapeConst*
_output_shapes
:*
_class
loc:@dense/kernel*
valueB"   �: *
dtype0
�
+dense/kernel/Initializer/random_uniform/minConst*
_output_shapes
: *
_class
loc:@dense/kernel*
valueB
 * ��*
dtype0
�
+dense/kernel/Initializer/random_uniform/maxConst*
_output_shapes
: *
_class
loc:@dense/kernel*
valueB
 * �<*
dtype0
�
5dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform-dense/kernel/Initializer/random_uniform/shape*
T0*
dtype0*
seed2 *!
_output_shapes
:���*
_class
loc:@dense/kernel*

seed 
�
+dense/kernel/Initializer/random_uniform/subSub+dense/kernel/Initializer/random_uniform/max+dense/kernel/Initializer/random_uniform/min*
T0*
_class
loc:@dense/kernel*
_output_shapes
: 
�
+dense/kernel/Initializer/random_uniform/mulMul5dense/kernel/Initializer/random_uniform/RandomUniform+dense/kernel/Initializer/random_uniform/sub*
T0*
_class
loc:@dense/kernel*!
_output_shapes
:���
�
'dense/kernel/Initializer/random_uniformAdd+dense/kernel/Initializer/random_uniform/mul+dense/kernel/Initializer/random_uniform/min*
T0*
_class
loc:@dense/kernel*!
_output_shapes
:���
�
dense/kernel
VariableV2*
dtype0*
_class
loc:@dense/kernel*!
_output_shapes
:���*
shared_name *
shape:���*
	container 
�
dense/kernel/AssignAssigndense/kernel'dense/kernel/Initializer/random_uniform*
T0*
_class
loc:@dense/kernel*
validate_shape(*
use_locking(*!
_output_shapes
:���
x
dense/kernel/readIdentitydense/kernel*
T0*
_class
loc:@dense/kernel*!
_output_shapes
:���
�
dense/bias/Initializer/zerosConst*
_output_shapes

:��*
_class
loc:@dense/bias*
valueB��*    *
dtype0
�

dense/bias
VariableV2*
dtype0*
_class
loc:@dense/bias*
_output_shapes

:��*
shared_name *
shape:��*
	container 
�
dense/bias/AssignAssign
dense/biasdense/bias/Initializer/zeros*
T0*
_class
loc:@dense/bias*
validate_shape(*
use_locking(*
_output_shapes

:��
m
dense/bias/readIdentity
dense/bias*
T0*
_class
loc:@dense/bias*
_output_shapes

:��
�
model/dense/MatMulMatMulmodel/rnn/while/Exit_2dense/kernel/read*
T0*)
_output_shapes
:�����������*
transpose_b( *
transpose_a( 
�
model/dense/BiasAddBiasAddmodel/dense/MatMuldense/bias/read*
T0*
data_formatNHWC*)
_output_shapes
:�����������
a
model/SoftmaxSoftmaxmodel/dense/BiasAdd*
T0*)
_output_shapes
:�����������
�
/model/SparseSoftmaxCrossEntropyWithLogits/ShapeShapeplaceholders/Placeholder_1*
T0*
_output_shapes
:*
out_type0
�
Mmodel/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits#SparseSoftmaxCrossEntropyWithLogitsmodel/dense/BiasAddplaceholders/Placeholder_1*
T0*
Tlabels0*8
_output_shapes&
$:���������:�����������
U
model/ConstConst*
_output_shapes
:*
valueB: *
dtype0
�

model/MeanMeanMmodel/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogitsmodel/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
X
model/gradients/ShapeConst*
_output_shapes
: *
valueB *
dtype0
Z
model/gradients/ConstConst*
_output_shapes
: *
valueB
 *  �?*
dtype0
k
model/gradients/FillFillmodel/gradients/Shapemodel/gradients/Const*
T0*
_output_shapes
: 
Y
model/gradients/f_countConst*
_output_shapes
: *
value	B : *
dtype0
�
model/gradients/f_count_1Entermodel/gradients/f_count*
T0*
_output_shapes
: *
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
is_constant( 
�
model/gradients/MergeMergemodel/gradients/f_count_1model/gradients/NextIteration*
T0*
_output_shapes
: : *
N
t
model/gradients/SwitchSwitchmodel/gradients/Mergemodel/rnn/while/LoopCond*
T0*
_output_shapes
: : 
r
model/gradients/Add/yConst^model/rnn/while/Identity*
_output_shapes
: *
value	B :*
dtype0
l
model/gradients/AddAddmodel/gradients/Switch:1model/gradients/Add/y*
T0*
_output_shapes
: 
�
model/gradients/NextIterationNextIterationmodel/gradients/AddV^model/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPushX^model/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPush_1V^model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPushX^model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPush_1D^model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/StackPushF^model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1/StackPushX^model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPushZ^model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPush_1F^model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPushH^model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/StackPushV^model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPush`^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/StackPush[^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/StackPush^^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPush`^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPush_1`^model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPushb^model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPush_1P^model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/StackPushO^model/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat/StackPushV^model/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/StackPushX^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/StackPushS^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/StackPushe^model/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/StackPush*
T0*
_output_shapes
: 
Z
model/gradients/f_count_2Exitmodel/gradients/Switch*
T0*
_output_shapes
: 
Y
model/gradients/b_countConst*
_output_shapes
: *
value	B :*
dtype0
�
model/gradients/b_count_1Entermodel/gradients/f_count_2*
T0*
_output_shapes
: *
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
is_constant( 
�
model/gradients/Merge_1Mergemodel/gradients/b_count_1model/gradients/NextIteration_1*
T0*
_output_shapes
: : *
N
�
"model/gradients/GreaterEqual/EnterEntermodel/gradients/b_count*
T0*
_output_shapes
: *
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
is_constant(
�
model/gradients/GreaterEqualGreaterEqualmodel/gradients/Merge_1"model/gradients/GreaterEqual/Enter*
T0*
_output_shapes
: 
[
model/gradients/b_count_2LoopCondmodel/gradients/GreaterEqual*
_output_shapes
: 
y
model/gradients/Switch_1Switchmodel/gradients/Merge_1model/gradients/b_count_2*
T0*
_output_shapes
: : 
{
model/gradients/SubSubmodel/gradients/Switch_1:1"model/gradients/GreaterEqual/Enter*
T0*
_output_shapes
: 
�
model/gradients/NextIteration_1NextIterationmodel/gradients/SubS^model/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/b_sync*
T0*
_output_shapes
: 
\
model/gradients/b_count_3Exitmodel/gradients/Switch_1*
T0*
_output_shapes
: 
w
-model/gradients/model/Mean_grad/Reshape/shapeConst*
_output_shapes
:*
valueB:*
dtype0
�
'model/gradients/model/Mean_grad/ReshapeReshapemodel/gradients/Fill-model/gradients/model/Mean_grad/Reshape/shape*
T0*
_output_shapes
:*
Tshape0
�
%model/gradients/model/Mean_grad/ShapeShapeMmodel/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits*
T0*
_output_shapes
:*
out_type0
�
$model/gradients/model/Mean_grad/TileTile'model/gradients/model/Mean_grad/Reshape%model/gradients/model/Mean_grad/Shape*
T0*#
_output_shapes
:���������*

Tmultiples0
�
'model/gradients/model/Mean_grad/Shape_1ShapeMmodel/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits*
T0*
_output_shapes
:*
out_type0
j
'model/gradients/model/Mean_grad/Shape_2Const*
_output_shapes
: *
valueB *
dtype0
o
%model/gradients/model/Mean_grad/ConstConst*
_output_shapes
:*
valueB: *
dtype0
�
$model/gradients/model/Mean_grad/ProdProd'model/gradients/model/Mean_grad/Shape_1%model/gradients/model/Mean_grad/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
q
'model/gradients/model/Mean_grad/Const_1Const*
_output_shapes
:*
valueB: *
dtype0
�
&model/gradients/model/Mean_grad/Prod_1Prod'model/gradients/model/Mean_grad/Shape_2'model/gradients/model/Mean_grad/Const_1*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
k
)model/gradients/model/Mean_grad/Maximum/yConst*
_output_shapes
: *
value	B :*
dtype0
�
'model/gradients/model/Mean_grad/MaximumMaximum&model/gradients/model/Mean_grad/Prod_1)model/gradients/model/Mean_grad/Maximum/y*
T0*
_output_shapes
: 
�
(model/gradients/model/Mean_grad/floordivFloorDiv$model/gradients/model/Mean_grad/Prod'model/gradients/model/Mean_grad/Maximum*
T0*
_output_shapes
: 
�
$model/gradients/model/Mean_grad/CastCast(model/gradients/model/Mean_grad/floordiv*

SrcT0*
_output_shapes
: *

DstT0
�
'model/gradients/model/Mean_grad/truedivRealDiv$model/gradients/model/Mean_grad/Tile$model/gradients/model/Mean_grad/Cast*
T0*#
_output_shapes
:���������
�
model/gradients/zeros_like	ZerosLikeOmodel/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits:1*
T0*)
_output_shapes
:�����������
�
rmodel/gradients/model/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/PreventGradientPreventGradientOmodel/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits:1*
T0*�
message��Currently there is no way to take the second derivative of sparse_softmax_cross_entropy_with_logits due to the fused implementation's interaction with tf.gradients()*)
_output_shapes
:�����������
�
qmodel/gradients/model/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDims/dimConst*
_output_shapes
: *
valueB :
���������*
dtype0
�
mmodel/gradients/model/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDims
ExpandDims'model/gradients/model/Mean_grad/truedivqmodel/gradients/model/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDims/dim*
T0*'
_output_shapes
:���������*

Tdim0
�
fmodel/gradients/model/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mulMulmmodel/gradients/model/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDimsrmodel/gradients/model/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/PreventGradient*
T0*)
_output_shapes
:�����������
�
4model/gradients/model/dense/BiasAdd_grad/BiasAddGradBiasAddGradfmodel/gradients/model/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mul*
T0*
data_formatNHWC*
_output_shapes

:��
�
9model/gradients/model/dense/BiasAdd_grad/tuple/group_depsNoOpg^model/gradients/model/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mul5^model/gradients/model/dense/BiasAdd_grad/BiasAddGrad
�
Amodel/gradients/model/dense/BiasAdd_grad/tuple/control_dependencyIdentityfmodel/gradients/model/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mul:^model/gradients/model/dense/BiasAdd_grad/tuple/group_deps*
T0*y
_classo
mkloc:@model/gradients/model/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mul*)
_output_shapes
:�����������
�
Cmodel/gradients/model/dense/BiasAdd_grad/tuple/control_dependency_1Identity4model/gradients/model/dense/BiasAdd_grad/BiasAddGrad:^model/gradients/model/dense/BiasAdd_grad/tuple/group_deps*
T0*G
_class=
;9loc:@model/gradients/model/dense/BiasAdd_grad/BiasAddGrad*
_output_shapes

:��
�
.model/gradients/model/dense/MatMul_grad/MatMulMatMulAmodel/gradients/model/dense/BiasAdd_grad/tuple/control_dependencydense/kernel/read*
T0*(
_output_shapes
:����������*
transpose_b(*
transpose_a( 
�
0model/gradients/model/dense/MatMul_grad/MatMul_1MatMulmodel/rnn/while/Exit_2Amodel/gradients/model/dense/BiasAdd_grad/tuple/control_dependency*
T0*!
_output_shapes
:���*
transpose_b( *
transpose_a(
�
8model/gradients/model/dense/MatMul_grad/tuple/group_depsNoOp/^model/gradients/model/dense/MatMul_grad/MatMul1^model/gradients/model/dense/MatMul_grad/MatMul_1
�
@model/gradients/model/dense/MatMul_grad/tuple/control_dependencyIdentity.model/gradients/model/dense/MatMul_grad/MatMul9^model/gradients/model/dense/MatMul_grad/tuple/group_deps*
T0*A
_class7
53loc:@model/gradients/model/dense/MatMul_grad/MatMul*(
_output_shapes
:����������
�
Bmodel/gradients/model/dense/MatMul_grad/tuple/control_dependency_1Identity0model/gradients/model/dense/MatMul_grad/MatMul_19^model/gradients/model/dense/MatMul_grad/tuple/group_deps*
T0*C
_class9
75loc:@model/gradients/model/dense/MatMul_grad/MatMul_1*!
_output_shapes
:���
Z
model/gradients/zerosConst*
_output_shapes
: *
valueB
 *    *
dtype0
�
2model/gradients/model/rnn/while/Exit_2_grad/b_exitEnter@model/gradients/model/dense/MatMul_grad/tuple/control_dependency*
T0*(
_output_shapes
:����������*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
is_constant( 
�
2model/gradients/model/rnn/while/Exit_1_grad/b_exitEntermodel/gradients/zeros*
T0*
_output_shapes
: *
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
is_constant( 
�
6model/gradients/model/rnn/while/Switch_2_grad/b_switchMerge2model/gradients/model/rnn/while/Exit_2_grad/b_exit=model/gradients/model/rnn/while/Switch_2_grad_1/NextIteration*
T0**
_output_shapes
:����������: *
N
�
3model/gradients/model/rnn/while/Merge_2_grad/SwitchSwitch6model/gradients/model/rnn/while/Switch_2_grad/b_switchmodel/gradients/b_count_2*
T0*I
_class?
=;loc:@model/gradients/model/rnn/while/Switch_2_grad/b_switch*<
_output_shapes*
(:����������:����������
{
=model/gradients/model/rnn/while/Merge_2_grad/tuple/group_depsNoOp4^model/gradients/model/rnn/while/Merge_2_grad/Switch
�
Emodel/gradients/model/rnn/while/Merge_2_grad/tuple/control_dependencyIdentity3model/gradients/model/rnn/while/Merge_2_grad/Switch>^model/gradients/model/rnn/while/Merge_2_grad/tuple/group_deps*
T0*I
_class?
=;loc:@model/gradients/model/rnn/while/Switch_2_grad/b_switch*(
_output_shapes
:����������
�
Gmodel/gradients/model/rnn/while/Merge_2_grad/tuple/control_dependency_1Identity5model/gradients/model/rnn/while/Merge_2_grad/Switch:1>^model/gradients/model/rnn/while/Merge_2_grad/tuple/group_deps*
T0*I
_class?
=;loc:@model/gradients/model/rnn/while/Switch_2_grad/b_switch*(
_output_shapes
:����������
�
1model/gradients/model/rnn/while/Enter_2_grad/ExitExitEmodel/gradients/model/rnn/while/Merge_2_grad/tuple/control_dependency*
T0*(
_output_shapes
:����������
�
;model/gradients/model/rnn/GRUCellZeroState/zeros_grad/ConstConst*
_output_shapes
:*
valueB"       *
dtype0
�
9model/gradients/model/rnn/GRUCellZeroState/zeros_grad/SumSum1model/gradients/model/rnn/while/Enter_2_grad/Exit;model/gradients/model/rnn/GRUCellZeroState/zeros_grad/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
�
;model/gradients/model/rnn/while/rnn/gru_cell/add_grad/ShapeShape model/rnn/while/rnn/gru_cell/mul*
T0*
_output_shapes
:*
out_type0
�
=model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Shape_1Shape"model/rnn/while/rnn/gru_cell/mul_1*
T0*
_output_shapes
:*
out_type0
�
Qmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/f_accStack*

stack_name *N
_classD
B@loc:@model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Shape*
	elem_type0*
_output_shapes
:
�
Tmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/RefEnterRefEnterQmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*N
_classD
B@loc:@model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Shape*
is_constant(
�
Umodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPush	StackPushTmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/RefEnter;model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Shape^model/gradients/Add*
T0*
swap_memory( *
_output_shapes
:*N
_classD
B@loc:@model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Shape
�
]model/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop/RefEnterRefEnterQmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*N
_classD
B@loc:@model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Shape*
is_constant(
�
Tmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPopStackPop]model/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop/RefEnter^model/gradients/Sub*
_output_shapes
:*N
_classD
B@loc:@model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Shape*
	elem_type0
�
Rmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/b_syncControlTriggerU^model/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPopW^model/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop_1U^model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPopW^model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop_1C^model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/StackPopE^model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1/StackPopW^model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPopY^model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop_1E^model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPopG^model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/StackPopU^model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPop_^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/StackPopZ^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/StackPop]^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop_^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop_1_^model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPopa^model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop_1O^model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/StackPopN^model/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat/StackPopU^model/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/StackPopW^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/StackPopR^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/StackPopd^model/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/StackPop
�
Smodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/f_acc_1Stack*

stack_name *P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Shape_1*
	elem_type0*
_output_shapes
:
�
Vmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/RefEnter_1RefEnterSmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Shape_1*
is_constant(
�
Wmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPush_1	StackPushVmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/RefEnter_1=model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Shape_1^model/gradients/Add*
T0*
swap_memory( *
_output_shapes
:*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Shape_1
�
_model/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop_1/RefEnterRefEnterSmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Shape_1*
is_constant(
�
Vmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop_1StackPop_model/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop_1/RefEnter^model/gradients/Sub*
_output_shapes
:*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Shape_1*
	elem_type0
�
Kmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgsBroadcastGradientArgsTmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPopVmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop_1*
T0*2
_output_shapes 
:���������:���������
�
9model/gradients/model/rnn/while/rnn/gru_cell/add_grad/SumSumGmodel/gradients/model/rnn/while/Merge_2_grad/tuple/control_dependency_1Kmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
=model/gradients/model/rnn/while/rnn/gru_cell/add_grad/ReshapeReshape9model/gradients/model/rnn/while/rnn/gru_cell/add_grad/SumTmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop*
T0*0
_output_shapes
:������������������*
Tshape0
�
;model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Sum_1SumGmodel/gradients/model/rnn/while/Merge_2_grad/tuple/control_dependency_1Mmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
?model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Reshape_1Reshape;model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Sum_1Vmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop_1*
T0*0
_output_shapes
:������������������*
Tshape0
�
Fmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/tuple/group_depsNoOp>^model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Reshape@^model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Reshape_1
�
Nmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/tuple/control_dependencyIdentity=model/gradients/model/rnn/while/rnn/gru_cell/add_grad/ReshapeG^model/gradients/model/rnn/while/rnn/gru_cell/add_grad/tuple/group_deps*
T0*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Reshape*(
_output_shapes
:����������
�
Pmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/tuple/control_dependency_1Identity?model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Reshape_1G^model/gradients/model/rnn/while/rnn/gru_cell/add_grad/tuple/group_deps*
T0*R
_classH
FDloc:@model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Reshape_1*(
_output_shapes
:����������
�
;model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/ShapeShape*model/rnn/while/rnn/gru_cell/gates/split:1*
T0*
_output_shapes
:*
out_type0
�
=model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Shape_1Shapemodel/rnn/while/Identity_2*
T0*
_output_shapes
:*
out_type0
�
Qmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/f_accStack*

stack_name *N
_classD
B@loc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Shape*
	elem_type0*
_output_shapes
:
�
Tmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/RefEnterRefEnterQmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*N
_classD
B@loc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Shape*
is_constant(
�
Umodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPush	StackPushTmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/RefEnter;model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Shape^model/gradients/Add*
T0*
swap_memory( *
_output_shapes
:*N
_classD
B@loc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Shape
�
]model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop/RefEnterRefEnterQmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*N
_classD
B@loc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Shape*
is_constant(
�
Tmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPopStackPop]model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop/RefEnter^model/gradients/Sub*
_output_shapes
:*N
_classD
B@loc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Shape*
	elem_type0
�
Smodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/f_acc_1Stack*

stack_name *P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Shape_1*
	elem_type0*
_output_shapes
:
�
Vmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/RefEnter_1RefEnterSmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Shape_1*
is_constant(
�
Wmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPush_1	StackPushVmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/RefEnter_1=model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Shape_1^model/gradients/Add*
T0*
swap_memory( *
_output_shapes
:*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Shape_1
�
_model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop_1/RefEnterRefEnterSmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Shape_1*
is_constant(
�
Vmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop_1StackPop_model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop_1/RefEnter^model/gradients/Sub*
_output_shapes
:*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Shape_1*
	elem_type0
�
Kmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgsBroadcastGradientArgsTmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPopVmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop_1*
T0*2
_output_shapes 
:���������:���������
�
?model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/f_accStack*

stack_name *-
_class#
!loc:@model/rnn/while/Identity_2*
	elem_type0*
_output_shapes
:
�
Bmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/RefEnterRefEnter?model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*-
_class#
!loc:@model/rnn/while/Identity_2*
is_constant(
�
Cmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/StackPush	StackPushBmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/RefEntermodel/rnn/while/Identity_2^model/gradients/Add*
T0*
swap_memory( *(
_output_shapes
:����������*-
_class#
!loc:@model/rnn/while/Identity_2
�
Kmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/StackPop/RefEnterRefEnter?model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*-
_class#
!loc:@model/rnn/while/Identity_2*
is_constant(
�
Bmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/StackPopStackPopKmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/StackPop/RefEnter^model/gradients/Sub*(
_output_shapes
:����������*-
_class#
!loc:@model/rnn/while/Identity_2*
	elem_type0
�
9model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mulMulNmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/tuple/control_dependencyBmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/StackPop*
T0*(
_output_shapes
:����������
�
9model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/SumSum9model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mulKmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
=model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/ReshapeReshape9model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/SumTmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop*
T0*0
_output_shapes
:������������������*
Tshape0
�
Amodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1/f_accStack*

stack_name *;
_class1
/-loc:@model/rnn/while/rnn/gru_cell/gates/split*
	elem_type0*
_output_shapes
:
�
Dmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1/RefEnterRefEnterAmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*;
_class1
/-loc:@model/rnn/while/rnn/gru_cell/gates/split*
is_constant(
�
Emodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1/StackPush	StackPushDmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1/RefEnter*model/rnn/while/rnn/gru_cell/gates/split:1^model/gradients/Add*
T0*
swap_memory( *(
_output_shapes
:����������*;
_class1
/-loc:@model/rnn/while/rnn/gru_cell/gates/split
�
Mmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1/StackPop/RefEnterRefEnterAmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*;
_class1
/-loc:@model/rnn/while/rnn/gru_cell/gates/split*
is_constant(
�
Dmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1/StackPopStackPopMmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1/StackPop/RefEnter^model/gradients/Sub*(
_output_shapes
:����������*;
_class1
/-loc:@model/rnn/while/rnn/gru_cell/gates/split*
	elem_type0
�
;model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1MulDmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1/StackPopNmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/tuple/control_dependency*
T0*(
_output_shapes
:����������
�
;model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Sum_1Sum;model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1Mmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
?model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Reshape_1Reshape;model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Sum_1Vmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop_1*
T0*0
_output_shapes
:������������������*
Tshape0
�
Fmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/tuple/group_depsNoOp>^model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Reshape@^model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Reshape_1
�
Nmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/tuple/control_dependencyIdentity=model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/ReshapeG^model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/tuple/group_deps*
T0*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Reshape*(
_output_shapes
:����������
�
Pmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/tuple/control_dependency_1Identity?model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Reshape_1G^model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/tuple/group_deps*
T0*R
_classH
FDloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Reshape_1*(
_output_shapes
:����������
�
=model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/ShapeShape model/rnn/while/rnn/gru_cell/sub*
T0*
_output_shapes
:*
out_type0
�
?model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Shape_1Shape+model/rnn/while/rnn/gru_cell/candidate/Tanh*
T0*
_output_shapes
:*
out_type0
�
Smodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/f_accStack*

stack_name *P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Shape*
	elem_type0*
_output_shapes
:
�
Vmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/RefEnterRefEnterSmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Shape*
is_constant(
�
Wmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPush	StackPushVmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/RefEnter=model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Shape^model/gradients/Add*
T0*
swap_memory( *
_output_shapes
:*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Shape
�
_model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop/RefEnterRefEnterSmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Shape*
is_constant(
�
Vmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPopStackPop_model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop/RefEnter^model/gradients/Sub*
_output_shapes
:*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Shape*
	elem_type0
�
Umodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/f_acc_1Stack*

stack_name *R
_classH
FDloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Shape_1*
	elem_type0*
_output_shapes
:
�
Xmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/RefEnter_1RefEnterUmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*R
_classH
FDloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Shape_1*
is_constant(
�
Ymodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPush_1	StackPushXmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/RefEnter_1?model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Shape_1^model/gradients/Add*
T0*
swap_memory( *
_output_shapes
:*R
_classH
FDloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Shape_1
�
amodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop_1/RefEnterRefEnterUmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*R
_classH
FDloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Shape_1*
is_constant(
�
Xmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop_1StackPopamodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop_1/RefEnter^model/gradients/Sub*
_output_shapes
:*R
_classH
FDloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Shape_1*
	elem_type0
�
Mmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgsBroadcastGradientArgsVmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPopXmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop_1*
T0*2
_output_shapes 
:���������:���������
�
Amodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul/f_accStack*

stack_name *>
_class4
20loc:@model/rnn/while/rnn/gru_cell/candidate/Tanh*
	elem_type0*
_output_shapes
:
�
Dmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul/RefEnterRefEnterAmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*>
_class4
20loc:@model/rnn/while/rnn/gru_cell/candidate/Tanh*
is_constant(
�
Emodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPush	StackPushDmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul/RefEnter+model/rnn/while/rnn/gru_cell/candidate/Tanh^model/gradients/Add*
T0*
swap_memory( *(
_output_shapes
:����������*>
_class4
20loc:@model/rnn/while/rnn/gru_cell/candidate/Tanh
�
Mmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPop/RefEnterRefEnterAmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*>
_class4
20loc:@model/rnn/while/rnn/gru_cell/candidate/Tanh*
is_constant(
�
Dmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPopStackPopMmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPop/RefEnter^model/gradients/Sub*(
_output_shapes
:����������*>
_class4
20loc:@model/rnn/while/rnn/gru_cell/candidate/Tanh*
	elem_type0
�
;model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mulMulPmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/tuple/control_dependency_1Dmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPop*
T0*(
_output_shapes
:����������
�
;model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/SumSum;model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mulMmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
?model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/ReshapeReshape;model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/SumVmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop*
T0*0
_output_shapes
:������������������*
Tshape0
�
Cmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/f_accStack*

stack_name *3
_class)
'%loc:@model/rnn/while/rnn/gru_cell/sub*
	elem_type0*
_output_shapes
:
�
Fmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/RefEnterRefEnterCmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*3
_class)
'%loc:@model/rnn/while/rnn/gru_cell/sub*
is_constant(
�
Gmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/StackPush	StackPushFmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/RefEnter model/rnn/while/rnn/gru_cell/sub^model/gradients/Add*
T0*
swap_memory( *(
_output_shapes
:����������*3
_class)
'%loc:@model/rnn/while/rnn/gru_cell/sub
�
Omodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/StackPop/RefEnterRefEnterCmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*3
_class)
'%loc:@model/rnn/while/rnn/gru_cell/sub*
is_constant(
�
Fmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/StackPopStackPopOmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/StackPop/RefEnter^model/gradients/Sub*(
_output_shapes
:����������*3
_class)
'%loc:@model/rnn/while/rnn/gru_cell/sub*
	elem_type0
�
=model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1MulFmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/StackPopPmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/tuple/control_dependency_1*
T0*(
_output_shapes
:����������
�
=model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Sum_1Sum=model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1Omodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
Amodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Reshape_1Reshape=model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Sum_1Xmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop_1*
T0*0
_output_shapes
:������������������*
Tshape0
�
Hmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/tuple/group_depsNoOp@^model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/ReshapeB^model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Reshape_1
�
Pmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/tuple/control_dependencyIdentity?model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/ReshapeI^model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/tuple/group_deps*
T0*R
_classH
FDloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Reshape*(
_output_shapes
:����������
�
Rmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/tuple/control_dependency_1IdentityAmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Reshape_1I^model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/tuple/group_deps*
T0*T
_classJ
HFloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Reshape_1*(
_output_shapes
:����������
�
;model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/ShapeConst^model/gradients/Sub*
_output_shapes
: *
valueB *
dtype0
�
=model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Shape_1Shape*model/rnn/while/rnn/gru_cell/gates/split:1*
T0*
_output_shapes
:*
out_type0
�
Qmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/f_accStack*

stack_name *P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Shape_1*
	elem_type0*
_output_shapes
:
�
Tmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/RefEnterRefEnterQmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Shape_1*
is_constant(
�
Umodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPush	StackPushTmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/RefEnter=model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Shape_1^model/gradients/Add*
T0*
swap_memory( *
_output_shapes
:*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Shape_1
�
]model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPop/RefEnterRefEnterQmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Shape_1*
is_constant(
�
Tmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPopStackPop]model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPop/RefEnter^model/gradients/Sub*
_output_shapes
:*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Shape_1*
	elem_type0
�
Kmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgsBroadcastGradientArgs;model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/ShapeTmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPop*
T0*2
_output_shapes 
:���������:���������
�
9model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/SumSumPmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/tuple/control_dependencyKmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
=model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/ReshapeReshape9model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Sum;model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Shape*
T0*
_output_shapes
: *
Tshape0
�
;model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Sum_1SumPmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/tuple/control_dependencyMmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
9model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/NegNeg;model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Sum_1*
T0*
_output_shapes
:
�
?model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Reshape_1Reshape9model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/NegTmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPop*
T0*0
_output_shapes
:������������������*
Tshape0
�
Fmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/tuple/group_depsNoOp>^model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Reshape@^model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Reshape_1
�
Nmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/tuple/control_dependencyIdentity=model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/ReshapeG^model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/tuple/group_deps*
T0*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Reshape*
_output_shapes
: 
�
Pmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/tuple/control_dependency_1Identity?model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Reshape_1G^model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/tuple/group_deps*
T0*R
_classH
FDloc:@model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Reshape_1*(
_output_shapes
:����������
�
Imodel/gradients/model/rnn/while/rnn/gru_cell/candidate/Tanh_grad/TanhGradTanhGradDmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPopRmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/tuple/control_dependency_1*
T0*(
_output_shapes
:����������
�
Ymodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/BiasAddGradBiasAddGradImodel/gradients/model/rnn/while/rnn/gru_cell/candidate/Tanh_grad/TanhGrad*
T0*
data_formatNHWC*
_output_shapes	
:�
�
^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/group_depsNoOpJ^model/gradients/model/rnn/while/rnn/gru_cell/candidate/Tanh_grad/TanhGradZ^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/BiasAddGrad
�
fmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/control_dependencyIdentityImodel/gradients/model/rnn/while/rnn/gru_cell/candidate/Tanh_grad/TanhGrad_^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/group_deps*
T0*\
_classR
PNloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/Tanh_grad/TanhGrad*(
_output_shapes
:����������
�
hmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/control_dependency_1IdentityYmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/BiasAddGrad_^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/group_deps*
T0*l
_classb
`^loc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/BiasAddGrad*
_output_shapes	
:�
�
Ymodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul/EnterEnter"rnn/gru_cell/candidate/kernel/read*
T0* 
_output_shapes
:
��*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
is_constant(
�
Smodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMulMatMulfmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/control_dependencyYmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul/Enter*
T0*(
_output_shapes
:����������*
transpose_b(*
transpose_a( 
�
[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/f_accStack*

stack_name *J
_class@
><loc:@model/rnn/while/rnn/gru_cell/candidate/candidate/concat*
	elem_type0*
_output_shapes
:
�
^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/RefEnterRefEnter[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*J
_class@
><loc:@model/rnn/while/rnn/gru_cell/candidate/candidate/concat*
is_constant(
�
_model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/StackPush	StackPush^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/RefEnter7model/rnn/while/rnn/gru_cell/candidate/candidate/concat^model/gradients/Add*
T0*
swap_memory( *(
_output_shapes
:����������*J
_class@
><loc:@model/rnn/while/rnn/gru_cell/candidate/candidate/concat
�
gmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/StackPop/RefEnterRefEnter[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*J
_class@
><loc:@model/rnn/while/rnn/gru_cell/candidate/candidate/concat*
is_constant(
�
^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/StackPopStackPopgmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/StackPop/RefEnter^model/gradients/Sub*(
_output_shapes
:����������*J
_class@
><loc:@model/rnn/while/rnn/gru_cell/candidate/candidate/concat*
	elem_type0
�
Umodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1MatMul^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/StackPopfmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/control_dependency*
T0* 
_output_shapes
:
��*
transpose_b( *
transpose_a(
�
]model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/group_depsNoOpT^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMulV^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1
�
emodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/control_dependencyIdentitySmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul^^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/group_deps*
T0*f
_class\
ZXloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul*(
_output_shapes
:����������
�
gmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/control_dependency_1IdentityUmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1^^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/group_deps*
T0*h
_class^
\Zloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1* 
_output_shapes
:
��
�
Ymodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_accConst*
_output_shapes	
:�*
valueB�*    *
dtype0
�
[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_acc_1EnterYmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_acc*
T0*
_output_shapes	
:�*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
is_constant( 
�
[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_acc_2Merge[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_acc_1amodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/NextIteration*
T0*
_output_shapes
	:�: *
N
�
Zmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/SwitchSwitch[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_acc_2model/gradients/b_count_2*
T0*"
_output_shapes
:�:�
�
Wmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/AddAdd\model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/Switch:1hmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/control_dependency_1*
T0*
_output_shapes	
:�
�
amodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/NextIterationNextIterationWmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/Add*
T0*
_output_shapes	
:�
�
[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_acc_3ExitZmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/Switch*
T0*
_output_shapes	
:�
�
Qmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/RankConst^model/gradients/Sub*
_output_shapes
: *
value	B :*
dtype0
�
Vmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/f_accStack*

stack_name *O
_classE
CAloc:@model/rnn/while/rnn/gru_cell/candidate/candidate/concat/axis*
	elem_type0*
_output_shapes
:
�
Ymodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/RefEnterRefEnterVmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*O
_classE
CAloc:@model/rnn/while/rnn/gru_cell/candidate/candidate/concat/axis*
is_constant(
�
Zmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/StackPush	StackPushYmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/RefEnter<model/rnn/while/rnn/gru_cell/candidate/candidate/concat/axis^model/gradients/Add*
T0*
swap_memory( *
_output_shapes
: *O
_classE
CAloc:@model/rnn/while/rnn/gru_cell/candidate/candidate/concat/axis
�
bmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/StackPop/RefEnterRefEnterVmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*O
_classE
CAloc:@model/rnn/while/rnn/gru_cell/candidate/candidate/concat/axis*
is_constant(
�
Ymodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/StackPopStackPopbmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/StackPop/RefEnter^model/gradients/Sub*
_output_shapes
: *O
_classE
CAloc:@model/rnn/while/rnn/gru_cell/candidate/candidate/concat/axis*
	elem_type0
�
Pmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/modFloorModYmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/StackPopQmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/Rank*
T0*
_output_shapes
: 
�
Rmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeShape!model/rnn/while/TensorArrayReadV3*
T0*
_output_shapes
:*
out_type0
�
Ymodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/f_accStack*

stack_name *4
_class*
(&loc:@model/rnn/while/TensorArrayReadV3*
	elem_type0*
_output_shapes
:
�
\model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/RefEnterRefEnterYmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*4
_class*
(&loc:@model/rnn/while/TensorArrayReadV3*
is_constant(
�
]model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPush	StackPush\model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/RefEnter!model/rnn/while/TensorArrayReadV3^model/gradients/Add*
T0*
swap_memory( *'
_output_shapes
:���������d*4
_class*
(&loc:@model/rnn/while/TensorArrayReadV3
�
emodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop/RefEnterRefEnterYmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*4
_class*
(&loc:@model/rnn/while/TensorArrayReadV3*
is_constant(
�
\model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPopStackPopemodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop/RefEnter^model/gradients/Sub*'
_output_shapes
:���������d*4
_class*
(&loc:@model/rnn/while/TensorArrayReadV3*
	elem_type0
�
[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/f_acc_1Stack*

stack_name *=
_class3
1/loc:@model/rnn/while/rnn/gru_cell/candidate/mul*
	elem_type0*
_output_shapes
:
�
^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/RefEnter_1RefEnter[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/f_acc_1*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*=
_class3
1/loc:@model/rnn/while/rnn/gru_cell/candidate/mul*
is_constant(
�
_model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPush_1	StackPush^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/RefEnter_1*model/rnn/while/rnn/gru_cell/candidate/mul^model/gradients/Add*
T0*
swap_memory( *(
_output_shapes
:����������*=
_class3
1/loc:@model/rnn/while/rnn/gru_cell/candidate/mul
�
gmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop_1/RefEnterRefEnter[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/f_acc_1*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*=
_class3
1/loc:@model/rnn/while/rnn/gru_cell/candidate/mul*
is_constant(
�
^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop_1StackPopgmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop_1/RefEnter^model/gradients/Sub*(
_output_shapes
:����������*=
_class3
1/loc:@model/rnn/while/rnn/gru_cell/candidate/mul*
	elem_type0
�
Smodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeNShapeN\model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop_1*
T0* 
_output_shapes
::*
out_type0*
N
�
Ymodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ConcatOffsetConcatOffsetPmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/modSmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeNUmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN:1* 
_output_shapes
::*
N
�
Rmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/SliceSliceemodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/control_dependencyYmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ConcatOffsetSmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN*
T0*0
_output_shapes
:������������������*
Index0
�
Tmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/Slice_1Sliceemodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/control_dependency[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ConcatOffset:1Umodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN:1*
T0*0
_output_shapes
:������������������*
Index0
�
]model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/group_depsNoOpS^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/SliceU^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/Slice_1
�
emodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/control_dependencyIdentityRmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/Slice^^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/group_deps*
T0*e
_class[
YWloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/Slice*'
_output_shapes
:���������d
�
gmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/control_dependency_1IdentityTmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/Slice_1^^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/group_deps*
T0*g
_class]
[Yloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/Slice_1*(
_output_shapes
:����������
�
Xmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_accConst* 
_output_shapes
:
��*
valueB
��*    *
dtype0
�
Zmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_acc_1EnterXmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_acc*
T0* 
_output_shapes
:
��*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
is_constant( 
�
Zmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_acc_2MergeZmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_acc_1`model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/NextIteration*
T0*"
_output_shapes
:
��: *
N
�
Ymodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/SwitchSwitchZmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_acc_2model/gradients/b_count_2*
T0*,
_output_shapes
:
��:
��
�
Vmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/AddAdd[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/Switch:1gmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/control_dependency_1*
T0* 
_output_shapes
:
��
�
`model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/NextIterationNextIterationVmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/Add*
T0* 
_output_shapes
:
��
�
Zmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_acc_3ExitYmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/Switch*
T0* 
_output_shapes
:
��
�
Emodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/ShapeShape(model/rnn/while/rnn/gru_cell/gates/split*
T0*
_output_shapes
:*
out_type0
�
Gmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape_1Shapemodel/rnn/while/Identity_2*
T0*
_output_shapes
:*
out_type0
�
[model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/f_accStack*

stack_name *X
_classN
LJloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape*
	elem_type0*
_output_shapes
:
�
^model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/RefEnterRefEnter[model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*X
_classN
LJloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape*
is_constant(
�
_model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPush	StackPush^model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/RefEnterEmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape^model/gradients/Add*
T0*
swap_memory( *
_output_shapes
:*X
_classN
LJloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape
�
gmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop/RefEnterRefEnter[model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*X
_classN
LJloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape*
is_constant(
�
^model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPopStackPopgmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop/RefEnter^model/gradients/Sub*
_output_shapes
:*X
_classN
LJloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape*
	elem_type0
�
]model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/f_acc_1Stack*

stack_name *Z
_classP
NLloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape_1*
	elem_type0*
_output_shapes
:
�
`model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/RefEnter_1RefEnter]model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*Z
_classP
NLloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape_1*
is_constant(
�
amodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPush_1	StackPush`model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/RefEnter_1Gmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape_1^model/gradients/Add*
T0*
swap_memory( *
_output_shapes
:*Z
_classP
NLloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape_1
�
imodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop_1/RefEnterRefEnter]model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*Z
_classP
NLloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape_1*
is_constant(
�
`model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop_1StackPopimodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop_1/RefEnter^model/gradients/Sub*
_output_shapes
:*Z
_classP
NLloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape_1*
	elem_type0
�
Umodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgsBroadcastGradientArgs^model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop`model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop_1*
T0*2
_output_shapes 
:���������:���������
�
Cmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mulMulgmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/control_dependency_1Bmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/StackPop*
T0*(
_output_shapes
:����������
�
Cmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/SumSumCmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mulUmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
Gmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/ReshapeReshapeCmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Sum^model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop*
T0*0
_output_shapes
:������������������*
Tshape0
�
Kmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/f_accStack*

stack_name *;
_class1
/-loc:@model/rnn/while/rnn/gru_cell/gates/split*
	elem_type0*
_output_shapes
:
�
Nmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/RefEnterRefEnterKmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*;
_class1
/-loc:@model/rnn/while/rnn/gru_cell/gates/split*
is_constant(
�
Omodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/StackPush	StackPushNmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/RefEnter(model/rnn/while/rnn/gru_cell/gates/split^model/gradients/Add*
T0*
swap_memory( *(
_output_shapes
:����������*;
_class1
/-loc:@model/rnn/while/rnn/gru_cell/gates/split
�
Wmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/StackPop/RefEnterRefEnterKmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*;
_class1
/-loc:@model/rnn/while/rnn/gru_cell/gates/split*
is_constant(
�
Nmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/StackPopStackPopWmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/StackPop/RefEnter^model/gradients/Sub*(
_output_shapes
:����������*;
_class1
/-loc:@model/rnn/while/rnn/gru_cell/gates/split*
	elem_type0
�
Emodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1MulNmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/StackPopgmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/control_dependency_1*
T0*(
_output_shapes
:����������
�
Emodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Sum_1SumEmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1Wmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
Imodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Reshape_1ReshapeEmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Sum_1`model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop_1*
T0*0
_output_shapes
:������������������*
Tshape0
�
Pmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/tuple/group_depsNoOpH^model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/ReshapeJ^model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Reshape_1
�
Xmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/tuple/control_dependencyIdentityGmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/ReshapeQ^model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/tuple/group_deps*
T0*Z
_classP
NLloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Reshape*(
_output_shapes
:����������
�
Zmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/tuple/control_dependency_1IdentityImodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Reshape_1Q^model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/tuple/group_deps*
T0*\
_classR
PNloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Reshape_1*(
_output_shapes
:����������
�
model/gradients/AddNAddNNmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/tuple/control_dependencyPmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/tuple/control_dependency_1*
T0*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Reshape*
N*(
_output_shapes
:����������
�
Jmodel/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat/f_accStack*

stack_name *E
_class;
97loc:@model/rnn/while/rnn/gru_cell/gates/split/split_dim*
	elem_type0*
_output_shapes
:
�
Mmodel/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat/RefEnterRefEnterJmodel/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*E
_class;
97loc:@model/rnn/while/rnn/gru_cell/gates/split/split_dim*
is_constant(
�
Nmodel/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat/StackPush	StackPushMmodel/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat/RefEnter2model/rnn/while/rnn/gru_cell/gates/split/split_dim^model/gradients/Add*
T0*
swap_memory( *
_output_shapes
: *E
_class;
97loc:@model/rnn/while/rnn/gru_cell/gates/split/split_dim
�
Vmodel/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat/StackPop/RefEnterRefEnterJmodel/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*E
_class;
97loc:@model/rnn/while/rnn/gru_cell/gates/split/split_dim*
is_constant(
�
Mmodel/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat/StackPopStackPopVmodel/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat/StackPop/RefEnter^model/gradients/Sub*
_output_shapes
: *E
_class;
97loc:@model/rnn/while/rnn/gru_cell/gates/split/split_dim*
	elem_type0
�
Dmodel/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concatConcatV2Xmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/tuple/control_dependencymodel/gradients/AddNMmodel/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat/StackPop*
T0*(
_output_shapes
:����������*
N*

Tidx0
�
Qmodel/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/f_accStack*

stack_name *=
_class3
1/loc:@model/rnn/while/rnn/gru_cell/gates/Sigmoid*
	elem_type0*
_output_shapes
:
�
Tmodel/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/RefEnterRefEnterQmodel/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*=
_class3
1/loc:@model/rnn/while/rnn/gru_cell/gates/Sigmoid*
is_constant(
�
Umodel/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/StackPush	StackPushTmodel/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/RefEnter*model/rnn/while/rnn/gru_cell/gates/Sigmoid^model/gradients/Add*
T0*
swap_memory( *(
_output_shapes
:����������*=
_class3
1/loc:@model/rnn/while/rnn/gru_cell/gates/Sigmoid
�
]model/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/StackPop/RefEnterRefEnterQmodel/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*=
_class3
1/loc:@model/rnn/while/rnn/gru_cell/gates/Sigmoid*
is_constant(
�
Tmodel/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/StackPopStackPop]model/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/StackPop/RefEnter^model/gradients/Sub*(
_output_shapes
:����������*=
_class3
1/loc:@model/rnn/while/rnn/gru_cell/gates/Sigmoid*
	elem_type0
�
Kmodel/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGradSigmoidGradTmodel/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/StackPopDmodel/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat*
T0*(
_output_shapes
:����������
�
Qmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/BiasAddGradBiasAddGradKmodel/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad*
T0*
data_formatNHWC*
_output_shapes	
:�
�
Vmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/group_depsNoOpL^model/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGradR^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/BiasAddGrad
�
^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/control_dependencyIdentityKmodel/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGradW^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/group_deps*
T0*^
_classT
RPloc:@model/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad*(
_output_shapes
:����������
�
`model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/control_dependency_1IdentityQmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/BiasAddGradW^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/group_deps*
T0*d
_classZ
XVloc:@model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/BiasAddGrad*
_output_shapes	
:�
�
Qmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul/EnterEnterrnn/gru_cell/gates/kernel/read*
T0* 
_output_shapes
:
��*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
is_constant(
�
Kmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMulMatMul^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/control_dependencyQmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul/Enter*
T0*(
_output_shapes
:����������*
transpose_b(*
transpose_a( 
�
Smodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/f_accStack*

stack_name *B
_class8
64loc:@model/rnn/while/rnn/gru_cell/gates/gates/concat*
	elem_type0*
_output_shapes
:
�
Vmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/RefEnterRefEnterSmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*B
_class8
64loc:@model/rnn/while/rnn/gru_cell/gates/gates/concat*
is_constant(
�
Wmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/StackPush	StackPushVmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/RefEnter/model/rnn/while/rnn/gru_cell/gates/gates/concat^model/gradients/Add*
T0*
swap_memory( *(
_output_shapes
:����������*B
_class8
64loc:@model/rnn/while/rnn/gru_cell/gates/gates/concat
�
_model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/StackPop/RefEnterRefEnterSmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*B
_class8
64loc:@model/rnn/while/rnn/gru_cell/gates/gates/concat*
is_constant(
�
Vmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/StackPopStackPop_model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/StackPop/RefEnter^model/gradients/Sub*(
_output_shapes
:����������*B
_class8
64loc:@model/rnn/while/rnn/gru_cell/gates/gates/concat*
	elem_type0
�
Mmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1MatMulVmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/StackPop^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/control_dependency*
T0* 
_output_shapes
:
��*
transpose_b( *
transpose_a(
�
Umodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/group_depsNoOpL^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMulN^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1
�
]model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/control_dependencyIdentityKmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMulV^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/group_deps*
T0*^
_classT
RPloc:@model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul*(
_output_shapes
:����������
�
_model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/control_dependency_1IdentityMmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1V^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/group_deps*
T0*`
_classV
TRloc:@model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1* 
_output_shapes
:
��
�
Qmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_accConst*
_output_shapes	
:�*
valueB�*    *
dtype0
�
Smodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_acc_1EnterQmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_acc*
T0*
_output_shapes	
:�*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
is_constant( 
�
Smodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_acc_2MergeSmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_acc_1Ymodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/NextIteration*
T0*
_output_shapes
	:�: *
N
�
Rmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/SwitchSwitchSmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_acc_2model/gradients/b_count_2*
T0*"
_output_shapes
:�:�
�
Omodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/AddAddTmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/Switch:1`model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/control_dependency_1*
T0*
_output_shapes	
:�
�
Ymodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/NextIterationNextIterationOmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/Add*
T0*
_output_shapes	
:�
�
Smodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_acc_3ExitRmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/Switch*
T0*
_output_shapes	
:�
�
Imodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/RankConst^model/gradients/Sub*
_output_shapes
: *
value	B :*
dtype0
�
Nmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/f_accStack*

stack_name *G
_class=
;9loc:@model/rnn/while/rnn/gru_cell/gates/gates/concat/axis*
	elem_type0*
_output_shapes
:
�
Qmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/RefEnterRefEnterNmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*G
_class=
;9loc:@model/rnn/while/rnn/gru_cell/gates/gates/concat/axis*
is_constant(
�
Rmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/StackPush	StackPushQmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/RefEnter4model/rnn/while/rnn/gru_cell/gates/gates/concat/axis^model/gradients/Add*
T0*
swap_memory( *
_output_shapes
: *G
_class=
;9loc:@model/rnn/while/rnn/gru_cell/gates/gates/concat/axis
�
Zmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/StackPop/RefEnterRefEnterNmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*G
_class=
;9loc:@model/rnn/while/rnn/gru_cell/gates/gates/concat/axis*
is_constant(
�
Qmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/StackPopStackPopZmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/StackPop/RefEnter^model/gradients/Sub*
_output_shapes
: *G
_class=
;9loc:@model/rnn/while/rnn/gru_cell/gates/gates/concat/axis*
	elem_type0
�
Hmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/modFloorModQmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/StackPopImodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/Rank*
T0*
_output_shapes
: 
�
Jmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ShapeShape!model/rnn/while/TensorArrayReadV3*
T0*
_output_shapes
:*
out_type0
�
Kmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ShapeNShapeN\model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPopBmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/StackPop*
T0* 
_output_shapes
::*
out_type0*
N
�
Qmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ConcatOffsetConcatOffsetHmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/modKmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ShapeNMmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ShapeN:1* 
_output_shapes
::*
N
�
Jmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/SliceSlice]model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/control_dependencyQmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ConcatOffsetKmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ShapeN*
T0*0
_output_shapes
:������������������*
Index0
�
Lmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/Slice_1Slice]model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/control_dependencySmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ConcatOffset:1Mmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ShapeN:1*
T0*0
_output_shapes
:������������������*
Index0
�
Umodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/tuple/group_depsNoOpK^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/SliceM^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/Slice_1
�
]model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/tuple/control_dependencyIdentityJmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/SliceV^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/tuple/group_deps*
T0*]
_classS
QOloc:@model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/Slice*'
_output_shapes
:���������d
�
_model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/tuple/control_dependency_1IdentityLmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/Slice_1V^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/tuple/group_deps*
T0*_
_classU
SQloc:@model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/Slice_1*(
_output_shapes
:����������
�
Pmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_accConst* 
_output_shapes
:
��*
valueB
��*    *
dtype0
�
Rmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_acc_1EnterPmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_acc*
T0* 
_output_shapes
:
��*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
is_constant( 
�
Rmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_acc_2MergeRmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_acc_1Xmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/NextIteration*
T0*"
_output_shapes
:
��: *
N
�
Qmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/SwitchSwitchRmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_acc_2model/gradients/b_count_2*
T0*,
_output_shapes
:
��:
��
�
Nmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/AddAddSmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/Switch:1_model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/control_dependency_1*
T0* 
_output_shapes
:
��
�
Xmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/NextIterationNextIterationNmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/Add*
T0* 
_output_shapes
:
��
�
Rmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_acc_3ExitQmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/Switch*
T0* 
_output_shapes
:
��
�
model/gradients/AddN_1AddNemodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/control_dependency]model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/tuple/control_dependency*
T0*e
_class[
YWloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/Slice*
N*'
_output_shapes
:���������d
�
^model/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3/EnterEntermodel/rnn/TensorArray_1*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*:
_class0
.,loc:@model/rnn/while/TensorArrayReadV3/Enter*
is_constant(
�
`model/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3/Enter_1EnterDmodel/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
: *:
_class0
.,loc:@model/rnn/while/TensorArrayReadV3/Enter*
is_constant(
�
Xmodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3TensorArrayGradV3^model/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3/Enter`model/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3/Enter_1^model/gradients/Sub*
_output_shapes

:: *:
_class0
.,loc:@model/rnn/while/TensorArrayReadV3/Enter*
sourcemodel/gradients
�
Tmodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/gradient_flowIdentity`model/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3/Enter_1Y^model/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3*
T0*:
_class0
.,loc:@model/rnn/while/TensorArrayReadV3/Enter*
_output_shapes
: 
�
`model/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/f_accStack*

stack_name *+
_class!
loc:@model/rnn/while/Identity*
	elem_type0*
_output_shapes
:
�
cmodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/RefEnterRefEnter`model/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*+
_class!
loc:@model/rnn/while/Identity*
is_constant(
�
dmodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/StackPush	StackPushcmodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/RefEntermodel/rnn/while/Identity^model/gradients/Add*
T0*
swap_memory( *
_output_shapes
: *+
_class!
loc:@model/rnn/while/Identity
�
lmodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/StackPop/RefEnterRefEnter`model/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*+
_class!
loc:@model/rnn/while/Identity*
is_constant(
�
cmodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/StackPopStackPoplmodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/StackPop/RefEnter^model/gradients/Sub*
_output_shapes
: *+
_class!
loc:@model/rnn/while/Identity*
	elem_type0
�
Zmodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV3Xmodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3cmodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/StackPopmodel/gradients/AddN_1Tmodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/gradient_flow*
T0*
_output_shapes
: 
�
model/gradients/AddN_2AddNPmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/tuple/control_dependency_1Zmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/tuple/control_dependency_1_model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/tuple/control_dependency_1*
T0*R
_classH
FDloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Reshape_1*
N*(
_output_shapes
:����������
�
Dmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/b_accConst*
_output_shapes
: *
valueB
 *    *
dtype0
�
Fmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_1EnterDmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc*
T0*
_output_shapes
: *
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
is_constant( 
�
Fmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_2MergeFmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_1Lmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/NextIteration*
T0*
_output_shapes
: : *
N
�
Emodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/SwitchSwitchFmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_2model/gradients/b_count_2*
T0*
_output_shapes
: : 
�
Bmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/AddAddGmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/Switch:1Zmodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3*
T0*
_output_shapes
: 
�
Lmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/NextIterationNextIterationBmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/Add*
T0*
_output_shapes
: 
�
Fmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3ExitEmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/Switch*
T0*
_output_shapes
: 
�
=model/gradients/model/rnn/while/Switch_2_grad_1/NextIterationNextIterationmodel/gradients/AddN_2*
T0*(
_output_shapes
:����������
�
{model/gradients/model/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGrad/TensorArrayGradV3TensorArrayGradV3model/rnn/TensorArray_1Fmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3*
_output_shapes

:: **
_class 
loc:@model/rnn/TensorArray_1*
sourcemodel/gradients
�
wmodel/gradients/model/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGrad/gradient_flowIdentityFmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3|^model/gradients/model/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGrad/TensorArrayGradV3*
T0**
_class 
loc:@model/rnn/TensorArray_1*
_output_shapes
: 
�
mmodel/gradients/model/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGatherV3TensorArrayGatherV3{model/gradients/model/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGrad/TensorArrayGradV3"model/rnn/TensorArrayUnstack/rangewmodel/gradients/model/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGrad/gradient_flow*
_output_shapes
:*
element_shape:*
dtype0
�
jmodel/gradients/model/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/group_depsNoOpG^model/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3n^model/gradients/model/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGatherV3
�
rmodel/gradients/model/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/control_dependencyIdentitymmodel/gradients/model/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGatherV3k^model/gradients/model/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/group_deps*
T0*�
_classv
trloc:@model/gradients/model/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGatherV3*+
_output_shapes
:���������d
�
tmodel/gradients/model/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/control_dependency_1IdentityFmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3k^model/gradients/model/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/group_deps*
T0*Y
_classO
MKloc:@model/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3*
_output_shapes
: 
~
6model/gradients/model/transpose_grad/InvertPermutationInvertPermutationmodel/concat*
T0*
_output_shapes
:
�
.model/gradients/model/transpose_grad/transpose	Transposermodel/gradients/model/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/control_dependency6model/gradients/model/transpose_grad/InvertPermutation*
T0*+
_output_shapes
:���������d*
Tperm0
�
6model/gradients/embeddings/embedding_lookup_grad/ShapeConst*
_output_shapes
:*&
_class
loc:@embeddings/Variable*
valueB"�: d   *
dtype0
�
5model/gradients/embeddings/embedding_lookup_grad/SizeSizeplaceholders/Placeholder*
T0*
_output_shapes
: *
out_type0
�
?model/gradients/embeddings/embedding_lookup_grad/ExpandDims/dimConst*
_output_shapes
: *
value	B : *
dtype0
�
;model/gradients/embeddings/embedding_lookup_grad/ExpandDims
ExpandDims5model/gradients/embeddings/embedding_lookup_grad/Size?model/gradients/embeddings/embedding_lookup_grad/ExpandDims/dim*
T0*
_output_shapes
:*

Tdim0
�
Dmodel/gradients/embeddings/embedding_lookup_grad/strided_slice/stackConst*
_output_shapes
:*
valueB:*
dtype0
�
Fmodel/gradients/embeddings/embedding_lookup_grad/strided_slice/stack_1Const*
_output_shapes
:*
valueB: *
dtype0
�
Fmodel/gradients/embeddings/embedding_lookup_grad/strided_slice/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
�
>model/gradients/embeddings/embedding_lookup_grad/strided_sliceStridedSlice6model/gradients/embeddings/embedding_lookup_grad/ShapeDmodel/gradients/embeddings/embedding_lookup_grad/strided_slice/stackFmodel/gradients/embeddings/embedding_lookup_grad/strided_slice/stack_1Fmodel/gradients/embeddings/embedding_lookup_grad/strided_slice/stack_2*
T0*
Index0*
new_axis_mask *

begin_mask *
ellipsis_mask *
_output_shapes
:*
shrink_axis_mask *
end_mask
~
<model/gradients/embeddings/embedding_lookup_grad/concat/axisConst*
_output_shapes
: *
value	B : *
dtype0
�
7model/gradients/embeddings/embedding_lookup_grad/concatConcatV2;model/gradients/embeddings/embedding_lookup_grad/ExpandDims>model/gradients/embeddings/embedding_lookup_grad/strided_slice<model/gradients/embeddings/embedding_lookup_grad/concat/axis*
T0*
_output_shapes
:*
N*

Tidx0
�
8model/gradients/embeddings/embedding_lookup_grad/ReshapeReshape.model/gradients/model/transpose_grad/transpose7model/gradients/embeddings/embedding_lookup_grad/concat*
T0*0
_output_shapes
:������������������*
Tshape0
�
:model/gradients/embeddings/embedding_lookup_grad/Reshape_1Reshapeplaceholders/Placeholder;model/gradients/embeddings/embedding_lookup_grad/ExpandDims*
T0*#
_output_shapes
:���������*
Tshape0
�
model/beta1_power/initial_valueConst*
_output_shapes
: *&
_class
loc:@embeddings/Variable*
valueB
 *fff?*
dtype0
�
model/beta1_power
VariableV2*
dtype0*
	container *
_output_shapes
: *
shared_name *&
_class
loc:@embeddings/Variable*
shape: 
�
model/beta1_power/AssignAssignmodel/beta1_powermodel/beta1_power/initial_value*
T0*&
_class
loc:@embeddings/Variable*
validate_shape(*
use_locking(*
_output_shapes
: 
~
model/beta1_power/readIdentitymodel/beta1_power*
T0*&
_class
loc:@embeddings/Variable*
_output_shapes
: 
�
model/beta2_power/initial_valueConst*
_output_shapes
: *&
_class
loc:@embeddings/Variable*
valueB
 *w�?*
dtype0
�
model/beta2_power
VariableV2*
dtype0*
	container *
_output_shapes
: *
shared_name *&
_class
loc:@embeddings/Variable*
shape: 
�
model/beta2_power/AssignAssignmodel/beta2_powermodel/beta2_power/initial_value*
T0*&
_class
loc:@embeddings/Variable*
validate_shape(*
use_locking(*
_output_shapes
: 
~
model/beta2_power/readIdentitymodel/beta2_power*
T0*&
_class
loc:@embeddings/Variable*
_output_shapes
: 
�
*embeddings/Variable/Adam/Initializer/zerosConst* 
_output_shapes
:
��d*&
_class
loc:@embeddings/Variable*
valueB
��d*    *
dtype0
�
embeddings/Variable/Adam
VariableV2*
dtype0*&
_class
loc:@embeddings/Variable* 
_output_shapes
:
��d*
shared_name *
shape:
��d*
	container 
�
embeddings/Variable/Adam/AssignAssignembeddings/Variable/Adam*embeddings/Variable/Adam/Initializer/zeros*
T0*&
_class
loc:@embeddings/Variable*
validate_shape(*
use_locking(* 
_output_shapes
:
��d
�
embeddings/Variable/Adam/readIdentityembeddings/Variable/Adam*
T0*&
_class
loc:@embeddings/Variable* 
_output_shapes
:
��d
�
,embeddings/Variable/Adam_1/Initializer/zerosConst* 
_output_shapes
:
��d*&
_class
loc:@embeddings/Variable*
valueB
��d*    *
dtype0
�
embeddings/Variable/Adam_1
VariableV2*
dtype0*&
_class
loc:@embeddings/Variable* 
_output_shapes
:
��d*
shared_name *
shape:
��d*
	container 
�
!embeddings/Variable/Adam_1/AssignAssignembeddings/Variable/Adam_1,embeddings/Variable/Adam_1/Initializer/zeros*
T0*&
_class
loc:@embeddings/Variable*
validate_shape(*
use_locking(* 
_output_shapes
:
��d
�
embeddings/Variable/Adam_1/readIdentityembeddings/Variable/Adam_1*
T0*&
_class
loc:@embeddings/Variable* 
_output_shapes
:
��d
�
0rnn/gru_cell/gates/kernel/Adam/Initializer/zerosConst* 
_output_shapes
:
��*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
valueB
��*    *
dtype0
�
rnn/gru_cell/gates/kernel/Adam
VariableV2*
dtype0*,
_class"
 loc:@rnn/gru_cell/gates/kernel* 
_output_shapes
:
��*
shared_name *
shape:
��*
	container 
�
%rnn/gru_cell/gates/kernel/Adam/AssignAssignrnn/gru_cell/gates/kernel/Adam0rnn/gru_cell/gates/kernel/Adam/Initializer/zeros*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
��
�
#rnn/gru_cell/gates/kernel/Adam/readIdentityrnn/gru_cell/gates/kernel/Adam*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel* 
_output_shapes
:
��
�
2rnn/gru_cell/gates/kernel/Adam_1/Initializer/zerosConst* 
_output_shapes
:
��*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
valueB
��*    *
dtype0
�
 rnn/gru_cell/gates/kernel/Adam_1
VariableV2*
dtype0*,
_class"
 loc:@rnn/gru_cell/gates/kernel* 
_output_shapes
:
��*
shared_name *
shape:
��*
	container 
�
'rnn/gru_cell/gates/kernel/Adam_1/AssignAssign rnn/gru_cell/gates/kernel/Adam_12rnn/gru_cell/gates/kernel/Adam_1/Initializer/zeros*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
��
�
%rnn/gru_cell/gates/kernel/Adam_1/readIdentity rnn/gru_cell/gates/kernel/Adam_1*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel* 
_output_shapes
:
��
�
.rnn/gru_cell/gates/bias/Adam/Initializer/zerosConst*
_output_shapes	
:�**
_class 
loc:@rnn/gru_cell/gates/bias*
valueB�*    *
dtype0
�
rnn/gru_cell/gates/bias/Adam
VariableV2*
dtype0**
_class 
loc:@rnn/gru_cell/gates/bias*
_output_shapes	
:�*
shared_name *
shape:�*
	container 
�
#rnn/gru_cell/gates/bias/Adam/AssignAssignrnn/gru_cell/gates/bias/Adam.rnn/gru_cell/gates/bias/Adam/Initializer/zeros*
T0**
_class 
loc:@rnn/gru_cell/gates/bias*
validate_shape(*
use_locking(*
_output_shapes	
:�
�
!rnn/gru_cell/gates/bias/Adam/readIdentityrnn/gru_cell/gates/bias/Adam*
T0**
_class 
loc:@rnn/gru_cell/gates/bias*
_output_shapes	
:�
�
0rnn/gru_cell/gates/bias/Adam_1/Initializer/zerosConst*
_output_shapes	
:�**
_class 
loc:@rnn/gru_cell/gates/bias*
valueB�*    *
dtype0
�
rnn/gru_cell/gates/bias/Adam_1
VariableV2*
dtype0**
_class 
loc:@rnn/gru_cell/gates/bias*
_output_shapes	
:�*
shared_name *
shape:�*
	container 
�
%rnn/gru_cell/gates/bias/Adam_1/AssignAssignrnn/gru_cell/gates/bias/Adam_10rnn/gru_cell/gates/bias/Adam_1/Initializer/zeros*
T0**
_class 
loc:@rnn/gru_cell/gates/bias*
validate_shape(*
use_locking(*
_output_shapes	
:�
�
#rnn/gru_cell/gates/bias/Adam_1/readIdentityrnn/gru_cell/gates/bias/Adam_1*
T0**
_class 
loc:@rnn/gru_cell/gates/bias*
_output_shapes	
:�
�
4rnn/gru_cell/candidate/kernel/Adam/Initializer/zerosConst* 
_output_shapes
:
��*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
valueB
��*    *
dtype0
�
"rnn/gru_cell/candidate/kernel/Adam
VariableV2*
dtype0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel* 
_output_shapes
:
��*
shared_name *
shape:
��*
	container 
�
)rnn/gru_cell/candidate/kernel/Adam/AssignAssign"rnn/gru_cell/candidate/kernel/Adam4rnn/gru_cell/candidate/kernel/Adam/Initializer/zeros*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
��
�
'rnn/gru_cell/candidate/kernel/Adam/readIdentity"rnn/gru_cell/candidate/kernel/Adam*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel* 
_output_shapes
:
��
�
6rnn/gru_cell/candidate/kernel/Adam_1/Initializer/zerosConst* 
_output_shapes
:
��*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
valueB
��*    *
dtype0
�
$rnn/gru_cell/candidate/kernel/Adam_1
VariableV2*
dtype0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel* 
_output_shapes
:
��*
shared_name *
shape:
��*
	container 
�
+rnn/gru_cell/candidate/kernel/Adam_1/AssignAssign$rnn/gru_cell/candidate/kernel/Adam_16rnn/gru_cell/candidate/kernel/Adam_1/Initializer/zeros*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
��
�
)rnn/gru_cell/candidate/kernel/Adam_1/readIdentity$rnn/gru_cell/candidate/kernel/Adam_1*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel* 
_output_shapes
:
��
�
2rnn/gru_cell/candidate/bias/Adam/Initializer/zerosConst*
_output_shapes	
:�*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
valueB�*    *
dtype0
�
 rnn/gru_cell/candidate/bias/Adam
VariableV2*
dtype0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
_output_shapes	
:�*
shared_name *
shape:�*
	container 
�
'rnn/gru_cell/candidate/bias/Adam/AssignAssign rnn/gru_cell/candidate/bias/Adam2rnn/gru_cell/candidate/bias/Adam/Initializer/zeros*
T0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
validate_shape(*
use_locking(*
_output_shapes	
:�
�
%rnn/gru_cell/candidate/bias/Adam/readIdentity rnn/gru_cell/candidate/bias/Adam*
T0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
_output_shapes	
:�
�
4rnn/gru_cell/candidate/bias/Adam_1/Initializer/zerosConst*
_output_shapes	
:�*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
valueB�*    *
dtype0
�
"rnn/gru_cell/candidate/bias/Adam_1
VariableV2*
dtype0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
_output_shapes	
:�*
shared_name *
shape:�*
	container 
�
)rnn/gru_cell/candidate/bias/Adam_1/AssignAssign"rnn/gru_cell/candidate/bias/Adam_14rnn/gru_cell/candidate/bias/Adam_1/Initializer/zeros*
T0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
validate_shape(*
use_locking(*
_output_shapes	
:�
�
'rnn/gru_cell/candidate/bias/Adam_1/readIdentity"rnn/gru_cell/candidate/bias/Adam_1*
T0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
_output_shapes	
:�
�
#dense/kernel/Adam/Initializer/zerosConst*!
_output_shapes
:���*
_class
loc:@dense/kernel* 
valueB���*    *
dtype0
�
dense/kernel/Adam
VariableV2*
dtype0*
_class
loc:@dense/kernel*!
_output_shapes
:���*
shared_name *
shape:���*
	container 
�
dense/kernel/Adam/AssignAssigndense/kernel/Adam#dense/kernel/Adam/Initializer/zeros*
T0*
_class
loc:@dense/kernel*
validate_shape(*
use_locking(*!
_output_shapes
:���
�
dense/kernel/Adam/readIdentitydense/kernel/Adam*
T0*
_class
loc:@dense/kernel*!
_output_shapes
:���
�
%dense/kernel/Adam_1/Initializer/zerosConst*!
_output_shapes
:���*
_class
loc:@dense/kernel* 
valueB���*    *
dtype0
�
dense/kernel/Adam_1
VariableV2*
dtype0*
_class
loc:@dense/kernel*!
_output_shapes
:���*
shared_name *
shape:���*
	container 
�
dense/kernel/Adam_1/AssignAssigndense/kernel/Adam_1%dense/kernel/Adam_1/Initializer/zeros*
T0*
_class
loc:@dense/kernel*
validate_shape(*
use_locking(*!
_output_shapes
:���
�
dense/kernel/Adam_1/readIdentitydense/kernel/Adam_1*
T0*
_class
loc:@dense/kernel*!
_output_shapes
:���
�
!dense/bias/Adam/Initializer/zerosConst*
_output_shapes

:��*
_class
loc:@dense/bias*
valueB��*    *
dtype0
�
dense/bias/Adam
VariableV2*
dtype0*
_class
loc:@dense/bias*
_output_shapes

:��*
shared_name *
shape:��*
	container 
�
dense/bias/Adam/AssignAssigndense/bias/Adam!dense/bias/Adam/Initializer/zeros*
T0*
_class
loc:@dense/bias*
validate_shape(*
use_locking(*
_output_shapes

:��
w
dense/bias/Adam/readIdentitydense/bias/Adam*
T0*
_class
loc:@dense/bias*
_output_shapes

:��
�
#dense/bias/Adam_1/Initializer/zerosConst*
_output_shapes

:��*
_class
loc:@dense/bias*
valueB��*    *
dtype0
�
dense/bias/Adam_1
VariableV2*
dtype0*
_class
loc:@dense/bias*
_output_shapes

:��*
shared_name *
shape:��*
	container 
�
dense/bias/Adam_1/AssignAssigndense/bias/Adam_1#dense/bias/Adam_1/Initializer/zeros*
T0*
_class
loc:@dense/bias*
validate_shape(*
use_locking(*
_output_shapes

:��
{
dense/bias/Adam_1/readIdentitydense/bias/Adam_1*
T0*
_class
loc:@dense/bias*
_output_shapes

:��
]
model/Adam/learning_rateConst*
_output_shapes
: *
valueB
 *
�#<*
dtype0
U
model/Adam/beta1Const*
_output_shapes
: *
valueB
 *fff?*
dtype0
U
model/Adam/beta2Const*
_output_shapes
: *
valueB
 *w�?*
dtype0
W
model/Adam/epsilonConst*
_output_shapes
: *
valueB
 *w�+2*
dtype0
�
,model/Adam/update_embeddings/Variable/UniqueUnique:model/gradients/embeddings/embedding_lookup_grad/Reshape_1*
T0*&
_class
loc:@embeddings/Variable*2
_output_shapes 
:���������:���������*
out_idx0
�
+model/Adam/update_embeddings/Variable/ShapeShape,model/Adam/update_embeddings/Variable/Unique*
T0*&
_class
loc:@embeddings/Variable*
out_type0*
_output_shapes
:
�
9model/Adam/update_embeddings/Variable/strided_slice/stackConst*
_output_shapes
:*&
_class
loc:@embeddings/Variable*
valueB: *
dtype0
�
;model/Adam/update_embeddings/Variable/strided_slice/stack_1Const*
_output_shapes
:*&
_class
loc:@embeddings/Variable*
valueB:*
dtype0
�
;model/Adam/update_embeddings/Variable/strided_slice/stack_2Const*
_output_shapes
:*&
_class
loc:@embeddings/Variable*
valueB:*
dtype0
�
3model/Adam/update_embeddings/Variable/strided_sliceStridedSlice+model/Adam/update_embeddings/Variable/Shape9model/Adam/update_embeddings/Variable/strided_slice/stack;model/Adam/update_embeddings/Variable/strided_slice/stack_1;model/Adam/update_embeddings/Variable/strided_slice/stack_2*
T0*
Index0*
new_axis_mask *

begin_mask *
ellipsis_mask *
shrink_axis_mask*
_output_shapes
: *&
_class
loc:@embeddings/Variable*
end_mask 
�
8model/Adam/update_embeddings/Variable/UnsortedSegmentSumUnsortedSegmentSum8model/gradients/embeddings/embedding_lookup_grad/Reshape.model/Adam/update_embeddings/Variable/Unique:13model/Adam/update_embeddings/Variable/strided_slice*
T0*&
_class
loc:@embeddings/Variable*
Tindices0*0
_output_shapes
:������������������
�
+model/Adam/update_embeddings/Variable/sub/xConst*
_output_shapes
: *&
_class
loc:@embeddings/Variable*
valueB
 *  �?*
dtype0
�
)model/Adam/update_embeddings/Variable/subSub+model/Adam/update_embeddings/Variable/sub/xmodel/beta2_power/read*
T0*&
_class
loc:@embeddings/Variable*
_output_shapes
: 
�
*model/Adam/update_embeddings/Variable/SqrtSqrt)model/Adam/update_embeddings/Variable/sub*
T0*&
_class
loc:@embeddings/Variable*
_output_shapes
: 
�
)model/Adam/update_embeddings/Variable/mulMulmodel/Adam/learning_rate*model/Adam/update_embeddings/Variable/Sqrt*
T0*&
_class
loc:@embeddings/Variable*
_output_shapes
: 
�
-model/Adam/update_embeddings/Variable/sub_1/xConst*
_output_shapes
: *&
_class
loc:@embeddings/Variable*
valueB
 *  �?*
dtype0
�
+model/Adam/update_embeddings/Variable/sub_1Sub-model/Adam/update_embeddings/Variable/sub_1/xmodel/beta1_power/read*
T0*&
_class
loc:@embeddings/Variable*
_output_shapes
: 
�
-model/Adam/update_embeddings/Variable/truedivRealDiv)model/Adam/update_embeddings/Variable/mul+model/Adam/update_embeddings/Variable/sub_1*
T0*&
_class
loc:@embeddings/Variable*
_output_shapes
: 
�
-model/Adam/update_embeddings/Variable/sub_2/xConst*
_output_shapes
: *&
_class
loc:@embeddings/Variable*
valueB
 *  �?*
dtype0
�
+model/Adam/update_embeddings/Variable/sub_2Sub-model/Adam/update_embeddings/Variable/sub_2/xmodel/Adam/beta1*
T0*&
_class
loc:@embeddings/Variable*
_output_shapes
: 
�
+model/Adam/update_embeddings/Variable/mul_1Mul8model/Adam/update_embeddings/Variable/UnsortedSegmentSum+model/Adam/update_embeddings/Variable/sub_2*
T0*&
_class
loc:@embeddings/Variable*0
_output_shapes
:������������������
�
+model/Adam/update_embeddings/Variable/mul_2Mulembeddings/Variable/Adam/readmodel/Adam/beta1*
T0*&
_class
loc:@embeddings/Variable* 
_output_shapes
:
��d
�
,model/Adam/update_embeddings/Variable/AssignAssignembeddings/Variable/Adam+model/Adam/update_embeddings/Variable/mul_2*
T0*&
_class
loc:@embeddings/Variable*
validate_shape(*
use_locking( * 
_output_shapes
:
��d
�
0model/Adam/update_embeddings/Variable/ScatterAdd
ScatterAddembeddings/Variable/Adam,model/Adam/update_embeddings/Variable/Unique+model/Adam/update_embeddings/Variable/mul_1-^model/Adam/update_embeddings/Variable/Assign*
T0*&
_class
loc:@embeddings/Variable*
Tindices0*
use_locking( * 
_output_shapes
:
��d
�
+model/Adam/update_embeddings/Variable/mul_3Mul8model/Adam/update_embeddings/Variable/UnsortedSegmentSum8model/Adam/update_embeddings/Variable/UnsortedSegmentSum*
T0*&
_class
loc:@embeddings/Variable*0
_output_shapes
:������������������
�
-model/Adam/update_embeddings/Variable/sub_3/xConst*
_output_shapes
: *&
_class
loc:@embeddings/Variable*
valueB
 *  �?*
dtype0
�
+model/Adam/update_embeddings/Variable/sub_3Sub-model/Adam/update_embeddings/Variable/sub_3/xmodel/Adam/beta2*
T0*&
_class
loc:@embeddings/Variable*
_output_shapes
: 
�
+model/Adam/update_embeddings/Variable/mul_4Mul+model/Adam/update_embeddings/Variable/mul_3+model/Adam/update_embeddings/Variable/sub_3*
T0*&
_class
loc:@embeddings/Variable*0
_output_shapes
:������������������
�
+model/Adam/update_embeddings/Variable/mul_5Mulembeddings/Variable/Adam_1/readmodel/Adam/beta2*
T0*&
_class
loc:@embeddings/Variable* 
_output_shapes
:
��d
�
.model/Adam/update_embeddings/Variable/Assign_1Assignembeddings/Variable/Adam_1+model/Adam/update_embeddings/Variable/mul_5*
T0*&
_class
loc:@embeddings/Variable*
validate_shape(*
use_locking( * 
_output_shapes
:
��d
�
2model/Adam/update_embeddings/Variable/ScatterAdd_1
ScatterAddembeddings/Variable/Adam_1,model/Adam/update_embeddings/Variable/Unique+model/Adam/update_embeddings/Variable/mul_4/^model/Adam/update_embeddings/Variable/Assign_1*
T0*&
_class
loc:@embeddings/Variable*
Tindices0*
use_locking( * 
_output_shapes
:
��d
�
,model/Adam/update_embeddings/Variable/Sqrt_1Sqrt2model/Adam/update_embeddings/Variable/ScatterAdd_1*
T0*&
_class
loc:@embeddings/Variable* 
_output_shapes
:
��d
�
+model/Adam/update_embeddings/Variable/mul_6Mul-model/Adam/update_embeddings/Variable/truediv0model/Adam/update_embeddings/Variable/ScatterAdd*
T0*&
_class
loc:@embeddings/Variable* 
_output_shapes
:
��d
�
)model/Adam/update_embeddings/Variable/addAdd,model/Adam/update_embeddings/Variable/Sqrt_1model/Adam/epsilon*
T0*&
_class
loc:@embeddings/Variable* 
_output_shapes
:
��d
�
/model/Adam/update_embeddings/Variable/truediv_1RealDiv+model/Adam/update_embeddings/Variable/mul_6)model/Adam/update_embeddings/Variable/add*
T0*&
_class
loc:@embeddings/Variable* 
_output_shapes
:
��d
�
/model/Adam/update_embeddings/Variable/AssignSub	AssignSubembeddings/Variable/model/Adam/update_embeddings/Variable/truediv_1*
T0*&
_class
loc:@embeddings/Variable*
use_locking( * 
_output_shapes
:
��d
�
0model/Adam/update_embeddings/Variable/group_depsNoOp0^model/Adam/update_embeddings/Variable/AssignSub1^model/Adam/update_embeddings/Variable/ScatterAdd3^model/Adam/update_embeddings/Variable/ScatterAdd_1*&
_class
loc:@embeddings/Variable
�
5model/Adam/update_rnn/gru_cell/gates/kernel/ApplyAdam	ApplyAdamrnn/gru_cell/gates/kernelrnn/gru_cell/gates/kernel/Adam rnn/gru_cell/gates/kernel/Adam_1model/beta1_power/readmodel/beta2_power/readmodel/Adam/learning_ratemodel/Adam/beta1model/Adam/beta2model/Adam/epsilonRmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_acc_3*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
use_locking( *
use_nesterov( * 
_output_shapes
:
��
�
3model/Adam/update_rnn/gru_cell/gates/bias/ApplyAdam	ApplyAdamrnn/gru_cell/gates/biasrnn/gru_cell/gates/bias/Adamrnn/gru_cell/gates/bias/Adam_1model/beta1_power/readmodel/beta2_power/readmodel/Adam/learning_ratemodel/Adam/beta1model/Adam/beta2model/Adam/epsilonSmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_acc_3*
T0**
_class 
loc:@rnn/gru_cell/gates/bias*
use_locking( *
use_nesterov( *
_output_shapes	
:�
�
9model/Adam/update_rnn/gru_cell/candidate/kernel/ApplyAdam	ApplyAdamrnn/gru_cell/candidate/kernel"rnn/gru_cell/candidate/kernel/Adam$rnn/gru_cell/candidate/kernel/Adam_1model/beta1_power/readmodel/beta2_power/readmodel/Adam/learning_ratemodel/Adam/beta1model/Adam/beta2model/Adam/epsilonZmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_acc_3*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
use_locking( *
use_nesterov( * 
_output_shapes
:
��
�
7model/Adam/update_rnn/gru_cell/candidate/bias/ApplyAdam	ApplyAdamrnn/gru_cell/candidate/bias rnn/gru_cell/candidate/bias/Adam"rnn/gru_cell/candidate/bias/Adam_1model/beta1_power/readmodel/beta2_power/readmodel/Adam/learning_ratemodel/Adam/beta1model/Adam/beta2model/Adam/epsilon[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_acc_3*
T0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
use_locking( *
use_nesterov( *
_output_shapes	
:�
�
(model/Adam/update_dense/kernel/ApplyAdam	ApplyAdamdense/kerneldense/kernel/Adamdense/kernel/Adam_1model/beta1_power/readmodel/beta2_power/readmodel/Adam/learning_ratemodel/Adam/beta1model/Adam/beta2model/Adam/epsilonBmodel/gradients/model/dense/MatMul_grad/tuple/control_dependency_1*
T0*
_class
loc:@dense/kernel*
use_locking( *
use_nesterov( *!
_output_shapes
:���
�
&model/Adam/update_dense/bias/ApplyAdam	ApplyAdam
dense/biasdense/bias/Adamdense/bias/Adam_1model/beta1_power/readmodel/beta2_power/readmodel/Adam/learning_ratemodel/Adam/beta1model/Adam/beta2model/Adam/epsilonCmodel/gradients/model/dense/BiasAdd_grad/tuple/control_dependency_1*
T0*
_class
loc:@dense/bias*
use_locking( *
use_nesterov( *
_output_shapes

:��
�
model/Adam/mulMulmodel/beta1_power/readmodel/Adam/beta11^model/Adam/update_embeddings/Variable/group_deps6^model/Adam/update_rnn/gru_cell/gates/kernel/ApplyAdam4^model/Adam/update_rnn/gru_cell/gates/bias/ApplyAdam:^model/Adam/update_rnn/gru_cell/candidate/kernel/ApplyAdam8^model/Adam/update_rnn/gru_cell/candidate/bias/ApplyAdam)^model/Adam/update_dense/kernel/ApplyAdam'^model/Adam/update_dense/bias/ApplyAdam*
T0*&
_class
loc:@embeddings/Variable*
_output_shapes
: 
�
model/Adam/AssignAssignmodel/beta1_powermodel/Adam/mul*
T0*&
_class
loc:@embeddings/Variable*
validate_shape(*
use_locking( *
_output_shapes
: 
�
model/Adam/mul_1Mulmodel/beta2_power/readmodel/Adam/beta21^model/Adam/update_embeddings/Variable/group_deps6^model/Adam/update_rnn/gru_cell/gates/kernel/ApplyAdam4^model/Adam/update_rnn/gru_cell/gates/bias/ApplyAdam:^model/Adam/update_rnn/gru_cell/candidate/kernel/ApplyAdam8^model/Adam/update_rnn/gru_cell/candidate/bias/ApplyAdam)^model/Adam/update_dense/kernel/ApplyAdam'^model/Adam/update_dense/bias/ApplyAdam*
T0*&
_class
loc:@embeddings/Variable*
_output_shapes
: 
�
model/Adam/Assign_1Assignmodel/beta2_powermodel/Adam/mul_1*
T0*&
_class
loc:@embeddings/Variable*
validate_shape(*
use_locking( *
_output_shapes
: 
�

model/AdamNoOp1^model/Adam/update_embeddings/Variable/group_deps6^model/Adam/update_rnn/gru_cell/gates/kernel/ApplyAdam4^model/Adam/update_rnn/gru_cell/gates/bias/ApplyAdam:^model/Adam/update_rnn/gru_cell/candidate/kernel/ApplyAdam8^model/Adam/update_rnn/gru_cell/candidate/bias/ApplyAdam)^model/Adam/update_dense/kernel/ApplyAdam'^model/Adam/update_dense/bias/ApplyAdam^model/Adam/Assign^model/Adam/Assign_1
l
model/cross_entropy/tagsConst*
_output_shapes
: *$
valueB Bmodel/cross_entropy*
dtype0
k
model/cross_entropyScalarSummarymodel/cross_entropy/tags
model/Mean*
T0*
_output_shapes
: 
^
model/Merge/MergeSummaryMergeSummarymodel/cross_entropy*
_output_shapes
: *
N
V
model/save/ConstConst*
_output_shapes
: *
valueB Bmodel*
dtype0
�
model/save/SaveV2/tensor_namesConst*
_output_shapes
:*�
value�B�B
dense/biasBdense/bias/AdamBdense/bias/Adam_1Bdense/kernelBdense/kernel/AdamBdense/kernel/Adam_1Bembeddings/VariableBembeddings/Variable/AdamBembeddings/Variable/Adam_1Bmodel/beta1_powerBmodel/beta2_powerBrnn/gru_cell/candidate/biasB rnn/gru_cell/candidate/bias/AdamB"rnn/gru_cell/candidate/bias/Adam_1Brnn/gru_cell/candidate/kernelB"rnn/gru_cell/candidate/kernel/AdamB$rnn/gru_cell/candidate/kernel/Adam_1Brnn/gru_cell/gates/biasBrnn/gru_cell/gates/bias/AdamBrnn/gru_cell/gates/bias/Adam_1Brnn/gru_cell/gates/kernelBrnn/gru_cell/gates/kernel/AdamB rnn/gru_cell/gates/kernel/Adam_1*
dtype0
�
"model/save/SaveV2/shape_and_slicesConst*
_output_shapes
:*A
value8B6B B B B B B B B B B B B B B B B B B B B B B B *
dtype0
�
model/save/SaveV2SaveV2model/save/Constmodel/save/SaveV2/tensor_names"model/save/SaveV2/shape_and_slices
dense/biasdense/bias/Adamdense/bias/Adam_1dense/kerneldense/kernel/Adamdense/kernel/Adam_1embeddings/Variableembeddings/Variable/Adamembeddings/Variable/Adam_1model/beta1_powermodel/beta2_powerrnn/gru_cell/candidate/bias rnn/gru_cell/candidate/bias/Adam"rnn/gru_cell/candidate/bias/Adam_1rnn/gru_cell/candidate/kernel"rnn/gru_cell/candidate/kernel/Adam$rnn/gru_cell/candidate/kernel/Adam_1rnn/gru_cell/gates/biasrnn/gru_cell/gates/bias/Adamrnn/gru_cell/gates/bias/Adam_1rnn/gru_cell/gates/kernelrnn/gru_cell/gates/kernel/Adam rnn/gru_cell/gates/kernel/Adam_1*%
dtypes
2
�
model/save/control_dependencyIdentitymodel/save/Const^model/save/SaveV2*
T0*#
_class
loc:@model/save/Const*
_output_shapes
: 
t
!model/save/RestoreV2/tensor_namesConst*
_output_shapes
:*
valueBB
dense/bias*
dtype0
n
%model/save/RestoreV2/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2	RestoreV2model/save/Const!model/save/RestoreV2/tensor_names%model/save/RestoreV2/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/AssignAssign
dense/biasmodel/save/RestoreV2*
T0*
_class
loc:@dense/bias*
validate_shape(*
use_locking(*
_output_shapes

:��
{
#model/save/RestoreV2_1/tensor_namesConst*
_output_shapes
:*$
valueBBdense/bias/Adam*
dtype0
p
'model/save/RestoreV2_1/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_1	RestoreV2model/save/Const#model/save/RestoreV2_1/tensor_names'model/save/RestoreV2_1/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_1Assigndense/bias/Adammodel/save/RestoreV2_1*
T0*
_class
loc:@dense/bias*
validate_shape(*
use_locking(*
_output_shapes

:��
}
#model/save/RestoreV2_2/tensor_namesConst*
_output_shapes
:*&
valueBBdense/bias/Adam_1*
dtype0
p
'model/save/RestoreV2_2/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_2	RestoreV2model/save/Const#model/save/RestoreV2_2/tensor_names'model/save/RestoreV2_2/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_2Assigndense/bias/Adam_1model/save/RestoreV2_2*
T0*
_class
loc:@dense/bias*
validate_shape(*
use_locking(*
_output_shapes

:��
x
#model/save/RestoreV2_3/tensor_namesConst*
_output_shapes
:*!
valueBBdense/kernel*
dtype0
p
'model/save/RestoreV2_3/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_3	RestoreV2model/save/Const#model/save/RestoreV2_3/tensor_names'model/save/RestoreV2_3/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_3Assigndense/kernelmodel/save/RestoreV2_3*
T0*
_class
loc:@dense/kernel*
validate_shape(*
use_locking(*!
_output_shapes
:���
}
#model/save/RestoreV2_4/tensor_namesConst*
_output_shapes
:*&
valueBBdense/kernel/Adam*
dtype0
p
'model/save/RestoreV2_4/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_4	RestoreV2model/save/Const#model/save/RestoreV2_4/tensor_names'model/save/RestoreV2_4/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_4Assigndense/kernel/Adammodel/save/RestoreV2_4*
T0*
_class
loc:@dense/kernel*
validate_shape(*
use_locking(*!
_output_shapes
:���

#model/save/RestoreV2_5/tensor_namesConst*
_output_shapes
:*(
valueBBdense/kernel/Adam_1*
dtype0
p
'model/save/RestoreV2_5/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_5	RestoreV2model/save/Const#model/save/RestoreV2_5/tensor_names'model/save/RestoreV2_5/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_5Assigndense/kernel/Adam_1model/save/RestoreV2_5*
T0*
_class
loc:@dense/kernel*
validate_shape(*
use_locking(*!
_output_shapes
:���

#model/save/RestoreV2_6/tensor_namesConst*
_output_shapes
:*(
valueBBembeddings/Variable*
dtype0
p
'model/save/RestoreV2_6/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_6	RestoreV2model/save/Const#model/save/RestoreV2_6/tensor_names'model/save/RestoreV2_6/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_6Assignembeddings/Variablemodel/save/RestoreV2_6*
T0*&
_class
loc:@embeddings/Variable*
validate_shape(*
use_locking(* 
_output_shapes
:
��d
�
#model/save/RestoreV2_7/tensor_namesConst*
_output_shapes
:*-
value$B"Bembeddings/Variable/Adam*
dtype0
p
'model/save/RestoreV2_7/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_7	RestoreV2model/save/Const#model/save/RestoreV2_7/tensor_names'model/save/RestoreV2_7/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_7Assignembeddings/Variable/Adammodel/save/RestoreV2_7*
T0*&
_class
loc:@embeddings/Variable*
validate_shape(*
use_locking(* 
_output_shapes
:
��d
�
#model/save/RestoreV2_8/tensor_namesConst*
_output_shapes
:*/
value&B$Bembeddings/Variable/Adam_1*
dtype0
p
'model/save/RestoreV2_8/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_8	RestoreV2model/save/Const#model/save/RestoreV2_8/tensor_names'model/save/RestoreV2_8/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_8Assignembeddings/Variable/Adam_1model/save/RestoreV2_8*
T0*&
_class
loc:@embeddings/Variable*
validate_shape(*
use_locking(* 
_output_shapes
:
��d
}
#model/save/RestoreV2_9/tensor_namesConst*
_output_shapes
:*&
valueBBmodel/beta1_power*
dtype0
p
'model/save/RestoreV2_9/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_9	RestoreV2model/save/Const#model/save/RestoreV2_9/tensor_names'model/save/RestoreV2_9/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_9Assignmodel/beta1_powermodel/save/RestoreV2_9*
T0*&
_class
loc:@embeddings/Variable*
validate_shape(*
use_locking(*
_output_shapes
: 
~
$model/save/RestoreV2_10/tensor_namesConst*
_output_shapes
:*&
valueBBmodel/beta2_power*
dtype0
q
(model/save/RestoreV2_10/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_10	RestoreV2model/save/Const$model/save/RestoreV2_10/tensor_names(model/save/RestoreV2_10/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_10Assignmodel/beta2_powermodel/save/RestoreV2_10*
T0*&
_class
loc:@embeddings/Variable*
validate_shape(*
use_locking(*
_output_shapes
: 
�
$model/save/RestoreV2_11/tensor_namesConst*
_output_shapes
:*0
value'B%Brnn/gru_cell/candidate/bias*
dtype0
q
(model/save/RestoreV2_11/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_11	RestoreV2model/save/Const$model/save/RestoreV2_11/tensor_names(model/save/RestoreV2_11/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_11Assignrnn/gru_cell/candidate/biasmodel/save/RestoreV2_11*
T0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
validate_shape(*
use_locking(*
_output_shapes	
:�
�
$model/save/RestoreV2_12/tensor_namesConst*
_output_shapes
:*5
value,B*B rnn/gru_cell/candidate/bias/Adam*
dtype0
q
(model/save/RestoreV2_12/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_12	RestoreV2model/save/Const$model/save/RestoreV2_12/tensor_names(model/save/RestoreV2_12/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_12Assign rnn/gru_cell/candidate/bias/Adammodel/save/RestoreV2_12*
T0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
validate_shape(*
use_locking(*
_output_shapes	
:�
�
$model/save/RestoreV2_13/tensor_namesConst*
_output_shapes
:*7
value.B,B"rnn/gru_cell/candidate/bias/Adam_1*
dtype0
q
(model/save/RestoreV2_13/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_13	RestoreV2model/save/Const$model/save/RestoreV2_13/tensor_names(model/save/RestoreV2_13/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_13Assign"rnn/gru_cell/candidate/bias/Adam_1model/save/RestoreV2_13*
T0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
validate_shape(*
use_locking(*
_output_shapes	
:�
�
$model/save/RestoreV2_14/tensor_namesConst*
_output_shapes
:*2
value)B'Brnn/gru_cell/candidate/kernel*
dtype0
q
(model/save/RestoreV2_14/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_14	RestoreV2model/save/Const$model/save/RestoreV2_14/tensor_names(model/save/RestoreV2_14/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_14Assignrnn/gru_cell/candidate/kernelmodel/save/RestoreV2_14*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
��
�
$model/save/RestoreV2_15/tensor_namesConst*
_output_shapes
:*7
value.B,B"rnn/gru_cell/candidate/kernel/Adam*
dtype0
q
(model/save/RestoreV2_15/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_15	RestoreV2model/save/Const$model/save/RestoreV2_15/tensor_names(model/save/RestoreV2_15/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_15Assign"rnn/gru_cell/candidate/kernel/Adammodel/save/RestoreV2_15*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
��
�
$model/save/RestoreV2_16/tensor_namesConst*
_output_shapes
:*9
value0B.B$rnn/gru_cell/candidate/kernel/Adam_1*
dtype0
q
(model/save/RestoreV2_16/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_16	RestoreV2model/save/Const$model/save/RestoreV2_16/tensor_names(model/save/RestoreV2_16/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_16Assign$rnn/gru_cell/candidate/kernel/Adam_1model/save/RestoreV2_16*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
��
�
$model/save/RestoreV2_17/tensor_namesConst*
_output_shapes
:*,
value#B!Brnn/gru_cell/gates/bias*
dtype0
q
(model/save/RestoreV2_17/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_17	RestoreV2model/save/Const$model/save/RestoreV2_17/tensor_names(model/save/RestoreV2_17/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_17Assignrnn/gru_cell/gates/biasmodel/save/RestoreV2_17*
T0**
_class 
loc:@rnn/gru_cell/gates/bias*
validate_shape(*
use_locking(*
_output_shapes	
:�
�
$model/save/RestoreV2_18/tensor_namesConst*
_output_shapes
:*1
value(B&Brnn/gru_cell/gates/bias/Adam*
dtype0
q
(model/save/RestoreV2_18/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_18	RestoreV2model/save/Const$model/save/RestoreV2_18/tensor_names(model/save/RestoreV2_18/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_18Assignrnn/gru_cell/gates/bias/Adammodel/save/RestoreV2_18*
T0**
_class 
loc:@rnn/gru_cell/gates/bias*
validate_shape(*
use_locking(*
_output_shapes	
:�
�
$model/save/RestoreV2_19/tensor_namesConst*
_output_shapes
:*3
value*B(Brnn/gru_cell/gates/bias/Adam_1*
dtype0
q
(model/save/RestoreV2_19/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_19	RestoreV2model/save/Const$model/save/RestoreV2_19/tensor_names(model/save/RestoreV2_19/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_19Assignrnn/gru_cell/gates/bias/Adam_1model/save/RestoreV2_19*
T0**
_class 
loc:@rnn/gru_cell/gates/bias*
validate_shape(*
use_locking(*
_output_shapes	
:�
�
$model/save/RestoreV2_20/tensor_namesConst*
_output_shapes
:*.
value%B#Brnn/gru_cell/gates/kernel*
dtype0
q
(model/save/RestoreV2_20/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_20	RestoreV2model/save/Const$model/save/RestoreV2_20/tensor_names(model/save/RestoreV2_20/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_20Assignrnn/gru_cell/gates/kernelmodel/save/RestoreV2_20*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
��
�
$model/save/RestoreV2_21/tensor_namesConst*
_output_shapes
:*3
value*B(Brnn/gru_cell/gates/kernel/Adam*
dtype0
q
(model/save/RestoreV2_21/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_21	RestoreV2model/save/Const$model/save/RestoreV2_21/tensor_names(model/save/RestoreV2_21/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_21Assignrnn/gru_cell/gates/kernel/Adammodel/save/RestoreV2_21*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
��
�
$model/save/RestoreV2_22/tensor_namesConst*
_output_shapes
:*5
value,B*B rnn/gru_cell/gates/kernel/Adam_1*
dtype0
q
(model/save/RestoreV2_22/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_22	RestoreV2model/save/Const$model/save/RestoreV2_22/tensor_names(model/save/RestoreV2_22/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_22Assign rnn/gru_cell/gates/kernel/Adam_1model/save/RestoreV2_22*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
��
�
model/save/restore_allNoOp^model/save/Assign^model/save/Assign_1^model/save/Assign_2^model/save/Assign_3^model/save/Assign_4^model/save/Assign_5^model/save/Assign_6^model/save/Assign_7^model/save/Assign_8^model/save/Assign_9^model/save/Assign_10^model/save/Assign_11^model/save/Assign_12^model/save/Assign_13^model/save/Assign_14^model/save/Assign_15^model/save/Assign_16^model/save/Assign_17^model/save/Assign_18^model/save/Assign_19^model/save/Assign_20^model/save/Assign_21^model/save/Assign_22
�
initNoOp^embeddings/Variable/Assign!^rnn/gru_cell/gates/kernel/Assign^rnn/gru_cell/gates/bias/Assign%^rnn/gru_cell/candidate/kernel/Assign#^rnn/gru_cell/candidate/bias/Assign^dense/kernel/Assign^dense/bias/Assign^model/beta1_power/Assign^model/beta2_power/Assign ^embeddings/Variable/Adam/Assign"^embeddings/Variable/Adam_1/Assign&^rnn/gru_cell/gates/kernel/Adam/Assign(^rnn/gru_cell/gates/kernel/Adam_1/Assign$^rnn/gru_cell/gates/bias/Adam/Assign&^rnn/gru_cell/gates/bias/Adam_1/Assign*^rnn/gru_cell/candidate/kernel/Adam/Assign,^rnn/gru_cell/candidate/kernel/Adam_1/Assign(^rnn/gru_cell/candidate/bias/Adam/Assign*^rnn/gru_cell/candidate/bias/Adam_1/Assign^dense/kernel/Adam/Assign^dense/kernel/Adam_1/Assign^dense/bias/Adam/Assign^dense/bias/Adam_1/Assign"����     L	%�AoZX�AJƫ
�6�6
9
Add
x"T
y"T
z"T"
Ttype:
2	
S
AddN
inputs"T*N
sum"T"
Nint(0"
Ttype:
2	��
�
	ApplyAdam
var"T�	
m"T�	
v"T�
beta1_power"T
beta2_power"T
lr"T

beta1"T

beta2"T
epsilon"T	
grad"T
out"T�"
Ttype:
2	"
use_lockingbool( "
use_nesterovbool( 
x
Assign
ref"T�

value"T

output_ref"T�"	
Ttype"
validate_shapebool("
use_lockingbool(�
p
	AssignSub
ref"T�

value"T

output_ref"T�"
Ttype:
2	"
use_lockingbool( 
{
BiasAdd

value"T	
bias"T
output"T"
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
{
BiasAddGrad
out_backprop"T
output"T"
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
R
BroadcastGradientArgs
s0"T
s1"T
r0"T
r1"T"
Ttype0:
2	
8
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype
I
ConcatOffset

concat_dim
shape*N
offset*N"
Nint(0
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype

ControlTrigger
y
Enter	
data"T
output"T"	
Ttype"

frame_namestring"
is_constantbool( "
parallel_iterationsint

)
Exit	
data"T
output"T"	
Ttype
W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
4
Fill
dims

value"T
output"T"	
Ttype
>
FloorDiv
x"T
y"T
z"T"
Ttype:
2	
7
FloorMod
x"T
y"T
z"T"
Ttype:
2	
�
Gather
params"Tparams
indices"Tindices
output"Tparams"
validate_indicesbool("
Tparamstype"
Tindicestype:
2	
?
GreaterEqual
x"T
y"T
z
"
Ttype:
2		
.
Identity

input"T
output"T"	
Ttype
:
InvertPermutation
x"T
y"T"
Ttype0:
2	
7
Less
x"T
y"T
z
"
Ttype:
2		
!
LoopCond	
input


output

o
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2
:
Maximum
x"T
y"T
z"T"
Ttype:	
2	�
�
Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
N
Merge
inputs"T*N
output"T
value_index"	
Ttype"
Nint(0
8
MergeSummary
inputs*N
summary"
Nint(0
<
Mul
x"T
y"T
z"T"
Ttype:
2	�
-
Neg
x"T
y"T"
Ttype:
	2	
2
NextIteration	
data"T
output"T"	
Ttype

NoOp
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
L
PreventGradient

input"T
output"T"	
Ttype"
messagestring 
�
Prod

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
}
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	�
`
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx"
Tidxtype0:
2	
=
RealDiv
x"T
y"T
z"T"
Ttype:
2	
�
RefEnter
data"T�
output"T�"	
Ttype"

frame_namestring"
is_constantbool( "
parallel_iterationsint

[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
l
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
i
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
M
ScalarSummary
tags
values"T
summary"
Ttype:
2		
�

ScatterAdd
ref"T�
indices"Tindices
updates"T

output_ref"T�"
Ttype:
2	"
Tindicestype:
2	"
use_lockingbool( 
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
e
ShapeN
input"T*N
output"out_type*N"
Nint(0"	
Ttype"
out_typetype0:
2	
/
Sigmoid
x"T
y"T"
Ttype:	
2
;
SigmoidGrad
x"T
y"T
z"T"
Ttype:	
2
O
Size

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
a
Slice

input"T
begin"Index
size"Index
output"T"	
Ttype"
Indextype:
2	
8
Softmax
logits"T
softmax"T"
Ttype:
2
�
#SparseSoftmaxCrossEntropyWithLogits
features"T
labels"Tlabels	
loss"T
backprop"T"
Ttype:
2"
Tlabelstype0	:
2	
[
Split
	split_dim

value"T
output"T*	num_split"
	num_splitint(0"	
Ttype
,
Sqrt
x"T
y"T"
Ttype:	
2
F
Stack
handle�"
	elem_typetype"

stack_namestring �
?
StackPop
handle�
elem"	elem_type"
	elem_typetype
V
	StackPush
handle�	
elem"T
output"T"	
Ttype"
swap_memorybool( 
�
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
5
Sub
x"T
y"T
z"T"
Ttype:
	2	
�
Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
M
Switch	
data"T
pred

output_false"T
output_true"T"	
Ttype
,
Tanh
x"T
y"T"
Ttype:	
2
8
TanhGrad
x"T
y"T
z"T"
Ttype:	
2
{
TensorArrayGatherV3

handle
indices
flow_in
value"dtype"
dtypetype"
element_shapeshape:�
`
TensorArrayGradV3

handle
flow_in
grad_handle
flow_out"
sourcestring�
Y
TensorArrayReadV3

handle	
index
flow_in
value"dtype"
dtypetype�
d
TensorArrayScatterV3

handle
indices

value"T
flow_in
flow_out"	
Ttype�
9
TensorArraySizeV3

handle
flow_in
size�
�
TensorArrayV3
size

handle
flow"
dtypetype"
element_shapeshape:"
dynamic_sizebool( "
clear_after_readbool("
tensor_array_namestring �
`
TensorArrayWriteV3

handle	
index

value"T
flow_in
flow_out"	
Ttype�
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	
P
	Transpose
x"T
perm"Tperm
y"T"	
Ttype"
Tpermtype0:
2	
P
Unique
x"T
y"T
idx"out_idx"	
Ttype"
out_idxtype0:
2	
�
UnsortedSegmentSum	
data"T
segment_ids"Tindices
num_segments
output"T"
Ttype:
2	"
Tindicestype:
2	
s

VariableV2
ref"dtype�"
shapeshape"
dtypetype"
	containerstring "
shared_namestring �
&
	ZerosLike
x"T
y"T"	
Ttype*1.2.12v1.2.0-5-g435cdfc��

{
placeholders/PlaceholderPlaceholder*'
_output_shapes
:���������*
shape:���������*
dtype0
u
placeholders/Placeholder_1Placeholder*#
_output_shapes
:���������*
shape:���������*
dtype0
u
placeholders/Placeholder_2Placeholder*#
_output_shapes
:���������*
shape:���������*
dtype0
p
embeddings/random_uniform/shapeConst*
_output_shapes
:*
valueB"�: d   *
dtype0
b
embeddings/random_uniform/minConst*
_output_shapes
: *
valueB
 *  ��*
dtype0
b
embeddings/random_uniform/maxConst*
_output_shapes
: *
valueB
 *  �?*
dtype0
�
'embeddings/random_uniform/RandomUniformRandomUniformembeddings/random_uniform/shape*
T0* 
_output_shapes
:
��d*

seed *
dtype0*
seed2 
�
embeddings/random_uniform/subSubembeddings/random_uniform/maxembeddings/random_uniform/min*
T0*
_output_shapes
: 
�
embeddings/random_uniform/mulMul'embeddings/random_uniform/RandomUniformembeddings/random_uniform/sub*
T0* 
_output_shapes
:
��d
�
embeddings/random_uniformAddembeddings/random_uniform/mulembeddings/random_uniform/min*
T0* 
_output_shapes
:
��d
�
embeddings/Variable
VariableV2* 
_output_shapes
:
��d*
	container *
shape:
��d*
dtype0*
shared_name 
�
embeddings/Variable/AssignAssignembeddings/Variableembeddings/random_uniform*
T0*&
_class
loc:@embeddings/Variable*
validate_shape(*
use_locking(* 
_output_shapes
:
��d
�
embeddings/Variable/readIdentityembeddings/Variable*
T0*&
_class
loc:@embeddings/Variable* 
_output_shapes
:
��d
�
embeddings/embedding_lookupGatherembeddings/Variable/readplaceholders/Placeholder*+
_output_shapes
:���������d*
Tparams0*
Tindices0*
validate_indices(*&
_class
loc:@embeddings/Variable
L

model/RankConst*
_output_shapes
: *
value	B :*
dtype0
S
model/range/startConst*
_output_shapes
: *
value	B :*
dtype0
S
model/range/deltaConst*
_output_shapes
: *
value	B :*
dtype0
n
model/rangeRangemodel/range/start
model/Rankmodel/range/delta*
_output_shapes
:*

Tidx0
f
model/concat/values_0Const*
_output_shapes
:*
valueB"       *
dtype0
S
model/concat/axisConst*
_output_shapes
: *
value	B : *
dtype0
�
model/concatConcatV2model/concat/values_0model/rangemodel/concat/axis*
T0*
_output_shapes
:*
N*

Tidx0
�
model/transpose	Transposeembeddings/embedding_lookupmodel/concat*
T0*+
_output_shapes
:���������d*
Tperm0
^
model/rnn/ShapeShapemodel/transpose*
T0*
_output_shapes
:*
out_type0
g
model/rnn/strided_slice/stackConst*
_output_shapes
:*
valueB:*
dtype0
i
model/rnn/strided_slice/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
i
model/rnn/strided_slice/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
�
model/rnn/strided_sliceStridedSlicemodel/rnn/Shapemodel/rnn/strided_slice/stackmodel/rnn/strided_slice/stack_1model/rnn/strided_slice/stack_2*
T0*
Index0*
new_axis_mask *

begin_mask *
ellipsis_mask *
_output_shapes
: *
shrink_axis_mask*
end_mask 
i
model/rnn/strided_slice_1/stackConst*
_output_shapes
:*
valueB:*
dtype0
k
!model/rnn/strided_slice_1/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
k
!model/rnn/strided_slice_1/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
�
model/rnn/strided_slice_1StridedSlicemodel/rnn/Shapemodel/rnn/strided_slice_1/stack!model/rnn/strided_slice_1/stack_1!model/rnn/strided_slice_1/stack_2*
T0*
Index0*
new_axis_mask *

begin_mask *
ellipsis_mask *
_output_shapes
: *
shrink_axis_mask*
end_mask 
k
)model/rnn/GRUCellZeroState/ExpandDims/dimConst*
_output_shapes
: *
value	B : *
dtype0
�
%model/rnn/GRUCellZeroState/ExpandDims
ExpandDimsmodel/rnn/strided_slice)model/rnn/GRUCellZeroState/ExpandDims/dim*
T0*
_output_shapes
:*

Tdim0
k
 model/rnn/GRUCellZeroState/ConstConst*
_output_shapes
:*
valueB:�*
dtype0
h
&model/rnn/GRUCellZeroState/concat/axisConst*
_output_shapes
: *
value	B : *
dtype0
�
!model/rnn/GRUCellZeroState/concatConcatV2%model/rnn/GRUCellZeroState/ExpandDims model/rnn/GRUCellZeroState/Const&model/rnn/GRUCellZeroState/concat/axis*
T0*
_output_shapes
:*
N*

Tidx0
m
+model/rnn/GRUCellZeroState/ExpandDims_1/dimConst*
_output_shapes
: *
value	B : *
dtype0
�
'model/rnn/GRUCellZeroState/ExpandDims_1
ExpandDimsmodel/rnn/strided_slice+model/rnn/GRUCellZeroState/ExpandDims_1/dim*
T0*
_output_shapes
:*

Tdim0
m
"model/rnn/GRUCellZeroState/Const_1Const*
_output_shapes
:*
valueB:�*
dtype0
k
&model/rnn/GRUCellZeroState/zeros/ConstConst*
_output_shapes
: *
valueB
 *    *
dtype0
�
 model/rnn/GRUCellZeroState/zerosFill!model/rnn/GRUCellZeroState/concat&model/rnn/GRUCellZeroState/zeros/Const*
T0*(
_output_shapes
:����������
`
model/rnn/Shape_1Shapemodel/transpose*
T0*
_output_shapes
:*
out_type0
i
model/rnn/strided_slice_2/stackConst*
_output_shapes
:*
valueB: *
dtype0
k
!model/rnn/strided_slice_2/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
k
!model/rnn/strided_slice_2/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
�
model/rnn/strided_slice_2StridedSlicemodel/rnn/Shape_1model/rnn/strided_slice_2/stack!model/rnn/strided_slice_2/stack_1!model/rnn/strided_slice_2/stack_2*
T0*
Index0*
new_axis_mask *

begin_mask *
ellipsis_mask *
_output_shapes
: *
shrink_axis_mask*
end_mask 
i
model/rnn/strided_slice_3/stackConst*
_output_shapes
:*
valueB:*
dtype0
k
!model/rnn/strided_slice_3/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
k
!model/rnn/strided_slice_3/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
�
model/rnn/strided_slice_3StridedSlicemodel/rnn/Shape_1model/rnn/strided_slice_3/stack!model/rnn/strided_slice_3/stack_1!model/rnn/strided_slice_3/stack_2*
T0*
Index0*
new_axis_mask *

begin_mask *
ellipsis_mask *
_output_shapes
: *
shrink_axis_mask*
end_mask 
Z
model/rnn/ExpandDims/dimConst*
_output_shapes
: *
value	B : *
dtype0
�
model/rnn/ExpandDims
ExpandDimsmodel/rnn/strided_slice_3model/rnn/ExpandDims/dim*
T0*
_output_shapes
:*

Tdim0
Z
model/rnn/ConstConst*
_output_shapes
:*
valueB:�*
dtype0
W
model/rnn/concat/axisConst*
_output_shapes
: *
value	B : *
dtype0
�
model/rnn/concatConcatV2model/rnn/ExpandDimsmodel/rnn/Constmodel/rnn/concat/axis*
T0*
_output_shapes
:*
N*

Tidx0
Z
model/rnn/zeros/ConstConst*
_output_shapes
: *
valueB
 *    *
dtype0
s
model/rnn/zerosFillmodel/rnn/concatmodel/rnn/zeros/Const*
T0*(
_output_shapes
:����������
P
model/rnn/timeConst*
_output_shapes
: *
value	B : *
dtype0
�
model/rnn/TensorArrayTensorArrayV3model/rnn/strided_slice_2*
dynamic_size( *
dtype0*
_output_shapes

:: *
element_shape:*5
tensor_array_name model/rnn/dynamic_rnn/output_0*
clear_after_read(
�
model/rnn/TensorArray_1TensorArrayV3model/rnn/strided_slice_2*
dynamic_size( *
dtype0*
_output_shapes

:: *
element_shape:*4
tensor_array_namemodel/rnn/dynamic_rnn/input_0*
clear_after_read(
q
"model/rnn/TensorArrayUnstack/ShapeShapemodel/transpose*
T0*
_output_shapes
:*
out_type0
z
0model/rnn/TensorArrayUnstack/strided_slice/stackConst*
_output_shapes
:*
valueB: *
dtype0
|
2model/rnn/TensorArrayUnstack/strided_slice/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
|
2model/rnn/TensorArrayUnstack/strided_slice/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
�
*model/rnn/TensorArrayUnstack/strided_sliceStridedSlice"model/rnn/TensorArrayUnstack/Shape0model/rnn/TensorArrayUnstack/strided_slice/stack2model/rnn/TensorArrayUnstack/strided_slice/stack_12model/rnn/TensorArrayUnstack/strided_slice/stack_2*
T0*
Index0*
new_axis_mask *

begin_mask *
ellipsis_mask *
_output_shapes
: *
shrink_axis_mask*
end_mask 
j
(model/rnn/TensorArrayUnstack/range/startConst*
_output_shapes
: *
value	B : *
dtype0
j
(model/rnn/TensorArrayUnstack/range/deltaConst*
_output_shapes
: *
value	B :*
dtype0
�
"model/rnn/TensorArrayUnstack/rangeRange(model/rnn/TensorArrayUnstack/range/start*model/rnn/TensorArrayUnstack/strided_slice(model/rnn/TensorArrayUnstack/range/delta*#
_output_shapes
:���������*

Tidx0
�
Dmodel/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3TensorArrayScatterV3model/rnn/TensorArray_1"model/rnn/TensorArrayUnstack/rangemodel/transposemodel/rnn/TensorArray_1:1*
T0*"
_class
loc:@model/transpose*
_output_shapes
: 
�
model/rnn/while/EnterEntermodel/rnn/time*
T0*
_output_shapes
: *
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
is_constant( 
�
model/rnn/while/Enter_1Entermodel/rnn/TensorArray:1*
T0*
_output_shapes
: *
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
is_constant( 
�
model/rnn/while/Enter_2Enter model/rnn/GRUCellZeroState/zeros*
T0*(
_output_shapes
:����������*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
is_constant( 
�
model/rnn/while/MergeMergemodel/rnn/while/Entermodel/rnn/while/NextIteration*
T0*
_output_shapes
: : *
N
�
model/rnn/while/Merge_1Mergemodel/rnn/while/Enter_1model/rnn/while/NextIteration_1*
T0*
_output_shapes
: : *
N
�
model/rnn/while/Merge_2Mergemodel/rnn/while/Enter_2model/rnn/while/NextIteration_2*
T0**
_output_shapes
:����������: *
N
�
model/rnn/while/Less/EnterEntermodel/rnn/strided_slice_2*
T0*
_output_shapes
: *
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
is_constant(
p
model/rnn/while/LessLessmodel/rnn/while/Mergemodel/rnn/while/Less/Enter*
T0*
_output_shapes
: 
R
model/rnn/while/LoopCondLoopCondmodel/rnn/while/Less*
_output_shapes
: 
�
model/rnn/while/SwitchSwitchmodel/rnn/while/Mergemodel/rnn/while/LoopCond*
T0*(
_class
loc:@model/rnn/while/Merge*
_output_shapes
: : 
�
model/rnn/while/Switch_1Switchmodel/rnn/while/Merge_1model/rnn/while/LoopCond*
T0**
_class 
loc:@model/rnn/while/Merge_1*
_output_shapes
: : 
�
model/rnn/while/Switch_2Switchmodel/rnn/while/Merge_2model/rnn/while/LoopCond*
T0**
_class 
loc:@model/rnn/while/Merge_2*<
_output_shapes*
(:����������:����������
_
model/rnn/while/IdentityIdentitymodel/rnn/while/Switch:1*
T0*
_output_shapes
: 
c
model/rnn/while/Identity_1Identitymodel/rnn/while/Switch_1:1*
T0*
_output_shapes
: 
u
model/rnn/while/Identity_2Identitymodel/rnn/while/Switch_2:1*
T0*(
_output_shapes
:����������
�
'model/rnn/while/TensorArrayReadV3/EnterEntermodel/rnn/TensorArray_1*
T0*
_output_shapes
:*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
is_constant(
�
)model/rnn/while/TensorArrayReadV3/Enter_1EnterDmodel/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*
T0*
_output_shapes
: *
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
is_constant(
�
!model/rnn/while/TensorArrayReadV3TensorArrayReadV3'model/rnn/while/TensorArrayReadV3/Entermodel/rnn/while/Identity)model/rnn/while/TensorArrayReadV3/Enter_1*'
_output_shapes
:���������d*
dtype0
�
:rnn/gru_cell/gates/kernel/Initializer/random_uniform/shapeConst*
_output_shapes
:*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
valueB"d     *
dtype0
�
8rnn/gru_cell/gates/kernel/Initializer/random_uniform/minConst*
_output_shapes
: *,
_class"
 loc:@rnn/gru_cell/gates/kernel*
valueB
 *|x�*
dtype0
�
8rnn/gru_cell/gates/kernel/Initializer/random_uniform/maxConst*
_output_shapes
: *,
_class"
 loc:@rnn/gru_cell/gates/kernel*
valueB
 *|x=*
dtype0
�
Brnn/gru_cell/gates/kernel/Initializer/random_uniform/RandomUniformRandomUniform:rnn/gru_cell/gates/kernel/Initializer/random_uniform/shape*
T0*
dtype0*
seed2 * 
_output_shapes
:
��*,
_class"
 loc:@rnn/gru_cell/gates/kernel*

seed 
�
8rnn/gru_cell/gates/kernel/Initializer/random_uniform/subSub8rnn/gru_cell/gates/kernel/Initializer/random_uniform/max8rnn/gru_cell/gates/kernel/Initializer/random_uniform/min*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
_output_shapes
: 
�
8rnn/gru_cell/gates/kernel/Initializer/random_uniform/mulMulBrnn/gru_cell/gates/kernel/Initializer/random_uniform/RandomUniform8rnn/gru_cell/gates/kernel/Initializer/random_uniform/sub*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel* 
_output_shapes
:
��
�
4rnn/gru_cell/gates/kernel/Initializer/random_uniformAdd8rnn/gru_cell/gates/kernel/Initializer/random_uniform/mul8rnn/gru_cell/gates/kernel/Initializer/random_uniform/min*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel* 
_output_shapes
:
��
�
rnn/gru_cell/gates/kernel
VariableV2*
dtype0*
shared_name * 
_output_shapes
:
��*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
shape:
��*
	container 
�
 rnn/gru_cell/gates/kernel/AssignAssignrnn/gru_cell/gates/kernel4rnn/gru_cell/gates/kernel/Initializer/random_uniform*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
��
p
rnn/gru_cell/gates/kernel/readIdentityrnn/gru_cell/gates/kernel*
T0* 
_output_shapes
:
��
�
4model/rnn/while/rnn/gru_cell/gates/gates/concat/axisConst^model/rnn/while/Identity*
_output_shapes
: *
value	B :*
dtype0
�
/model/rnn/while/rnn/gru_cell/gates/gates/concatConcatV2!model/rnn/while/TensorArrayReadV3model/rnn/while/Identity_24model/rnn/while/rnn/gru_cell/gates/gates/concat/axis*
T0*(
_output_shapes
:����������*
N*

Tidx0
�
5model/rnn/while/rnn/gru_cell/gates/gates/MatMul/EnterEnterrnn/gru_cell/gates/kernel/read*
T0* 
_output_shapes
:
��*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
is_constant(
�
/model/rnn/while/rnn/gru_cell/gates/gates/MatMulMatMul/model/rnn/while/rnn/gru_cell/gates/gates/concat5model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter*
T0*(
_output_shapes
:����������*
transpose_b( *
transpose_a( 
�
)rnn/gru_cell/gates/bias/Initializer/ConstConst*
_output_shapes	
:�**
_class 
loc:@rnn/gru_cell/gates/bias*
valueB�*  �?*
dtype0
�
rnn/gru_cell/gates/bias
VariableV2*
dtype0*
shared_name *
_output_shapes	
:�**
_class 
loc:@rnn/gru_cell/gates/bias*
shape:�*
	container 
�
rnn/gru_cell/gates/bias/AssignAssignrnn/gru_cell/gates/bias)rnn/gru_cell/gates/bias/Initializer/Const*
T0**
_class 
loc:@rnn/gru_cell/gates/bias*
validate_shape(*
use_locking(*
_output_shapes	
:�
g
rnn/gru_cell/gates/bias/readIdentityrnn/gru_cell/gates/bias*
T0*
_output_shapes	
:�
�
6model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/EnterEnterrnn/gru_cell/gates/bias/read*
T0*
_output_shapes	
:�*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
is_constant(
�
0model/rnn/while/rnn/gru_cell/gates/gates/BiasAddBiasAdd/model/rnn/while/rnn/gru_cell/gates/gates/MatMul6model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter*
T0*
data_formatNHWC*(
_output_shapes
:����������
�
*model/rnn/while/rnn/gru_cell/gates/SigmoidSigmoid0model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd*
T0*(
_output_shapes
:����������
�
(model/rnn/while/rnn/gru_cell/gates/ConstConst^model/rnn/while/Identity*
_output_shapes
: *
value	B :*
dtype0
�
2model/rnn/while/rnn/gru_cell/gates/split/split_dimConst^model/rnn/while/Identity*
_output_shapes
: *
value	B :*
dtype0
�
(model/rnn/while/rnn/gru_cell/gates/splitSplit2model/rnn/while/rnn/gru_cell/gates/split/split_dim*model/rnn/while/rnn/gru_cell/gates/Sigmoid*
T0*<
_output_shapes*
(:����������:����������*
	num_split
�
*model/rnn/while/rnn/gru_cell/candidate/mulMul(model/rnn/while/rnn/gru_cell/gates/splitmodel/rnn/while/Identity_2*
T0*(
_output_shapes
:����������
�
>rnn/gru_cell/candidate/kernel/Initializer/random_uniform/shapeConst*
_output_shapes
:*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
valueB"d     *
dtype0
�
<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/minConst*
_output_shapes
: *0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
valueB
 *����*
dtype0
�
<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/maxConst*
_output_shapes
: *0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
valueB
 *���=*
dtype0
�
Frnn/gru_cell/candidate/kernel/Initializer/random_uniform/RandomUniformRandomUniform>rnn/gru_cell/candidate/kernel/Initializer/random_uniform/shape*
T0*
dtype0*
seed2 * 
_output_shapes
:
��*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*

seed 
�
<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/subSub<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/max<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/min*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
_output_shapes
: 
�
<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/mulMulFrnn/gru_cell/candidate/kernel/Initializer/random_uniform/RandomUniform<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/sub*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel* 
_output_shapes
:
��
�
8rnn/gru_cell/candidate/kernel/Initializer/random_uniformAdd<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/mul<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/min*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel* 
_output_shapes
:
��
�
rnn/gru_cell/candidate/kernel
VariableV2*
dtype0*
shared_name * 
_output_shapes
:
��*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
shape:
��*
	container 
�
$rnn/gru_cell/candidate/kernel/AssignAssignrnn/gru_cell/candidate/kernel8rnn/gru_cell/candidate/kernel/Initializer/random_uniform*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
��
x
"rnn/gru_cell/candidate/kernel/readIdentityrnn/gru_cell/candidate/kernel*
T0* 
_output_shapes
:
��
�
<model/rnn/while/rnn/gru_cell/candidate/candidate/concat/axisConst^model/rnn/while/Identity*
_output_shapes
: *
value	B :*
dtype0
�
7model/rnn/while/rnn/gru_cell/candidate/candidate/concatConcatV2!model/rnn/while/TensorArrayReadV3*model/rnn/while/rnn/gru_cell/candidate/mul<model/rnn/while/rnn/gru_cell/candidate/candidate/concat/axis*
T0*(
_output_shapes
:����������*
N*

Tidx0
�
=model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/EnterEnter"rnn/gru_cell/candidate/kernel/read*
T0* 
_output_shapes
:
��*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
is_constant(
�
7model/rnn/while/rnn/gru_cell/candidate/candidate/MatMulMatMul7model/rnn/while/rnn/gru_cell/candidate/candidate/concat=model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter*
T0*(
_output_shapes
:����������*
transpose_b( *
transpose_a( 
�
-rnn/gru_cell/candidate/bias/Initializer/ConstConst*
_output_shapes	
:�*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
valueB�*    *
dtype0
�
rnn/gru_cell/candidate/bias
VariableV2*
dtype0*
shared_name *
_output_shapes	
:�*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
shape:�*
	container 
�
"rnn/gru_cell/candidate/bias/AssignAssignrnn/gru_cell/candidate/bias-rnn/gru_cell/candidate/bias/Initializer/Const*
T0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
validate_shape(*
use_locking(*
_output_shapes	
:�
o
 rnn/gru_cell/candidate/bias/readIdentityrnn/gru_cell/candidate/bias*
T0*
_output_shapes	
:�
�
>model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/EnterEnter rnn/gru_cell/candidate/bias/read*
T0*
_output_shapes	
:�*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
is_constant(
�
8model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAddBiasAdd7model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul>model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter*
T0*
data_formatNHWC*(
_output_shapes
:����������
�
+model/rnn/while/rnn/gru_cell/candidate/TanhTanh8model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd*
T0*(
_output_shapes
:����������
�
 model/rnn/while/rnn/gru_cell/mulMul*model/rnn/while/rnn/gru_cell/gates/split:1model/rnn/while/Identity_2*
T0*(
_output_shapes
:����������
�
"model/rnn/while/rnn/gru_cell/sub/xConst^model/rnn/while/Identity*
_output_shapes
: *
valueB
 *  �?*
dtype0
�
 model/rnn/while/rnn/gru_cell/subSub"model/rnn/while/rnn/gru_cell/sub/x*model/rnn/while/rnn/gru_cell/gates/split:1*
T0*(
_output_shapes
:����������
�
"model/rnn/while/rnn/gru_cell/mul_1Mul model/rnn/while/rnn/gru_cell/sub+model/rnn/while/rnn/gru_cell/candidate/Tanh*
T0*(
_output_shapes
:����������
�
 model/rnn/while/rnn/gru_cell/addAdd model/rnn/while/rnn/gru_cell/mul"model/rnn/while/rnn/gru_cell/mul_1*
T0*(
_output_shapes
:����������
�
9model/rnn/while/TensorArrayWrite/TensorArrayWriteV3/EnterEntermodel/rnn/TensorArray*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*3
_class)
'%loc:@model/rnn/while/rnn/gru_cell/add*
is_constant(
�
3model/rnn/while/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV39model/rnn/while/TensorArrayWrite/TensorArrayWriteV3/Entermodel/rnn/while/Identity model/rnn/while/rnn/gru_cell/addmodel/rnn/while/Identity_1*
T0*3
_class)
'%loc:@model/rnn/while/rnn/gru_cell/add*
_output_shapes
: 
r
model/rnn/while/add/yConst^model/rnn/while/Identity*
_output_shapes
: *
value	B :*
dtype0
l
model/rnn/while/addAddmodel/rnn/while/Identitymodel/rnn/while/add/y*
T0*
_output_shapes
: 
d
model/rnn/while/NextIterationNextIterationmodel/rnn/while/add*
T0*
_output_shapes
: 
�
model/rnn/while/NextIteration_1NextIteration3model/rnn/while/TensorArrayWrite/TensorArrayWriteV3*
T0*
_output_shapes
: 
�
model/rnn/while/NextIteration_2NextIteration model/rnn/while/rnn/gru_cell/add*
T0*(
_output_shapes
:����������
U
model/rnn/while/ExitExitmodel/rnn/while/Switch*
T0*
_output_shapes
: 
Y
model/rnn/while/Exit_1Exitmodel/rnn/while/Switch_1*
T0*
_output_shapes
: 
k
model/rnn/while/Exit_2Exitmodel/rnn/while/Switch_2*
T0*(
_output_shapes
:����������
�
,model/rnn/TensorArrayStack/TensorArraySizeV3TensorArraySizeV3model/rnn/TensorArraymodel/rnn/while/Exit_1*
_output_shapes
: *(
_class
loc:@model/rnn/TensorArray
�
&model/rnn/TensorArrayStack/range/startConst*
_output_shapes
: *(
_class
loc:@model/rnn/TensorArray*
value	B : *
dtype0
�
&model/rnn/TensorArrayStack/range/deltaConst*
_output_shapes
: *(
_class
loc:@model/rnn/TensorArray*
value	B :*
dtype0
�
 model/rnn/TensorArrayStack/rangeRange&model/rnn/TensorArrayStack/range/start,model/rnn/TensorArrayStack/TensorArraySizeV3&model/rnn/TensorArrayStack/range/delta*#
_output_shapes
:���������*(
_class
loc:@model/rnn/TensorArray*

Tidx0
�
.model/rnn/TensorArrayStack/TensorArrayGatherV3TensorArrayGatherV3model/rnn/TensorArray model/rnn/TensorArrayStack/rangemodel/rnn/while/Exit_1*,
_output_shapes
:����������*%
element_shape:����������*
dtype0*(
_class
loc:@model/rnn/TensorArray
\
model/rnn/Const_1Const*
_output_shapes
:*
valueB:�*
dtype0
P
model/rnn/RankConst*
_output_shapes
: *
value	B :*
dtype0
W
model/rnn/range/startConst*
_output_shapes
: *
value	B :*
dtype0
W
model/rnn/range/deltaConst*
_output_shapes
: *
value	B :*
dtype0
~
model/rnn/rangeRangemodel/rnn/range/startmodel/rnn/Rankmodel/rnn/range/delta*
_output_shapes
:*

Tidx0
l
model/rnn/concat_1/values_0Const*
_output_shapes
:*
valueB"       *
dtype0
Y
model/rnn/concat_1/axisConst*
_output_shapes
: *
value	B : *
dtype0
�
model/rnn/concat_1ConcatV2model/rnn/concat_1/values_0model/rnn/rangemodel/rnn/concat_1/axis*
T0*
_output_shapes
:*
N*

Tidx0
�
model/rnn/transpose	Transpose.model/rnn/TensorArrayStack/TensorArrayGatherV3model/rnn/concat_1*
T0*,
_output_shapes
:����������*
Tperm0
�
-dense/kernel/Initializer/random_uniform/shapeConst*
_output_shapes
:*
_class
loc:@dense/kernel*
valueB"   �: *
dtype0
�
+dense/kernel/Initializer/random_uniform/minConst*
_output_shapes
: *
_class
loc:@dense/kernel*
valueB
 * ��*
dtype0
�
+dense/kernel/Initializer/random_uniform/maxConst*
_output_shapes
: *
_class
loc:@dense/kernel*
valueB
 * �<*
dtype0
�
5dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform-dense/kernel/Initializer/random_uniform/shape*
T0*
dtype0*
seed2 *!
_output_shapes
:���*
_class
loc:@dense/kernel*

seed 
�
+dense/kernel/Initializer/random_uniform/subSub+dense/kernel/Initializer/random_uniform/max+dense/kernel/Initializer/random_uniform/min*
T0*
_class
loc:@dense/kernel*
_output_shapes
: 
�
+dense/kernel/Initializer/random_uniform/mulMul5dense/kernel/Initializer/random_uniform/RandomUniform+dense/kernel/Initializer/random_uniform/sub*
T0*
_class
loc:@dense/kernel*!
_output_shapes
:���
�
'dense/kernel/Initializer/random_uniformAdd+dense/kernel/Initializer/random_uniform/mul+dense/kernel/Initializer/random_uniform/min*
T0*
_class
loc:@dense/kernel*!
_output_shapes
:���
�
dense/kernel
VariableV2*
dtype0*
shared_name *!
_output_shapes
:���*
_class
loc:@dense/kernel*
shape:���*
	container 
�
dense/kernel/AssignAssigndense/kernel'dense/kernel/Initializer/random_uniform*
T0*
_class
loc:@dense/kernel*
validate_shape(*
use_locking(*!
_output_shapes
:���
x
dense/kernel/readIdentitydense/kernel*
T0*
_class
loc:@dense/kernel*!
_output_shapes
:���
�
dense/bias/Initializer/zerosConst*
_output_shapes

:��*
_class
loc:@dense/bias*
valueB��*    *
dtype0
�

dense/bias
VariableV2*
dtype0*
shared_name *
_output_shapes

:��*
_class
loc:@dense/bias*
shape:��*
	container 
�
dense/bias/AssignAssign
dense/biasdense/bias/Initializer/zeros*
T0*
_class
loc:@dense/bias*
validate_shape(*
use_locking(*
_output_shapes

:��
m
dense/bias/readIdentity
dense/bias*
T0*
_class
loc:@dense/bias*
_output_shapes

:��
�
model/dense/MatMulMatMulmodel/rnn/while/Exit_2dense/kernel/read*
T0*)
_output_shapes
:�����������*
transpose_b( *
transpose_a( 
�
model/dense/BiasAddBiasAddmodel/dense/MatMuldense/bias/read*
T0*
data_formatNHWC*)
_output_shapes
:�����������
a
model/SoftmaxSoftmaxmodel/dense/BiasAdd*
T0*)
_output_shapes
:�����������
�
/model/SparseSoftmaxCrossEntropyWithLogits/ShapeShapeplaceholders/Placeholder_1*
T0*
_output_shapes
:*
out_type0
�
Mmodel/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits#SparseSoftmaxCrossEntropyWithLogitsmodel/dense/BiasAddplaceholders/Placeholder_1*
T0*
Tlabels0*8
_output_shapes&
$:���������:�����������
U
model/ConstConst*
_output_shapes
:*
valueB: *
dtype0
�

model/MeanMeanMmodel/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogitsmodel/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
X
model/gradients/ShapeConst*
_output_shapes
: *
valueB *
dtype0
Z
model/gradients/ConstConst*
_output_shapes
: *
valueB
 *  �?*
dtype0
k
model/gradients/FillFillmodel/gradients/Shapemodel/gradients/Const*
T0*
_output_shapes
: 
Y
model/gradients/f_countConst*
_output_shapes
: *
value	B : *
dtype0
�
model/gradients/f_count_1Entermodel/gradients/f_count*
T0*
_output_shapes
: *
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
is_constant( 
�
model/gradients/MergeMergemodel/gradients/f_count_1model/gradients/NextIteration*
T0*
_output_shapes
: : *
N
t
model/gradients/SwitchSwitchmodel/gradients/Mergemodel/rnn/while/LoopCond*
T0*
_output_shapes
: : 
r
model/gradients/Add/yConst^model/rnn/while/Identity*
_output_shapes
: *
value	B :*
dtype0
l
model/gradients/AddAddmodel/gradients/Switch:1model/gradients/Add/y*
T0*
_output_shapes
: 
�
model/gradients/NextIterationNextIterationmodel/gradients/AddV^model/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPushX^model/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPush_1V^model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPushX^model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPush_1D^model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/StackPushF^model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1/StackPushX^model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPushZ^model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPush_1F^model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPushH^model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/StackPushV^model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPush`^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/StackPush[^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/StackPush^^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPush`^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPush_1`^model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPushb^model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPush_1P^model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/StackPushO^model/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat/StackPushV^model/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/StackPushX^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/StackPushS^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/StackPushe^model/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/StackPush*
T0*
_output_shapes
: 
Z
model/gradients/f_count_2Exitmodel/gradients/Switch*
T0*
_output_shapes
: 
Y
model/gradients/b_countConst*
_output_shapes
: *
value	B :*
dtype0
�
model/gradients/b_count_1Entermodel/gradients/f_count_2*
T0*
_output_shapes
: *
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
is_constant( 
�
model/gradients/Merge_1Mergemodel/gradients/b_count_1model/gradients/NextIteration_1*
T0*
_output_shapes
: : *
N
�
"model/gradients/GreaterEqual/EnterEntermodel/gradients/b_count*
T0*
_output_shapes
: *
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
is_constant(
�
model/gradients/GreaterEqualGreaterEqualmodel/gradients/Merge_1"model/gradients/GreaterEqual/Enter*
T0*
_output_shapes
: 
[
model/gradients/b_count_2LoopCondmodel/gradients/GreaterEqual*
_output_shapes
: 
y
model/gradients/Switch_1Switchmodel/gradients/Merge_1model/gradients/b_count_2*
T0*
_output_shapes
: : 
{
model/gradients/SubSubmodel/gradients/Switch_1:1"model/gradients/GreaterEqual/Enter*
T0*
_output_shapes
: 
�
model/gradients/NextIteration_1NextIterationmodel/gradients/SubS^model/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/b_sync*
T0*
_output_shapes
: 
\
model/gradients/b_count_3Exitmodel/gradients/Switch_1*
T0*
_output_shapes
: 
w
-model/gradients/model/Mean_grad/Reshape/shapeConst*
_output_shapes
:*
valueB:*
dtype0
�
'model/gradients/model/Mean_grad/ReshapeReshapemodel/gradients/Fill-model/gradients/model/Mean_grad/Reshape/shape*
T0*
_output_shapes
:*
Tshape0
�
%model/gradients/model/Mean_grad/ShapeShapeMmodel/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits*
T0*
_output_shapes
:*
out_type0
�
$model/gradients/model/Mean_grad/TileTile'model/gradients/model/Mean_grad/Reshape%model/gradients/model/Mean_grad/Shape*
T0*#
_output_shapes
:���������*

Tmultiples0
�
'model/gradients/model/Mean_grad/Shape_1ShapeMmodel/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits*
T0*
_output_shapes
:*
out_type0
j
'model/gradients/model/Mean_grad/Shape_2Const*
_output_shapes
: *
valueB *
dtype0
o
%model/gradients/model/Mean_grad/ConstConst*
_output_shapes
:*
valueB: *
dtype0
�
$model/gradients/model/Mean_grad/ProdProd'model/gradients/model/Mean_grad/Shape_1%model/gradients/model/Mean_grad/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
q
'model/gradients/model/Mean_grad/Const_1Const*
_output_shapes
:*
valueB: *
dtype0
�
&model/gradients/model/Mean_grad/Prod_1Prod'model/gradients/model/Mean_grad/Shape_2'model/gradients/model/Mean_grad/Const_1*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
k
)model/gradients/model/Mean_grad/Maximum/yConst*
_output_shapes
: *
value	B :*
dtype0
�
'model/gradients/model/Mean_grad/MaximumMaximum&model/gradients/model/Mean_grad/Prod_1)model/gradients/model/Mean_grad/Maximum/y*
T0*
_output_shapes
: 
�
(model/gradients/model/Mean_grad/floordivFloorDiv$model/gradients/model/Mean_grad/Prod'model/gradients/model/Mean_grad/Maximum*
T0*
_output_shapes
: 
�
$model/gradients/model/Mean_grad/CastCast(model/gradients/model/Mean_grad/floordiv*

SrcT0*
_output_shapes
: *

DstT0
�
'model/gradients/model/Mean_grad/truedivRealDiv$model/gradients/model/Mean_grad/Tile$model/gradients/model/Mean_grad/Cast*
T0*#
_output_shapes
:���������
�
model/gradients/zeros_like	ZerosLikeOmodel/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits:1*
T0*)
_output_shapes
:�����������
�
rmodel/gradients/model/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/PreventGradientPreventGradientOmodel/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits:1*
T0*�
message��Currently there is no way to take the second derivative of sparse_softmax_cross_entropy_with_logits due to the fused implementation's interaction with tf.gradients()*)
_output_shapes
:�����������
�
qmodel/gradients/model/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDims/dimConst*
_output_shapes
: *
valueB :
���������*
dtype0
�
mmodel/gradients/model/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDims
ExpandDims'model/gradients/model/Mean_grad/truedivqmodel/gradients/model/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDims/dim*
T0*'
_output_shapes
:���������*

Tdim0
�
fmodel/gradients/model/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mulMulmmodel/gradients/model/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDimsrmodel/gradients/model/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/PreventGradient*
T0*)
_output_shapes
:�����������
�
4model/gradients/model/dense/BiasAdd_grad/BiasAddGradBiasAddGradfmodel/gradients/model/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mul*
T0*
data_formatNHWC*
_output_shapes

:��
�
9model/gradients/model/dense/BiasAdd_grad/tuple/group_depsNoOpg^model/gradients/model/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mul5^model/gradients/model/dense/BiasAdd_grad/BiasAddGrad
�
Amodel/gradients/model/dense/BiasAdd_grad/tuple/control_dependencyIdentityfmodel/gradients/model/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mul:^model/gradients/model/dense/BiasAdd_grad/tuple/group_deps*
T0*y
_classo
mkloc:@model/gradients/model/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mul*)
_output_shapes
:�����������
�
Cmodel/gradients/model/dense/BiasAdd_grad/tuple/control_dependency_1Identity4model/gradients/model/dense/BiasAdd_grad/BiasAddGrad:^model/gradients/model/dense/BiasAdd_grad/tuple/group_deps*
T0*G
_class=
;9loc:@model/gradients/model/dense/BiasAdd_grad/BiasAddGrad*
_output_shapes

:��
�
.model/gradients/model/dense/MatMul_grad/MatMulMatMulAmodel/gradients/model/dense/BiasAdd_grad/tuple/control_dependencydense/kernel/read*
T0*(
_output_shapes
:����������*
transpose_b(*
transpose_a( 
�
0model/gradients/model/dense/MatMul_grad/MatMul_1MatMulmodel/rnn/while/Exit_2Amodel/gradients/model/dense/BiasAdd_grad/tuple/control_dependency*
T0*!
_output_shapes
:���*
transpose_b( *
transpose_a(
�
8model/gradients/model/dense/MatMul_grad/tuple/group_depsNoOp/^model/gradients/model/dense/MatMul_grad/MatMul1^model/gradients/model/dense/MatMul_grad/MatMul_1
�
@model/gradients/model/dense/MatMul_grad/tuple/control_dependencyIdentity.model/gradients/model/dense/MatMul_grad/MatMul9^model/gradients/model/dense/MatMul_grad/tuple/group_deps*
T0*A
_class7
53loc:@model/gradients/model/dense/MatMul_grad/MatMul*(
_output_shapes
:����������
�
Bmodel/gradients/model/dense/MatMul_grad/tuple/control_dependency_1Identity0model/gradients/model/dense/MatMul_grad/MatMul_19^model/gradients/model/dense/MatMul_grad/tuple/group_deps*
T0*C
_class9
75loc:@model/gradients/model/dense/MatMul_grad/MatMul_1*!
_output_shapes
:���
Z
model/gradients/zerosConst*
_output_shapes
: *
valueB
 *    *
dtype0
�
2model/gradients/model/rnn/while/Exit_2_grad/b_exitEnter@model/gradients/model/dense/MatMul_grad/tuple/control_dependency*
T0*(
_output_shapes
:����������*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
is_constant( 
�
2model/gradients/model/rnn/while/Exit_1_grad/b_exitEntermodel/gradients/zeros*
T0*
_output_shapes
: *
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
is_constant( 
�
6model/gradients/model/rnn/while/Switch_2_grad/b_switchMerge2model/gradients/model/rnn/while/Exit_2_grad/b_exit=model/gradients/model/rnn/while/Switch_2_grad_1/NextIteration*
T0**
_output_shapes
:����������: *
N
�
3model/gradients/model/rnn/while/Merge_2_grad/SwitchSwitch6model/gradients/model/rnn/while/Switch_2_grad/b_switchmodel/gradients/b_count_2*
T0*I
_class?
=;loc:@model/gradients/model/rnn/while/Switch_2_grad/b_switch*<
_output_shapes*
(:����������:����������
{
=model/gradients/model/rnn/while/Merge_2_grad/tuple/group_depsNoOp4^model/gradients/model/rnn/while/Merge_2_grad/Switch
�
Emodel/gradients/model/rnn/while/Merge_2_grad/tuple/control_dependencyIdentity3model/gradients/model/rnn/while/Merge_2_grad/Switch>^model/gradients/model/rnn/while/Merge_2_grad/tuple/group_deps*
T0*I
_class?
=;loc:@model/gradients/model/rnn/while/Switch_2_grad/b_switch*(
_output_shapes
:����������
�
Gmodel/gradients/model/rnn/while/Merge_2_grad/tuple/control_dependency_1Identity5model/gradients/model/rnn/while/Merge_2_grad/Switch:1>^model/gradients/model/rnn/while/Merge_2_grad/tuple/group_deps*
T0*I
_class?
=;loc:@model/gradients/model/rnn/while/Switch_2_grad/b_switch*(
_output_shapes
:����������
�
1model/gradients/model/rnn/while/Enter_2_grad/ExitExitEmodel/gradients/model/rnn/while/Merge_2_grad/tuple/control_dependency*
T0*(
_output_shapes
:����������
�
;model/gradients/model/rnn/GRUCellZeroState/zeros_grad/ConstConst*
_output_shapes
:*
valueB"       *
dtype0
�
9model/gradients/model/rnn/GRUCellZeroState/zeros_grad/SumSum1model/gradients/model/rnn/while/Enter_2_grad/Exit;model/gradients/model/rnn/GRUCellZeroState/zeros_grad/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
�
;model/gradients/model/rnn/while/rnn/gru_cell/add_grad/ShapeShape model/rnn/while/rnn/gru_cell/mul*
T0*
_output_shapes
:*
out_type0
�
=model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Shape_1Shape"model/rnn/while/rnn/gru_cell/mul_1*
T0*
_output_shapes
:*
out_type0
�
Qmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/f_accStack*

stack_name *N
_classD
B@loc:@model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Shape*
	elem_type0*
_output_shapes
:
�
Tmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/RefEnterRefEnterQmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*N
_classD
B@loc:@model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Shape*
is_constant(
�
Umodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPush	StackPushTmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/RefEnter;model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Shape^model/gradients/Add*
T0*
swap_memory( *N
_classD
B@loc:@model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Shape*
_output_shapes
:
�
]model/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop/RefEnterRefEnterQmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*N
_classD
B@loc:@model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Shape*
is_constant(
�
Tmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPopStackPop]model/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop/RefEnter^model/gradients/Sub*
_output_shapes
:*N
_classD
B@loc:@model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Shape*
	elem_type0
�
Rmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/b_syncControlTriggerU^model/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPopW^model/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop_1U^model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPopW^model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop_1C^model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/StackPopE^model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1/StackPopW^model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPopY^model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop_1E^model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPopG^model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/StackPopU^model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPop_^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/StackPopZ^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/StackPop]^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop_^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop_1_^model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPopa^model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop_1O^model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/StackPopN^model/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat/StackPopU^model/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/StackPopW^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/StackPopR^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/StackPopd^model/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/StackPop
�
Smodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/f_acc_1Stack*

stack_name *P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Shape_1*
	elem_type0*
_output_shapes
:
�
Vmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/RefEnter_1RefEnterSmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Shape_1*
is_constant(
�
Wmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPush_1	StackPushVmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/RefEnter_1=model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Shape_1^model/gradients/Add*
T0*
swap_memory( *P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Shape_1*
_output_shapes
:
�
_model/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop_1/RefEnterRefEnterSmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Shape_1*
is_constant(
�
Vmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop_1StackPop_model/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop_1/RefEnter^model/gradients/Sub*
_output_shapes
:*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Shape_1*
	elem_type0
�
Kmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgsBroadcastGradientArgsTmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPopVmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop_1*
T0*2
_output_shapes 
:���������:���������
�
9model/gradients/model/rnn/while/rnn/gru_cell/add_grad/SumSumGmodel/gradients/model/rnn/while/Merge_2_grad/tuple/control_dependency_1Kmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
=model/gradients/model/rnn/while/rnn/gru_cell/add_grad/ReshapeReshape9model/gradients/model/rnn/while/rnn/gru_cell/add_grad/SumTmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop*
T0*0
_output_shapes
:������������������*
Tshape0
�
;model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Sum_1SumGmodel/gradients/model/rnn/while/Merge_2_grad/tuple/control_dependency_1Mmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
?model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Reshape_1Reshape;model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Sum_1Vmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop_1*
T0*0
_output_shapes
:������������������*
Tshape0
�
Fmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/tuple/group_depsNoOp>^model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Reshape@^model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Reshape_1
�
Nmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/tuple/control_dependencyIdentity=model/gradients/model/rnn/while/rnn/gru_cell/add_grad/ReshapeG^model/gradients/model/rnn/while/rnn/gru_cell/add_grad/tuple/group_deps*
T0*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Reshape*(
_output_shapes
:����������
�
Pmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/tuple/control_dependency_1Identity?model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Reshape_1G^model/gradients/model/rnn/while/rnn/gru_cell/add_grad/tuple/group_deps*
T0*R
_classH
FDloc:@model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Reshape_1*(
_output_shapes
:����������
�
;model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/ShapeShape*model/rnn/while/rnn/gru_cell/gates/split:1*
T0*
_output_shapes
:*
out_type0
�
=model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Shape_1Shapemodel/rnn/while/Identity_2*
T0*
_output_shapes
:*
out_type0
�
Qmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/f_accStack*

stack_name *N
_classD
B@loc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Shape*
	elem_type0*
_output_shapes
:
�
Tmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/RefEnterRefEnterQmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*N
_classD
B@loc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Shape*
is_constant(
�
Umodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPush	StackPushTmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/RefEnter;model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Shape^model/gradients/Add*
T0*
swap_memory( *N
_classD
B@loc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Shape*
_output_shapes
:
�
]model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop/RefEnterRefEnterQmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*N
_classD
B@loc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Shape*
is_constant(
�
Tmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPopStackPop]model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop/RefEnter^model/gradients/Sub*
_output_shapes
:*N
_classD
B@loc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Shape*
	elem_type0
�
Smodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/f_acc_1Stack*

stack_name *P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Shape_1*
	elem_type0*
_output_shapes
:
�
Vmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/RefEnter_1RefEnterSmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Shape_1*
is_constant(
�
Wmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPush_1	StackPushVmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/RefEnter_1=model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Shape_1^model/gradients/Add*
T0*
swap_memory( *P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Shape_1*
_output_shapes
:
�
_model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop_1/RefEnterRefEnterSmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Shape_1*
is_constant(
�
Vmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop_1StackPop_model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop_1/RefEnter^model/gradients/Sub*
_output_shapes
:*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Shape_1*
	elem_type0
�
Kmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgsBroadcastGradientArgsTmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPopVmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop_1*
T0*2
_output_shapes 
:���������:���������
�
?model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/f_accStack*

stack_name *-
_class#
!loc:@model/rnn/while/Identity_2*
	elem_type0*
_output_shapes
:
�
Bmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/RefEnterRefEnter?model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*-
_class#
!loc:@model/rnn/while/Identity_2*
is_constant(
�
Cmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/StackPush	StackPushBmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/RefEntermodel/rnn/while/Identity_2^model/gradients/Add*
T0*
swap_memory( *-
_class#
!loc:@model/rnn/while/Identity_2*(
_output_shapes
:����������
�
Kmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/StackPop/RefEnterRefEnter?model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*-
_class#
!loc:@model/rnn/while/Identity_2*
is_constant(
�
Bmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/StackPopStackPopKmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/StackPop/RefEnter^model/gradients/Sub*(
_output_shapes
:����������*-
_class#
!loc:@model/rnn/while/Identity_2*
	elem_type0
�
9model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mulMulNmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/tuple/control_dependencyBmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/StackPop*
T0*(
_output_shapes
:����������
�
9model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/SumSum9model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mulKmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
=model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/ReshapeReshape9model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/SumTmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop*
T0*0
_output_shapes
:������������������*
Tshape0
�
Amodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1/f_accStack*

stack_name *;
_class1
/-loc:@model/rnn/while/rnn/gru_cell/gates/split*
	elem_type0*
_output_shapes
:
�
Dmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1/RefEnterRefEnterAmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*;
_class1
/-loc:@model/rnn/while/rnn/gru_cell/gates/split*
is_constant(
�
Emodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1/StackPush	StackPushDmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1/RefEnter*model/rnn/while/rnn/gru_cell/gates/split:1^model/gradients/Add*
T0*
swap_memory( *;
_class1
/-loc:@model/rnn/while/rnn/gru_cell/gates/split*(
_output_shapes
:����������
�
Mmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1/StackPop/RefEnterRefEnterAmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*;
_class1
/-loc:@model/rnn/while/rnn/gru_cell/gates/split*
is_constant(
�
Dmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1/StackPopStackPopMmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1/StackPop/RefEnter^model/gradients/Sub*(
_output_shapes
:����������*;
_class1
/-loc:@model/rnn/while/rnn/gru_cell/gates/split*
	elem_type0
�
;model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1MulDmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1/StackPopNmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/tuple/control_dependency*
T0*(
_output_shapes
:����������
�
;model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Sum_1Sum;model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1Mmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
?model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Reshape_1Reshape;model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Sum_1Vmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop_1*
T0*0
_output_shapes
:������������������*
Tshape0
�
Fmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/tuple/group_depsNoOp>^model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Reshape@^model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Reshape_1
�
Nmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/tuple/control_dependencyIdentity=model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/ReshapeG^model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/tuple/group_deps*
T0*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Reshape*(
_output_shapes
:����������
�
Pmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/tuple/control_dependency_1Identity?model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Reshape_1G^model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/tuple/group_deps*
T0*R
_classH
FDloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Reshape_1*(
_output_shapes
:����������
�
=model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/ShapeShape model/rnn/while/rnn/gru_cell/sub*
T0*
_output_shapes
:*
out_type0
�
?model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Shape_1Shape+model/rnn/while/rnn/gru_cell/candidate/Tanh*
T0*
_output_shapes
:*
out_type0
�
Smodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/f_accStack*

stack_name *P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Shape*
	elem_type0*
_output_shapes
:
�
Vmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/RefEnterRefEnterSmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Shape*
is_constant(
�
Wmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPush	StackPushVmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/RefEnter=model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Shape^model/gradients/Add*
T0*
swap_memory( *P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Shape*
_output_shapes
:
�
_model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop/RefEnterRefEnterSmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Shape*
is_constant(
�
Vmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPopStackPop_model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop/RefEnter^model/gradients/Sub*
_output_shapes
:*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Shape*
	elem_type0
�
Umodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/f_acc_1Stack*

stack_name *R
_classH
FDloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Shape_1*
	elem_type0*
_output_shapes
:
�
Xmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/RefEnter_1RefEnterUmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*R
_classH
FDloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Shape_1*
is_constant(
�
Ymodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPush_1	StackPushXmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/RefEnter_1?model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Shape_1^model/gradients/Add*
T0*
swap_memory( *R
_classH
FDloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Shape_1*
_output_shapes
:
�
amodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop_1/RefEnterRefEnterUmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*R
_classH
FDloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Shape_1*
is_constant(
�
Xmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop_1StackPopamodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop_1/RefEnter^model/gradients/Sub*
_output_shapes
:*R
_classH
FDloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Shape_1*
	elem_type0
�
Mmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgsBroadcastGradientArgsVmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPopXmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop_1*
T0*2
_output_shapes 
:���������:���������
�
Amodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul/f_accStack*

stack_name *>
_class4
20loc:@model/rnn/while/rnn/gru_cell/candidate/Tanh*
	elem_type0*
_output_shapes
:
�
Dmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul/RefEnterRefEnterAmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*>
_class4
20loc:@model/rnn/while/rnn/gru_cell/candidate/Tanh*
is_constant(
�
Emodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPush	StackPushDmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul/RefEnter+model/rnn/while/rnn/gru_cell/candidate/Tanh^model/gradients/Add*
T0*
swap_memory( *>
_class4
20loc:@model/rnn/while/rnn/gru_cell/candidate/Tanh*(
_output_shapes
:����������
�
Mmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPop/RefEnterRefEnterAmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*>
_class4
20loc:@model/rnn/while/rnn/gru_cell/candidate/Tanh*
is_constant(
�
Dmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPopStackPopMmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPop/RefEnter^model/gradients/Sub*(
_output_shapes
:����������*>
_class4
20loc:@model/rnn/while/rnn/gru_cell/candidate/Tanh*
	elem_type0
�
;model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mulMulPmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/tuple/control_dependency_1Dmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPop*
T0*(
_output_shapes
:����������
�
;model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/SumSum;model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mulMmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
?model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/ReshapeReshape;model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/SumVmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop*
T0*0
_output_shapes
:������������������*
Tshape0
�
Cmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/f_accStack*

stack_name *3
_class)
'%loc:@model/rnn/while/rnn/gru_cell/sub*
	elem_type0*
_output_shapes
:
�
Fmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/RefEnterRefEnterCmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*3
_class)
'%loc:@model/rnn/while/rnn/gru_cell/sub*
is_constant(
�
Gmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/StackPush	StackPushFmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/RefEnter model/rnn/while/rnn/gru_cell/sub^model/gradients/Add*
T0*
swap_memory( *3
_class)
'%loc:@model/rnn/while/rnn/gru_cell/sub*(
_output_shapes
:����������
�
Omodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/StackPop/RefEnterRefEnterCmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*3
_class)
'%loc:@model/rnn/while/rnn/gru_cell/sub*
is_constant(
�
Fmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/StackPopStackPopOmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/StackPop/RefEnter^model/gradients/Sub*(
_output_shapes
:����������*3
_class)
'%loc:@model/rnn/while/rnn/gru_cell/sub*
	elem_type0
�
=model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1MulFmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/StackPopPmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/tuple/control_dependency_1*
T0*(
_output_shapes
:����������
�
=model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Sum_1Sum=model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1Omodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
Amodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Reshape_1Reshape=model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Sum_1Xmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop_1*
T0*0
_output_shapes
:������������������*
Tshape0
�
Hmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/tuple/group_depsNoOp@^model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/ReshapeB^model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Reshape_1
�
Pmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/tuple/control_dependencyIdentity?model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/ReshapeI^model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/tuple/group_deps*
T0*R
_classH
FDloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Reshape*(
_output_shapes
:����������
�
Rmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/tuple/control_dependency_1IdentityAmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Reshape_1I^model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/tuple/group_deps*
T0*T
_classJ
HFloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Reshape_1*(
_output_shapes
:����������
�
;model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/ShapeConst^model/gradients/Sub*
_output_shapes
: *
valueB *
dtype0
�
=model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Shape_1Shape*model/rnn/while/rnn/gru_cell/gates/split:1*
T0*
_output_shapes
:*
out_type0
�
Qmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/f_accStack*

stack_name *P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Shape_1*
	elem_type0*
_output_shapes
:
�
Tmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/RefEnterRefEnterQmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Shape_1*
is_constant(
�
Umodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPush	StackPushTmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/RefEnter=model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Shape_1^model/gradients/Add*
T0*
swap_memory( *P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Shape_1*
_output_shapes
:
�
]model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPop/RefEnterRefEnterQmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Shape_1*
is_constant(
�
Tmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPopStackPop]model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPop/RefEnter^model/gradients/Sub*
_output_shapes
:*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Shape_1*
	elem_type0
�
Kmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgsBroadcastGradientArgs;model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/ShapeTmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPop*
T0*2
_output_shapes 
:���������:���������
�
9model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/SumSumPmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/tuple/control_dependencyKmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
=model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/ReshapeReshape9model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Sum;model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Shape*
T0*
_output_shapes
: *
Tshape0
�
;model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Sum_1SumPmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/tuple/control_dependencyMmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
9model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/NegNeg;model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Sum_1*
T0*
_output_shapes
:
�
?model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Reshape_1Reshape9model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/NegTmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPop*
T0*0
_output_shapes
:������������������*
Tshape0
�
Fmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/tuple/group_depsNoOp>^model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Reshape@^model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Reshape_1
�
Nmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/tuple/control_dependencyIdentity=model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/ReshapeG^model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/tuple/group_deps*
T0*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Reshape*
_output_shapes
: 
�
Pmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/tuple/control_dependency_1Identity?model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Reshape_1G^model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/tuple/group_deps*
T0*R
_classH
FDloc:@model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Reshape_1*(
_output_shapes
:����������
�
Imodel/gradients/model/rnn/while/rnn/gru_cell/candidate/Tanh_grad/TanhGradTanhGradDmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPopRmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/tuple/control_dependency_1*
T0*(
_output_shapes
:����������
�
Ymodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/BiasAddGradBiasAddGradImodel/gradients/model/rnn/while/rnn/gru_cell/candidate/Tanh_grad/TanhGrad*
T0*
data_formatNHWC*
_output_shapes	
:�
�
^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/group_depsNoOpJ^model/gradients/model/rnn/while/rnn/gru_cell/candidate/Tanh_grad/TanhGradZ^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/BiasAddGrad
�
fmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/control_dependencyIdentityImodel/gradients/model/rnn/while/rnn/gru_cell/candidate/Tanh_grad/TanhGrad_^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/group_deps*
T0*\
_classR
PNloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/Tanh_grad/TanhGrad*(
_output_shapes
:����������
�
hmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/control_dependency_1IdentityYmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/BiasAddGrad_^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/group_deps*
T0*l
_classb
`^loc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/BiasAddGrad*
_output_shapes	
:�
�
Ymodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul/EnterEnter"rnn/gru_cell/candidate/kernel/read*
T0* 
_output_shapes
:
��*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
is_constant(
�
Smodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMulMatMulfmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/control_dependencyYmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul/Enter*
T0*(
_output_shapes
:����������*
transpose_b(*
transpose_a( 
�
[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/f_accStack*

stack_name *J
_class@
><loc:@model/rnn/while/rnn/gru_cell/candidate/candidate/concat*
	elem_type0*
_output_shapes
:
�
^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/RefEnterRefEnter[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*J
_class@
><loc:@model/rnn/while/rnn/gru_cell/candidate/candidate/concat*
is_constant(
�
_model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/StackPush	StackPush^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/RefEnter7model/rnn/while/rnn/gru_cell/candidate/candidate/concat^model/gradients/Add*
T0*
swap_memory( *J
_class@
><loc:@model/rnn/while/rnn/gru_cell/candidate/candidate/concat*(
_output_shapes
:����������
�
gmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/StackPop/RefEnterRefEnter[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*J
_class@
><loc:@model/rnn/while/rnn/gru_cell/candidate/candidate/concat*
is_constant(
�
^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/StackPopStackPopgmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/StackPop/RefEnter^model/gradients/Sub*(
_output_shapes
:����������*J
_class@
><loc:@model/rnn/while/rnn/gru_cell/candidate/candidate/concat*
	elem_type0
�
Umodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1MatMul^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/StackPopfmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/control_dependency*
T0* 
_output_shapes
:
��*
transpose_b( *
transpose_a(
�
]model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/group_depsNoOpT^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMulV^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1
�
emodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/control_dependencyIdentitySmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul^^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/group_deps*
T0*f
_class\
ZXloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul*(
_output_shapes
:����������
�
gmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/control_dependency_1IdentityUmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1^^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/group_deps*
T0*h
_class^
\Zloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1* 
_output_shapes
:
��
�
Ymodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_accConst*
_output_shapes	
:�*
valueB�*    *
dtype0
�
[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_acc_1EnterYmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_acc*
T0*
_output_shapes	
:�*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
is_constant( 
�
[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_acc_2Merge[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_acc_1amodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/NextIteration*
T0*
_output_shapes
	:�: *
N
�
Zmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/SwitchSwitch[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_acc_2model/gradients/b_count_2*
T0*"
_output_shapes
:�:�
�
Wmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/AddAdd\model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/Switch:1hmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/control_dependency_1*
T0*
_output_shapes	
:�
�
amodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/NextIterationNextIterationWmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/Add*
T0*
_output_shapes	
:�
�
[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_acc_3ExitZmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/Switch*
T0*
_output_shapes	
:�
�
Qmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/RankConst^model/gradients/Sub*
_output_shapes
: *
value	B :*
dtype0
�
Vmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/f_accStack*

stack_name *O
_classE
CAloc:@model/rnn/while/rnn/gru_cell/candidate/candidate/concat/axis*
	elem_type0*
_output_shapes
:
�
Ymodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/RefEnterRefEnterVmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*O
_classE
CAloc:@model/rnn/while/rnn/gru_cell/candidate/candidate/concat/axis*
is_constant(
�
Zmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/StackPush	StackPushYmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/RefEnter<model/rnn/while/rnn/gru_cell/candidate/candidate/concat/axis^model/gradients/Add*
T0*
swap_memory( *O
_classE
CAloc:@model/rnn/while/rnn/gru_cell/candidate/candidate/concat/axis*
_output_shapes
: 
�
bmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/StackPop/RefEnterRefEnterVmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*O
_classE
CAloc:@model/rnn/while/rnn/gru_cell/candidate/candidate/concat/axis*
is_constant(
�
Ymodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/StackPopStackPopbmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/StackPop/RefEnter^model/gradients/Sub*
_output_shapes
: *O
_classE
CAloc:@model/rnn/while/rnn/gru_cell/candidate/candidate/concat/axis*
	elem_type0
�
Pmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/modFloorModYmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/StackPopQmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/Rank*
T0*
_output_shapes
: 
�
Rmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeShape!model/rnn/while/TensorArrayReadV3*
T0*
_output_shapes
:*
out_type0
�
Ymodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/f_accStack*

stack_name *4
_class*
(&loc:@model/rnn/while/TensorArrayReadV3*
	elem_type0*
_output_shapes
:
�
\model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/RefEnterRefEnterYmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*4
_class*
(&loc:@model/rnn/while/TensorArrayReadV3*
is_constant(
�
]model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPush	StackPush\model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/RefEnter!model/rnn/while/TensorArrayReadV3^model/gradients/Add*
T0*
swap_memory( *4
_class*
(&loc:@model/rnn/while/TensorArrayReadV3*'
_output_shapes
:���������d
�
emodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop/RefEnterRefEnterYmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*4
_class*
(&loc:@model/rnn/while/TensorArrayReadV3*
is_constant(
�
\model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPopStackPopemodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop/RefEnter^model/gradients/Sub*'
_output_shapes
:���������d*4
_class*
(&loc:@model/rnn/while/TensorArrayReadV3*
	elem_type0
�
[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/f_acc_1Stack*

stack_name *=
_class3
1/loc:@model/rnn/while/rnn/gru_cell/candidate/mul*
	elem_type0*
_output_shapes
:
�
^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/RefEnter_1RefEnter[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/f_acc_1*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*=
_class3
1/loc:@model/rnn/while/rnn/gru_cell/candidate/mul*
is_constant(
�
_model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPush_1	StackPush^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/RefEnter_1*model/rnn/while/rnn/gru_cell/candidate/mul^model/gradients/Add*
T0*
swap_memory( *=
_class3
1/loc:@model/rnn/while/rnn/gru_cell/candidate/mul*(
_output_shapes
:����������
�
gmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop_1/RefEnterRefEnter[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/f_acc_1*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*=
_class3
1/loc:@model/rnn/while/rnn/gru_cell/candidate/mul*
is_constant(
�
^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop_1StackPopgmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop_1/RefEnter^model/gradients/Sub*(
_output_shapes
:����������*=
_class3
1/loc:@model/rnn/while/rnn/gru_cell/candidate/mul*
	elem_type0
�
Smodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeNShapeN\model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop_1*
T0* 
_output_shapes
::*
out_type0*
N
�
Ymodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ConcatOffsetConcatOffsetPmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/modSmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeNUmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN:1* 
_output_shapes
::*
N
�
Rmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/SliceSliceemodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/control_dependencyYmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ConcatOffsetSmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN*
T0*0
_output_shapes
:������������������*
Index0
�
Tmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/Slice_1Sliceemodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/control_dependency[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ConcatOffset:1Umodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN:1*
T0*0
_output_shapes
:������������������*
Index0
�
]model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/group_depsNoOpS^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/SliceU^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/Slice_1
�
emodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/control_dependencyIdentityRmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/Slice^^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/group_deps*
T0*e
_class[
YWloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/Slice*'
_output_shapes
:���������d
�
gmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/control_dependency_1IdentityTmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/Slice_1^^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/group_deps*
T0*g
_class]
[Yloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/Slice_1*(
_output_shapes
:����������
�
Xmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_accConst* 
_output_shapes
:
��*
valueB
��*    *
dtype0
�
Zmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_acc_1EnterXmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_acc*
T0* 
_output_shapes
:
��*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
is_constant( 
�
Zmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_acc_2MergeZmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_acc_1`model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/NextIteration*
T0*"
_output_shapes
:
��: *
N
�
Ymodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/SwitchSwitchZmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_acc_2model/gradients/b_count_2*
T0*,
_output_shapes
:
��:
��
�
Vmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/AddAdd[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/Switch:1gmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/control_dependency_1*
T0* 
_output_shapes
:
��
�
`model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/NextIterationNextIterationVmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/Add*
T0* 
_output_shapes
:
��
�
Zmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_acc_3ExitYmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/Switch*
T0* 
_output_shapes
:
��
�
Emodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/ShapeShape(model/rnn/while/rnn/gru_cell/gates/split*
T0*
_output_shapes
:*
out_type0
�
Gmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape_1Shapemodel/rnn/while/Identity_2*
T0*
_output_shapes
:*
out_type0
�
[model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/f_accStack*

stack_name *X
_classN
LJloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape*
	elem_type0*
_output_shapes
:
�
^model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/RefEnterRefEnter[model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*X
_classN
LJloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape*
is_constant(
�
_model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPush	StackPush^model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/RefEnterEmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape^model/gradients/Add*
T0*
swap_memory( *X
_classN
LJloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape*
_output_shapes
:
�
gmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop/RefEnterRefEnter[model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*X
_classN
LJloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape*
is_constant(
�
^model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPopStackPopgmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop/RefEnter^model/gradients/Sub*
_output_shapes
:*X
_classN
LJloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape*
	elem_type0
�
]model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/f_acc_1Stack*

stack_name *Z
_classP
NLloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape_1*
	elem_type0*
_output_shapes
:
�
`model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/RefEnter_1RefEnter]model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*Z
_classP
NLloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape_1*
is_constant(
�
amodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPush_1	StackPush`model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/RefEnter_1Gmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape_1^model/gradients/Add*
T0*
swap_memory( *Z
_classP
NLloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape_1*
_output_shapes
:
�
imodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop_1/RefEnterRefEnter]model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*Z
_classP
NLloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape_1*
is_constant(
�
`model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop_1StackPopimodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop_1/RefEnter^model/gradients/Sub*
_output_shapes
:*Z
_classP
NLloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape_1*
	elem_type0
�
Umodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgsBroadcastGradientArgs^model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop`model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop_1*
T0*2
_output_shapes 
:���������:���������
�
Cmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mulMulgmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/control_dependency_1Bmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/StackPop*
T0*(
_output_shapes
:����������
�
Cmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/SumSumCmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mulUmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
Gmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/ReshapeReshapeCmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Sum^model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop*
T0*0
_output_shapes
:������������������*
Tshape0
�
Kmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/f_accStack*

stack_name *;
_class1
/-loc:@model/rnn/while/rnn/gru_cell/gates/split*
	elem_type0*
_output_shapes
:
�
Nmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/RefEnterRefEnterKmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*;
_class1
/-loc:@model/rnn/while/rnn/gru_cell/gates/split*
is_constant(
�
Omodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/StackPush	StackPushNmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/RefEnter(model/rnn/while/rnn/gru_cell/gates/split^model/gradients/Add*
T0*
swap_memory( *;
_class1
/-loc:@model/rnn/while/rnn/gru_cell/gates/split*(
_output_shapes
:����������
�
Wmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/StackPop/RefEnterRefEnterKmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*;
_class1
/-loc:@model/rnn/while/rnn/gru_cell/gates/split*
is_constant(
�
Nmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/StackPopStackPopWmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/StackPop/RefEnter^model/gradients/Sub*(
_output_shapes
:����������*;
_class1
/-loc:@model/rnn/while/rnn/gru_cell/gates/split*
	elem_type0
�
Emodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1MulNmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/StackPopgmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/control_dependency_1*
T0*(
_output_shapes
:����������
�
Emodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Sum_1SumEmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1Wmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
�
Imodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Reshape_1ReshapeEmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Sum_1`model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop_1*
T0*0
_output_shapes
:������������������*
Tshape0
�
Pmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/tuple/group_depsNoOpH^model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/ReshapeJ^model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Reshape_1
�
Xmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/tuple/control_dependencyIdentityGmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/ReshapeQ^model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/tuple/group_deps*
T0*Z
_classP
NLloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Reshape*(
_output_shapes
:����������
�
Zmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/tuple/control_dependency_1IdentityImodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Reshape_1Q^model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/tuple/group_deps*
T0*\
_classR
PNloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Reshape_1*(
_output_shapes
:����������
�
model/gradients/AddNAddNNmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/tuple/control_dependencyPmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/tuple/control_dependency_1*
T0*P
_classF
DBloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Reshape*
N*(
_output_shapes
:����������
�
Jmodel/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat/f_accStack*

stack_name *E
_class;
97loc:@model/rnn/while/rnn/gru_cell/gates/split/split_dim*
	elem_type0*
_output_shapes
:
�
Mmodel/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat/RefEnterRefEnterJmodel/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*E
_class;
97loc:@model/rnn/while/rnn/gru_cell/gates/split/split_dim*
is_constant(
�
Nmodel/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat/StackPush	StackPushMmodel/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat/RefEnter2model/rnn/while/rnn/gru_cell/gates/split/split_dim^model/gradients/Add*
T0*
swap_memory( *E
_class;
97loc:@model/rnn/while/rnn/gru_cell/gates/split/split_dim*
_output_shapes
: 
�
Vmodel/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat/StackPop/RefEnterRefEnterJmodel/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*E
_class;
97loc:@model/rnn/while/rnn/gru_cell/gates/split/split_dim*
is_constant(
�
Mmodel/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat/StackPopStackPopVmodel/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat/StackPop/RefEnter^model/gradients/Sub*
_output_shapes
: *E
_class;
97loc:@model/rnn/while/rnn/gru_cell/gates/split/split_dim*
	elem_type0
�
Dmodel/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concatConcatV2Xmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/tuple/control_dependencymodel/gradients/AddNMmodel/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat/StackPop*
T0*(
_output_shapes
:����������*
N*

Tidx0
�
Qmodel/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/f_accStack*

stack_name *=
_class3
1/loc:@model/rnn/while/rnn/gru_cell/gates/Sigmoid*
	elem_type0*
_output_shapes
:
�
Tmodel/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/RefEnterRefEnterQmodel/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*=
_class3
1/loc:@model/rnn/while/rnn/gru_cell/gates/Sigmoid*
is_constant(
�
Umodel/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/StackPush	StackPushTmodel/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/RefEnter*model/rnn/while/rnn/gru_cell/gates/Sigmoid^model/gradients/Add*
T0*
swap_memory( *=
_class3
1/loc:@model/rnn/while/rnn/gru_cell/gates/Sigmoid*(
_output_shapes
:����������
�
]model/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/StackPop/RefEnterRefEnterQmodel/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*=
_class3
1/loc:@model/rnn/while/rnn/gru_cell/gates/Sigmoid*
is_constant(
�
Tmodel/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/StackPopStackPop]model/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/StackPop/RefEnter^model/gradients/Sub*(
_output_shapes
:����������*=
_class3
1/loc:@model/rnn/while/rnn/gru_cell/gates/Sigmoid*
	elem_type0
�
Kmodel/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGradSigmoidGradTmodel/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/StackPopDmodel/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat*
T0*(
_output_shapes
:����������
�
Qmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/BiasAddGradBiasAddGradKmodel/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad*
T0*
data_formatNHWC*
_output_shapes	
:�
�
Vmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/group_depsNoOpL^model/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGradR^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/BiasAddGrad
�
^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/control_dependencyIdentityKmodel/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGradW^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/group_deps*
T0*^
_classT
RPloc:@model/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad*(
_output_shapes
:����������
�
`model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/control_dependency_1IdentityQmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/BiasAddGradW^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/group_deps*
T0*d
_classZ
XVloc:@model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/BiasAddGrad*
_output_shapes	
:�
�
Qmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul/EnterEnterrnn/gru_cell/gates/kernel/read*
T0* 
_output_shapes
:
��*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
is_constant(
�
Kmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMulMatMul^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/control_dependencyQmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul/Enter*
T0*(
_output_shapes
:����������*
transpose_b(*
transpose_a( 
�
Smodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/f_accStack*

stack_name *B
_class8
64loc:@model/rnn/while/rnn/gru_cell/gates/gates/concat*
	elem_type0*
_output_shapes
:
�
Vmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/RefEnterRefEnterSmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*B
_class8
64loc:@model/rnn/while/rnn/gru_cell/gates/gates/concat*
is_constant(
�
Wmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/StackPush	StackPushVmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/RefEnter/model/rnn/while/rnn/gru_cell/gates/gates/concat^model/gradients/Add*
T0*
swap_memory( *B
_class8
64loc:@model/rnn/while/rnn/gru_cell/gates/gates/concat*(
_output_shapes
:����������
�
_model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/StackPop/RefEnterRefEnterSmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*B
_class8
64loc:@model/rnn/while/rnn/gru_cell/gates/gates/concat*
is_constant(
�
Vmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/StackPopStackPop_model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/StackPop/RefEnter^model/gradients/Sub*(
_output_shapes
:����������*B
_class8
64loc:@model/rnn/while/rnn/gru_cell/gates/gates/concat*
	elem_type0
�
Mmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1MatMulVmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/StackPop^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/control_dependency*
T0* 
_output_shapes
:
��*
transpose_b( *
transpose_a(
�
Umodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/group_depsNoOpL^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMulN^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1
�
]model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/control_dependencyIdentityKmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMulV^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/group_deps*
T0*^
_classT
RPloc:@model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul*(
_output_shapes
:����������
�
_model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/control_dependency_1IdentityMmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1V^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/group_deps*
T0*`
_classV
TRloc:@model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1* 
_output_shapes
:
��
�
Qmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_accConst*
_output_shapes	
:�*
valueB�*    *
dtype0
�
Smodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_acc_1EnterQmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_acc*
T0*
_output_shapes	
:�*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
is_constant( 
�
Smodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_acc_2MergeSmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_acc_1Ymodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/NextIteration*
T0*
_output_shapes
	:�: *
N
�
Rmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/SwitchSwitchSmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_acc_2model/gradients/b_count_2*
T0*"
_output_shapes
:�:�
�
Omodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/AddAddTmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/Switch:1`model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/control_dependency_1*
T0*
_output_shapes	
:�
�
Ymodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/NextIterationNextIterationOmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/Add*
T0*
_output_shapes	
:�
�
Smodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_acc_3ExitRmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/Switch*
T0*
_output_shapes	
:�
�
Imodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/RankConst^model/gradients/Sub*
_output_shapes
: *
value	B :*
dtype0
�
Nmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/f_accStack*

stack_name *G
_class=
;9loc:@model/rnn/while/rnn/gru_cell/gates/gates/concat/axis*
	elem_type0*
_output_shapes
:
�
Qmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/RefEnterRefEnterNmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*G
_class=
;9loc:@model/rnn/while/rnn/gru_cell/gates/gates/concat/axis*
is_constant(
�
Rmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/StackPush	StackPushQmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/RefEnter4model/rnn/while/rnn/gru_cell/gates/gates/concat/axis^model/gradients/Add*
T0*
swap_memory( *G
_class=
;9loc:@model/rnn/while/rnn/gru_cell/gates/gates/concat/axis*
_output_shapes
: 
�
Zmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/StackPop/RefEnterRefEnterNmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*G
_class=
;9loc:@model/rnn/while/rnn/gru_cell/gates/gates/concat/axis*
is_constant(
�
Qmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/StackPopStackPopZmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/StackPop/RefEnter^model/gradients/Sub*
_output_shapes
: *G
_class=
;9loc:@model/rnn/while/rnn/gru_cell/gates/gates/concat/axis*
	elem_type0
�
Hmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/modFloorModQmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/StackPopImodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/Rank*
T0*
_output_shapes
: 
�
Jmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ShapeShape!model/rnn/while/TensorArrayReadV3*
T0*
_output_shapes
:*
out_type0
�
Kmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ShapeNShapeN\model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPopBmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/StackPop*
T0* 
_output_shapes
::*
out_type0*
N
�
Qmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ConcatOffsetConcatOffsetHmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/modKmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ShapeNMmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ShapeN:1* 
_output_shapes
::*
N
�
Jmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/SliceSlice]model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/control_dependencyQmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ConcatOffsetKmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ShapeN*
T0*0
_output_shapes
:������������������*
Index0
�
Lmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/Slice_1Slice]model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/control_dependencySmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ConcatOffset:1Mmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ShapeN:1*
T0*0
_output_shapes
:������������������*
Index0
�
Umodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/tuple/group_depsNoOpK^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/SliceM^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/Slice_1
�
]model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/tuple/control_dependencyIdentityJmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/SliceV^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/tuple/group_deps*
T0*]
_classS
QOloc:@model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/Slice*'
_output_shapes
:���������d
�
_model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/tuple/control_dependency_1IdentityLmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/Slice_1V^model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/tuple/group_deps*
T0*_
_classU
SQloc:@model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/Slice_1*(
_output_shapes
:����������
�
Pmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_accConst* 
_output_shapes
:
��*
valueB
��*    *
dtype0
�
Rmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_acc_1EnterPmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_acc*
T0* 
_output_shapes
:
��*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
is_constant( 
�
Rmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_acc_2MergeRmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_acc_1Xmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/NextIteration*
T0*"
_output_shapes
:
��: *
N
�
Qmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/SwitchSwitchRmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_acc_2model/gradients/b_count_2*
T0*,
_output_shapes
:
��:
��
�
Nmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/AddAddSmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/Switch:1_model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/control_dependency_1*
T0* 
_output_shapes
:
��
�
Xmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/NextIterationNextIterationNmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/Add*
T0* 
_output_shapes
:
��
�
Rmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_acc_3ExitQmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/Switch*
T0* 
_output_shapes
:
��
�
model/gradients/AddN_1AddNemodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/control_dependency]model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/tuple/control_dependency*
T0*e
_class[
YWloc:@model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/Slice*
N*'
_output_shapes
:���������d
�
^model/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3/EnterEntermodel/rnn/TensorArray_1*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*:
_class0
.,loc:@model/rnn/while/TensorArrayReadV3/Enter*
is_constant(
�
`model/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3/Enter_1EnterDmodel/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
: *:
_class0
.,loc:@model/rnn/while/TensorArrayReadV3/Enter*
is_constant(
�
Xmodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3TensorArrayGradV3^model/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3/Enter`model/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3/Enter_1^model/gradients/Sub*
_output_shapes

:: *:
_class0
.,loc:@model/rnn/while/TensorArrayReadV3/Enter*
sourcemodel/gradients
�
Tmodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/gradient_flowIdentity`model/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3/Enter_1Y^model/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3*
T0*:
_class0
.,loc:@model/rnn/while/TensorArrayReadV3/Enter*
_output_shapes
: 
�
`model/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/f_accStack*

stack_name *+
_class!
loc:@model/rnn/while/Identity*
	elem_type0*
_output_shapes
:
�
cmodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/RefEnterRefEnter`model/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/f_acc*
T0*
parallel_iterations *0

frame_name" model/rnn/while/model/rnn/while/*
_output_shapes
:*+
_class!
loc:@model/rnn/while/Identity*
is_constant(
�
dmodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/StackPush	StackPushcmodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/RefEntermodel/rnn/while/Identity^model/gradients/Add*
T0*
swap_memory( *+
_class!
loc:@model/rnn/while/Identity*
_output_shapes
: 
�
lmodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/StackPop/RefEnterRefEnter`model/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/f_acc*
T0*
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
_output_shapes
:*+
_class!
loc:@model/rnn/while/Identity*
is_constant(
�
cmodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/StackPopStackPoplmodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/StackPop/RefEnter^model/gradients/Sub*
_output_shapes
: *+
_class!
loc:@model/rnn/while/Identity*
	elem_type0
�
Zmodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV3Xmodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3cmodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/StackPopmodel/gradients/AddN_1Tmodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/gradient_flow*
T0*
_output_shapes
: 
�
model/gradients/AddN_2AddNPmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/tuple/control_dependency_1Zmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/tuple/control_dependency_1_model/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/tuple/control_dependency_1*
T0*R
_classH
FDloc:@model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Reshape_1*
N*(
_output_shapes
:����������
�
Dmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/b_accConst*
_output_shapes
: *
valueB
 *    *
dtype0
�
Fmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_1EnterDmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc*
T0*
_output_shapes
: *
parallel_iterations *@

frame_name20model/gradients/model/rnn/while/model/rnn/while/*
is_constant( 
�
Fmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_2MergeFmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_1Lmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/NextIteration*
T0*
_output_shapes
: : *
N
�
Emodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/SwitchSwitchFmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_2model/gradients/b_count_2*
T0*
_output_shapes
: : 
�
Bmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/AddAddGmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/Switch:1Zmodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3*
T0*
_output_shapes
: 
�
Lmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/NextIterationNextIterationBmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/Add*
T0*
_output_shapes
: 
�
Fmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3ExitEmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/Switch*
T0*
_output_shapes
: 
�
=model/gradients/model/rnn/while/Switch_2_grad_1/NextIterationNextIterationmodel/gradients/AddN_2*
T0*(
_output_shapes
:����������
�
{model/gradients/model/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGrad/TensorArrayGradV3TensorArrayGradV3model/rnn/TensorArray_1Fmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3*
_output_shapes

:: **
_class 
loc:@model/rnn/TensorArray_1*
sourcemodel/gradients
�
wmodel/gradients/model/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGrad/gradient_flowIdentityFmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3|^model/gradients/model/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGrad/TensorArrayGradV3*
T0**
_class 
loc:@model/rnn/TensorArray_1*
_output_shapes
: 
�
mmodel/gradients/model/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGatherV3TensorArrayGatherV3{model/gradients/model/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGrad/TensorArrayGradV3"model/rnn/TensorArrayUnstack/rangewmodel/gradients/model/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGrad/gradient_flow*
_output_shapes
:*
element_shape:*
dtype0
�
jmodel/gradients/model/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/group_depsNoOpG^model/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3n^model/gradients/model/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGatherV3
�
rmodel/gradients/model/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/control_dependencyIdentitymmodel/gradients/model/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGatherV3k^model/gradients/model/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/group_deps*
T0*�
_classv
trloc:@model/gradients/model/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGatherV3*+
_output_shapes
:���������d
�
tmodel/gradients/model/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/control_dependency_1IdentityFmodel/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3k^model/gradients/model/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/group_deps*
T0*Y
_classO
MKloc:@model/gradients/model/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3*
_output_shapes
: 
~
6model/gradients/model/transpose_grad/InvertPermutationInvertPermutationmodel/concat*
T0*
_output_shapes
:
�
.model/gradients/model/transpose_grad/transpose	Transposermodel/gradients/model/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/control_dependency6model/gradients/model/transpose_grad/InvertPermutation*
T0*+
_output_shapes
:���������d*
Tperm0
�
6model/gradients/embeddings/embedding_lookup_grad/ShapeConst*
_output_shapes
:*&
_class
loc:@embeddings/Variable*
valueB"�: d   *
dtype0
�
5model/gradients/embeddings/embedding_lookup_grad/SizeSizeplaceholders/Placeholder*
T0*
_output_shapes
: *
out_type0
�
?model/gradients/embeddings/embedding_lookup_grad/ExpandDims/dimConst*
_output_shapes
: *
value	B : *
dtype0
�
;model/gradients/embeddings/embedding_lookup_grad/ExpandDims
ExpandDims5model/gradients/embeddings/embedding_lookup_grad/Size?model/gradients/embeddings/embedding_lookup_grad/ExpandDims/dim*
T0*
_output_shapes
:*

Tdim0
�
Dmodel/gradients/embeddings/embedding_lookup_grad/strided_slice/stackConst*
_output_shapes
:*
valueB:*
dtype0
�
Fmodel/gradients/embeddings/embedding_lookup_grad/strided_slice/stack_1Const*
_output_shapes
:*
valueB: *
dtype0
�
Fmodel/gradients/embeddings/embedding_lookup_grad/strided_slice/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
�
>model/gradients/embeddings/embedding_lookup_grad/strided_sliceStridedSlice6model/gradients/embeddings/embedding_lookup_grad/ShapeDmodel/gradients/embeddings/embedding_lookup_grad/strided_slice/stackFmodel/gradients/embeddings/embedding_lookup_grad/strided_slice/stack_1Fmodel/gradients/embeddings/embedding_lookup_grad/strided_slice/stack_2*
T0*
Index0*
new_axis_mask *

begin_mask *
ellipsis_mask *
_output_shapes
:*
shrink_axis_mask *
end_mask
~
<model/gradients/embeddings/embedding_lookup_grad/concat/axisConst*
_output_shapes
: *
value	B : *
dtype0
�
7model/gradients/embeddings/embedding_lookup_grad/concatConcatV2;model/gradients/embeddings/embedding_lookup_grad/ExpandDims>model/gradients/embeddings/embedding_lookup_grad/strided_slice<model/gradients/embeddings/embedding_lookup_grad/concat/axis*
T0*
_output_shapes
:*
N*

Tidx0
�
8model/gradients/embeddings/embedding_lookup_grad/ReshapeReshape.model/gradients/model/transpose_grad/transpose7model/gradients/embeddings/embedding_lookup_grad/concat*
T0*0
_output_shapes
:������������������*
Tshape0
�
:model/gradients/embeddings/embedding_lookup_grad/Reshape_1Reshapeplaceholders/Placeholder;model/gradients/embeddings/embedding_lookup_grad/ExpandDims*
T0*#
_output_shapes
:���������*
Tshape0
�
model/beta1_power/initial_valueConst*
_output_shapes
: *&
_class
loc:@embeddings/Variable*
valueB
 *fff?*
dtype0
�
model/beta1_power
VariableV2*
shared_name *
dtype0*&
_class
loc:@embeddings/Variable*
_output_shapes
: *
	container *
shape: 
�
model/beta1_power/AssignAssignmodel/beta1_powermodel/beta1_power/initial_value*
T0*&
_class
loc:@embeddings/Variable*
validate_shape(*
use_locking(*
_output_shapes
: 
~
model/beta1_power/readIdentitymodel/beta1_power*
T0*&
_class
loc:@embeddings/Variable*
_output_shapes
: 
�
model/beta2_power/initial_valueConst*
_output_shapes
: *&
_class
loc:@embeddings/Variable*
valueB
 *w�?*
dtype0
�
model/beta2_power
VariableV2*
shared_name *
dtype0*&
_class
loc:@embeddings/Variable*
_output_shapes
: *
	container *
shape: 
�
model/beta2_power/AssignAssignmodel/beta2_powermodel/beta2_power/initial_value*
T0*&
_class
loc:@embeddings/Variable*
validate_shape(*
use_locking(*
_output_shapes
: 
~
model/beta2_power/readIdentitymodel/beta2_power*
T0*&
_class
loc:@embeddings/Variable*
_output_shapes
: 
�
*embeddings/Variable/Adam/Initializer/zerosConst* 
_output_shapes
:
��d*&
_class
loc:@embeddings/Variable*
valueB
��d*    *
dtype0
�
embeddings/Variable/Adam
VariableV2*
dtype0*
shared_name * 
_output_shapes
:
��d*&
_class
loc:@embeddings/Variable*
shape:
��d*
	container 
�
embeddings/Variable/Adam/AssignAssignembeddings/Variable/Adam*embeddings/Variable/Adam/Initializer/zeros*
T0*&
_class
loc:@embeddings/Variable*
validate_shape(*
use_locking(* 
_output_shapes
:
��d
�
embeddings/Variable/Adam/readIdentityembeddings/Variable/Adam*
T0*&
_class
loc:@embeddings/Variable* 
_output_shapes
:
��d
�
,embeddings/Variable/Adam_1/Initializer/zerosConst* 
_output_shapes
:
��d*&
_class
loc:@embeddings/Variable*
valueB
��d*    *
dtype0
�
embeddings/Variable/Adam_1
VariableV2*
dtype0*
shared_name * 
_output_shapes
:
��d*&
_class
loc:@embeddings/Variable*
shape:
��d*
	container 
�
!embeddings/Variable/Adam_1/AssignAssignembeddings/Variable/Adam_1,embeddings/Variable/Adam_1/Initializer/zeros*
T0*&
_class
loc:@embeddings/Variable*
validate_shape(*
use_locking(* 
_output_shapes
:
��d
�
embeddings/Variable/Adam_1/readIdentityembeddings/Variable/Adam_1*
T0*&
_class
loc:@embeddings/Variable* 
_output_shapes
:
��d
�
0rnn/gru_cell/gates/kernel/Adam/Initializer/zerosConst* 
_output_shapes
:
��*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
valueB
��*    *
dtype0
�
rnn/gru_cell/gates/kernel/Adam
VariableV2*
dtype0*
shared_name * 
_output_shapes
:
��*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
shape:
��*
	container 
�
%rnn/gru_cell/gates/kernel/Adam/AssignAssignrnn/gru_cell/gates/kernel/Adam0rnn/gru_cell/gates/kernel/Adam/Initializer/zeros*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
��
�
#rnn/gru_cell/gates/kernel/Adam/readIdentityrnn/gru_cell/gates/kernel/Adam*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel* 
_output_shapes
:
��
�
2rnn/gru_cell/gates/kernel/Adam_1/Initializer/zerosConst* 
_output_shapes
:
��*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
valueB
��*    *
dtype0
�
 rnn/gru_cell/gates/kernel/Adam_1
VariableV2*
dtype0*
shared_name * 
_output_shapes
:
��*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
shape:
��*
	container 
�
'rnn/gru_cell/gates/kernel/Adam_1/AssignAssign rnn/gru_cell/gates/kernel/Adam_12rnn/gru_cell/gates/kernel/Adam_1/Initializer/zeros*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
��
�
%rnn/gru_cell/gates/kernel/Adam_1/readIdentity rnn/gru_cell/gates/kernel/Adam_1*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel* 
_output_shapes
:
��
�
.rnn/gru_cell/gates/bias/Adam/Initializer/zerosConst*
_output_shapes	
:�**
_class 
loc:@rnn/gru_cell/gates/bias*
valueB�*    *
dtype0
�
rnn/gru_cell/gates/bias/Adam
VariableV2*
dtype0*
shared_name *
_output_shapes	
:�**
_class 
loc:@rnn/gru_cell/gates/bias*
shape:�*
	container 
�
#rnn/gru_cell/gates/bias/Adam/AssignAssignrnn/gru_cell/gates/bias/Adam.rnn/gru_cell/gates/bias/Adam/Initializer/zeros*
T0**
_class 
loc:@rnn/gru_cell/gates/bias*
validate_shape(*
use_locking(*
_output_shapes	
:�
�
!rnn/gru_cell/gates/bias/Adam/readIdentityrnn/gru_cell/gates/bias/Adam*
T0**
_class 
loc:@rnn/gru_cell/gates/bias*
_output_shapes	
:�
�
0rnn/gru_cell/gates/bias/Adam_1/Initializer/zerosConst*
_output_shapes	
:�**
_class 
loc:@rnn/gru_cell/gates/bias*
valueB�*    *
dtype0
�
rnn/gru_cell/gates/bias/Adam_1
VariableV2*
dtype0*
shared_name *
_output_shapes	
:�**
_class 
loc:@rnn/gru_cell/gates/bias*
shape:�*
	container 
�
%rnn/gru_cell/gates/bias/Adam_1/AssignAssignrnn/gru_cell/gates/bias/Adam_10rnn/gru_cell/gates/bias/Adam_1/Initializer/zeros*
T0**
_class 
loc:@rnn/gru_cell/gates/bias*
validate_shape(*
use_locking(*
_output_shapes	
:�
�
#rnn/gru_cell/gates/bias/Adam_1/readIdentityrnn/gru_cell/gates/bias/Adam_1*
T0**
_class 
loc:@rnn/gru_cell/gates/bias*
_output_shapes	
:�
�
4rnn/gru_cell/candidate/kernel/Adam/Initializer/zerosConst* 
_output_shapes
:
��*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
valueB
��*    *
dtype0
�
"rnn/gru_cell/candidate/kernel/Adam
VariableV2*
dtype0*
shared_name * 
_output_shapes
:
��*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
shape:
��*
	container 
�
)rnn/gru_cell/candidate/kernel/Adam/AssignAssign"rnn/gru_cell/candidate/kernel/Adam4rnn/gru_cell/candidate/kernel/Adam/Initializer/zeros*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
��
�
'rnn/gru_cell/candidate/kernel/Adam/readIdentity"rnn/gru_cell/candidate/kernel/Adam*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel* 
_output_shapes
:
��
�
6rnn/gru_cell/candidate/kernel/Adam_1/Initializer/zerosConst* 
_output_shapes
:
��*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
valueB
��*    *
dtype0
�
$rnn/gru_cell/candidate/kernel/Adam_1
VariableV2*
dtype0*
shared_name * 
_output_shapes
:
��*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
shape:
��*
	container 
�
+rnn/gru_cell/candidate/kernel/Adam_1/AssignAssign$rnn/gru_cell/candidate/kernel/Adam_16rnn/gru_cell/candidate/kernel/Adam_1/Initializer/zeros*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
��
�
)rnn/gru_cell/candidate/kernel/Adam_1/readIdentity$rnn/gru_cell/candidate/kernel/Adam_1*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel* 
_output_shapes
:
��
�
2rnn/gru_cell/candidate/bias/Adam/Initializer/zerosConst*
_output_shapes	
:�*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
valueB�*    *
dtype0
�
 rnn/gru_cell/candidate/bias/Adam
VariableV2*
dtype0*
shared_name *
_output_shapes	
:�*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
shape:�*
	container 
�
'rnn/gru_cell/candidate/bias/Adam/AssignAssign rnn/gru_cell/candidate/bias/Adam2rnn/gru_cell/candidate/bias/Adam/Initializer/zeros*
T0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
validate_shape(*
use_locking(*
_output_shapes	
:�
�
%rnn/gru_cell/candidate/bias/Adam/readIdentity rnn/gru_cell/candidate/bias/Adam*
T0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
_output_shapes	
:�
�
4rnn/gru_cell/candidate/bias/Adam_1/Initializer/zerosConst*
_output_shapes	
:�*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
valueB�*    *
dtype0
�
"rnn/gru_cell/candidate/bias/Adam_1
VariableV2*
dtype0*
shared_name *
_output_shapes	
:�*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
shape:�*
	container 
�
)rnn/gru_cell/candidate/bias/Adam_1/AssignAssign"rnn/gru_cell/candidate/bias/Adam_14rnn/gru_cell/candidate/bias/Adam_1/Initializer/zeros*
T0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
validate_shape(*
use_locking(*
_output_shapes	
:�
�
'rnn/gru_cell/candidate/bias/Adam_1/readIdentity"rnn/gru_cell/candidate/bias/Adam_1*
T0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
_output_shapes	
:�
�
#dense/kernel/Adam/Initializer/zerosConst*!
_output_shapes
:���*
_class
loc:@dense/kernel* 
valueB���*    *
dtype0
�
dense/kernel/Adam
VariableV2*
dtype0*
shared_name *!
_output_shapes
:���*
_class
loc:@dense/kernel*
shape:���*
	container 
�
dense/kernel/Adam/AssignAssigndense/kernel/Adam#dense/kernel/Adam/Initializer/zeros*
T0*
_class
loc:@dense/kernel*
validate_shape(*
use_locking(*!
_output_shapes
:���
�
dense/kernel/Adam/readIdentitydense/kernel/Adam*
T0*
_class
loc:@dense/kernel*!
_output_shapes
:���
�
%dense/kernel/Adam_1/Initializer/zerosConst*!
_output_shapes
:���*
_class
loc:@dense/kernel* 
valueB���*    *
dtype0
�
dense/kernel/Adam_1
VariableV2*
dtype0*
shared_name *!
_output_shapes
:���*
_class
loc:@dense/kernel*
shape:���*
	container 
�
dense/kernel/Adam_1/AssignAssigndense/kernel/Adam_1%dense/kernel/Adam_1/Initializer/zeros*
T0*
_class
loc:@dense/kernel*
validate_shape(*
use_locking(*!
_output_shapes
:���
�
dense/kernel/Adam_1/readIdentitydense/kernel/Adam_1*
T0*
_class
loc:@dense/kernel*!
_output_shapes
:���
�
!dense/bias/Adam/Initializer/zerosConst*
_output_shapes

:��*
_class
loc:@dense/bias*
valueB��*    *
dtype0
�
dense/bias/Adam
VariableV2*
dtype0*
shared_name *
_output_shapes

:��*
_class
loc:@dense/bias*
shape:��*
	container 
�
dense/bias/Adam/AssignAssigndense/bias/Adam!dense/bias/Adam/Initializer/zeros*
T0*
_class
loc:@dense/bias*
validate_shape(*
use_locking(*
_output_shapes

:��
w
dense/bias/Adam/readIdentitydense/bias/Adam*
T0*
_class
loc:@dense/bias*
_output_shapes

:��
�
#dense/bias/Adam_1/Initializer/zerosConst*
_output_shapes

:��*
_class
loc:@dense/bias*
valueB��*    *
dtype0
�
dense/bias/Adam_1
VariableV2*
dtype0*
shared_name *
_output_shapes

:��*
_class
loc:@dense/bias*
shape:��*
	container 
�
dense/bias/Adam_1/AssignAssigndense/bias/Adam_1#dense/bias/Adam_1/Initializer/zeros*
T0*
_class
loc:@dense/bias*
validate_shape(*
use_locking(*
_output_shapes

:��
{
dense/bias/Adam_1/readIdentitydense/bias/Adam_1*
T0*
_class
loc:@dense/bias*
_output_shapes

:��
]
model/Adam/learning_rateConst*
_output_shapes
: *
valueB
 *
�#<*
dtype0
U
model/Adam/beta1Const*
_output_shapes
: *
valueB
 *fff?*
dtype0
U
model/Adam/beta2Const*
_output_shapes
: *
valueB
 *w�?*
dtype0
W
model/Adam/epsilonConst*
_output_shapes
: *
valueB
 *w�+2*
dtype0
�
,model/Adam/update_embeddings/Variable/UniqueUnique:model/gradients/embeddings/embedding_lookup_grad/Reshape_1*
T0*&
_class
loc:@embeddings/Variable*
out_idx0*2
_output_shapes 
:���������:���������
�
+model/Adam/update_embeddings/Variable/ShapeShape,model/Adam/update_embeddings/Variable/Unique*
T0*&
_class
loc:@embeddings/Variable*
out_type0*
_output_shapes
:
�
9model/Adam/update_embeddings/Variable/strided_slice/stackConst*
_output_shapes
:*&
_class
loc:@embeddings/Variable*
valueB: *
dtype0
�
;model/Adam/update_embeddings/Variable/strided_slice/stack_1Const*
_output_shapes
:*&
_class
loc:@embeddings/Variable*
valueB:*
dtype0
�
;model/Adam/update_embeddings/Variable/strided_slice/stack_2Const*
_output_shapes
:*&
_class
loc:@embeddings/Variable*
valueB:*
dtype0
�
3model/Adam/update_embeddings/Variable/strided_sliceStridedSlice+model/Adam/update_embeddings/Variable/Shape9model/Adam/update_embeddings/Variable/strided_slice/stack;model/Adam/update_embeddings/Variable/strided_slice/stack_1;model/Adam/update_embeddings/Variable/strided_slice/stack_2*
T0*
Index0*
new_axis_mask *

begin_mask *
ellipsis_mask *&
_class
loc:@embeddings/Variable*
_output_shapes
: *
shrink_axis_mask*
end_mask 
�
8model/Adam/update_embeddings/Variable/UnsortedSegmentSumUnsortedSegmentSum8model/gradients/embeddings/embedding_lookup_grad/Reshape.model/Adam/update_embeddings/Variable/Unique:13model/Adam/update_embeddings/Variable/strided_slice*
T0*&
_class
loc:@embeddings/Variable*
Tindices0*0
_output_shapes
:������������������
�
+model/Adam/update_embeddings/Variable/sub/xConst*
_output_shapes
: *&
_class
loc:@embeddings/Variable*
valueB
 *  �?*
dtype0
�
)model/Adam/update_embeddings/Variable/subSub+model/Adam/update_embeddings/Variable/sub/xmodel/beta2_power/read*
T0*&
_class
loc:@embeddings/Variable*
_output_shapes
: 
�
*model/Adam/update_embeddings/Variable/SqrtSqrt)model/Adam/update_embeddings/Variable/sub*
T0*&
_class
loc:@embeddings/Variable*
_output_shapes
: 
�
)model/Adam/update_embeddings/Variable/mulMulmodel/Adam/learning_rate*model/Adam/update_embeddings/Variable/Sqrt*
T0*&
_class
loc:@embeddings/Variable*
_output_shapes
: 
�
-model/Adam/update_embeddings/Variable/sub_1/xConst*
_output_shapes
: *&
_class
loc:@embeddings/Variable*
valueB
 *  �?*
dtype0
�
+model/Adam/update_embeddings/Variable/sub_1Sub-model/Adam/update_embeddings/Variable/sub_1/xmodel/beta1_power/read*
T0*&
_class
loc:@embeddings/Variable*
_output_shapes
: 
�
-model/Adam/update_embeddings/Variable/truedivRealDiv)model/Adam/update_embeddings/Variable/mul+model/Adam/update_embeddings/Variable/sub_1*
T0*&
_class
loc:@embeddings/Variable*
_output_shapes
: 
�
-model/Adam/update_embeddings/Variable/sub_2/xConst*
_output_shapes
: *&
_class
loc:@embeddings/Variable*
valueB
 *  �?*
dtype0
�
+model/Adam/update_embeddings/Variable/sub_2Sub-model/Adam/update_embeddings/Variable/sub_2/xmodel/Adam/beta1*
T0*&
_class
loc:@embeddings/Variable*
_output_shapes
: 
�
+model/Adam/update_embeddings/Variable/mul_1Mul8model/Adam/update_embeddings/Variable/UnsortedSegmentSum+model/Adam/update_embeddings/Variable/sub_2*
T0*&
_class
loc:@embeddings/Variable*0
_output_shapes
:������������������
�
+model/Adam/update_embeddings/Variable/mul_2Mulembeddings/Variable/Adam/readmodel/Adam/beta1*
T0*&
_class
loc:@embeddings/Variable* 
_output_shapes
:
��d
�
,model/Adam/update_embeddings/Variable/AssignAssignembeddings/Variable/Adam+model/Adam/update_embeddings/Variable/mul_2*
T0*&
_class
loc:@embeddings/Variable*
validate_shape(*
use_locking( * 
_output_shapes
:
��d
�
0model/Adam/update_embeddings/Variable/ScatterAdd
ScatterAddembeddings/Variable/Adam,model/Adam/update_embeddings/Variable/Unique+model/Adam/update_embeddings/Variable/mul_1-^model/Adam/update_embeddings/Variable/Assign*
T0*&
_class
loc:@embeddings/Variable*
Tindices0*
use_locking( * 
_output_shapes
:
��d
�
+model/Adam/update_embeddings/Variable/mul_3Mul8model/Adam/update_embeddings/Variable/UnsortedSegmentSum8model/Adam/update_embeddings/Variable/UnsortedSegmentSum*
T0*&
_class
loc:@embeddings/Variable*0
_output_shapes
:������������������
�
-model/Adam/update_embeddings/Variable/sub_3/xConst*
_output_shapes
: *&
_class
loc:@embeddings/Variable*
valueB
 *  �?*
dtype0
�
+model/Adam/update_embeddings/Variable/sub_3Sub-model/Adam/update_embeddings/Variable/sub_3/xmodel/Adam/beta2*
T0*&
_class
loc:@embeddings/Variable*
_output_shapes
: 
�
+model/Adam/update_embeddings/Variable/mul_4Mul+model/Adam/update_embeddings/Variable/mul_3+model/Adam/update_embeddings/Variable/sub_3*
T0*&
_class
loc:@embeddings/Variable*0
_output_shapes
:������������������
�
+model/Adam/update_embeddings/Variable/mul_5Mulembeddings/Variable/Adam_1/readmodel/Adam/beta2*
T0*&
_class
loc:@embeddings/Variable* 
_output_shapes
:
��d
�
.model/Adam/update_embeddings/Variable/Assign_1Assignembeddings/Variable/Adam_1+model/Adam/update_embeddings/Variable/mul_5*
T0*&
_class
loc:@embeddings/Variable*
validate_shape(*
use_locking( * 
_output_shapes
:
��d
�
2model/Adam/update_embeddings/Variable/ScatterAdd_1
ScatterAddembeddings/Variable/Adam_1,model/Adam/update_embeddings/Variable/Unique+model/Adam/update_embeddings/Variable/mul_4/^model/Adam/update_embeddings/Variable/Assign_1*
T0*&
_class
loc:@embeddings/Variable*
Tindices0*
use_locking( * 
_output_shapes
:
��d
�
,model/Adam/update_embeddings/Variable/Sqrt_1Sqrt2model/Adam/update_embeddings/Variable/ScatterAdd_1*
T0*&
_class
loc:@embeddings/Variable* 
_output_shapes
:
��d
�
+model/Adam/update_embeddings/Variable/mul_6Mul-model/Adam/update_embeddings/Variable/truediv0model/Adam/update_embeddings/Variable/ScatterAdd*
T0*&
_class
loc:@embeddings/Variable* 
_output_shapes
:
��d
�
)model/Adam/update_embeddings/Variable/addAdd,model/Adam/update_embeddings/Variable/Sqrt_1model/Adam/epsilon*
T0*&
_class
loc:@embeddings/Variable* 
_output_shapes
:
��d
�
/model/Adam/update_embeddings/Variable/truediv_1RealDiv+model/Adam/update_embeddings/Variable/mul_6)model/Adam/update_embeddings/Variable/add*
T0*&
_class
loc:@embeddings/Variable* 
_output_shapes
:
��d
�
/model/Adam/update_embeddings/Variable/AssignSub	AssignSubembeddings/Variable/model/Adam/update_embeddings/Variable/truediv_1*
T0*&
_class
loc:@embeddings/Variable*
use_locking( * 
_output_shapes
:
��d
�
0model/Adam/update_embeddings/Variable/group_depsNoOp0^model/Adam/update_embeddings/Variable/AssignSub1^model/Adam/update_embeddings/Variable/ScatterAdd3^model/Adam/update_embeddings/Variable/ScatterAdd_1*&
_class
loc:@embeddings/Variable
�
5model/Adam/update_rnn/gru_cell/gates/kernel/ApplyAdam	ApplyAdamrnn/gru_cell/gates/kernelrnn/gru_cell/gates/kernel/Adam rnn/gru_cell/gates/kernel/Adam_1model/beta1_power/readmodel/beta2_power/readmodel/Adam/learning_ratemodel/Adam/beta1model/Adam/beta2model/Adam/epsilonRmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_acc_3*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
use_locking( *
use_nesterov( * 
_output_shapes
:
��
�
3model/Adam/update_rnn/gru_cell/gates/bias/ApplyAdam	ApplyAdamrnn/gru_cell/gates/biasrnn/gru_cell/gates/bias/Adamrnn/gru_cell/gates/bias/Adam_1model/beta1_power/readmodel/beta2_power/readmodel/Adam/learning_ratemodel/Adam/beta1model/Adam/beta2model/Adam/epsilonSmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_acc_3*
T0**
_class 
loc:@rnn/gru_cell/gates/bias*
use_locking( *
use_nesterov( *
_output_shapes	
:�
�
9model/Adam/update_rnn/gru_cell/candidate/kernel/ApplyAdam	ApplyAdamrnn/gru_cell/candidate/kernel"rnn/gru_cell/candidate/kernel/Adam$rnn/gru_cell/candidate/kernel/Adam_1model/beta1_power/readmodel/beta2_power/readmodel/Adam/learning_ratemodel/Adam/beta1model/Adam/beta2model/Adam/epsilonZmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_acc_3*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
use_locking( *
use_nesterov( * 
_output_shapes
:
��
�
7model/Adam/update_rnn/gru_cell/candidate/bias/ApplyAdam	ApplyAdamrnn/gru_cell/candidate/bias rnn/gru_cell/candidate/bias/Adam"rnn/gru_cell/candidate/bias/Adam_1model/beta1_power/readmodel/beta2_power/readmodel/Adam/learning_ratemodel/Adam/beta1model/Adam/beta2model/Adam/epsilon[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_acc_3*
T0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
use_locking( *
use_nesterov( *
_output_shapes	
:�
�
(model/Adam/update_dense/kernel/ApplyAdam	ApplyAdamdense/kerneldense/kernel/Adamdense/kernel/Adam_1model/beta1_power/readmodel/beta2_power/readmodel/Adam/learning_ratemodel/Adam/beta1model/Adam/beta2model/Adam/epsilonBmodel/gradients/model/dense/MatMul_grad/tuple/control_dependency_1*
T0*
_class
loc:@dense/kernel*
use_locking( *
use_nesterov( *!
_output_shapes
:���
�
&model/Adam/update_dense/bias/ApplyAdam	ApplyAdam
dense/biasdense/bias/Adamdense/bias/Adam_1model/beta1_power/readmodel/beta2_power/readmodel/Adam/learning_ratemodel/Adam/beta1model/Adam/beta2model/Adam/epsilonCmodel/gradients/model/dense/BiasAdd_grad/tuple/control_dependency_1*
T0*
_class
loc:@dense/bias*
use_locking( *
use_nesterov( *
_output_shapes

:��
�
model/Adam/mulMulmodel/beta1_power/readmodel/Adam/beta11^model/Adam/update_embeddings/Variable/group_deps6^model/Adam/update_rnn/gru_cell/gates/kernel/ApplyAdam4^model/Adam/update_rnn/gru_cell/gates/bias/ApplyAdam:^model/Adam/update_rnn/gru_cell/candidate/kernel/ApplyAdam8^model/Adam/update_rnn/gru_cell/candidate/bias/ApplyAdam)^model/Adam/update_dense/kernel/ApplyAdam'^model/Adam/update_dense/bias/ApplyAdam*
T0*&
_class
loc:@embeddings/Variable*
_output_shapes
: 
�
model/Adam/AssignAssignmodel/beta1_powermodel/Adam/mul*
T0*&
_class
loc:@embeddings/Variable*
validate_shape(*
use_locking( *
_output_shapes
: 
�
model/Adam/mul_1Mulmodel/beta2_power/readmodel/Adam/beta21^model/Adam/update_embeddings/Variable/group_deps6^model/Adam/update_rnn/gru_cell/gates/kernel/ApplyAdam4^model/Adam/update_rnn/gru_cell/gates/bias/ApplyAdam:^model/Adam/update_rnn/gru_cell/candidate/kernel/ApplyAdam8^model/Adam/update_rnn/gru_cell/candidate/bias/ApplyAdam)^model/Adam/update_dense/kernel/ApplyAdam'^model/Adam/update_dense/bias/ApplyAdam*
T0*&
_class
loc:@embeddings/Variable*
_output_shapes
: 
�
model/Adam/Assign_1Assignmodel/beta2_powermodel/Adam/mul_1*
T0*&
_class
loc:@embeddings/Variable*
validate_shape(*
use_locking( *
_output_shapes
: 
�

model/AdamNoOp1^model/Adam/update_embeddings/Variable/group_deps6^model/Adam/update_rnn/gru_cell/gates/kernel/ApplyAdam4^model/Adam/update_rnn/gru_cell/gates/bias/ApplyAdam:^model/Adam/update_rnn/gru_cell/candidate/kernel/ApplyAdam8^model/Adam/update_rnn/gru_cell/candidate/bias/ApplyAdam)^model/Adam/update_dense/kernel/ApplyAdam'^model/Adam/update_dense/bias/ApplyAdam^model/Adam/Assign^model/Adam/Assign_1
l
model/cross_entropy/tagsConst*
_output_shapes
: *$
valueB Bmodel/cross_entropy*
dtype0
k
model/cross_entropyScalarSummarymodel/cross_entropy/tags
model/Mean*
T0*
_output_shapes
: 
^
model/Merge/MergeSummaryMergeSummarymodel/cross_entropy*
_output_shapes
: *
N
V
model/save/ConstConst*
_output_shapes
: *
valueB Bmodel*
dtype0
�
model/save/SaveV2/tensor_namesConst*
_output_shapes
:*�
value�B�B
dense/biasBdense/bias/AdamBdense/bias/Adam_1Bdense/kernelBdense/kernel/AdamBdense/kernel/Adam_1Bembeddings/VariableBembeddings/Variable/AdamBembeddings/Variable/Adam_1Bmodel/beta1_powerBmodel/beta2_powerBrnn/gru_cell/candidate/biasB rnn/gru_cell/candidate/bias/AdamB"rnn/gru_cell/candidate/bias/Adam_1Brnn/gru_cell/candidate/kernelB"rnn/gru_cell/candidate/kernel/AdamB$rnn/gru_cell/candidate/kernel/Adam_1Brnn/gru_cell/gates/biasBrnn/gru_cell/gates/bias/AdamBrnn/gru_cell/gates/bias/Adam_1Brnn/gru_cell/gates/kernelBrnn/gru_cell/gates/kernel/AdamB rnn/gru_cell/gates/kernel/Adam_1*
dtype0
�
"model/save/SaveV2/shape_and_slicesConst*
_output_shapes
:*A
value8B6B B B B B B B B B B B B B B B B B B B B B B B *
dtype0
�
model/save/SaveV2SaveV2model/save/Constmodel/save/SaveV2/tensor_names"model/save/SaveV2/shape_and_slices
dense/biasdense/bias/Adamdense/bias/Adam_1dense/kerneldense/kernel/Adamdense/kernel/Adam_1embeddings/Variableembeddings/Variable/Adamembeddings/Variable/Adam_1model/beta1_powermodel/beta2_powerrnn/gru_cell/candidate/bias rnn/gru_cell/candidate/bias/Adam"rnn/gru_cell/candidate/bias/Adam_1rnn/gru_cell/candidate/kernel"rnn/gru_cell/candidate/kernel/Adam$rnn/gru_cell/candidate/kernel/Adam_1rnn/gru_cell/gates/biasrnn/gru_cell/gates/bias/Adamrnn/gru_cell/gates/bias/Adam_1rnn/gru_cell/gates/kernelrnn/gru_cell/gates/kernel/Adam rnn/gru_cell/gates/kernel/Adam_1*%
dtypes
2
�
model/save/control_dependencyIdentitymodel/save/Const^model/save/SaveV2*
T0*#
_class
loc:@model/save/Const*
_output_shapes
: 
t
!model/save/RestoreV2/tensor_namesConst*
_output_shapes
:*
valueBB
dense/bias*
dtype0
n
%model/save/RestoreV2/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2	RestoreV2model/save/Const!model/save/RestoreV2/tensor_names%model/save/RestoreV2/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/AssignAssign
dense/biasmodel/save/RestoreV2*
T0*
_class
loc:@dense/bias*
validate_shape(*
use_locking(*
_output_shapes

:��
{
#model/save/RestoreV2_1/tensor_namesConst*
_output_shapes
:*$
valueBBdense/bias/Adam*
dtype0
p
'model/save/RestoreV2_1/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_1	RestoreV2model/save/Const#model/save/RestoreV2_1/tensor_names'model/save/RestoreV2_1/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_1Assigndense/bias/Adammodel/save/RestoreV2_1*
T0*
_class
loc:@dense/bias*
validate_shape(*
use_locking(*
_output_shapes

:��
}
#model/save/RestoreV2_2/tensor_namesConst*
_output_shapes
:*&
valueBBdense/bias/Adam_1*
dtype0
p
'model/save/RestoreV2_2/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_2	RestoreV2model/save/Const#model/save/RestoreV2_2/tensor_names'model/save/RestoreV2_2/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_2Assigndense/bias/Adam_1model/save/RestoreV2_2*
T0*
_class
loc:@dense/bias*
validate_shape(*
use_locking(*
_output_shapes

:��
x
#model/save/RestoreV2_3/tensor_namesConst*
_output_shapes
:*!
valueBBdense/kernel*
dtype0
p
'model/save/RestoreV2_3/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_3	RestoreV2model/save/Const#model/save/RestoreV2_3/tensor_names'model/save/RestoreV2_3/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_3Assigndense/kernelmodel/save/RestoreV2_3*
T0*
_class
loc:@dense/kernel*
validate_shape(*
use_locking(*!
_output_shapes
:���
}
#model/save/RestoreV2_4/tensor_namesConst*
_output_shapes
:*&
valueBBdense/kernel/Adam*
dtype0
p
'model/save/RestoreV2_4/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_4	RestoreV2model/save/Const#model/save/RestoreV2_4/tensor_names'model/save/RestoreV2_4/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_4Assigndense/kernel/Adammodel/save/RestoreV2_4*
T0*
_class
loc:@dense/kernel*
validate_shape(*
use_locking(*!
_output_shapes
:���

#model/save/RestoreV2_5/tensor_namesConst*
_output_shapes
:*(
valueBBdense/kernel/Adam_1*
dtype0
p
'model/save/RestoreV2_5/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_5	RestoreV2model/save/Const#model/save/RestoreV2_5/tensor_names'model/save/RestoreV2_5/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_5Assigndense/kernel/Adam_1model/save/RestoreV2_5*
T0*
_class
loc:@dense/kernel*
validate_shape(*
use_locking(*!
_output_shapes
:���

#model/save/RestoreV2_6/tensor_namesConst*
_output_shapes
:*(
valueBBembeddings/Variable*
dtype0
p
'model/save/RestoreV2_6/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_6	RestoreV2model/save/Const#model/save/RestoreV2_6/tensor_names'model/save/RestoreV2_6/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_6Assignembeddings/Variablemodel/save/RestoreV2_6*
T0*&
_class
loc:@embeddings/Variable*
validate_shape(*
use_locking(* 
_output_shapes
:
��d
�
#model/save/RestoreV2_7/tensor_namesConst*
_output_shapes
:*-
value$B"Bembeddings/Variable/Adam*
dtype0
p
'model/save/RestoreV2_7/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_7	RestoreV2model/save/Const#model/save/RestoreV2_7/tensor_names'model/save/RestoreV2_7/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_7Assignembeddings/Variable/Adammodel/save/RestoreV2_7*
T0*&
_class
loc:@embeddings/Variable*
validate_shape(*
use_locking(* 
_output_shapes
:
��d
�
#model/save/RestoreV2_8/tensor_namesConst*
_output_shapes
:*/
value&B$Bembeddings/Variable/Adam_1*
dtype0
p
'model/save/RestoreV2_8/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_8	RestoreV2model/save/Const#model/save/RestoreV2_8/tensor_names'model/save/RestoreV2_8/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_8Assignembeddings/Variable/Adam_1model/save/RestoreV2_8*
T0*&
_class
loc:@embeddings/Variable*
validate_shape(*
use_locking(* 
_output_shapes
:
��d
}
#model/save/RestoreV2_9/tensor_namesConst*
_output_shapes
:*&
valueBBmodel/beta1_power*
dtype0
p
'model/save/RestoreV2_9/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_9	RestoreV2model/save/Const#model/save/RestoreV2_9/tensor_names'model/save/RestoreV2_9/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_9Assignmodel/beta1_powermodel/save/RestoreV2_9*
T0*&
_class
loc:@embeddings/Variable*
validate_shape(*
use_locking(*
_output_shapes
: 
~
$model/save/RestoreV2_10/tensor_namesConst*
_output_shapes
:*&
valueBBmodel/beta2_power*
dtype0
q
(model/save/RestoreV2_10/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_10	RestoreV2model/save/Const$model/save/RestoreV2_10/tensor_names(model/save/RestoreV2_10/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_10Assignmodel/beta2_powermodel/save/RestoreV2_10*
T0*&
_class
loc:@embeddings/Variable*
validate_shape(*
use_locking(*
_output_shapes
: 
�
$model/save/RestoreV2_11/tensor_namesConst*
_output_shapes
:*0
value'B%Brnn/gru_cell/candidate/bias*
dtype0
q
(model/save/RestoreV2_11/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_11	RestoreV2model/save/Const$model/save/RestoreV2_11/tensor_names(model/save/RestoreV2_11/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_11Assignrnn/gru_cell/candidate/biasmodel/save/RestoreV2_11*
T0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
validate_shape(*
use_locking(*
_output_shapes	
:�
�
$model/save/RestoreV2_12/tensor_namesConst*
_output_shapes
:*5
value,B*B rnn/gru_cell/candidate/bias/Adam*
dtype0
q
(model/save/RestoreV2_12/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_12	RestoreV2model/save/Const$model/save/RestoreV2_12/tensor_names(model/save/RestoreV2_12/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_12Assign rnn/gru_cell/candidate/bias/Adammodel/save/RestoreV2_12*
T0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
validate_shape(*
use_locking(*
_output_shapes	
:�
�
$model/save/RestoreV2_13/tensor_namesConst*
_output_shapes
:*7
value.B,B"rnn/gru_cell/candidate/bias/Adam_1*
dtype0
q
(model/save/RestoreV2_13/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_13	RestoreV2model/save/Const$model/save/RestoreV2_13/tensor_names(model/save/RestoreV2_13/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_13Assign"rnn/gru_cell/candidate/bias/Adam_1model/save/RestoreV2_13*
T0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
validate_shape(*
use_locking(*
_output_shapes	
:�
�
$model/save/RestoreV2_14/tensor_namesConst*
_output_shapes
:*2
value)B'Brnn/gru_cell/candidate/kernel*
dtype0
q
(model/save/RestoreV2_14/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_14	RestoreV2model/save/Const$model/save/RestoreV2_14/tensor_names(model/save/RestoreV2_14/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_14Assignrnn/gru_cell/candidate/kernelmodel/save/RestoreV2_14*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
��
�
$model/save/RestoreV2_15/tensor_namesConst*
_output_shapes
:*7
value.B,B"rnn/gru_cell/candidate/kernel/Adam*
dtype0
q
(model/save/RestoreV2_15/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_15	RestoreV2model/save/Const$model/save/RestoreV2_15/tensor_names(model/save/RestoreV2_15/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_15Assign"rnn/gru_cell/candidate/kernel/Adammodel/save/RestoreV2_15*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
��
�
$model/save/RestoreV2_16/tensor_namesConst*
_output_shapes
:*9
value0B.B$rnn/gru_cell/candidate/kernel/Adam_1*
dtype0
q
(model/save/RestoreV2_16/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_16	RestoreV2model/save/Const$model/save/RestoreV2_16/tensor_names(model/save/RestoreV2_16/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_16Assign$rnn/gru_cell/candidate/kernel/Adam_1model/save/RestoreV2_16*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
��
�
$model/save/RestoreV2_17/tensor_namesConst*
_output_shapes
:*,
value#B!Brnn/gru_cell/gates/bias*
dtype0
q
(model/save/RestoreV2_17/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_17	RestoreV2model/save/Const$model/save/RestoreV2_17/tensor_names(model/save/RestoreV2_17/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_17Assignrnn/gru_cell/gates/biasmodel/save/RestoreV2_17*
T0**
_class 
loc:@rnn/gru_cell/gates/bias*
validate_shape(*
use_locking(*
_output_shapes	
:�
�
$model/save/RestoreV2_18/tensor_namesConst*
_output_shapes
:*1
value(B&Brnn/gru_cell/gates/bias/Adam*
dtype0
q
(model/save/RestoreV2_18/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_18	RestoreV2model/save/Const$model/save/RestoreV2_18/tensor_names(model/save/RestoreV2_18/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_18Assignrnn/gru_cell/gates/bias/Adammodel/save/RestoreV2_18*
T0**
_class 
loc:@rnn/gru_cell/gates/bias*
validate_shape(*
use_locking(*
_output_shapes	
:�
�
$model/save/RestoreV2_19/tensor_namesConst*
_output_shapes
:*3
value*B(Brnn/gru_cell/gates/bias/Adam_1*
dtype0
q
(model/save/RestoreV2_19/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_19	RestoreV2model/save/Const$model/save/RestoreV2_19/tensor_names(model/save/RestoreV2_19/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_19Assignrnn/gru_cell/gates/bias/Adam_1model/save/RestoreV2_19*
T0**
_class 
loc:@rnn/gru_cell/gates/bias*
validate_shape(*
use_locking(*
_output_shapes	
:�
�
$model/save/RestoreV2_20/tensor_namesConst*
_output_shapes
:*.
value%B#Brnn/gru_cell/gates/kernel*
dtype0
q
(model/save/RestoreV2_20/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_20	RestoreV2model/save/Const$model/save/RestoreV2_20/tensor_names(model/save/RestoreV2_20/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_20Assignrnn/gru_cell/gates/kernelmodel/save/RestoreV2_20*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
��
�
$model/save/RestoreV2_21/tensor_namesConst*
_output_shapes
:*3
value*B(Brnn/gru_cell/gates/kernel/Adam*
dtype0
q
(model/save/RestoreV2_21/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_21	RestoreV2model/save/Const$model/save/RestoreV2_21/tensor_names(model/save/RestoreV2_21/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_21Assignrnn/gru_cell/gates/kernel/Adammodel/save/RestoreV2_21*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
��
�
$model/save/RestoreV2_22/tensor_namesConst*
_output_shapes
:*5
value,B*B rnn/gru_cell/gates/kernel/Adam_1*
dtype0
q
(model/save/RestoreV2_22/shape_and_slicesConst*
_output_shapes
:*
valueB
B *
dtype0
�
model/save/RestoreV2_22	RestoreV2model/save/Const$model/save/RestoreV2_22/tensor_names(model/save/RestoreV2_22/shape_and_slices*
dtypes
2*
_output_shapes
:
�
model/save/Assign_22Assign rnn/gru_cell/gates/kernel/Adam_1model/save/RestoreV2_22*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
��
�
model/save/restore_allNoOp^model/save/Assign^model/save/Assign_1^model/save/Assign_2^model/save/Assign_3^model/save/Assign_4^model/save/Assign_5^model/save/Assign_6^model/save/Assign_7^model/save/Assign_8^model/save/Assign_9^model/save/Assign_10^model/save/Assign_11^model/save/Assign_12^model/save/Assign_13^model/save/Assign_14^model/save/Assign_15^model/save/Assign_16^model/save/Assign_17^model/save/Assign_18^model/save/Assign_19^model/save/Assign_20^model/save/Assign_21^model/save/Assign_22
�
initNoOp^embeddings/Variable/Assign!^rnn/gru_cell/gates/kernel/Assign^rnn/gru_cell/gates/bias/Assign%^rnn/gru_cell/candidate/kernel/Assign#^rnn/gru_cell/candidate/bias/Assign^dense/kernel/Assign^dense/bias/Assign^model/beta1_power/Assign^model/beta2_power/Assign ^embeddings/Variable/Adam/Assign"^embeddings/Variable/Adam_1/Assign&^rnn/gru_cell/gates/kernel/Adam/Assign(^rnn/gru_cell/gates/kernel/Adam_1/Assign$^rnn/gru_cell/gates/bias/Adam/Assign&^rnn/gru_cell/gates/bias/Adam_1/Assign*^rnn/gru_cell/candidate/kernel/Adam/Assign,^rnn/gru_cell/candidate/kernel/Adam_1/Assign(^rnn/gru_cell/candidate/bias/Adam/Assign*^rnn/gru_cell/candidate/bias/Adam_1/Assign^dense/kernel/Adam/Assign^dense/kernel/Adam_1/Assign^dense/bias/Adam/Assign^dense/bias/Adam_1/Assign""
train_op


model/Adam"�
trainable_variables��
O
embeddings/Variable:0embeddings/Variable/Assignembeddings/Variable/read:0
a
rnn/gru_cell/gates/kernel:0 rnn/gru_cell/gates/kernel/Assign rnn/gru_cell/gates/kernel/read:0
[
rnn/gru_cell/gates/bias:0rnn/gru_cell/gates/bias/Assignrnn/gru_cell/gates/bias/read:0
m
rnn/gru_cell/candidate/kernel:0$rnn/gru_cell/candidate/kernel/Assign$rnn/gru_cell/candidate/kernel/read:0
g
rnn/gru_cell/candidate/bias:0"rnn/gru_cell/candidate/bias/Assign"rnn/gru_cell/candidate/bias/read:0
:
dense/kernel:0dense/kernel/Assigndense/kernel/read:0
4
dense/bias:0dense/bias/Assigndense/bias/read:0"�s
while_context�s�s
�s
 model/rnn/while/model/rnn/while/ *model/rnn/while/LoopCond:02model/rnn/while/Merge:0:model/rnn/while/Identity:0Bmodel/rnn/while/Exit:0Bmodel/rnn/while/Exit_1:0Bmodel/rnn/while/Exit_2:0Bmodel/gradients/f_count_2:0J�p
model/gradients/Add/y:0
model/gradients/Add:0
model/gradients/Merge:0
model/gradients/Merge:1
model/gradients/NextIteration:0
model/gradients/Switch:0
model/gradients/Switch:1
model/gradients/f_count:0
model/gradients/f_count_1:0
model/gradients/f_count_2:0
emodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/RefEnter:0
fmodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/StackPush:0
bmodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/f_acc:0
Vmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/RefEnter:0
Xmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/RefEnter_1:0
Wmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPush:0
Ymodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPush_1:0
Smodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/f_acc:0
Umodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/f_acc_1:0
=model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Shape:0
?model/gradients/model/rnn/while/rnn/gru_cell/add_grad/Shape_1:0
`model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/RefEnter:0
amodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/StackPush:0
]model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/f_acc:0
Tmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/Shape:0
^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/RefEnter:0
`model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/RefEnter_1:0
_model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPush:0
amodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPush_1:0
[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/f_acc:0
]model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/f_acc_1:0
[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/RefEnter:0
\model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/StackPush:0
Xmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/f_acc:0
`model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/RefEnter:0
bmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/RefEnter_1:0
amodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPush:0
cmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPush_1:0
]model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/f_acc:0
_model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/f_acc_1:0
Gmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape:0
Imodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape_1:0
Pmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/RefEnter:0
Qmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/StackPush:0
Mmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/f_acc:0
Vmodel/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/RefEnter:0
Wmodel/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/StackPush:0
Smodel/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/f_acc:0
Xmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/RefEnter:0
Ymodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/StackPush:0
Umodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/f_acc:0
Lmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/Shape:0
Smodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/RefEnter:0
Tmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/StackPush:0
Pmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/f_acc:0
Omodel/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat/RefEnter:0
Pmodel/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat/StackPush:0
Lmodel/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat/f_acc:0
Xmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/RefEnter:0
Zmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/RefEnter_1:0
Ymodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPush:0
[model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPush_1:0
Umodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/f_acc:0
Wmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/f_acc_1:0
?model/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Shape:0
Amodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/Shape_1:0
Fmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul/RefEnter:0
Gmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPush:0
Cmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul/f_acc:0
Hmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/RefEnter:0
Imodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/StackPush:0
Emodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/f_acc:0
Vmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/RefEnter:0
Xmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/RefEnter_1:0
Wmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPush:0
Ymodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPush_1:0
Smodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/f_acc:0
Umodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/f_acc_1:0
=model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Shape:0
?model/gradients/model/rnn/while/rnn/gru_cell/mul_grad/Shape_1:0
Dmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/RefEnter:0
Emodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/StackPush:0
Amodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/f_acc:0
Fmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1/RefEnter:0
Gmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1/StackPush:0
Cmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1/f_acc:0
Vmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/RefEnter:0
Wmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPush:0
Smodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/f_acc:0
?model/gradients/model/rnn/while/rnn/gru_cell/sub_grad/Shape_1:0
model/rnn/TensorArray:0
Fmodel/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0
model/rnn/TensorArray_1:0
model/rnn/strided_slice_2:0
model/rnn/while/Enter:0
model/rnn/while/Enter_1:0
model/rnn/while/Enter_2:0
model/rnn/while/Exit:0
model/rnn/while/Exit_1:0
model/rnn/while/Exit_2:0
model/rnn/while/Identity:0
model/rnn/while/Identity_1:0
model/rnn/while/Identity_2:0
model/rnn/while/Less/Enter:0
model/rnn/while/Less:0
model/rnn/while/LoopCond:0
model/rnn/while/Merge:0
model/rnn/while/Merge:1
model/rnn/while/Merge_1:0
model/rnn/while/Merge_1:1
model/rnn/while/Merge_2:0
model/rnn/while/Merge_2:1
model/rnn/while/NextIteration:0
!model/rnn/while/NextIteration_1:0
!model/rnn/while/NextIteration_2:0
model/rnn/while/Switch:0
model/rnn/while/Switch:1
model/rnn/while/Switch_1:0
model/rnn/while/Switch_1:1
model/rnn/while/Switch_2:0
model/rnn/while/Switch_2:1
)model/rnn/while/TensorArrayReadV3/Enter:0
+model/rnn/while/TensorArrayReadV3/Enter_1:0
#model/rnn/while/TensorArrayReadV3:0
;model/rnn/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0
5model/rnn/while/TensorArrayWrite/TensorArrayWriteV3:0
model/rnn/while/add/y:0
model/rnn/while/add:0
"model/rnn/while/rnn/gru_cell/add:0
-model/rnn/while/rnn/gru_cell/candidate/Tanh:0
@model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter:0
:model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd:0
?model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter:0
9model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul:0
>model/rnn/while/rnn/gru_cell/candidate/candidate/concat/axis:0
9model/rnn/while/rnn/gru_cell/candidate/candidate/concat:0
,model/rnn/while/rnn/gru_cell/candidate/mul:0
*model/rnn/while/rnn/gru_cell/gates/Const:0
,model/rnn/while/rnn/gru_cell/gates/Sigmoid:0
8model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter:0
2model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd:0
7model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter:0
1model/rnn/while/rnn/gru_cell/gates/gates/MatMul:0
6model/rnn/while/rnn/gru_cell/gates/gates/concat/axis:0
1model/rnn/while/rnn/gru_cell/gates/gates/concat:0
4model/rnn/while/rnn/gru_cell/gates/split/split_dim:0
*model/rnn/while/rnn/gru_cell/gates/split:0
*model/rnn/while/rnn/gru_cell/gates/split:1
"model/rnn/while/rnn/gru_cell/mul:0
$model/rnn/while/rnn/gru_cell/mul_1:0
$model/rnn/while/rnn/gru_cell/sub/x:0
"model/rnn/while/rnn/gru_cell/sub:0
"rnn/gru_cell/candidate/bias/read:0
$rnn/gru_cell/candidate/kernel/read:0
rnn/gru_cell/gates/bias/read:0
 rnn/gru_cell/gates/kernel/read:0�
Smodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/f_acc:0Vmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/RefEnter:0[
 rnn/gru_cell/gates/kernel/read:07model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter:0�
Amodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/f_acc:0Dmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/RefEnter:0�
Umodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/f_acc_1:0Xmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/RefEnter_1:0�
]model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/f_acc_1:0`model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/RefEnter_1:0�
]model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/f_acc:0`model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/RefEnter:0�
Pmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/f_acc:0Smodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/RefEnter:0�
Smodel/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/f_acc:0Vmodel/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/RefEnter:0�
Lmodel/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat/f_acc:0Omodel/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat/RefEnter:0�
Smodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/f_acc:0Vmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/RefEnter:0�
[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/f_acc:0^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/RefEnter:0�
Emodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/f_acc:0Hmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/RefEnter:0;
model/rnn/strided_slice_2:0model/rnn/while/Less/Enter:0Z
rnn/gru_cell/gates/bias/read:08model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter:0�
bmodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/f_acc:0emodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/RefEnter:0�
Mmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/f_acc:0Pmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/RefEnter:0V
model/rnn/TensorArray:0;model/rnn/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0�
Smodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/f_acc:0Vmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/RefEnter:0�
Umodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/f_acc:0Xmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/RefEnter:0g
$rnn/gru_cell/candidate/kernel/read:0?model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter:0�
Umodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/f_acc_1:0Xmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/RefEnter_1:0�
_model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/f_acc_1:0bmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/RefEnter_1:0F
model/rnn/TensorArray_1:0)model/rnn/while/TensorArrayReadV3/Enter:0�
Wmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/f_acc_1:0Zmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/RefEnter_1:0u
Fmodel/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0+model/rnn/while/TensorArrayReadV3/Enter_1:0�
]model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/f_acc:0`model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/RefEnter:0f
"rnn/gru_cell/candidate/bias/read:0@model/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter:0�
Xmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/f_acc:0[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/RefEnter:0�
Umodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/f_acc:0Xmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/RefEnter:0�
Cmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul/f_acc:0Fmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul/RefEnter:0�
Cmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1/f_acc:0Fmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul_1/RefEnter:0Rmodel/rnn/while/Enter:0Rmodel/rnn/while/Enter_1:0Rmodel/rnn/while/Enter_2:0Rmodel/gradients/f_count_1:0"�
	variables��
O
embeddings/Variable:0embeddings/Variable/Assignembeddings/Variable/read:0
a
rnn/gru_cell/gates/kernel:0 rnn/gru_cell/gates/kernel/Assign rnn/gru_cell/gates/kernel/read:0
[
rnn/gru_cell/gates/bias:0rnn/gru_cell/gates/bias/Assignrnn/gru_cell/gates/bias/read:0
m
rnn/gru_cell/candidate/kernel:0$rnn/gru_cell/candidate/kernel/Assign$rnn/gru_cell/candidate/kernel/read:0
g
rnn/gru_cell/candidate/bias:0"rnn/gru_cell/candidate/bias/Assign"rnn/gru_cell/candidate/bias/read:0
:
dense/kernel:0dense/kernel/Assigndense/kernel/read:0
4
dense/bias:0dense/bias/Assigndense/bias/read:0
I
model/beta1_power:0model/beta1_power/Assignmodel/beta1_power/read:0
I
model/beta2_power:0model/beta2_power/Assignmodel/beta2_power/re