       £K"	  @WXXÖAbrain.Event:2Ņ©Õš,     c7Ņ	ŽqWXXÖA"ćŁ
n
PlaceholderPlaceholder*'
_output_shapes
:’’’’’’’’’*
shape:’’’’’’’’’*
dtype0
h
Placeholder_1Placeholder*#
_output_shapes
:’’’’’’’’’*
shape:’’’’’’’’’*
dtype0
h
Placeholder_2Placeholder*#
_output_shapes
:’’’’’’’’’*
shape:’’’’’’’’’*
dtype0
e
random_uniform/shapeConst*
_output_shapes
:*
valueB"”: d   *
dtype0
W
random_uniform/minConst*
_output_shapes
: *
valueB
 *  æ*
dtype0
W
random_uniform/maxConst*
_output_shapes
: *
valueB
 *  ?*
dtype0

random_uniform/RandomUniformRandomUniformrandom_uniform/shape*
T0* 
_output_shapes
:
”õd*

seed *
dtype0*
seed2 
b
random_uniform/subSubrandom_uniform/maxrandom_uniform/min*
T0*
_output_shapes
: 
v
random_uniform/mulMulrandom_uniform/RandomUniformrandom_uniform/sub*
T0* 
_output_shapes
:
”õd
h
random_uniformAddrandom_uniform/mulrandom_uniform/min*
T0* 
_output_shapes
:
”õd

Variable
VariableV2* 
_output_shapes
:
”õd*
	container *
shape:
”õd*
dtype0*
shared_name 
¤
Variable/AssignAssignVariablerandom_uniform*
T0*
_class
loc:@Variable*
validate_shape(*
use_locking(* 
_output_shapes
:
”õd
k
Variable/readIdentityVariable*
T0*
_class
loc:@Variable* 
_output_shapes
:
”õd
·
embedding_lookupGatherVariable/readPlaceholder*+
_output_shapes
:’’’’’’’’’d*
Tparams0*
Tindices0*
validate_indices(*
_class
loc:@Variable
F
RankConst*
_output_shapes
: *
value	B :*
dtype0
M
range/startConst*
_output_shapes
: *
value	B :*
dtype0
M
range/deltaConst*
_output_shapes
: *
value	B :*
dtype0
V
rangeRangerange/startRankrange/delta*
_output_shapes
:*

Tidx0
`
concat/values_0Const*
_output_shapes
:*
valueB"       *
dtype0
M
concat/axisConst*
_output_shapes
: *
value	B : *
dtype0
q
concatConcatV2concat/values_0rangeconcat/axis*
T0*
_output_shapes
:*
N*

Tidx0
s
	transpose	Transposeembedding_lookupconcat*
T0*+
_output_shapes
:’’’’’’’’’d*
Tperm0
R
	rnn/ShapeShape	transpose*
T0*
_output_shapes
:*
out_type0
a
rnn/strided_slice/stackConst*
_output_shapes
:*
valueB:*
dtype0
c
rnn/strided_slice/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
c
rnn/strided_slice/stack_2Const*
_output_shapes
:*
valueB:*
dtype0

rnn/strided_sliceStridedSlice	rnn/Shapernn/strided_slice/stackrnn/strided_slice/stack_1rnn/strided_slice/stack_2*
T0*
Index0*
new_axis_mask *

begin_mask *
ellipsis_mask *
_output_shapes
: *
shrink_axis_mask*
end_mask 
c
rnn/strided_slice_1/stackConst*
_output_shapes
:*
valueB:*
dtype0
e
rnn/strided_slice_1/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
e
rnn/strided_slice_1/stack_2Const*
_output_shapes
:*
valueB:*
dtype0

rnn/strided_slice_1StridedSlice	rnn/Shapernn/strided_slice_1/stackrnn/strided_slice_1/stack_1rnn/strided_slice_1/stack_2*
T0*
Index0*
new_axis_mask *

begin_mask *
ellipsis_mask *
_output_shapes
: *
shrink_axis_mask*
end_mask 
e
#rnn/GRUCellZeroState/ExpandDims/dimConst*
_output_shapes
: *
value	B : *
dtype0

rnn/GRUCellZeroState/ExpandDims
ExpandDimsrnn/strided_slice#rnn/GRUCellZeroState/ExpandDims/dim*
T0*
_output_shapes
:*

Tdim0
e
rnn/GRUCellZeroState/ConstConst*
_output_shapes
:*
valueB:*
dtype0
b
 rnn/GRUCellZeroState/concat/axisConst*
_output_shapes
: *
value	B : *
dtype0
Ą
rnn/GRUCellZeroState/concatConcatV2rnn/GRUCellZeroState/ExpandDimsrnn/GRUCellZeroState/Const rnn/GRUCellZeroState/concat/axis*
T0*
_output_shapes
:*
N*

Tidx0
g
%rnn/GRUCellZeroState/ExpandDims_1/dimConst*
_output_shapes
: *
value	B : *
dtype0

!rnn/GRUCellZeroState/ExpandDims_1
ExpandDimsrnn/strided_slice%rnn/GRUCellZeroState/ExpandDims_1/dim*
T0*
_output_shapes
:*

Tdim0
g
rnn/GRUCellZeroState/Const_1Const*
_output_shapes
:*
valueB:*
dtype0
e
 rnn/GRUCellZeroState/zeros/ConstConst*
_output_shapes
: *
valueB
 *    *
dtype0

rnn/GRUCellZeroState/zerosFillrnn/GRUCellZeroState/concat rnn/GRUCellZeroState/zeros/Const*
T0*(
_output_shapes
:’’’’’’’’’
T
rnn/Shape_1Shape	transpose*
T0*
_output_shapes
:*
out_type0
c
rnn/strided_slice_2/stackConst*
_output_shapes
:*
valueB: *
dtype0
e
rnn/strided_slice_2/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
e
rnn/strided_slice_2/stack_2Const*
_output_shapes
:*
valueB:*
dtype0

rnn/strided_slice_2StridedSlicernn/Shape_1rnn/strided_slice_2/stackrnn/strided_slice_2/stack_1rnn/strided_slice_2/stack_2*
T0*
Index0*
new_axis_mask *

begin_mask *
ellipsis_mask *
_output_shapes
: *
shrink_axis_mask*
end_mask 
c
rnn/strided_slice_3/stackConst*
_output_shapes
:*
valueB:*
dtype0
e
rnn/strided_slice_3/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
e
rnn/strided_slice_3/stack_2Const*
_output_shapes
:*
valueB:*
dtype0

rnn/strided_slice_3StridedSlicernn/Shape_1rnn/strided_slice_3/stackrnn/strided_slice_3/stack_1rnn/strided_slice_3/stack_2*
T0*
Index0*
new_axis_mask *

begin_mask *
ellipsis_mask *
_output_shapes
: *
shrink_axis_mask*
end_mask 
T
rnn/ExpandDims/dimConst*
_output_shapes
: *
value	B : *
dtype0
v
rnn/ExpandDims
ExpandDimsrnn/strided_slice_3rnn/ExpandDims/dim*
T0*
_output_shapes
:*

Tdim0
T
	rnn/ConstConst*
_output_shapes
:*
valueB:*
dtype0
Q
rnn/concat/axisConst*
_output_shapes
: *
value	B : *
dtype0
|

rnn/concatConcatV2rnn/ExpandDims	rnn/Constrnn/concat/axis*
T0*
_output_shapes
:*
N*

Tidx0
T
rnn/zeros/ConstConst*
_output_shapes
: *
valueB
 *    *
dtype0
a
	rnn/zerosFill
rnn/concatrnn/zeros/Const*
T0*(
_output_shapes
:’’’’’’’’’
J
rnn/timeConst*
_output_shapes
: *
value	B : *
dtype0
Ō
rnn/TensorArrayTensorArrayV3rnn/strided_slice_2*
dynamic_size( *
dtype0*
_output_shapes

:: *
element_shape:*/
tensor_array_namernn/dynamic_rnn/output_0*
clear_after_read(
Õ
rnn/TensorArray_1TensorArrayV3rnn/strided_slice_2*
dynamic_size( *
dtype0*
_output_shapes

:: *
element_shape:*.
tensor_array_namernn/dynamic_rnn/input_0*
clear_after_read(
e
rnn/TensorArrayUnstack/ShapeShape	transpose*
T0*
_output_shapes
:*
out_type0
t
*rnn/TensorArrayUnstack/strided_slice/stackConst*
_output_shapes
:*
valueB: *
dtype0
v
,rnn/TensorArrayUnstack/strided_slice/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
v
,rnn/TensorArrayUnstack/strided_slice/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
ģ
$rnn/TensorArrayUnstack/strided_sliceStridedSlicernn/TensorArrayUnstack/Shape*rnn/TensorArrayUnstack/strided_slice/stack,rnn/TensorArrayUnstack/strided_slice/stack_1,rnn/TensorArrayUnstack/strided_slice/stack_2*
T0*
Index0*
new_axis_mask *

begin_mask *
ellipsis_mask *
_output_shapes
: *
shrink_axis_mask*
end_mask 
d
"rnn/TensorArrayUnstack/range/startConst*
_output_shapes
: *
value	B : *
dtype0
d
"rnn/TensorArrayUnstack/range/deltaConst*
_output_shapes
: *
value	B :*
dtype0
Ä
rnn/TensorArrayUnstack/rangeRange"rnn/TensorArrayUnstack/range/start$rnn/TensorArrayUnstack/strided_slice"rnn/TensorArrayUnstack/range/delta*#
_output_shapes
:’’’’’’’’’*

Tidx0
ę
>rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3TensorArrayScatterV3rnn/TensorArray_1rnn/TensorArrayUnstack/range	transposernn/TensorArray_1:1*
T0*
_class
loc:@transpose*
_output_shapes
: 

rnn/while/EnterEnterrnn/time*
T0*
_output_shapes
: *
parallel_iterations *$

frame_namernn/while/rnn/while/*
is_constant( 
¢
rnn/while/Enter_1Enterrnn/TensorArray:1*
T0*
_output_shapes
: *
parallel_iterations *$

frame_namernn/while/rnn/while/*
is_constant( 
½
rnn/while/Enter_2Enterrnn/GRUCellZeroState/zeros*
T0*(
_output_shapes
:’’’’’’’’’*
parallel_iterations *$

frame_namernn/while/rnn/while/*
is_constant( 
n
rnn/while/MergeMergernn/while/Enterrnn/while/NextIteration*
T0*
_output_shapes
: : *
N
t
rnn/while/Merge_1Mergernn/while/Enter_1rnn/while/NextIteration_1*
T0*
_output_shapes
: : *
N

rnn/while/Merge_2Mergernn/while/Enter_2rnn/while/NextIteration_2*
T0**
_output_shapes
:’’’’’’’’’: *
N
§
rnn/while/Less/EnterEnterrnn/strided_slice_2*
T0*
_output_shapes
: *
parallel_iterations *$

frame_namernn/while/rnn/while/*
is_constant(
^
rnn/while/LessLessrnn/while/Mergernn/while/Less/Enter*
T0*
_output_shapes
: 
F
rnn/while/LoopCondLoopCondrnn/while/Less*
_output_shapes
: 

rnn/while/SwitchSwitchrnn/while/Mergernn/while/LoopCond*
T0*"
_class
loc:@rnn/while/Merge*
_output_shapes
: : 

rnn/while/Switch_1Switchrnn/while/Merge_1rnn/while/LoopCond*
T0*$
_class
loc:@rnn/while/Merge_1*
_output_shapes
: : 
°
rnn/while/Switch_2Switchrnn/while/Merge_2rnn/while/LoopCond*
T0*$
_class
loc:@rnn/while/Merge_2*<
_output_shapes*
(:’’’’’’’’’:’’’’’’’’’
S
rnn/while/IdentityIdentityrnn/while/Switch:1*
T0*
_output_shapes
: 
W
rnn/while/Identity_1Identityrnn/while/Switch_1:1*
T0*
_output_shapes
: 
i
rnn/while/Identity_2Identityrnn/while/Switch_2:1*
T0*(
_output_shapes
:’’’’’’’’’
¶
!rnn/while/TensorArrayReadV3/EnterEnterrnn/TensorArray_1*
T0*
_output_shapes
:*
parallel_iterations *$

frame_namernn/while/rnn/while/*
is_constant(
į
#rnn/while/TensorArrayReadV3/Enter_1Enter>rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*
T0*
_output_shapes
: *
parallel_iterations *$

frame_namernn/while/rnn/while/*
is_constant(
Ā
rnn/while/TensorArrayReadV3TensorArrayReadV3!rnn/while/TensorArrayReadV3/Enterrnn/while/Identity#rnn/while/TensorArrayReadV3/Enter_1*'
_output_shapes
:’’’’’’’’’d*
dtype0
¹
:rnn/gru_cell/gates/kernel/Initializer/random_uniform/shapeConst*
_output_shapes
:*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
valueB"d     *
dtype0
«
8rnn/gru_cell/gates/kernel/Initializer/random_uniform/minConst*
_output_shapes
: *,
_class"
 loc:@rnn/gru_cell/gates/kernel*
valueB
 *|x½*
dtype0
«
8rnn/gru_cell/gates/kernel/Initializer/random_uniform/maxConst*
_output_shapes
: *,
_class"
 loc:@rnn/gru_cell/gates/kernel*
valueB
 *|x=*
dtype0

Brnn/gru_cell/gates/kernel/Initializer/random_uniform/RandomUniformRandomUniform:rnn/gru_cell/gates/kernel/Initializer/random_uniform/shape*
T0*
dtype0*
seed2 * 
_output_shapes
:
ä*,
_class"
 loc:@rnn/gru_cell/gates/kernel*

seed 

8rnn/gru_cell/gates/kernel/Initializer/random_uniform/subSub8rnn/gru_cell/gates/kernel/Initializer/random_uniform/max8rnn/gru_cell/gates/kernel/Initializer/random_uniform/min*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
_output_shapes
: 

8rnn/gru_cell/gates/kernel/Initializer/random_uniform/mulMulBrnn/gru_cell/gates/kernel/Initializer/random_uniform/RandomUniform8rnn/gru_cell/gates/kernel/Initializer/random_uniform/sub*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel* 
_output_shapes
:
ä

4rnn/gru_cell/gates/kernel/Initializer/random_uniformAdd8rnn/gru_cell/gates/kernel/Initializer/random_uniform/mul8rnn/gru_cell/gates/kernel/Initializer/random_uniform/min*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel* 
_output_shapes
:
ä
æ
rnn/gru_cell/gates/kernel
VariableV2*
dtype0*,
_class"
 loc:@rnn/gru_cell/gates/kernel* 
_output_shapes
:
ä*
shared_name *
shape:
ä*
	container 
ż
 rnn/gru_cell/gates/kernel/AssignAssignrnn/gru_cell/gates/kernel4rnn/gru_cell/gates/kernel/Initializer/random_uniform*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
ä
p
rnn/gru_cell/gates/kernel/readIdentityrnn/gru_cell/gates/kernel*
T0* 
_output_shapes
:
ä

.rnn/while/rnn/gru_cell/gates/gates/concat/axisConst^rnn/while/Identity*
_output_shapes
: *
value	B :*
dtype0
ą
)rnn/while/rnn/gru_cell/gates/gates/concatConcatV2rnn/while/TensorArrayReadV3rnn/while/Identity_2.rnn/while/rnn/gru_cell/gates/gates/concat/axis*
T0*(
_output_shapes
:’’’’’’’’’ä*
N*

Tidx0
×
/rnn/while/rnn/gru_cell/gates/gates/MatMul/EnterEnterrnn/gru_cell/gates/kernel/read*
T0* 
_output_shapes
:
ä*
parallel_iterations *$

frame_namernn/while/rnn/while/*
is_constant(
č
)rnn/while/rnn/gru_cell/gates/gates/MatMulMatMul)rnn/while/rnn/gru_cell/gates/gates/concat/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter*
T0*(
_output_shapes
:’’’’’’’’’*
transpose_b( *
transpose_a( 
¤
)rnn/gru_cell/gates/bias/Initializer/ConstConst*
_output_shapes	
:**
_class 
loc:@rnn/gru_cell/gates/bias*
valueB*  ?*
dtype0
±
rnn/gru_cell/gates/bias
VariableV2*
dtype0**
_class 
loc:@rnn/gru_cell/gates/bias*
_output_shapes	
:*
shared_name *
shape:*
	container 
ē
rnn/gru_cell/gates/bias/AssignAssignrnn/gru_cell/gates/bias)rnn/gru_cell/gates/bias/Initializer/Const*
T0**
_class 
loc:@rnn/gru_cell/gates/bias*
validate_shape(*
use_locking(*
_output_shapes	
:
g
rnn/gru_cell/gates/bias/readIdentityrnn/gru_cell/gates/bias*
T0*
_output_shapes	
:
Ń
0rnn/while/rnn/gru_cell/gates/gates/BiasAdd/EnterEnterrnn/gru_cell/gates/bias/read*
T0*
_output_shapes	
:*
parallel_iterations *$

frame_namernn/while/rnn/while/*
is_constant(
Ü
*rnn/while/rnn/gru_cell/gates/gates/BiasAddBiasAdd)rnn/while/rnn/gru_cell/gates/gates/MatMul0rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter*
T0*
data_formatNHWC*(
_output_shapes
:’’’’’’’’’

$rnn/while/rnn/gru_cell/gates/SigmoidSigmoid*rnn/while/rnn/gru_cell/gates/gates/BiasAdd*
T0*(
_output_shapes
:’’’’’’’’’
y
"rnn/while/rnn/gru_cell/gates/ConstConst^rnn/while/Identity*
_output_shapes
: *
value	B :*
dtype0

,rnn/while/rnn/gru_cell/gates/split/split_dimConst^rnn/while/Identity*
_output_shapes
: *
value	B :*
dtype0
×
"rnn/while/rnn/gru_cell/gates/splitSplit,rnn/while/rnn/gru_cell/gates/split/split_dim$rnn/while/rnn/gru_cell/gates/Sigmoid*
T0*<
_output_shapes*
(:’’’’’’’’’:’’’’’’’’’*
	num_split

$rnn/while/rnn/gru_cell/candidate/mulMul"rnn/while/rnn/gru_cell/gates/splitrnn/while/Identity_2*
T0*(
_output_shapes
:’’’’’’’’’
Į
>rnn/gru_cell/candidate/kernel/Initializer/random_uniform/shapeConst*
_output_shapes
:*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
valueB"d     *
dtype0
³
<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/minConst*
_output_shapes
: *0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
valueB
 *”½*
dtype0
³
<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/maxConst*
_output_shapes
: *0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
valueB
 *”=*
dtype0

Frnn/gru_cell/candidate/kernel/Initializer/random_uniform/RandomUniformRandomUniform>rnn/gru_cell/candidate/kernel/Initializer/random_uniform/shape*
T0*
dtype0*
seed2 * 
_output_shapes
:
ä*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*

seed 

<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/subSub<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/max<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/min*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
_output_shapes
: 
¦
<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/mulMulFrnn/gru_cell/candidate/kernel/Initializer/random_uniform/RandomUniform<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/sub*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel* 
_output_shapes
:
ä

8rnn/gru_cell/candidate/kernel/Initializer/random_uniformAdd<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/mul<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/min*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel* 
_output_shapes
:
ä
Ē
rnn/gru_cell/candidate/kernel
VariableV2*
dtype0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel* 
_output_shapes
:
ä*
shared_name *
shape:
ä*
	container 

$rnn/gru_cell/candidate/kernel/AssignAssignrnn/gru_cell/candidate/kernel8rnn/gru_cell/candidate/kernel/Initializer/random_uniform*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
ä
x
"rnn/gru_cell/candidate/kernel/readIdentityrnn/gru_cell/candidate/kernel*
T0* 
_output_shapes
:
ä

6rnn/while/rnn/gru_cell/candidate/candidate/concat/axisConst^rnn/while/Identity*
_output_shapes
: *
value	B :*
dtype0

1rnn/while/rnn/gru_cell/candidate/candidate/concatConcatV2rnn/while/TensorArrayReadV3$rnn/while/rnn/gru_cell/candidate/mul6rnn/while/rnn/gru_cell/candidate/candidate/concat/axis*
T0*(
_output_shapes
:’’’’’’’’’ä*
N*

Tidx0
ć
7rnn/while/rnn/gru_cell/candidate/candidate/MatMul/EnterEnter"rnn/gru_cell/candidate/kernel/read*
T0* 
_output_shapes
:
ä*
parallel_iterations *$

frame_namernn/while/rnn/while/*
is_constant(

1rnn/while/rnn/gru_cell/candidate/candidate/MatMulMatMul1rnn/while/rnn/gru_cell/candidate/candidate/concat7rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter*
T0*(
_output_shapes
:’’’’’’’’’*
transpose_b( *
transpose_a( 
¬
-rnn/gru_cell/candidate/bias/Initializer/ConstConst*
_output_shapes	
:*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
valueB*    *
dtype0
¹
rnn/gru_cell/candidate/bias
VariableV2*
dtype0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
_output_shapes	
:*
shared_name *
shape:*
	container 
÷
"rnn/gru_cell/candidate/bias/AssignAssignrnn/gru_cell/candidate/bias-rnn/gru_cell/candidate/bias/Initializer/Const*
T0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
validate_shape(*
use_locking(*
_output_shapes	
:
o
 rnn/gru_cell/candidate/bias/readIdentityrnn/gru_cell/candidate/bias*
T0*
_output_shapes	
:
Ż
8rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/EnterEnter rnn/gru_cell/candidate/bias/read*
T0*
_output_shapes	
:*
parallel_iterations *$

frame_namernn/while/rnn/while/*
is_constant(
ō
2rnn/while/rnn/gru_cell/candidate/candidate/BiasAddBiasAdd1rnn/while/rnn/gru_cell/candidate/candidate/MatMul8rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter*
T0*
data_formatNHWC*(
_output_shapes
:’’’’’’’’’

%rnn/while/rnn/gru_cell/candidate/TanhTanh2rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd*
T0*(
_output_shapes
:’’’’’’’’’

rnn/while/rnn/gru_cell/mulMul$rnn/while/rnn/gru_cell/gates/split:1rnn/while/Identity_2*
T0*(
_output_shapes
:’’’’’’’’’
v
rnn/while/rnn/gru_cell/sub/xConst^rnn/while/Identity*
_output_shapes
: *
valueB
 *  ?*
dtype0

rnn/while/rnn/gru_cell/subSubrnn/while/rnn/gru_cell/sub/x$rnn/while/rnn/gru_cell/gates/split:1*
T0*(
_output_shapes
:’’’’’’’’’

rnn/while/rnn/gru_cell/mul_1Mulrnn/while/rnn/gru_cell/sub%rnn/while/rnn/gru_cell/candidate/Tanh*
T0*(
_output_shapes
:’’’’’’’’’

rnn/while/rnn/gru_cell/addAddrnn/while/rnn/gru_cell/mulrnn/while/rnn/gru_cell/mul_1*
T0*(
_output_shapes
:’’’’’’’’’
õ
3rnn/while/TensorArrayWrite/TensorArrayWriteV3/EnterEnterrnn/TensorArray*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*-
_class#
!loc:@rnn/while/rnn/gru_cell/add*
is_constant(

-rnn/while/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV33rnn/while/TensorArrayWrite/TensorArrayWriteV3/Enterrnn/while/Identityrnn/while/rnn/gru_cell/addrnn/while/Identity_1*
T0*-
_class#
!loc:@rnn/while/rnn/gru_cell/add*
_output_shapes
: 
f
rnn/while/add/yConst^rnn/while/Identity*
_output_shapes
: *
value	B :*
dtype0
Z
rnn/while/addAddrnn/while/Identityrnn/while/add/y*
T0*
_output_shapes
: 
X
rnn/while/NextIterationNextIterationrnn/while/add*
T0*
_output_shapes
: 
z
rnn/while/NextIteration_1NextIteration-rnn/while/TensorArrayWrite/TensorArrayWriteV3*
T0*
_output_shapes
: 
y
rnn/while/NextIteration_2NextIterationrnn/while/rnn/gru_cell/add*
T0*(
_output_shapes
:’’’’’’’’’
I
rnn/while/ExitExitrnn/while/Switch*
T0*
_output_shapes
: 
M
rnn/while/Exit_1Exitrnn/while/Switch_1*
T0*
_output_shapes
: 
_
rnn/while/Exit_2Exitrnn/while/Switch_2*
T0*(
_output_shapes
:’’’’’’’’’

&rnn/TensorArrayStack/TensorArraySizeV3TensorArraySizeV3rnn/TensorArrayrnn/while/Exit_1*
_output_shapes
: *"
_class
loc:@rnn/TensorArray

 rnn/TensorArrayStack/range/startConst*
_output_shapes
: *"
_class
loc:@rnn/TensorArray*
value	B : *
dtype0

 rnn/TensorArrayStack/range/deltaConst*
_output_shapes
: *"
_class
loc:@rnn/TensorArray*
value	B :*
dtype0
ä
rnn/TensorArrayStack/rangeRange rnn/TensorArrayStack/range/start&rnn/TensorArrayStack/TensorArraySizeV3 rnn/TensorArrayStack/range/delta*#
_output_shapes
:’’’’’’’’’*"
_class
loc:@rnn/TensorArray*

Tidx0

(rnn/TensorArrayStack/TensorArrayGatherV3TensorArrayGatherV3rnn/TensorArrayrnn/TensorArrayStack/rangernn/while/Exit_1*,
_output_shapes
:’’’’’’’’’*%
element_shape:’’’’’’’’’*
dtype0*"
_class
loc:@rnn/TensorArray
V
rnn/Const_1Const*
_output_shapes
:*
valueB:*
dtype0
J
rnn/RankConst*
_output_shapes
: *
value	B :*
dtype0
Q
rnn/range/startConst*
_output_shapes
: *
value	B :*
dtype0
Q
rnn/range/deltaConst*
_output_shapes
: *
value	B :*
dtype0
f
	rnn/rangeRangernn/range/startrnn/Rankrnn/range/delta*
_output_shapes
:*

Tidx0
f
rnn/concat_1/values_0Const*
_output_shapes
:*
valueB"       *
dtype0
S
rnn/concat_1/axisConst*
_output_shapes
: *
value	B : *
dtype0

rnn/concat_1ConcatV2rnn/concat_1/values_0	rnn/rangernn/concat_1/axis*
T0*
_output_shapes
:*
N*

Tidx0

rnn/transpose	Transpose(rnn/TensorArrayStack/TensorArrayGatherV3rnn/concat_1*
T0*,
_output_shapes
:’’’’’’’’’*
Tperm0

-dense/kernel/Initializer/random_uniform/shapeConst*
_output_shapes
:*
_class
loc:@dense/kernel*
valueB"   ”: *
dtype0

+dense/kernel/Initializer/random_uniform/minConst*
_output_shapes
: *
_class
loc:@dense/kernel*
valueB
 * ö¼*
dtype0

+dense/kernel/Initializer/random_uniform/maxConst*
_output_shapes
: *
_class
loc:@dense/kernel*
valueB
 * ö<*
dtype0
č
5dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform-dense/kernel/Initializer/random_uniform/shape*
T0*
dtype0*
seed2 *!
_output_shapes
:”õ*
_class
loc:@dense/kernel*

seed 
Ī
+dense/kernel/Initializer/random_uniform/subSub+dense/kernel/Initializer/random_uniform/max+dense/kernel/Initializer/random_uniform/min*
T0*
_class
loc:@dense/kernel*
_output_shapes
: 
ć
+dense/kernel/Initializer/random_uniform/mulMul5dense/kernel/Initializer/random_uniform/RandomUniform+dense/kernel/Initializer/random_uniform/sub*
T0*
_class
loc:@dense/kernel*!
_output_shapes
:”õ
Õ
'dense/kernel/Initializer/random_uniformAdd+dense/kernel/Initializer/random_uniform/mul+dense/kernel/Initializer/random_uniform/min*
T0*
_class
loc:@dense/kernel*!
_output_shapes
:”õ
§
dense/kernel
VariableV2*
dtype0*
_class
loc:@dense/kernel*!
_output_shapes
:”õ*
shared_name *
shape:”õ*
	container 
Ź
dense/kernel/AssignAssigndense/kernel'dense/kernel/Initializer/random_uniform*
T0*
_class
loc:@dense/kernel*
validate_shape(*
use_locking(*!
_output_shapes
:”õ
x
dense/kernel/readIdentitydense/kernel*
T0*
_class
loc:@dense/kernel*!
_output_shapes
:”õ

dense/bias/Initializer/zerosConst*
_output_shapes

:”õ*
_class
loc:@dense/bias*
valueB”õ*    *
dtype0


dense/bias
VariableV2*
dtype0*
_class
loc:@dense/bias*
_output_shapes

:”õ*
shared_name *
shape:”õ*
	container 
“
dense/bias/AssignAssign
dense/biasdense/bias/Initializer/zeros*
T0*
_class
loc:@dense/bias*
validate_shape(*
use_locking(*
_output_shapes

:”õ
m
dense/bias/readIdentity
dense/bias*
T0*
_class
loc:@dense/bias*
_output_shapes

:”õ

dense/MatMulMatMulrnn/while/Exit_2dense/kernel/read*
T0*)
_output_shapes
:’’’’’’’’’”õ*
transpose_b( *
transpose_a( 

dense/BiasAddBiasAdddense/MatMuldense/bias/read*
T0*
data_formatNHWC*)
_output_shapes
:’’’’’’’’’”õ
U
SoftmaxSoftmaxdense/BiasAdd*
T0*)
_output_shapes
:’’’’’’’’’”õ
v
)SparseSoftmaxCrossEntropyWithLogits/ShapeShapePlaceholder_1*
T0*
_output_shapes
:*
out_type0
Ž
GSparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits#SparseSoftmaxCrossEntropyWithLogitsdense/BiasAddPlaceholder_1*
T0*
Tlabels0*8
_output_shapes&
$:’’’’’’’’’:’’’’’’’’’”õ
O
ConstConst*
_output_shapes
:*
valueB: *
dtype0

MeanMeanGSparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogitsConst*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
R
gradients/ShapeConst*
_output_shapes
: *
valueB *
dtype0
T
gradients/ConstConst*
_output_shapes
: *
valueB
 *  ?*
dtype0
Y
gradients/FillFillgradients/Shapegradients/Const*
T0*
_output_shapes
: 
S
gradients/f_countConst*
_output_shapes
: *
value	B : *
dtype0
¤
gradients/f_count_1Entergradients/f_count*
T0*
_output_shapes
: *
parallel_iterations *$

frame_namernn/while/rnn/while/*
is_constant( 
r
gradients/MergeMergegradients/f_count_1gradients/NextIteration*
T0*
_output_shapes
: : *
N
b
gradients/SwitchSwitchgradients/Mergernn/while/LoopCond*
T0*
_output_shapes
: : 
f
gradients/Add/yConst^rnn/while/Identity*
_output_shapes
: *
value	B :*
dtype0
Z
gradients/AddAddgradients/Switch:1gradients/Add/y*
T0*
_output_shapes
: 
®
gradients/NextIterationNextIterationgradients/AddJ^gradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPushL^gradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPush_1J^gradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPushL^gradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPush_18^gradients/rnn/while/rnn/gru_cell/mul_grad/mul/StackPush:^gradients/rnn/while/rnn/gru_cell/mul_grad/mul_1/StackPushL^gradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPushN^gradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPush_1:^gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPush<^gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/StackPushJ^gradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPushT^gradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/StackPushO^gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/StackPushR^gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPushT^gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPush_1T^gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPushV^gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPush_1D^gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/StackPushC^gradients/rnn/while/rnn/gru_cell/gates/split_grad/concat/StackPushJ^gradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/StackPushL^gradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/StackPushG^gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/StackPushY^gradients/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/StackPush*
T0*
_output_shapes
: 
N
gradients/f_count_2Exitgradients/Switch*
T0*
_output_shapes
: 
S
gradients/b_countConst*
_output_shapes
: *
value	B :*
dtype0
°
gradients/b_count_1Entergradients/f_count_2*
T0*
_output_shapes
: *
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
is_constant( 
v
gradients/Merge_1Mergegradients/b_count_1gradients/NextIteration_1*
T0*
_output_shapes
: : *
N
·
gradients/GreaterEqual/EnterEntergradients/b_count*
T0*
_output_shapes
: *
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
is_constant(
x
gradients/GreaterEqualGreaterEqualgradients/Merge_1gradients/GreaterEqual/Enter*
T0*
_output_shapes
: 
O
gradients/b_count_2LoopCondgradients/GreaterEqual*
_output_shapes
: 
g
gradients/Switch_1Switchgradients/Merge_1gradients/b_count_2*
T0*
_output_shapes
: : 
i
gradients/SubSubgradients/Switch_1:1gradients/GreaterEqual/Enter*
T0*
_output_shapes
: 
£
gradients/NextIteration_1NextIterationgradients/SubG^gradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/b_sync*
T0*
_output_shapes
: 
P
gradients/b_count_3Exitgradients/Switch_1*
T0*
_output_shapes
: 
k
!gradients/Mean_grad/Reshape/shapeConst*
_output_shapes
:*
valueB:*
dtype0

gradients/Mean_grad/ReshapeReshapegradients/Fill!gradients/Mean_grad/Reshape/shape*
T0*
_output_shapes
:*
Tshape0
 
gradients/Mean_grad/ShapeShapeGSparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits*
T0*
_output_shapes
:*
out_type0

gradients/Mean_grad/TileTilegradients/Mean_grad/Reshapegradients/Mean_grad/Shape*
T0*#
_output_shapes
:’’’’’’’’’*

Tmultiples0
¢
gradients/Mean_grad/Shape_1ShapeGSparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits*
T0*
_output_shapes
:*
out_type0
^
gradients/Mean_grad/Shape_2Const*
_output_shapes
: *
valueB *
dtype0
c
gradients/Mean_grad/ConstConst*
_output_shapes
:*
valueB: *
dtype0

gradients/Mean_grad/ProdProdgradients/Mean_grad/Shape_1gradients/Mean_grad/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
e
gradients/Mean_grad/Const_1Const*
_output_shapes
:*
valueB: *
dtype0

gradients/Mean_grad/Prod_1Prodgradients/Mean_grad/Shape_2gradients/Mean_grad/Const_1*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
_
gradients/Mean_grad/Maximum/yConst*
_output_shapes
: *
value	B :*
dtype0

gradients/Mean_grad/MaximumMaximumgradients/Mean_grad/Prod_1gradients/Mean_grad/Maximum/y*
T0*
_output_shapes
: 

gradients/Mean_grad/floordivFloorDivgradients/Mean_grad/Prodgradients/Mean_grad/Maximum*
T0*
_output_shapes
: 
n
gradients/Mean_grad/CastCastgradients/Mean_grad/floordiv*

SrcT0*
_output_shapes
: *

DstT0

gradients/Mean_grad/truedivRealDivgradients/Mean_grad/Tilegradients/Mean_grad/Cast*
T0*#
_output_shapes
:’’’’’’’’’
 
gradients/zeros_like	ZerosLikeISparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits:1*
T0*)
_output_shapes
:’’’’’’’’’”õ
Æ
fgradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/PreventGradientPreventGradientISparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits:1*
T0*“
messageØ„Currently there is no way to take the second derivative of sparse_softmax_cross_entropy_with_logits due to the fused implementation's interaction with tf.gradients()*)
_output_shapes
:’’’’’’’’’”õ
°
egradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDims/dimConst*
_output_shapes
: *
valueB :
’’’’’’’’’*
dtype0
±
agradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDims
ExpandDimsgradients/Mean_grad/truedivegradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDims/dim*
T0*'
_output_shapes
:’’’’’’’’’*

Tdim0
ą
Zgradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mulMulagradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDimsfgradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/PreventGradient*
T0*)
_output_shapes
:’’’’’’’’’”õ
Ń
(gradients/dense/BiasAdd_grad/BiasAddGradBiasAddGradZgradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mul*
T0*
data_formatNHWC*
_output_shapes

:”õ
½
-gradients/dense/BiasAdd_grad/tuple/group_depsNoOp[^gradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mul)^gradients/dense/BiasAdd_grad/BiasAddGrad
š
5gradients/dense/BiasAdd_grad/tuple/control_dependencyIdentityZgradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mul.^gradients/dense/BiasAdd_grad/tuple/group_deps*
T0*m
_classc
a_loc:@gradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mul*)
_output_shapes
:’’’’’’’’’”õ

7gradients/dense/BiasAdd_grad/tuple/control_dependency_1Identity(gradients/dense/BiasAdd_grad/BiasAddGrad.^gradients/dense/BiasAdd_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients/dense/BiasAdd_grad/BiasAddGrad*
_output_shapes

:”õ
Ļ
"gradients/dense/MatMul_grad/MatMulMatMul5gradients/dense/BiasAdd_grad/tuple/control_dependencydense/kernel/read*
T0*(
_output_shapes
:’’’’’’’’’*
transpose_b(*
transpose_a( 
É
$gradients/dense/MatMul_grad/MatMul_1MatMulrnn/while/Exit_25gradients/dense/BiasAdd_grad/tuple/control_dependency*
T0*!
_output_shapes
:”õ*
transpose_b( *
transpose_a(

,gradients/dense/MatMul_grad/tuple/group_depsNoOp#^gradients/dense/MatMul_grad/MatMul%^gradients/dense/MatMul_grad/MatMul_1
ż
4gradients/dense/MatMul_grad/tuple/control_dependencyIdentity"gradients/dense/MatMul_grad/MatMul-^gradients/dense/MatMul_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients/dense/MatMul_grad/MatMul*(
_output_shapes
:’’’’’’’’’
ü
6gradients/dense/MatMul_grad/tuple/control_dependency_1Identity$gradients/dense/MatMul_grad/MatMul_1-^gradients/dense/MatMul_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients/dense/MatMul_grad/MatMul_1*!
_output_shapes
:”õ
T
gradients/zerosConst*
_output_shapes
: *
valueB
 *    *
dtype0
ö
&gradients/rnn/while/Exit_2_grad/b_exitEnter4gradients/dense/MatMul_grad/tuple/control_dependency*
T0*(
_output_shapes
:’’’’’’’’’*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
is_constant( 
æ
&gradients/rnn/while/Exit_1_grad/b_exitEntergradients/zeros*
T0*
_output_shapes
: *
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
is_constant( 
Ģ
*gradients/rnn/while/Switch_2_grad/b_switchMerge&gradients/rnn/while/Exit_2_grad/b_exit1gradients/rnn/while/Switch_2_grad_1/NextIteration*
T0**
_output_shapes
:’’’’’’’’’: *
N
ų
'gradients/rnn/while/Merge_2_grad/SwitchSwitch*gradients/rnn/while/Switch_2_grad/b_switchgradients/b_count_2*
T0*=
_class3
1/loc:@gradients/rnn/while/Switch_2_grad/b_switch*<
_output_shapes*
(:’’’’’’’’’:’’’’’’’’’
c
1gradients/rnn/while/Merge_2_grad/tuple/group_depsNoOp(^gradients/rnn/while/Merge_2_grad/Switch

9gradients/rnn/while/Merge_2_grad/tuple/control_dependencyIdentity'gradients/rnn/while/Merge_2_grad/Switch2^gradients/rnn/while/Merge_2_grad/tuple/group_deps*
T0*=
_class3
1/loc:@gradients/rnn/while/Switch_2_grad/b_switch*(
_output_shapes
:’’’’’’’’’

;gradients/rnn/while/Merge_2_grad/tuple/control_dependency_1Identity)gradients/rnn/while/Merge_2_grad/Switch:12^gradients/rnn/while/Merge_2_grad/tuple/group_deps*
T0*=
_class3
1/loc:@gradients/rnn/while/Switch_2_grad/b_switch*(
_output_shapes
:’’’’’’’’’

%gradients/rnn/while/Enter_2_grad/ExitExit9gradients/rnn/while/Merge_2_grad/tuple/control_dependency*
T0*(
_output_shapes
:’’’’’’’’’

/gradients/rnn/GRUCellZeroState/zeros_grad/ConstConst*
_output_shapes
:*
valueB"       *
dtype0
Ź
-gradients/rnn/GRUCellZeroState/zeros_grad/SumSum%gradients/rnn/while/Enter_2_grad/Exit/gradients/rnn/GRUCellZeroState/zeros_grad/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0

/gradients/rnn/while/rnn/gru_cell/add_grad/ShapeShapernn/while/rnn/gru_cell/mul*
T0*
_output_shapes
:*
out_type0

1gradients/rnn/while/rnn/gru_cell/add_grad/Shape_1Shapernn/while/rnn/gru_cell/mul_1*
T0*
_output_shapes
:*
out_type0
Ń
Egradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/f_accStack*

stack_name *B
_class8
64loc:@gradients/rnn/while/rnn/gru_cell/add_grad/Shape*
	elem_type0*
_output_shapes
:
Ų
Hgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/RefEnterRefEnterEgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*B
_class8
64loc:@gradients/rnn/while/rnn/gru_cell/add_grad/Shape*
is_constant(
Ż
Igradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPush	StackPushHgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/RefEnter/gradients/rnn/while/rnn/gru_cell/add_grad/Shape^gradients/Add*
T0*
swap_memory( *
_output_shapes
:*B
_class8
64loc:@gradients/rnn/while/rnn/gru_cell/add_grad/Shape
ė
Qgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop/RefEnterRefEnterEgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*B
_class8
64loc:@gradients/rnn/while/rnn/gru_cell/add_grad/Shape*
is_constant(
Ø
Hgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPopStackPopQgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop/RefEnter^gradients/Sub*
_output_shapes
:*B
_class8
64loc:@gradients/rnn/while/rnn/gru_cell/add_grad/Shape*
	elem_type0

Fgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/b_syncControlTriggerI^gradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPopK^gradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop_1I^gradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPopK^gradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop_17^gradients/rnn/while/rnn/gru_cell/mul_grad/mul/StackPop9^gradients/rnn/while/rnn/gru_cell/mul_grad/mul_1/StackPopK^gradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPopM^gradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop_19^gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPop;^gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/StackPopI^gradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPopS^gradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/StackPopN^gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/StackPopQ^gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPopS^gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop_1S^gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPopU^gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop_1C^gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/StackPopB^gradients/rnn/while/rnn/gru_cell/gates/split_grad/concat/StackPopI^gradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/StackPopK^gradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/StackPopF^gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/StackPopX^gradients/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/StackPop
Õ
Ggradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/f_acc_1Stack*

stack_name *D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/add_grad/Shape_1*
	elem_type0*
_output_shapes
:
Ž
Jgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/RefEnter_1RefEnterGgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/add_grad/Shape_1*
is_constant(
å
Kgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPush_1	StackPushJgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/RefEnter_11gradients/rnn/while/rnn/gru_cell/add_grad/Shape_1^gradients/Add*
T0*
swap_memory( *
_output_shapes
:*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/add_grad/Shape_1
ń
Sgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop_1/RefEnterRefEnterGgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/add_grad/Shape_1*
is_constant(
®
Jgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop_1StackPopSgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop_1/RefEnter^gradients/Sub*
_output_shapes
:*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/add_grad/Shape_1*
	elem_type0
«
?gradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgsBroadcastGradientArgsHgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPopJgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop_1*
T0*2
_output_shapes 
:’’’’’’’’’:’’’’’’’’’
ņ
-gradients/rnn/while/rnn/gru_cell/add_grad/SumSum;gradients/rnn/while/Merge_2_grad/tuple/control_dependency_1?gradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
ž
1gradients/rnn/while/rnn/gru_cell/add_grad/ReshapeReshape-gradients/rnn/while/rnn/gru_cell/add_grad/SumHgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop*
T0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’*
Tshape0
ö
/gradients/rnn/while/rnn/gru_cell/add_grad/Sum_1Sum;gradients/rnn/while/Merge_2_grad/tuple/control_dependency_1Agradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0

3gradients/rnn/while/rnn/gru_cell/add_grad/Reshape_1Reshape/gradients/rnn/while/rnn/gru_cell/add_grad/Sum_1Jgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop_1*
T0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’*
Tshape0
¬
:gradients/rnn/while/rnn/gru_cell/add_grad/tuple/group_depsNoOp2^gradients/rnn/while/rnn/gru_cell/add_grad/Reshape4^gradients/rnn/while/rnn/gru_cell/add_grad/Reshape_1
·
Bgradients/rnn/while/rnn/gru_cell/add_grad/tuple/control_dependencyIdentity1gradients/rnn/while/rnn/gru_cell/add_grad/Reshape;^gradients/rnn/while/rnn/gru_cell/add_grad/tuple/group_deps*
T0*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/add_grad/Reshape*(
_output_shapes
:’’’’’’’’’
½
Dgradients/rnn/while/rnn/gru_cell/add_grad/tuple/control_dependency_1Identity3gradients/rnn/while/rnn/gru_cell/add_grad/Reshape_1;^gradients/rnn/while/rnn/gru_cell/add_grad/tuple/group_deps*
T0*F
_class<
:8loc:@gradients/rnn/while/rnn/gru_cell/add_grad/Reshape_1*(
_output_shapes
:’’’’’’’’’

/gradients/rnn/while/rnn/gru_cell/mul_grad/ShapeShape$rnn/while/rnn/gru_cell/gates/split:1*
T0*
_output_shapes
:*
out_type0

1gradients/rnn/while/rnn/gru_cell/mul_grad/Shape_1Shapernn/while/Identity_2*
T0*
_output_shapes
:*
out_type0
Ń
Egradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/f_accStack*

stack_name *B
_class8
64loc:@gradients/rnn/while/rnn/gru_cell/mul_grad/Shape*
	elem_type0*
_output_shapes
:
Ų
Hgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/RefEnterRefEnterEgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*B
_class8
64loc:@gradients/rnn/while/rnn/gru_cell/mul_grad/Shape*
is_constant(
Ż
Igradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPush	StackPushHgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/RefEnter/gradients/rnn/while/rnn/gru_cell/mul_grad/Shape^gradients/Add*
T0*
swap_memory( *
_output_shapes
:*B
_class8
64loc:@gradients/rnn/while/rnn/gru_cell/mul_grad/Shape
ė
Qgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop/RefEnterRefEnterEgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*B
_class8
64loc:@gradients/rnn/while/rnn/gru_cell/mul_grad/Shape*
is_constant(
Ø
Hgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPopStackPopQgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop/RefEnter^gradients/Sub*
_output_shapes
:*B
_class8
64loc:@gradients/rnn/while/rnn/gru_cell/mul_grad/Shape*
	elem_type0
Õ
Ggradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/f_acc_1Stack*

stack_name *D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/mul_grad/Shape_1*
	elem_type0*
_output_shapes
:
Ž
Jgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/RefEnter_1RefEnterGgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/mul_grad/Shape_1*
is_constant(
å
Kgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPush_1	StackPushJgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/RefEnter_11gradients/rnn/while/rnn/gru_cell/mul_grad/Shape_1^gradients/Add*
T0*
swap_memory( *
_output_shapes
:*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/mul_grad/Shape_1
ń
Sgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop_1/RefEnterRefEnterGgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/mul_grad/Shape_1*
is_constant(
®
Jgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop_1StackPopSgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop_1/RefEnter^gradients/Sub*
_output_shapes
:*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/mul_grad/Shape_1*
	elem_type0
«
?gradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgsBroadcastGradientArgsHgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPopJgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop_1*
T0*2
_output_shapes 
:’’’’’’’’’:’’’’’’’’’
¤
3gradients/rnn/while/rnn/gru_cell/mul_grad/mul/f_accStack*

stack_name *'
_class
loc:@rnn/while/Identity_2*
	elem_type0*
_output_shapes
:

6gradients/rnn/while/rnn/gru_cell/mul_grad/mul/RefEnterRefEnter3gradients/rnn/while/rnn/gru_cell/mul_grad/mul/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*'
_class
loc:@rnn/while/Identity_2*
is_constant(

7gradients/rnn/while/rnn/gru_cell/mul_grad/mul/StackPush	StackPush6gradients/rnn/while/rnn/gru_cell/mul_grad/mul/RefEnterrnn/while/Identity_2^gradients/Add*
T0*
swap_memory( *(
_output_shapes
:’’’’’’’’’*'
_class
loc:@rnn/while/Identity_2
¬
?gradients/rnn/while/rnn/gru_cell/mul_grad/mul/StackPop/RefEnterRefEnter3gradients/rnn/while/rnn/gru_cell/mul_grad/mul/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*'
_class
loc:@rnn/while/Identity_2*
is_constant(
÷
6gradients/rnn/while/rnn/gru_cell/mul_grad/mul/StackPopStackPop?gradients/rnn/while/rnn/gru_cell/mul_grad/mul/StackPop/RefEnter^gradients/Sub*(
_output_shapes
:’’’’’’’’’*'
_class
loc:@rnn/while/Identity_2*
	elem_type0
ć
-gradients/rnn/while/rnn/gru_cell/mul_grad/mulMulBgradients/rnn/while/rnn/gru_cell/add_grad/tuple/control_dependency6gradients/rnn/while/rnn/gru_cell/mul_grad/mul/StackPop*
T0*(
_output_shapes
:’’’’’’’’’
ä
-gradients/rnn/while/rnn/gru_cell/mul_grad/SumSum-gradients/rnn/while/rnn/gru_cell/mul_grad/mul?gradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
ž
1gradients/rnn/while/rnn/gru_cell/mul_grad/ReshapeReshape-gradients/rnn/while/rnn/gru_cell/mul_grad/SumHgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop*
T0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’*
Tshape0
“
5gradients/rnn/while/rnn/gru_cell/mul_grad/mul_1/f_accStack*

stack_name *5
_class+
)'loc:@rnn/while/rnn/gru_cell/gates/split*
	elem_type0*
_output_shapes
:
«
8gradients/rnn/while/rnn/gru_cell/mul_grad/mul_1/RefEnterRefEnter5gradients/rnn/while/rnn/gru_cell/mul_grad/mul_1/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*5
_class+
)'loc:@rnn/while/rnn/gru_cell/gates/split*
is_constant(
³
9gradients/rnn/while/rnn/gru_cell/mul_grad/mul_1/StackPush	StackPush8gradients/rnn/while/rnn/gru_cell/mul_grad/mul_1/RefEnter$rnn/while/rnn/gru_cell/gates/split:1^gradients/Add*
T0*
swap_memory( *(
_output_shapes
:’’’’’’’’’*5
_class+
)'loc:@rnn/while/rnn/gru_cell/gates/split
¾
Agradients/rnn/while/rnn/gru_cell/mul_grad/mul_1/StackPop/RefEnterRefEnter5gradients/rnn/while/rnn/gru_cell/mul_grad/mul_1/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*5
_class+
)'loc:@rnn/while/rnn/gru_cell/gates/split*
is_constant(

8gradients/rnn/while/rnn/gru_cell/mul_grad/mul_1/StackPopStackPopAgradients/rnn/while/rnn/gru_cell/mul_grad/mul_1/StackPop/RefEnter^gradients/Sub*(
_output_shapes
:’’’’’’’’’*5
_class+
)'loc:@rnn/while/rnn/gru_cell/gates/split*
	elem_type0
ē
/gradients/rnn/while/rnn/gru_cell/mul_grad/mul_1Mul8gradients/rnn/while/rnn/gru_cell/mul_grad/mul_1/StackPopBgradients/rnn/while/rnn/gru_cell/add_grad/tuple/control_dependency*
T0*(
_output_shapes
:’’’’’’’’’
ź
/gradients/rnn/while/rnn/gru_cell/mul_grad/Sum_1Sum/gradients/rnn/while/rnn/gru_cell/mul_grad/mul_1Agradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0

3gradients/rnn/while/rnn/gru_cell/mul_grad/Reshape_1Reshape/gradients/rnn/while/rnn/gru_cell/mul_grad/Sum_1Jgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop_1*
T0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’*
Tshape0
¬
:gradients/rnn/while/rnn/gru_cell/mul_grad/tuple/group_depsNoOp2^gradients/rnn/while/rnn/gru_cell/mul_grad/Reshape4^gradients/rnn/while/rnn/gru_cell/mul_grad/Reshape_1
·
Bgradients/rnn/while/rnn/gru_cell/mul_grad/tuple/control_dependencyIdentity1gradients/rnn/while/rnn/gru_cell/mul_grad/Reshape;^gradients/rnn/while/rnn/gru_cell/mul_grad/tuple/group_deps*
T0*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/mul_grad/Reshape*(
_output_shapes
:’’’’’’’’’
½
Dgradients/rnn/while/rnn/gru_cell/mul_grad/tuple/control_dependency_1Identity3gradients/rnn/while/rnn/gru_cell/mul_grad/Reshape_1;^gradients/rnn/while/rnn/gru_cell/mul_grad/tuple/group_deps*
T0*F
_class<
:8loc:@gradients/rnn/while/rnn/gru_cell/mul_grad/Reshape_1*(
_output_shapes
:’’’’’’’’’

1gradients/rnn/while/rnn/gru_cell/mul_1_grad/ShapeShapernn/while/rnn/gru_cell/sub*
T0*
_output_shapes
:*
out_type0

3gradients/rnn/while/rnn/gru_cell/mul_1_grad/Shape_1Shape%rnn/while/rnn/gru_cell/candidate/Tanh*
T0*
_output_shapes
:*
out_type0
Õ
Ggradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/f_accStack*

stack_name *D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/mul_1_grad/Shape*
	elem_type0*
_output_shapes
:
Ž
Jgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/RefEnterRefEnterGgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/mul_1_grad/Shape*
is_constant(
å
Kgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPush	StackPushJgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/RefEnter1gradients/rnn/while/rnn/gru_cell/mul_1_grad/Shape^gradients/Add*
T0*
swap_memory( *
_output_shapes
:*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/mul_1_grad/Shape
ń
Sgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop/RefEnterRefEnterGgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/mul_1_grad/Shape*
is_constant(
®
Jgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPopStackPopSgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop/RefEnter^gradients/Sub*
_output_shapes
:*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/mul_1_grad/Shape*
	elem_type0
Ł
Igradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/f_acc_1Stack*

stack_name *F
_class<
:8loc:@gradients/rnn/while/rnn/gru_cell/mul_1_grad/Shape_1*
	elem_type0*
_output_shapes
:
ä
Lgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/RefEnter_1RefEnterIgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*F
_class<
:8loc:@gradients/rnn/while/rnn/gru_cell/mul_1_grad/Shape_1*
is_constant(
ķ
Mgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPush_1	StackPushLgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/RefEnter_13gradients/rnn/while/rnn/gru_cell/mul_1_grad/Shape_1^gradients/Add*
T0*
swap_memory( *
_output_shapes
:*F
_class<
:8loc:@gradients/rnn/while/rnn/gru_cell/mul_1_grad/Shape_1
÷
Ugradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop_1/RefEnterRefEnterIgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*F
_class<
:8loc:@gradients/rnn/while/rnn/gru_cell/mul_1_grad/Shape_1*
is_constant(
“
Lgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop_1StackPopUgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop_1/RefEnter^gradients/Sub*
_output_shapes
:*F
_class<
:8loc:@gradients/rnn/while/rnn/gru_cell/mul_1_grad/Shape_1*
	elem_type0
±
Agradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgsBroadcastGradientArgsJgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPopLgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop_1*
T0*2
_output_shapes 
:’’’’’’’’’:’’’’’’’’’
·
5gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul/f_accStack*

stack_name *8
_class.
,*loc:@rnn/while/rnn/gru_cell/candidate/Tanh*
	elem_type0*
_output_shapes
:
®
8gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul/RefEnterRefEnter5gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*8
_class.
,*loc:@rnn/while/rnn/gru_cell/candidate/Tanh*
is_constant(
·
9gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPush	StackPush8gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul/RefEnter%rnn/while/rnn/gru_cell/candidate/Tanh^gradients/Add*
T0*
swap_memory( *(
_output_shapes
:’’’’’’’’’*8
_class.
,*loc:@rnn/while/rnn/gru_cell/candidate/Tanh
Į
Agradients/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPop/RefEnterRefEnter5gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*8
_class.
,*loc:@rnn/while/rnn/gru_cell/candidate/Tanh*
is_constant(

8gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPopStackPopAgradients/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPop/RefEnter^gradients/Sub*(
_output_shapes
:’’’’’’’’’*8
_class.
,*loc:@rnn/while/rnn/gru_cell/candidate/Tanh*
	elem_type0
é
/gradients/rnn/while/rnn/gru_cell/mul_1_grad/mulMulDgradients/rnn/while/rnn/gru_cell/add_grad/tuple/control_dependency_18gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPop*
T0*(
_output_shapes
:’’’’’’’’’
ź
/gradients/rnn/while/rnn/gru_cell/mul_1_grad/SumSum/gradients/rnn/while/rnn/gru_cell/mul_1_grad/mulAgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0

3gradients/rnn/while/rnn/gru_cell/mul_1_grad/ReshapeReshape/gradients/rnn/while/rnn/gru_cell/mul_1_grad/SumJgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop*
T0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’*
Tshape0
®
7gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/f_accStack*

stack_name *-
_class#
!loc:@rnn/while/rnn/gru_cell/sub*
	elem_type0*
_output_shapes
:
§
:gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/RefEnterRefEnter7gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*-
_class#
!loc:@rnn/while/rnn/gru_cell/sub*
is_constant(
„
;gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/StackPush	StackPush:gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/RefEnterrnn/while/rnn/gru_cell/sub^gradients/Add*
T0*
swap_memory( *(
_output_shapes
:’’’’’’’’’*-
_class#
!loc:@rnn/while/rnn/gru_cell/sub
ŗ
Cgradients/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/StackPop/RefEnterRefEnter7gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*-
_class#
!loc:@rnn/while/rnn/gru_cell/sub*
is_constant(

:gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/StackPopStackPopCgradients/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/StackPop/RefEnter^gradients/Sub*(
_output_shapes
:’’’’’’’’’*-
_class#
!loc:@rnn/while/rnn/gru_cell/sub*
	elem_type0
ķ
1gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul_1Mul:gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/StackPopDgradients/rnn/while/rnn/gru_cell/add_grad/tuple/control_dependency_1*
T0*(
_output_shapes
:’’’’’’’’’
š
1gradients/rnn/while/rnn/gru_cell/mul_1_grad/Sum_1Sum1gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul_1Cgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0

5gradients/rnn/while/rnn/gru_cell/mul_1_grad/Reshape_1Reshape1gradients/rnn/while/rnn/gru_cell/mul_1_grad/Sum_1Lgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop_1*
T0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’*
Tshape0
²
<gradients/rnn/while/rnn/gru_cell/mul_1_grad/tuple/group_depsNoOp4^gradients/rnn/while/rnn/gru_cell/mul_1_grad/Reshape6^gradients/rnn/while/rnn/gru_cell/mul_1_grad/Reshape_1
æ
Dgradients/rnn/while/rnn/gru_cell/mul_1_grad/tuple/control_dependencyIdentity3gradients/rnn/while/rnn/gru_cell/mul_1_grad/Reshape=^gradients/rnn/while/rnn/gru_cell/mul_1_grad/tuple/group_deps*
T0*F
_class<
:8loc:@gradients/rnn/while/rnn/gru_cell/mul_1_grad/Reshape*(
_output_shapes
:’’’’’’’’’
Å
Fgradients/rnn/while/rnn/gru_cell/mul_1_grad/tuple/control_dependency_1Identity5gradients/rnn/while/rnn/gru_cell/mul_1_grad/Reshape_1=^gradients/rnn/while/rnn/gru_cell/mul_1_grad/tuple/group_deps*
T0*H
_class>
<:loc:@gradients/rnn/while/rnn/gru_cell/mul_1_grad/Reshape_1*(
_output_shapes
:’’’’’’’’’

/gradients/rnn/while/rnn/gru_cell/sub_grad/ShapeConst^gradients/Sub*
_output_shapes
: *
valueB *
dtype0

1gradients/rnn/while/rnn/gru_cell/sub_grad/Shape_1Shape$rnn/while/rnn/gru_cell/gates/split:1*
T0*
_output_shapes
:*
out_type0
Ó
Egradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/f_accStack*

stack_name *D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/sub_grad/Shape_1*
	elem_type0*
_output_shapes
:
Ś
Hgradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/RefEnterRefEnterEgradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/sub_grad/Shape_1*
is_constant(
į
Igradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPush	StackPushHgradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/RefEnter1gradients/rnn/while/rnn/gru_cell/sub_grad/Shape_1^gradients/Add*
T0*
swap_memory( *
_output_shapes
:*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/sub_grad/Shape_1
ķ
Qgradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPop/RefEnterRefEnterEgradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/sub_grad/Shape_1*
is_constant(
Ŗ
Hgradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPopStackPopQgradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPop/RefEnter^gradients/Sub*
_output_shapes
:*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/sub_grad/Shape_1*
	elem_type0

?gradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgsBroadcastGradientArgs/gradients/rnn/while/rnn/gru_cell/sub_grad/ShapeHgradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPop*
T0*2
_output_shapes 
:’’’’’’’’’:’’’’’’’’’
ū
-gradients/rnn/while/rnn/gru_cell/sub_grad/SumSumDgradients/rnn/while/rnn/gru_cell/mul_1_grad/tuple/control_dependency?gradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ė
1gradients/rnn/while/rnn/gru_cell/sub_grad/ReshapeReshape-gradients/rnn/while/rnn/gru_cell/sub_grad/Sum/gradients/rnn/while/rnn/gru_cell/sub_grad/Shape*
T0*
_output_shapes
: *
Tshape0
’
/gradients/rnn/while/rnn/gru_cell/sub_grad/Sum_1SumDgradients/rnn/while/rnn/gru_cell/mul_1_grad/tuple/control_dependencyAgradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0

-gradients/rnn/while/rnn/gru_cell/sub_grad/NegNeg/gradients/rnn/while/rnn/gru_cell/sub_grad/Sum_1*
T0*
_output_shapes
:

3gradients/rnn/while/rnn/gru_cell/sub_grad/Reshape_1Reshape-gradients/rnn/while/rnn/gru_cell/sub_grad/NegHgradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPop*
T0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’*
Tshape0
¬
:gradients/rnn/while/rnn/gru_cell/sub_grad/tuple/group_depsNoOp2^gradients/rnn/while/rnn/gru_cell/sub_grad/Reshape4^gradients/rnn/while/rnn/gru_cell/sub_grad/Reshape_1
„
Bgradients/rnn/while/rnn/gru_cell/sub_grad/tuple/control_dependencyIdentity1gradients/rnn/while/rnn/gru_cell/sub_grad/Reshape;^gradients/rnn/while/rnn/gru_cell/sub_grad/tuple/group_deps*
T0*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/sub_grad/Reshape*
_output_shapes
: 
½
Dgradients/rnn/while/rnn/gru_cell/sub_grad/tuple/control_dependency_1Identity3gradients/rnn/while/rnn/gru_cell/sub_grad/Reshape_1;^gradients/rnn/while/rnn/gru_cell/sub_grad/tuple/group_deps*
T0*F
_class<
:8loc:@gradients/rnn/while/rnn/gru_cell/sub_grad/Reshape_1*(
_output_shapes
:’’’’’’’’’
ž
=gradients/rnn/while/rnn/gru_cell/candidate/Tanh_grad/TanhGradTanhGrad8gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPopFgradients/rnn/while/rnn/gru_cell/mul_1_grad/tuple/control_dependency_1*
T0*(
_output_shapes
:’’’’’’’’’
Ų
Mgradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/BiasAddGradBiasAddGrad=gradients/rnn/while/rnn/gru_cell/candidate/Tanh_grad/TanhGrad*
T0*
data_formatNHWC*
_output_shapes	
:
ź
Rgradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/group_depsNoOp>^gradients/rnn/while/rnn/gru_cell/candidate/Tanh_grad/TanhGradN^gradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/BiasAddGrad
’
Zgradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/control_dependencyIdentity=gradients/rnn/while/rnn/gru_cell/candidate/Tanh_grad/TanhGradS^gradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/group_deps*
T0*P
_classF
DBloc:@gradients/rnn/while/rnn/gru_cell/candidate/Tanh_grad/TanhGrad*(
_output_shapes
:’’’’’’’’’

\gradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/control_dependency_1IdentityMgradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/BiasAddGradS^gradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/group_deps*
T0*`
_classV
TRloc:@gradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/BiasAddGrad*
_output_shapes	
:

Mgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul/EnterEnter"rnn/gru_cell/candidate/kernel/read*
T0* 
_output_shapes
:
ä*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
is_constant(
Õ
Ggradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMulMatMulZgradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/control_dependencyMgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul/Enter*
T0*(
_output_shapes
:’’’’’’’’’ä*
transpose_b(*
transpose_a( 
Ż
Ogradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/f_accStack*

stack_name *D
_class:
86loc:@rnn/while/rnn/gru_cell/candidate/candidate/concat*
	elem_type0*
_output_shapes
:
ī
Rgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/RefEnterRefEnterOgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*D
_class:
86loc:@rnn/while/rnn/gru_cell/candidate/candidate/concat*
is_constant(

Sgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/StackPush	StackPushRgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/RefEnter1rnn/while/rnn/gru_cell/candidate/candidate/concat^gradients/Add*
T0*
swap_memory( *(
_output_shapes
:’’’’’’’’’ä*D
_class:
86loc:@rnn/while/rnn/gru_cell/candidate/candidate/concat

[gradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/StackPop/RefEnterRefEnterOgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*D
_class:
86loc:@rnn/while/rnn/gru_cell/candidate/candidate/concat*
is_constant(
Ģ
Rgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/StackPopStackPop[gradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/StackPop/RefEnter^gradients/Sub*(
_output_shapes
:’’’’’’’’’ä*D
_class:
86loc:@rnn/while/rnn/gru_cell/candidate/candidate/concat*
	elem_type0
Ō
Igradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1MatMulRgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/StackPopZgradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/control_dependency*
T0* 
_output_shapes
:
ä*
transpose_b( *
transpose_a(
ļ
Qgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/group_depsNoOpH^gradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMulJ^gradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1

Ygradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/control_dependencyIdentityGgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMulR^gradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/group_deps*
T0*Z
_classP
NLloc:@gradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul*(
_output_shapes
:’’’’’’’’’ä

[gradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/control_dependency_1IdentityIgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1R^gradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/group_deps*
T0*\
_classR
PNloc:@gradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1* 
_output_shapes
:
ä

Mgradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_accConst*
_output_shapes	
:*
valueB*    *
dtype0
«
Ogradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_acc_1EnterMgradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_acc*
T0*
_output_shapes	
:*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
is_constant( 
±
Ogradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_acc_2MergeOgradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_acc_1Ugradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/NextIteration*
T0*
_output_shapes
	:: *
N
ė
Ngradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/SwitchSwitchOgradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_acc_2gradients/b_count_2*
T0*"
_output_shapes
::
Ø
Kgradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/AddAddPgradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/Switch:1\gradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/control_dependency_1*
T0*
_output_shapes	
:
Ł
Ugradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/NextIterationNextIterationKgradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/Add*
T0*
_output_shapes	
:
Ķ
Ogradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_acc_3ExitNgradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/Switch*
T0*
_output_shapes	
:

Egradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/RankConst^gradients/Sub*
_output_shapes
: *
value	B :*
dtype0
Ż
Jgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/f_accStack*

stack_name *I
_class?
=;loc:@rnn/while/rnn/gru_cell/candidate/candidate/concat/axis*
	elem_type0*
_output_shapes
:
é
Mgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/RefEnterRefEnterJgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*I
_class?
=;loc:@rnn/while/rnn/gru_cell/candidate/candidate/concat/axis*
is_constant(
ń
Ngradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/StackPush	StackPushMgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/RefEnter6rnn/while/rnn/gru_cell/candidate/candidate/concat/axis^gradients/Add*
T0*
swap_memory( *
_output_shapes
: *I
_class?
=;loc:@rnn/while/rnn/gru_cell/candidate/candidate/concat/axis
ü
Vgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/StackPop/RefEnterRefEnterJgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*I
_class?
=;loc:@rnn/while/rnn/gru_cell/candidate/candidate/concat/axis*
is_constant(
µ
Mgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/StackPopStackPopVgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/StackPop/RefEnter^gradients/Sub*
_output_shapes
: *I
_class?
=;loc:@rnn/while/rnn/gru_cell/candidate/candidate/concat/axis*
	elem_type0

Dgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/modFloorModMgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/StackPopEgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/Rank*
T0*
_output_shapes
: 
”
Fgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeShapernn/while/TensorArrayReadV3*
T0*
_output_shapes
:*
out_type0
Å
Mgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/f_accStack*

stack_name *.
_class$
" loc:@rnn/while/TensorArrayReadV3*
	elem_type0*
_output_shapes
:
Ō
Pgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/RefEnterRefEnterMgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*.
_class$
" loc:@rnn/while/TensorArrayReadV3*
is_constant(
Ņ
Qgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPush	StackPushPgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/RefEnterrnn/while/TensorArrayReadV3^gradients/Add*
T0*
swap_memory( *'
_output_shapes
:’’’’’’’’’d*.
_class$
" loc:@rnn/while/TensorArrayReadV3
ē
Ygradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop/RefEnterRefEnterMgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*.
_class$
" loc:@rnn/while/TensorArrayReadV3*
is_constant(
±
Pgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPopStackPopYgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop/RefEnter^gradients/Sub*'
_output_shapes
:’’’’’’’’’d*.
_class$
" loc:@rnn/while/TensorArrayReadV3*
	elem_type0
Š
Ogradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/f_acc_1Stack*

stack_name *7
_class-
+)loc:@rnn/while/rnn/gru_cell/candidate/mul*
	elem_type0*
_output_shapes
:
į
Rgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/RefEnter_1RefEnterOgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/f_acc_1*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*7
_class-
+)loc:@rnn/while/rnn/gru_cell/candidate/mul*
is_constant(
é
Sgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPush_1	StackPushRgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/RefEnter_1$rnn/while/rnn/gru_cell/candidate/mul^gradients/Add*
T0*
swap_memory( *(
_output_shapes
:’’’’’’’’’*7
_class-
+)loc:@rnn/while/rnn/gru_cell/candidate/mul
ō
[gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop_1/RefEnterRefEnterOgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/f_acc_1*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*7
_class-
+)loc:@rnn/while/rnn/gru_cell/candidate/mul*
is_constant(
æ
Rgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop_1StackPop[gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop_1/RefEnter^gradients/Sub*(
_output_shapes
:’’’’’’’’’*7
_class-
+)loc:@rnn/while/rnn/gru_cell/candidate/mul*
	elem_type0
»
Ggradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeNShapeNPgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPopRgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop_1*
T0* 
_output_shapes
::*
out_type0*
N
ā
Mgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ConcatOffsetConcatOffsetDgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/modGgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeNIgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN:1* 
_output_shapes
::*
N

Fgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/SliceSliceYgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/control_dependencyMgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ConcatOffsetGgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN*
T0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’*
Index0

Hgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/Slice_1SliceYgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/control_dependencyOgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ConcatOffset:1Igradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN:1*
T0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’*
Index0
ķ
Qgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/group_depsNoOpG^gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/SliceI^gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/Slice_1

Ygradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/control_dependencyIdentityFgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/SliceR^gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/group_deps*
T0*Y
_classO
MKloc:@gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/Slice*'
_output_shapes
:’’’’’’’’’d

[gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/control_dependency_1IdentityHgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/Slice_1R^gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/group_deps*
T0*[
_classQ
OMloc:@gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/Slice_1*(
_output_shapes
:’’’’’’’’’
„
Lgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_accConst* 
_output_shapes
:
ä*
valueB
ä*    *
dtype0
®
Ngradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_acc_1EnterLgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_acc*
T0* 
_output_shapes
:
ä*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
is_constant( 
³
Ngradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_acc_2MergeNgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_acc_1Tgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/NextIteration*
T0*"
_output_shapes
:
ä: *
N
ó
Mgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/SwitchSwitchNgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_acc_2gradients/b_count_2*
T0*,
_output_shapes
:
ä:
ä
Ŗ
Jgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/AddAddOgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/Switch:1[gradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/control_dependency_1*
T0* 
_output_shapes
:
ä
Ü
Tgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/NextIterationNextIterationJgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/Add*
T0* 
_output_shapes
:
ä
Š
Ngradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_acc_3ExitMgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/Switch*
T0* 
_output_shapes
:
ä

9gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/ShapeShape"rnn/while/rnn/gru_cell/gates/split*
T0*
_output_shapes
:*
out_type0

;gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape_1Shapernn/while/Identity_2*
T0*
_output_shapes
:*
out_type0
å
Ogradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/f_accStack*

stack_name *L
_classB
@>loc:@gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape*
	elem_type0*
_output_shapes
:
ö
Rgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/RefEnterRefEnterOgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*L
_classB
@>loc:@gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape*
is_constant(

Sgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPush	StackPushRgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/RefEnter9gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape^gradients/Add*
T0*
swap_memory( *
_output_shapes
:*L
_classB
@>loc:@gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape

[gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop/RefEnterRefEnterOgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*L
_classB
@>loc:@gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape*
is_constant(
Ę
Rgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPopStackPop[gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop/RefEnter^gradients/Sub*
_output_shapes
:*L
_classB
@>loc:@gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape*
	elem_type0
é
Qgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/f_acc_1Stack*

stack_name *N
_classD
B@loc:@gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape_1*
	elem_type0*
_output_shapes
:
ü
Tgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/RefEnter_1RefEnterQgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*N
_classD
B@loc:@gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape_1*
is_constant(

Ugradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPush_1	StackPushTgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/RefEnter_1;gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape_1^gradients/Add*
T0*
swap_memory( *
_output_shapes
:*N
_classD
B@loc:@gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape_1

]gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop_1/RefEnterRefEnterQgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*N
_classD
B@loc:@gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape_1*
is_constant(
Ģ
Tgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop_1StackPop]gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop_1/RefEnter^gradients/Sub*
_output_shapes
:*N
_classD
B@loc:@gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape_1*
	elem_type0
É
Igradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgsBroadcastGradientArgsRgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPopTgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop_1*
T0*2
_output_shapes 
:’’’’’’’’’:’’’’’’’’’

7gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mulMul[gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/control_dependency_16gradients/rnn/while/rnn/gru_cell/mul_grad/mul/StackPop*
T0*(
_output_shapes
:’’’’’’’’’

7gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/SumSum7gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mulIgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0

;gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/ReshapeReshape7gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/SumRgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop*
T0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’*
Tshape0
¾
?gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/f_accStack*

stack_name *5
_class+
)'loc:@rnn/while/rnn/gru_cell/gates/split*
	elem_type0*
_output_shapes
:
æ
Bgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/RefEnterRefEnter?gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*5
_class+
)'loc:@rnn/while/rnn/gru_cell/gates/split*
is_constant(
Å
Cgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/StackPush	StackPushBgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/RefEnter"rnn/while/rnn/gru_cell/gates/split^gradients/Add*
T0*
swap_memory( *(
_output_shapes
:’’’’’’’’’*5
_class+
)'loc:@rnn/while/rnn/gru_cell/gates/split
Ņ
Kgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/StackPop/RefEnterRefEnter?gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*5
_class+
)'loc:@rnn/while/rnn/gru_cell/gates/split*
is_constant(

Bgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/StackPopStackPopKgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/StackPop/RefEnter^gradients/Sub*(
_output_shapes
:’’’’’’’’’*5
_class+
)'loc:@rnn/while/rnn/gru_cell/gates/split*
	elem_type0

9gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1MulBgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/StackPop[gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/control_dependency_1*
T0*(
_output_shapes
:’’’’’’’’’

9gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Sum_1Sum9gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1Kgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
¢
=gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Reshape_1Reshape9gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Sum_1Tgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop_1*
T0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’*
Tshape0
Ź
Dgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/tuple/group_depsNoOp<^gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Reshape>^gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Reshape_1
ß
Lgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/tuple/control_dependencyIdentity;gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/ReshapeE^gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/tuple/group_deps*
T0*N
_classD
B@loc:@gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Reshape*(
_output_shapes
:’’’’’’’’’
å
Ngradients/rnn/while/rnn/gru_cell/candidate/mul_grad/tuple/control_dependency_1Identity=gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Reshape_1E^gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/tuple/group_deps*
T0*P
_classF
DBloc:@gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Reshape_1*(
_output_shapes
:’’’’’’’’’
¢
gradients/AddNAddNBgradients/rnn/while/rnn/gru_cell/mul_grad/tuple/control_dependencyDgradients/rnn/while/rnn/gru_cell/sub_grad/tuple/control_dependency_1*
T0*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/mul_grad/Reshape*
N*(
_output_shapes
:’’’’’’’’’
Ē
>gradients/rnn/while/rnn/gru_cell/gates/split_grad/concat/f_accStack*

stack_name *?
_class5
31loc:@rnn/while/rnn/gru_cell/gates/split/split_dim*
	elem_type0*
_output_shapes
:
Ē
Agradients/rnn/while/rnn/gru_cell/gates/split_grad/concat/RefEnterRefEnter>gradients/rnn/while/rnn/gru_cell/gates/split_grad/concat/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*?
_class5
31loc:@rnn/while/rnn/gru_cell/gates/split/split_dim*
is_constant(
Å
Bgradients/rnn/while/rnn/gru_cell/gates/split_grad/concat/StackPush	StackPushAgradients/rnn/while/rnn/gru_cell/gates/split_grad/concat/RefEnter,rnn/while/rnn/gru_cell/gates/split/split_dim^gradients/Add*
T0*
swap_memory( *
_output_shapes
: *?
_class5
31loc:@rnn/while/rnn/gru_cell/gates/split/split_dim
Ś
Jgradients/rnn/while/rnn/gru_cell/gates/split_grad/concat/StackPop/RefEnterRefEnter>gradients/rnn/while/rnn/gru_cell/gates/split_grad/concat/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*?
_class5
31loc:@rnn/while/rnn/gru_cell/gates/split/split_dim*
is_constant(

Agradients/rnn/while/rnn/gru_cell/gates/split_grad/concat/StackPopStackPopJgradients/rnn/while/rnn/gru_cell/gates/split_grad/concat/StackPop/RefEnter^gradients/Sub*
_output_shapes
: *?
_class5
31loc:@rnn/while/rnn/gru_cell/gates/split/split_dim*
	elem_type0
­
8gradients/rnn/while/rnn/gru_cell/gates/split_grad/concatConcatV2Lgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/tuple/control_dependencygradients/AddNAgradients/rnn/while/rnn/gru_cell/gates/split_grad/concat/StackPop*
T0*(
_output_shapes
:’’’’’’’’’*
N*

Tidx0
Ę
Egradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/f_accStack*

stack_name *7
_class-
+)loc:@rnn/while/rnn/gru_cell/gates/Sigmoid*
	elem_type0*
_output_shapes
:
Ķ
Hgradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/RefEnterRefEnterEgradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*7
_class-
+)loc:@rnn/while/rnn/gru_cell/gates/Sigmoid*
is_constant(
Õ
Igradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/StackPush	StackPushHgradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/RefEnter$rnn/while/rnn/gru_cell/gates/Sigmoid^gradients/Add*
T0*
swap_memory( *(
_output_shapes
:’’’’’’’’’*7
_class-
+)loc:@rnn/while/rnn/gru_cell/gates/Sigmoid
ą
Qgradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/StackPop/RefEnterRefEnterEgradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*7
_class-
+)loc:@rnn/while/rnn/gru_cell/gates/Sigmoid*
is_constant(
«
Hgradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/StackPopStackPopQgradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/StackPop/RefEnter^gradients/Sub*(
_output_shapes
:’’’’’’’’’*7
_class-
+)loc:@rnn/while/rnn/gru_cell/gates/Sigmoid*
	elem_type0

?gradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGradSigmoidGradHgradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/StackPop8gradients/rnn/while/rnn/gru_cell/gates/split_grad/concat*
T0*(
_output_shapes
:’’’’’’’’’
Ņ
Egradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/BiasAddGradBiasAddGrad?gradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad*
T0*
data_formatNHWC*
_output_shapes	
:
Ü
Jgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/group_depsNoOp@^gradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGradF^gradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/BiasAddGrad
ó
Rgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/control_dependencyIdentity?gradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGradK^gradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/group_deps*
T0*R
_classH
FDloc:@gradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad*(
_output_shapes
:’’’’’’’’’
ō
Tgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/control_dependency_1IdentityEgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/BiasAddGradK^gradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/group_deps*
T0*X
_classN
LJloc:@gradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/BiasAddGrad*
_output_shapes	
:
÷
Egradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul/EnterEnterrnn/gru_cell/gates/kernel/read*
T0* 
_output_shapes
:
ä*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
is_constant(
½
?gradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMulMatMulRgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/control_dependencyEgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul/Enter*
T0*(
_output_shapes
:’’’’’’’’’ä*
transpose_b(*
transpose_a( 
Ķ
Ggradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/f_accStack*

stack_name *<
_class2
0.loc:@rnn/while/rnn/gru_cell/gates/gates/concat*
	elem_type0*
_output_shapes
:
Ö
Jgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/RefEnterRefEnterGgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*<
_class2
0.loc:@rnn/while/rnn/gru_cell/gates/gates/concat*
is_constant(
ć
Kgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/StackPush	StackPushJgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/RefEnter)rnn/while/rnn/gru_cell/gates/gates/concat^gradients/Add*
T0*
swap_memory( *(
_output_shapes
:’’’’’’’’’ä*<
_class2
0.loc:@rnn/while/rnn/gru_cell/gates/gates/concat
é
Sgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/StackPop/RefEnterRefEnterGgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*<
_class2
0.loc:@rnn/while/rnn/gru_cell/gates/gates/concat*
is_constant(
“
Jgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/StackPopStackPopSgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/StackPop/RefEnter^gradients/Sub*(
_output_shapes
:’’’’’’’’’ä*<
_class2
0.loc:@rnn/while/rnn/gru_cell/gates/gates/concat*
	elem_type0
¼
Agradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1MatMulJgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/StackPopRgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/control_dependency*
T0* 
_output_shapes
:
ä*
transpose_b( *
transpose_a(
×
Igradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/group_depsNoOp@^gradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMulB^gradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1
ń
Qgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/control_dependencyIdentity?gradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMulJ^gradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/group_deps*
T0*R
_classH
FDloc:@gradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul*(
_output_shapes
:’’’’’’’’’ä
ļ
Sgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/control_dependency_1IdentityAgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1J^gradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/group_deps*
T0*T
_classJ
HFloc:@gradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1* 
_output_shapes
:
ä

Egradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_accConst*
_output_shapes	
:*
valueB*    *
dtype0

Ggradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_acc_1EnterEgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_acc*
T0*
_output_shapes	
:*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
is_constant( 

Ggradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_acc_2MergeGgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_acc_1Mgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/NextIteration*
T0*
_output_shapes
	:: *
N
Ū
Fgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/SwitchSwitchGgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_acc_2gradients/b_count_2*
T0*"
_output_shapes
::

Cgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/AddAddHgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/Switch:1Tgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/control_dependency_1*
T0*
_output_shapes	
:
É
Mgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/NextIterationNextIterationCgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/Add*
T0*
_output_shapes	
:
½
Ggradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_acc_3ExitFgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/Switch*
T0*
_output_shapes	
:

=gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/RankConst^gradients/Sub*
_output_shapes
: *
value	B :*
dtype0
Ķ
Bgradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/f_accStack*

stack_name *A
_class7
53loc:@rnn/while/rnn/gru_cell/gates/gates/concat/axis*
	elem_type0*
_output_shapes
:
Ń
Egradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/RefEnterRefEnterBgradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*A
_class7
53loc:@rnn/while/rnn/gru_cell/gates/gates/concat/axis*
is_constant(
Ń
Fgradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/StackPush	StackPushEgradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/RefEnter.rnn/while/rnn/gru_cell/gates/gates/concat/axis^gradients/Add*
T0*
swap_memory( *
_output_shapes
: *A
_class7
53loc:@rnn/while/rnn/gru_cell/gates/gates/concat/axis
ä
Ngradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/StackPop/RefEnterRefEnterBgradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*A
_class7
53loc:@rnn/while/rnn/gru_cell/gates/gates/concat/axis*
is_constant(

Egradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/StackPopStackPopNgradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/StackPop/RefEnter^gradients/Sub*
_output_shapes
: *A
_class7
53loc:@rnn/while/rnn/gru_cell/gates/gates/concat/axis*
	elem_type0
ļ
<gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/modFloorModEgradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/StackPop=gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/Rank*
T0*
_output_shapes
: 

>gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ShapeShapernn/while/TensorArrayReadV3*
T0*
_output_shapes
:*
out_type0

?gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ShapeNShapeNPgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop6gradients/rnn/while/rnn/gru_cell/mul_grad/mul/StackPop*
T0* 
_output_shapes
::*
out_type0*
N
Ā
Egradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ConcatOffsetConcatOffset<gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod?gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ShapeNAgradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ShapeN:1* 
_output_shapes
::*
N
ź
>gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/SliceSliceQgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/control_dependencyEgradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ConcatOffset?gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ShapeN*
T0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’*
Index0
š
@gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/Slice_1SliceQgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/control_dependencyGgradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ConcatOffset:1Agradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ShapeN:1*
T0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’*
Index0
Õ
Igradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/tuple/group_depsNoOp?^gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/SliceA^gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/Slice_1
ī
Qgradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/tuple/control_dependencyIdentity>gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/SliceJ^gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/tuple/group_deps*
T0*Q
_classG
ECloc:@gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/Slice*'
_output_shapes
:’’’’’’’’’d
õ
Sgradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/tuple/control_dependency_1Identity@gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/Slice_1J^gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/tuple/group_deps*
T0*S
_classI
GEloc:@gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/Slice_1*(
_output_shapes
:’’’’’’’’’

Dgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_accConst* 
_output_shapes
:
ä*
valueB
ä*    *
dtype0

Fgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_acc_1EnterDgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_acc*
T0* 
_output_shapes
:
ä*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
is_constant( 

Fgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_acc_2MergeFgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_acc_1Lgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/NextIteration*
T0*"
_output_shapes
:
ä: *
N
ć
Egradients/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/SwitchSwitchFgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_acc_2gradients/b_count_2*
T0*,
_output_shapes
:
ä:
ä

Bgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/AddAddGgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/Switch:1Sgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/control_dependency_1*
T0* 
_output_shapes
:
ä
Ģ
Lgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/NextIterationNextIterationBgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/Add*
T0* 
_output_shapes
:
ä
Ą
Fgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_acc_3ExitEgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/Switch*
T0* 
_output_shapes
:
ä
Ü
gradients/AddN_1AddNYgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/control_dependencyQgradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/tuple/control_dependency*
T0*Y
_classO
MKloc:@gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/Slice*
N*'
_output_shapes
:’’’’’’’’’d
§
Rgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3/EnterEnterrnn/TensorArray_1*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*4
_class*
(&loc:@rnn/while/TensorArrayReadV3/Enter*
is_constant(
Ņ
Tgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3/Enter_1Enter>rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
: *4
_class*
(&loc:@rnn/while/TensorArrayReadV3/Enter*
is_constant(

Lgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3TensorArrayGradV3Rgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3/EnterTgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3/Enter_1^gradients/Sub*
_output_shapes

:: *4
_class*
(&loc:@rnn/while/TensorArrayReadV3/Enter*
source	gradients
Š
Hgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/gradient_flowIdentityTgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3/Enter_1M^gradients/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3*
T0*4
_class*
(&loc:@rnn/while/TensorArrayReadV3/Enter*
_output_shapes
: 
Ć
Tgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/f_accStack*

stack_name *%
_class
loc:@rnn/while/Identity*
	elem_type0*
_output_shapes
:
Ł
Wgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/RefEnterRefEnterTgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*%
_class
loc:@rnn/while/Identity*
is_constant(
½
Xgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/StackPush	StackPushWgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/RefEnterrnn/while/Identity^gradients/Add*
T0*
swap_memory( *
_output_shapes
: *%
_class
loc:@rnn/while/Identity
ģ
`gradients/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/StackPop/RefEnterRefEnterTgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*%
_class
loc:@rnn/while/Identity*
is_constant(
„
Wgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/StackPopStackPop`gradients/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/StackPop/RefEnter^gradients/Sub*
_output_shapes
: *%
_class
loc:@rnn/while/Identity*
	elem_type0

Ngradients/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV3Lgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3Wgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/StackPopgradients/AddN_1Hgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/gradient_flow*
T0*
_output_shapes
: 

gradients/AddN_2AddNDgradients/rnn/while/rnn/gru_cell/mul_grad/tuple/control_dependency_1Ngradients/rnn/while/rnn/gru_cell/candidate/mul_grad/tuple/control_dependency_1Sgradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/tuple/control_dependency_1*
T0*F
_class<
:8loc:@gradients/rnn/while/rnn/gru_cell/mul_grad/Reshape_1*
N*(
_output_shapes
:’’’’’’’’’
}
8gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/b_accConst*
_output_shapes
: *
valueB
 *    *
dtype0
ü
:gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_1Enter8gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc*
T0*
_output_shapes
: *
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
is_constant( 
ķ
:gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_2Merge:gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_1@gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/NextIteration*
T0*
_output_shapes
: : *
N
·
9gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/SwitchSwitch:gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_2gradients/b_count_2*
T0*
_output_shapes
: : 
ė
6gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/AddAdd;gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/Switch:1Ngradients/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3*
T0*
_output_shapes
: 
Ŗ
@gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/NextIterationNextIteration6gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/Add*
T0*
_output_shapes
: 

:gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3Exit9gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/Switch*
T0*
_output_shapes
: 

1gradients/rnn/while/Switch_2_grad_1/NextIterationNextIterationgradients/AddN_2*
T0*(
_output_shapes
:’’’’’’’’’
®
ogradients/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGrad/TensorArrayGradV3TensorArrayGradV3rnn/TensorArray_1:gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3*
_output_shapes

:: *$
_class
loc:@rnn/TensorArray_1*
source	gradients
ģ
kgradients/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGrad/gradient_flowIdentity:gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3p^gradients/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGrad/TensorArrayGradV3*
T0*$
_class
loc:@rnn/TensorArray_1*
_output_shapes
: 
²
agradients/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGatherV3TensorArrayGatherV3ogradients/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGrad/TensorArrayGradV3rnn/TensorArrayUnstack/rangekgradients/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGrad/gradient_flow*
_output_shapes
:*
element_shape:*
dtype0

^gradients/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/group_depsNoOp;^gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3b^gradients/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGatherV3
ā
fgradients/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/control_dependencyIdentityagradients/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGatherV3_^gradients/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/group_deps*
T0*t
_classj
hfloc:@gradients/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGatherV3*+
_output_shapes
:’’’’’’’’’d

hgradients/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/control_dependency_1Identity:gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3_^gradients/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/group_deps*
T0*M
_classC
A?loc:@gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3*
_output_shapes
: 
l
*gradients/transpose_grad/InvertPermutationInvertPermutationconcat*
T0*
_output_shapes
:

"gradients/transpose_grad/transpose	Transposefgradients/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/control_dependency*gradients/transpose_grad/InvertPermutation*
T0*+
_output_shapes
:’’’’’’’’’d*
Tperm0

%gradients/embedding_lookup_grad/ShapeConst*
_output_shapes
:*
_class
loc:@Variable*
valueB"”: d   *
dtype0
j
$gradients/embedding_lookup_grad/SizeSizePlaceholder*
T0*
_output_shapes
: *
out_type0
p
.gradients/embedding_lookup_grad/ExpandDims/dimConst*
_output_shapes
: *
value	B : *
dtype0
æ
*gradients/embedding_lookup_grad/ExpandDims
ExpandDims$gradients/embedding_lookup_grad/Size.gradients/embedding_lookup_grad/ExpandDims/dim*
T0*
_output_shapes
:*

Tdim0
}
3gradients/embedding_lookup_grad/strided_slice/stackConst*
_output_shapes
:*
valueB:*
dtype0

5gradients/embedding_lookup_grad/strided_slice/stack_1Const*
_output_shapes
:*
valueB: *
dtype0

5gradients/embedding_lookup_grad/strided_slice/stack_2Const*
_output_shapes
:*
valueB:*
dtype0

-gradients/embedding_lookup_grad/strided_sliceStridedSlice%gradients/embedding_lookup_grad/Shape3gradients/embedding_lookup_grad/strided_slice/stack5gradients/embedding_lookup_grad/strided_slice/stack_15gradients/embedding_lookup_grad/strided_slice/stack_2*
T0*
Index0*
new_axis_mask *

begin_mask *
ellipsis_mask *
_output_shapes
:*
shrink_axis_mask *
end_mask
m
+gradients/embedding_lookup_grad/concat/axisConst*
_output_shapes
: *
value	B : *
dtype0
ō
&gradients/embedding_lookup_grad/concatConcatV2*gradients/embedding_lookup_grad/ExpandDims-gradients/embedding_lookup_grad/strided_slice+gradients/embedding_lookup_grad/concat/axis*
T0*
_output_shapes
:*
N*

Tidx0
Ē
'gradients/embedding_lookup_grad/ReshapeReshape"gradients/transpose_grad/transpose&gradients/embedding_lookup_grad/concat*
T0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’*
Tshape0
©
)gradients/embedding_lookup_grad/Reshape_1ReshapePlaceholder*gradients/embedding_lookup_grad/ExpandDims*
T0*#
_output_shapes
:’’’’’’’’’*
Tshape0
{
beta1_power/initial_valueConst*
_output_shapes
: *
_class
loc:@Variable*
valueB
 *fff?*
dtype0

beta1_power
VariableV2*
dtype0*
	container *
_output_shapes
: *
shared_name *
_class
loc:@Variable*
shape: 
«
beta1_power/AssignAssignbeta1_powerbeta1_power/initial_value*
T0*
_class
loc:@Variable*
validate_shape(*
use_locking(*
_output_shapes
: 
g
beta1_power/readIdentitybeta1_power*
T0*
_class
loc:@Variable*
_output_shapes
: 
{
beta2_power/initial_valueConst*
_output_shapes
: *
_class
loc:@Variable*
valueB
 *w¾?*
dtype0

beta2_power
VariableV2*
dtype0*
	container *
_output_shapes
: *
shared_name *
_class
loc:@Variable*
shape: 
«
beta2_power/AssignAssignbeta2_powerbeta2_power/initial_value*
T0*
_class
loc:@Variable*
validate_shape(*
use_locking(*
_output_shapes
: 
g
beta2_power/readIdentitybeta2_power*
T0*
_class
loc:@Variable*
_output_shapes
: 

Variable/Adam/Initializer/zerosConst* 
_output_shapes
:
”õd*
_class
loc:@Variable*
valueB
”õd*    *
dtype0
¢
Variable/Adam
VariableV2*
dtype0*
_class
loc:@Variable* 
_output_shapes
:
”õd*
shared_name *
shape:
”õd*
	container 
æ
Variable/Adam/AssignAssignVariable/AdamVariable/Adam/Initializer/zeros*
T0*
_class
loc:@Variable*
validate_shape(*
use_locking(* 
_output_shapes
:
”õd
u
Variable/Adam/readIdentityVariable/Adam*
T0*
_class
loc:@Variable* 
_output_shapes
:
”õd

!Variable/Adam_1/Initializer/zerosConst* 
_output_shapes
:
”õd*
_class
loc:@Variable*
valueB
”õd*    *
dtype0
¤
Variable/Adam_1
VariableV2*
dtype0*
_class
loc:@Variable* 
_output_shapes
:
”õd*
shared_name *
shape:
”õd*
	container 
Å
Variable/Adam_1/AssignAssignVariable/Adam_1!Variable/Adam_1/Initializer/zeros*
T0*
_class
loc:@Variable*
validate_shape(*
use_locking(* 
_output_shapes
:
”õd
y
Variable/Adam_1/readIdentityVariable/Adam_1*
T0*
_class
loc:@Variable* 
_output_shapes
:
”õd
·
0rnn/gru_cell/gates/kernel/Adam/Initializer/zerosConst* 
_output_shapes
:
ä*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
valueB
ä*    *
dtype0
Ä
rnn/gru_cell/gates/kernel/Adam
VariableV2*
dtype0*,
_class"
 loc:@rnn/gru_cell/gates/kernel* 
_output_shapes
:
ä*
shared_name *
shape:
ä*
	container 

%rnn/gru_cell/gates/kernel/Adam/AssignAssignrnn/gru_cell/gates/kernel/Adam0rnn/gru_cell/gates/kernel/Adam/Initializer/zeros*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
ä
Ø
#rnn/gru_cell/gates/kernel/Adam/readIdentityrnn/gru_cell/gates/kernel/Adam*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel* 
_output_shapes
:
ä
¹
2rnn/gru_cell/gates/kernel/Adam_1/Initializer/zerosConst* 
_output_shapes
:
ä*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
valueB
ä*    *
dtype0
Ę
 rnn/gru_cell/gates/kernel/Adam_1
VariableV2*
dtype0*,
_class"
 loc:@rnn/gru_cell/gates/kernel* 
_output_shapes
:
ä*
shared_name *
shape:
ä*
	container 

'rnn/gru_cell/gates/kernel/Adam_1/AssignAssign rnn/gru_cell/gates/kernel/Adam_12rnn/gru_cell/gates/kernel/Adam_1/Initializer/zeros*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
ä
¬
%rnn/gru_cell/gates/kernel/Adam_1/readIdentity rnn/gru_cell/gates/kernel/Adam_1*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel* 
_output_shapes
:
ä
©
.rnn/gru_cell/gates/bias/Adam/Initializer/zerosConst*
_output_shapes	
:**
_class 
loc:@rnn/gru_cell/gates/bias*
valueB*    *
dtype0
¶
rnn/gru_cell/gates/bias/Adam
VariableV2*
dtype0**
_class 
loc:@rnn/gru_cell/gates/bias*
_output_shapes	
:*
shared_name *
shape:*
	container 
ö
#rnn/gru_cell/gates/bias/Adam/AssignAssignrnn/gru_cell/gates/bias/Adam.rnn/gru_cell/gates/bias/Adam/Initializer/zeros*
T0**
_class 
loc:@rnn/gru_cell/gates/bias*
validate_shape(*
use_locking(*
_output_shapes	
:

!rnn/gru_cell/gates/bias/Adam/readIdentityrnn/gru_cell/gates/bias/Adam*
T0**
_class 
loc:@rnn/gru_cell/gates/bias*
_output_shapes	
:
«
0rnn/gru_cell/gates/bias/Adam_1/Initializer/zerosConst*
_output_shapes	
:**
_class 
loc:@rnn/gru_cell/gates/bias*
valueB*    *
dtype0
ø
rnn/gru_cell/gates/bias/Adam_1
VariableV2*
dtype0**
_class 
loc:@rnn/gru_cell/gates/bias*
_output_shapes	
:*
shared_name *
shape:*
	container 
ü
%rnn/gru_cell/gates/bias/Adam_1/AssignAssignrnn/gru_cell/gates/bias/Adam_10rnn/gru_cell/gates/bias/Adam_1/Initializer/zeros*
T0**
_class 
loc:@rnn/gru_cell/gates/bias*
validate_shape(*
use_locking(*
_output_shapes	
:
”
#rnn/gru_cell/gates/bias/Adam_1/readIdentityrnn/gru_cell/gates/bias/Adam_1*
T0**
_class 
loc:@rnn/gru_cell/gates/bias*
_output_shapes	
:
æ
4rnn/gru_cell/candidate/kernel/Adam/Initializer/zerosConst* 
_output_shapes
:
ä*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
valueB
ä*    *
dtype0
Ģ
"rnn/gru_cell/candidate/kernel/Adam
VariableV2*
dtype0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel* 
_output_shapes
:
ä*
shared_name *
shape:
ä*
	container 

)rnn/gru_cell/candidate/kernel/Adam/AssignAssign"rnn/gru_cell/candidate/kernel/Adam4rnn/gru_cell/candidate/kernel/Adam/Initializer/zeros*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
ä
“
'rnn/gru_cell/candidate/kernel/Adam/readIdentity"rnn/gru_cell/candidate/kernel/Adam*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel* 
_output_shapes
:
ä
Į
6rnn/gru_cell/candidate/kernel/Adam_1/Initializer/zerosConst* 
_output_shapes
:
ä*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
valueB
ä*    *
dtype0
Ī
$rnn/gru_cell/candidate/kernel/Adam_1
VariableV2*
dtype0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel* 
_output_shapes
:
ä*
shared_name *
shape:
ä*
	container 

+rnn/gru_cell/candidate/kernel/Adam_1/AssignAssign$rnn/gru_cell/candidate/kernel/Adam_16rnn/gru_cell/candidate/kernel/Adam_1/Initializer/zeros*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
ä
ø
)rnn/gru_cell/candidate/kernel/Adam_1/readIdentity$rnn/gru_cell/candidate/kernel/Adam_1*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel* 
_output_shapes
:
ä
±
2rnn/gru_cell/candidate/bias/Adam/Initializer/zerosConst*
_output_shapes	
:*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
valueB*    *
dtype0
¾
 rnn/gru_cell/candidate/bias/Adam
VariableV2*
dtype0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
_output_shapes	
:*
shared_name *
shape:*
	container 

'rnn/gru_cell/candidate/bias/Adam/AssignAssign rnn/gru_cell/candidate/bias/Adam2rnn/gru_cell/candidate/bias/Adam/Initializer/zeros*
T0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
validate_shape(*
use_locking(*
_output_shapes	
:
©
%rnn/gru_cell/candidate/bias/Adam/readIdentity rnn/gru_cell/candidate/bias/Adam*
T0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
_output_shapes	
:
³
4rnn/gru_cell/candidate/bias/Adam_1/Initializer/zerosConst*
_output_shapes	
:*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
valueB*    *
dtype0
Ą
"rnn/gru_cell/candidate/bias/Adam_1
VariableV2*
dtype0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
_output_shapes	
:*
shared_name *
shape:*
	container 

)rnn/gru_cell/candidate/bias/Adam_1/AssignAssign"rnn/gru_cell/candidate/bias/Adam_14rnn/gru_cell/candidate/bias/Adam_1/Initializer/zeros*
T0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
validate_shape(*
use_locking(*
_output_shapes	
:
­
'rnn/gru_cell/candidate/bias/Adam_1/readIdentity"rnn/gru_cell/candidate/bias/Adam_1*
T0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
_output_shapes	
:

#dense/kernel/Adam/Initializer/zerosConst*!
_output_shapes
:”õ*
_class
loc:@dense/kernel* 
valueB”õ*    *
dtype0
¬
dense/kernel/Adam
VariableV2*
dtype0*
_class
loc:@dense/kernel*!
_output_shapes
:”õ*
shared_name *
shape:”õ*
	container 
Š
dense/kernel/Adam/AssignAssigndense/kernel/Adam#dense/kernel/Adam/Initializer/zeros*
T0*
_class
loc:@dense/kernel*
validate_shape(*
use_locking(*!
_output_shapes
:”õ

dense/kernel/Adam/readIdentitydense/kernel/Adam*
T0*
_class
loc:@dense/kernel*!
_output_shapes
:”õ
”
%dense/kernel/Adam_1/Initializer/zerosConst*!
_output_shapes
:”õ*
_class
loc:@dense/kernel* 
valueB”õ*    *
dtype0
®
dense/kernel/Adam_1
VariableV2*
dtype0*
_class
loc:@dense/kernel*!
_output_shapes
:”õ*
shared_name *
shape:”õ*
	container 
Ö
dense/kernel/Adam_1/AssignAssigndense/kernel/Adam_1%dense/kernel/Adam_1/Initializer/zeros*
T0*
_class
loc:@dense/kernel*
validate_shape(*
use_locking(*!
_output_shapes
:”õ

dense/kernel/Adam_1/readIdentitydense/kernel/Adam_1*
T0*
_class
loc:@dense/kernel*!
_output_shapes
:”õ

!dense/bias/Adam/Initializer/zerosConst*
_output_shapes

:”õ*
_class
loc:@dense/bias*
valueB”õ*    *
dtype0

dense/bias/Adam
VariableV2*
dtype0*
_class
loc:@dense/bias*
_output_shapes

:”õ*
shared_name *
shape:”õ*
	container 
Ć
dense/bias/Adam/AssignAssigndense/bias/Adam!dense/bias/Adam/Initializer/zeros*
T0*
_class
loc:@dense/bias*
validate_shape(*
use_locking(*
_output_shapes

:”õ
w
dense/bias/Adam/readIdentitydense/bias/Adam*
T0*
_class
loc:@dense/bias*
_output_shapes

:”õ

#dense/bias/Adam_1/Initializer/zerosConst*
_output_shapes

:”õ*
_class
loc:@dense/bias*
valueB”õ*    *
dtype0
 
dense/bias/Adam_1
VariableV2*
dtype0*
_class
loc:@dense/bias*
_output_shapes

:”õ*
shared_name *
shape:”õ*
	container 
É
dense/bias/Adam_1/AssignAssigndense/bias/Adam_1#dense/bias/Adam_1/Initializer/zeros*
T0*
_class
loc:@dense/bias*
validate_shape(*
use_locking(*
_output_shapes

:”õ
{
dense/bias/Adam_1/readIdentitydense/bias/Adam_1*
T0*
_class
loc:@dense/bias*
_output_shapes

:”õ
W
Adam/learning_rateConst*
_output_shapes
: *
valueB
 *
×#<*
dtype0
O

Adam/beta1Const*
_output_shapes
: *
valueB
 *fff?*
dtype0
O

Adam/beta2Const*
_output_shapes
: *
valueB
 *w¾?*
dtype0
Q
Adam/epsilonConst*
_output_shapes
: *
valueB
 *wĢ+2*
dtype0
¹
Adam/update_Variable/UniqueUnique)gradients/embedding_lookup_grad/Reshape_1*
T0*
_class
loc:@Variable*2
_output_shapes 
:’’’’’’’’’:’’’’’’’’’*
out_idx0

Adam/update_Variable/ShapeShapeAdam/update_Variable/Unique*
T0*
_class
loc:@Variable*
out_type0*
_output_shapes
:

(Adam/update_Variable/strided_slice/stackConst*
_output_shapes
:*
_class
loc:@Variable*
valueB: *
dtype0

*Adam/update_Variable/strided_slice/stack_1Const*
_output_shapes
:*
_class
loc:@Variable*
valueB:*
dtype0

*Adam/update_Variable/strided_slice/stack_2Const*
_output_shapes
:*
_class
loc:@Variable*
valueB:*
dtype0
’
"Adam/update_Variable/strided_sliceStridedSliceAdam/update_Variable/Shape(Adam/update_Variable/strided_slice/stack*Adam/update_Variable/strided_slice/stack_1*Adam/update_Variable/strided_slice/stack_2*
T0*
Index0*
new_axis_mask *

begin_mask *
ellipsis_mask *
shrink_axis_mask*
_output_shapes
: *
_class
loc:@Variable*
end_mask 

'Adam/update_Variable/UnsortedSegmentSumUnsortedSegmentSum'gradients/embedding_lookup_grad/ReshapeAdam/update_Variable/Unique:1"Adam/update_Variable/strided_slice*
T0*
_class
loc:@Variable*
Tindices0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’
|
Adam/update_Variable/sub/xConst*
_output_shapes
: *
_class
loc:@Variable*
valueB
 *  ?*
dtype0

Adam/update_Variable/subSubAdam/update_Variable/sub/xbeta2_power/read*
T0*
_class
loc:@Variable*
_output_shapes
: 
y
Adam/update_Variable/SqrtSqrtAdam/update_Variable/sub*
T0*
_class
loc:@Variable*
_output_shapes
: 

Adam/update_Variable/mulMulAdam/learning_rateAdam/update_Variable/Sqrt*
T0*
_class
loc:@Variable*
_output_shapes
: 
~
Adam/update_Variable/sub_1/xConst*
_output_shapes
: *
_class
loc:@Variable*
valueB
 *  ?*
dtype0

Adam/update_Variable/sub_1SubAdam/update_Variable/sub_1/xbeta1_power/read*
T0*
_class
loc:@Variable*
_output_shapes
: 

Adam/update_Variable/truedivRealDivAdam/update_Variable/mulAdam/update_Variable/sub_1*
T0*
_class
loc:@Variable*
_output_shapes
: 
~
Adam/update_Variable/sub_2/xConst*
_output_shapes
: *
_class
loc:@Variable*
valueB
 *  ?*
dtype0

Adam/update_Variable/sub_2SubAdam/update_Variable/sub_2/x
Adam/beta1*
T0*
_class
loc:@Variable*
_output_shapes
: 
¾
Adam/update_Variable/mul_1Mul'Adam/update_Variable/UnsortedSegmentSumAdam/update_Variable/sub_2*
T0*
_class
loc:@Variable*0
_output_shapes
:’’’’’’’’’’’’’’’’’’

Adam/update_Variable/mul_2MulVariable/Adam/read
Adam/beta1*
T0*
_class
loc:@Variable* 
_output_shapes
:
”õd
Į
Adam/update_Variable/AssignAssignVariable/AdamAdam/update_Variable/mul_2*
T0*
_class
loc:@Variable*
validate_shape(*
use_locking( * 
_output_shapes
:
”õd
ž
Adam/update_Variable/ScatterAdd
ScatterAddVariable/AdamAdam/update_Variable/UniqueAdam/update_Variable/mul_1^Adam/update_Variable/Assign*
T0*
_class
loc:@Variable*
Tindices0*
use_locking( * 
_output_shapes
:
”õd
Ė
Adam/update_Variable/mul_3Mul'Adam/update_Variable/UnsortedSegmentSum'Adam/update_Variable/UnsortedSegmentSum*
T0*
_class
loc:@Variable*0
_output_shapes
:’’’’’’’’’’’’’’’’’’
~
Adam/update_Variable/sub_3/xConst*
_output_shapes
: *
_class
loc:@Variable*
valueB
 *  ?*
dtype0

Adam/update_Variable/sub_3SubAdam/update_Variable/sub_3/x
Adam/beta2*
T0*
_class
loc:@Variable*
_output_shapes
: 
±
Adam/update_Variable/mul_4MulAdam/update_Variable/mul_3Adam/update_Variable/sub_3*
T0*
_class
loc:@Variable*0
_output_shapes
:’’’’’’’’’’’’’’’’’’

Adam/update_Variable/mul_5MulVariable/Adam_1/read
Adam/beta2*
T0*
_class
loc:@Variable* 
_output_shapes
:
”õd
Å
Adam/update_Variable/Assign_1AssignVariable/Adam_1Adam/update_Variable/mul_5*
T0*
_class
loc:@Variable*
validate_shape(*
use_locking( * 
_output_shapes
:
”õd

!Adam/update_Variable/ScatterAdd_1
ScatterAddVariable/Adam_1Adam/update_Variable/UniqueAdam/update_Variable/mul_4^Adam/update_Variable/Assign_1*
T0*
_class
loc:@Variable*
Tindices0*
use_locking( * 
_output_shapes
:
”õd

Adam/update_Variable/Sqrt_1Sqrt!Adam/update_Variable/ScatterAdd_1*
T0*
_class
loc:@Variable* 
_output_shapes
:
”õd
Ø
Adam/update_Variable/mul_6MulAdam/update_Variable/truedivAdam/update_Variable/ScatterAdd*
T0*
_class
loc:@Variable* 
_output_shapes
:
”õd

Adam/update_Variable/addAddAdam/update_Variable/Sqrt_1Adam/epsilon*
T0*
_class
loc:@Variable* 
_output_shapes
:
”õd
§
Adam/update_Variable/truediv_1RealDivAdam/update_Variable/mul_6Adam/update_Variable/add*
T0*
_class
loc:@Variable* 
_output_shapes
:
”õd
°
Adam/update_Variable/AssignSub	AssignSubVariableAdam/update_Variable/truediv_1*
T0*
_class
loc:@Variable*
use_locking( * 
_output_shapes
:
”õd
«
Adam/update_Variable/group_depsNoOp^Adam/update_Variable/AssignSub ^Adam/update_Variable/ScatterAdd"^Adam/update_Variable/ScatterAdd_1*
_class
loc:@Variable
æ
/Adam/update_rnn/gru_cell/gates/kernel/ApplyAdam	ApplyAdamrnn/gru_cell/gates/kernelrnn/gru_cell/gates/kernel/Adam rnn/gru_cell/gates/kernel/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilonFgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_acc_3*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
use_locking( *
use_nesterov( * 
_output_shapes
:
ä
±
-Adam/update_rnn/gru_cell/gates/bias/ApplyAdam	ApplyAdamrnn/gru_cell/gates/biasrnn/gru_cell/gates/bias/Adamrnn/gru_cell/gates/bias/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilonGgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_acc_3*
T0**
_class 
loc:@rnn/gru_cell/gates/bias*
use_locking( *
use_nesterov( *
_output_shapes	
:
Ū
3Adam/update_rnn/gru_cell/candidate/kernel/ApplyAdam	ApplyAdamrnn/gru_cell/candidate/kernel"rnn/gru_cell/candidate/kernel/Adam$rnn/gru_cell/candidate/kernel/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilonNgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_acc_3*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
use_locking( *
use_nesterov( * 
_output_shapes
:
ä
Ķ
1Adam/update_rnn/gru_cell/candidate/bias/ApplyAdam	ApplyAdamrnn/gru_cell/candidate/bias rnn/gru_cell/candidate/bias/Adam"rnn/gru_cell/candidate/bias/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilonOgradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_acc_3*
T0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
use_locking( *
use_nesterov( *
_output_shapes	
:
ļ
"Adam/update_dense/kernel/ApplyAdam	ApplyAdamdense/kerneldense/kernel/Adamdense/kernel/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon6gradients/dense/MatMul_grad/tuple/control_dependency_1*
T0*
_class
loc:@dense/kernel*
use_locking( *
use_nesterov( *!
_output_shapes
:”õ
į
 Adam/update_dense/bias/ApplyAdam	ApplyAdam
dense/biasdense/bias/Adamdense/bias/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon7gradients/dense/BiasAdd_grad/tuple/control_dependency_1*
T0*
_class
loc:@dense/bias*
use_locking( *
use_nesterov( *
_output_shapes

:”õ
”
Adam/mulMulbeta1_power/read
Adam/beta1 ^Adam/update_Variable/group_deps0^Adam/update_rnn/gru_cell/gates/kernel/ApplyAdam.^Adam/update_rnn/gru_cell/gates/bias/ApplyAdam4^Adam/update_rnn/gru_cell/candidate/kernel/ApplyAdam2^Adam/update_rnn/gru_cell/candidate/bias/ApplyAdam#^Adam/update_dense/kernel/ApplyAdam!^Adam/update_dense/bias/ApplyAdam*
T0*
_class
loc:@Variable*
_output_shapes
: 

Adam/AssignAssignbeta1_powerAdam/mul*
T0*
_class
loc:@Variable*
validate_shape(*
use_locking( *
_output_shapes
: 
£

Adam/mul_1Mulbeta2_power/read
Adam/beta2 ^Adam/update_Variable/group_deps0^Adam/update_rnn/gru_cell/gates/kernel/ApplyAdam.^Adam/update_rnn/gru_cell/gates/bias/ApplyAdam4^Adam/update_rnn/gru_cell/candidate/kernel/ApplyAdam2^Adam/update_rnn/gru_cell/candidate/bias/ApplyAdam#^Adam/update_dense/kernel/ApplyAdam!^Adam/update_dense/bias/ApplyAdam*
T0*
_class
loc:@Variable*
_output_shapes
: 

Adam/Assign_1Assignbeta2_power
Adam/mul_1*
T0*
_class
loc:@Variable*
validate_shape(*
use_locking( *
_output_shapes
: 
ą
AdamNoOp ^Adam/update_Variable/group_deps0^Adam/update_rnn/gru_cell/gates/kernel/ApplyAdam.^Adam/update_rnn/gru_cell/gates/bias/ApplyAdam4^Adam/update_rnn/gru_cell/candidate/kernel/ApplyAdam2^Adam/update_rnn/gru_cell/candidate/bias/ApplyAdam#^Adam/update_dense/kernel/ApplyAdam!^Adam/update_dense/bias/ApplyAdam^Adam/Assign^Adam/Assign_1
ī
initNoOp^Variable/Assign!^rnn/gru_cell/gates/kernel/Assign^rnn/gru_cell/gates/bias/Assign%^rnn/gru_cell/candidate/kernel/Assign#^rnn/gru_cell/candidate/bias/Assign^dense/kernel/Assign^dense/bias/Assign^beta1_power/Assign^beta2_power/Assign^Variable/Adam/Assign^Variable/Adam_1/Assign&^rnn/gru_cell/gates/kernel/Adam/Assign(^rnn/gru_cell/gates/kernel/Adam_1/Assign$^rnn/gru_cell/gates/bias/Adam/Assign&^rnn/gru_cell/gates/bias/Adam_1/Assign*^rnn/gru_cell/candidate/kernel/Adam/Assign,^rnn/gru_cell/candidate/kernel/Adam_1/Assign(^rnn/gru_cell/candidate/bias/Adam/Assign*^rnn/gru_cell/candidate/bias/Adam_1/Assign^dense/kernel/Adam/Assign^dense/kernel/Adam_1/Assign^dense/bias/Adam/Assign^dense/bias/Adam_1/Assign"ęĀ      ēÓM	ĆWXXÖAJ

4ķ3
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
2	
ė
	ApplyAdam
var"T	
m"T	
v"T
beta1_power"T
beta2_power"T
lr"T

beta1"T

beta2"T
epsilon"T	
grad"T
out"T"
Ttype:
2	"
use_lockingbool( "
use_nesterovbool( 
x
Assign
ref"T

value"T

output_ref"T"	
Ttype"
validate_shapebool("
use_lockingbool(
p
	AssignSub
ref"T

value"T

output_ref"T"
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

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
2	

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
<
Mul
x"T
y"T
z"T"
Ttype:
2	
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

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
2	
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

RefEnter
data"T
output"T"	
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
¢

ScatterAdd
ref"T
indices"Tindices
updates"T

output_ref"T"
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

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
handle"
	elem_typetype"

stack_namestring 
?
StackPop
handle
elem"	elem_type"
	elem_typetype
V
	StackPush
handle	
elem"T
output"T"	
Ttype"
swap_memorybool( 
ö
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

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
element_shapeshape:
`
TensorArrayGradV3

handle
flow_in
grad_handle
flow_out"
sourcestring
Y
TensorArrayReadV3

handle	
index
flow_in
value"dtype"
dtypetype
d
TensorArrayScatterV3

handle
indices

value"T
flow_in
flow_out"	
Ttype
9
TensorArraySizeV3

handle
flow_in
size
ø
TensorArrayV3
size

handle
flow"
dtypetype"
element_shapeshape:"
dynamic_sizebool( "
clear_after_readbool("
tensor_array_namestring 
`
TensorArrayWriteV3

handle	
index

value"T
flow_in
flow_out"	
Ttype
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

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
ref"dtype"
shapeshape"
dtypetype"
	containerstring "
shared_namestring 
&
	ZerosLike
x"T
y"T"	
Ttype*1.2.12v1.2.0-5-g435cdfcćŁ
n
PlaceholderPlaceholder*'
_output_shapes
:’’’’’’’’’*
shape:’’’’’’’’’*
dtype0
h
Placeholder_1Placeholder*#
_output_shapes
:’’’’’’’’’*
shape:’’’’’’’’’*
dtype0
h
Placeholder_2Placeholder*#
_output_shapes
:’’’’’’’’’*
shape:’’’’’’’’’*
dtype0
e
random_uniform/shapeConst*
_output_shapes
:*
valueB"”: d   *
dtype0
W
random_uniform/minConst*
_output_shapes
: *
valueB
 *  æ*
dtype0
W
random_uniform/maxConst*
_output_shapes
: *
valueB
 *  ?*
dtype0

random_uniform/RandomUniformRandomUniformrandom_uniform/shape*
T0* 
_output_shapes
:
”õd*

seed *
dtype0*
seed2 
b
random_uniform/subSubrandom_uniform/maxrandom_uniform/min*
T0*
_output_shapes
: 
v
random_uniform/mulMulrandom_uniform/RandomUniformrandom_uniform/sub*
T0* 
_output_shapes
:
”õd
h
random_uniformAddrandom_uniform/mulrandom_uniform/min*
T0* 
_output_shapes
:
”õd

Variable
VariableV2* 
_output_shapes
:
”õd*
	container *
shape:
”õd*
dtype0*
shared_name 
¤
Variable/AssignAssignVariablerandom_uniform*
T0*
_class
loc:@Variable*
validate_shape(*
use_locking(* 
_output_shapes
:
”õd
k
Variable/readIdentityVariable*
T0*
_class
loc:@Variable* 
_output_shapes
:
”õd
·
embedding_lookupGatherVariable/readPlaceholder*+
_output_shapes
:’’’’’’’’’d*
Tparams0*
Tindices0*
validate_indices(*
_class
loc:@Variable
F
RankConst*
_output_shapes
: *
value	B :*
dtype0
M
range/startConst*
_output_shapes
: *
value	B :*
dtype0
M
range/deltaConst*
_output_shapes
: *
value	B :*
dtype0
V
rangeRangerange/startRankrange/delta*
_output_shapes
:*

Tidx0
`
concat/values_0Const*
_output_shapes
:*
valueB"       *
dtype0
M
concat/axisConst*
_output_shapes
: *
value	B : *
dtype0
q
concatConcatV2concat/values_0rangeconcat/axis*
T0*
_output_shapes
:*
N*

Tidx0
s
	transpose	Transposeembedding_lookupconcat*
T0*+
_output_shapes
:’’’’’’’’’d*
Tperm0
R
	rnn/ShapeShape	transpose*
T0*
_output_shapes
:*
out_type0
a
rnn/strided_slice/stackConst*
_output_shapes
:*
valueB:*
dtype0
c
rnn/strided_slice/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
c
rnn/strided_slice/stack_2Const*
_output_shapes
:*
valueB:*
dtype0

rnn/strided_sliceStridedSlice	rnn/Shapernn/strided_slice/stackrnn/strided_slice/stack_1rnn/strided_slice/stack_2*
T0*
Index0*
new_axis_mask *

begin_mask *
ellipsis_mask *
_output_shapes
: *
shrink_axis_mask*
end_mask 
c
rnn/strided_slice_1/stackConst*
_output_shapes
:*
valueB:*
dtype0
e
rnn/strided_slice_1/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
e
rnn/strided_slice_1/stack_2Const*
_output_shapes
:*
valueB:*
dtype0

rnn/strided_slice_1StridedSlice	rnn/Shapernn/strided_slice_1/stackrnn/strided_slice_1/stack_1rnn/strided_slice_1/stack_2*
T0*
Index0*
new_axis_mask *

begin_mask *
ellipsis_mask *
_output_shapes
: *
shrink_axis_mask*
end_mask 
e
#rnn/GRUCellZeroState/ExpandDims/dimConst*
_output_shapes
: *
value	B : *
dtype0

rnn/GRUCellZeroState/ExpandDims
ExpandDimsrnn/strided_slice#rnn/GRUCellZeroState/ExpandDims/dim*
T0*
_output_shapes
:*

Tdim0
e
rnn/GRUCellZeroState/ConstConst*
_output_shapes
:*
valueB:*
dtype0
b
 rnn/GRUCellZeroState/concat/axisConst*
_output_shapes
: *
value	B : *
dtype0
Ą
rnn/GRUCellZeroState/concatConcatV2rnn/GRUCellZeroState/ExpandDimsrnn/GRUCellZeroState/Const rnn/GRUCellZeroState/concat/axis*
T0*
_output_shapes
:*
N*

Tidx0
g
%rnn/GRUCellZeroState/ExpandDims_1/dimConst*
_output_shapes
: *
value	B : *
dtype0

!rnn/GRUCellZeroState/ExpandDims_1
ExpandDimsrnn/strided_slice%rnn/GRUCellZeroState/ExpandDims_1/dim*
T0*
_output_shapes
:*

Tdim0
g
rnn/GRUCellZeroState/Const_1Const*
_output_shapes
:*
valueB:*
dtype0
e
 rnn/GRUCellZeroState/zeros/ConstConst*
_output_shapes
: *
valueB
 *    *
dtype0

rnn/GRUCellZeroState/zerosFillrnn/GRUCellZeroState/concat rnn/GRUCellZeroState/zeros/Const*
T0*(
_output_shapes
:’’’’’’’’’
T
rnn/Shape_1Shape	transpose*
T0*
_output_shapes
:*
out_type0
c
rnn/strided_slice_2/stackConst*
_output_shapes
:*
valueB: *
dtype0
e
rnn/strided_slice_2/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
e
rnn/strided_slice_2/stack_2Const*
_output_shapes
:*
valueB:*
dtype0

rnn/strided_slice_2StridedSlicernn/Shape_1rnn/strided_slice_2/stackrnn/strided_slice_2/stack_1rnn/strided_slice_2/stack_2*
T0*
Index0*
new_axis_mask *

begin_mask *
ellipsis_mask *
_output_shapes
: *
shrink_axis_mask*
end_mask 
c
rnn/strided_slice_3/stackConst*
_output_shapes
:*
valueB:*
dtype0
e
rnn/strided_slice_3/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
e
rnn/strided_slice_3/stack_2Const*
_output_shapes
:*
valueB:*
dtype0

rnn/strided_slice_3StridedSlicernn/Shape_1rnn/strided_slice_3/stackrnn/strided_slice_3/stack_1rnn/strided_slice_3/stack_2*
T0*
Index0*
new_axis_mask *

begin_mask *
ellipsis_mask *
_output_shapes
: *
shrink_axis_mask*
end_mask 
T
rnn/ExpandDims/dimConst*
_output_shapes
: *
value	B : *
dtype0
v
rnn/ExpandDims
ExpandDimsrnn/strided_slice_3rnn/ExpandDims/dim*
T0*
_output_shapes
:*

Tdim0
T
	rnn/ConstConst*
_output_shapes
:*
valueB:*
dtype0
Q
rnn/concat/axisConst*
_output_shapes
: *
value	B : *
dtype0
|

rnn/concatConcatV2rnn/ExpandDims	rnn/Constrnn/concat/axis*
T0*
_output_shapes
:*
N*

Tidx0
T
rnn/zeros/ConstConst*
_output_shapes
: *
valueB
 *    *
dtype0
a
	rnn/zerosFill
rnn/concatrnn/zeros/Const*
T0*(
_output_shapes
:’’’’’’’’’
J
rnn/timeConst*
_output_shapes
: *
value	B : *
dtype0
Ō
rnn/TensorArrayTensorArrayV3rnn/strided_slice_2*
dynamic_size( *
dtype0*
_output_shapes

:: *
element_shape:*/
tensor_array_namernn/dynamic_rnn/output_0*
clear_after_read(
Õ
rnn/TensorArray_1TensorArrayV3rnn/strided_slice_2*
dynamic_size( *
dtype0*
_output_shapes

:: *
element_shape:*.
tensor_array_namernn/dynamic_rnn/input_0*
clear_after_read(
e
rnn/TensorArrayUnstack/ShapeShape	transpose*
T0*
_output_shapes
:*
out_type0
t
*rnn/TensorArrayUnstack/strided_slice/stackConst*
_output_shapes
:*
valueB: *
dtype0
v
,rnn/TensorArrayUnstack/strided_slice/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
v
,rnn/TensorArrayUnstack/strided_slice/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
ģ
$rnn/TensorArrayUnstack/strided_sliceStridedSlicernn/TensorArrayUnstack/Shape*rnn/TensorArrayUnstack/strided_slice/stack,rnn/TensorArrayUnstack/strided_slice/stack_1,rnn/TensorArrayUnstack/strided_slice/stack_2*
T0*
Index0*
new_axis_mask *

begin_mask *
ellipsis_mask *
_output_shapes
: *
shrink_axis_mask*
end_mask 
d
"rnn/TensorArrayUnstack/range/startConst*
_output_shapes
: *
value	B : *
dtype0
d
"rnn/TensorArrayUnstack/range/deltaConst*
_output_shapes
: *
value	B :*
dtype0
Ä
rnn/TensorArrayUnstack/rangeRange"rnn/TensorArrayUnstack/range/start$rnn/TensorArrayUnstack/strided_slice"rnn/TensorArrayUnstack/range/delta*#
_output_shapes
:’’’’’’’’’*

Tidx0
ę
>rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3TensorArrayScatterV3rnn/TensorArray_1rnn/TensorArrayUnstack/range	transposernn/TensorArray_1:1*
T0*
_class
loc:@transpose*
_output_shapes
: 

rnn/while/EnterEnterrnn/time*
T0*
_output_shapes
: *
parallel_iterations *$

frame_namernn/while/rnn/while/*
is_constant( 
¢
rnn/while/Enter_1Enterrnn/TensorArray:1*
T0*
_output_shapes
: *
parallel_iterations *$

frame_namernn/while/rnn/while/*
is_constant( 
½
rnn/while/Enter_2Enterrnn/GRUCellZeroState/zeros*
T0*(
_output_shapes
:’’’’’’’’’*
parallel_iterations *$

frame_namernn/while/rnn/while/*
is_constant( 
n
rnn/while/MergeMergernn/while/Enterrnn/while/NextIteration*
T0*
_output_shapes
: : *
N
t
rnn/while/Merge_1Mergernn/while/Enter_1rnn/while/NextIteration_1*
T0*
_output_shapes
: : *
N

rnn/while/Merge_2Mergernn/while/Enter_2rnn/while/NextIteration_2*
T0**
_output_shapes
:’’’’’’’’’: *
N
§
rnn/while/Less/EnterEnterrnn/strided_slice_2*
T0*
_output_shapes
: *
parallel_iterations *$

frame_namernn/while/rnn/while/*
is_constant(
^
rnn/while/LessLessrnn/while/Mergernn/while/Less/Enter*
T0*
_output_shapes
: 
F
rnn/while/LoopCondLoopCondrnn/while/Less*
_output_shapes
: 

rnn/while/SwitchSwitchrnn/while/Mergernn/while/LoopCond*
T0*"
_class
loc:@rnn/while/Merge*
_output_shapes
: : 

rnn/while/Switch_1Switchrnn/while/Merge_1rnn/while/LoopCond*
T0*$
_class
loc:@rnn/while/Merge_1*
_output_shapes
: : 
°
rnn/while/Switch_2Switchrnn/while/Merge_2rnn/while/LoopCond*
T0*$
_class
loc:@rnn/while/Merge_2*<
_output_shapes*
(:’’’’’’’’’:’’’’’’’’’
S
rnn/while/IdentityIdentityrnn/while/Switch:1*
T0*
_output_shapes
: 
W
rnn/while/Identity_1Identityrnn/while/Switch_1:1*
T0*
_output_shapes
: 
i
rnn/while/Identity_2Identityrnn/while/Switch_2:1*
T0*(
_output_shapes
:’’’’’’’’’
¶
!rnn/while/TensorArrayReadV3/EnterEnterrnn/TensorArray_1*
T0*
_output_shapes
:*
parallel_iterations *$

frame_namernn/while/rnn/while/*
is_constant(
į
#rnn/while/TensorArrayReadV3/Enter_1Enter>rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*
T0*
_output_shapes
: *
parallel_iterations *$

frame_namernn/while/rnn/while/*
is_constant(
Ā
rnn/while/TensorArrayReadV3TensorArrayReadV3!rnn/while/TensorArrayReadV3/Enterrnn/while/Identity#rnn/while/TensorArrayReadV3/Enter_1*'
_output_shapes
:’’’’’’’’’d*
dtype0
¹
:rnn/gru_cell/gates/kernel/Initializer/random_uniform/shapeConst*
_output_shapes
:*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
valueB"d     *
dtype0
«
8rnn/gru_cell/gates/kernel/Initializer/random_uniform/minConst*
_output_shapes
: *,
_class"
 loc:@rnn/gru_cell/gates/kernel*
valueB
 *|x½*
dtype0
«
8rnn/gru_cell/gates/kernel/Initializer/random_uniform/maxConst*
_output_shapes
: *,
_class"
 loc:@rnn/gru_cell/gates/kernel*
valueB
 *|x=*
dtype0

Brnn/gru_cell/gates/kernel/Initializer/random_uniform/RandomUniformRandomUniform:rnn/gru_cell/gates/kernel/Initializer/random_uniform/shape*
T0*
dtype0*
seed2 * 
_output_shapes
:
ä*,
_class"
 loc:@rnn/gru_cell/gates/kernel*

seed 

8rnn/gru_cell/gates/kernel/Initializer/random_uniform/subSub8rnn/gru_cell/gates/kernel/Initializer/random_uniform/max8rnn/gru_cell/gates/kernel/Initializer/random_uniform/min*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
_output_shapes
: 

8rnn/gru_cell/gates/kernel/Initializer/random_uniform/mulMulBrnn/gru_cell/gates/kernel/Initializer/random_uniform/RandomUniform8rnn/gru_cell/gates/kernel/Initializer/random_uniform/sub*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel* 
_output_shapes
:
ä

4rnn/gru_cell/gates/kernel/Initializer/random_uniformAdd8rnn/gru_cell/gates/kernel/Initializer/random_uniform/mul8rnn/gru_cell/gates/kernel/Initializer/random_uniform/min*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel* 
_output_shapes
:
ä
æ
rnn/gru_cell/gates/kernel
VariableV2*
dtype0*
shared_name * 
_output_shapes
:
ä*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
shape:
ä*
	container 
ż
 rnn/gru_cell/gates/kernel/AssignAssignrnn/gru_cell/gates/kernel4rnn/gru_cell/gates/kernel/Initializer/random_uniform*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
ä
p
rnn/gru_cell/gates/kernel/readIdentityrnn/gru_cell/gates/kernel*
T0* 
_output_shapes
:
ä

.rnn/while/rnn/gru_cell/gates/gates/concat/axisConst^rnn/while/Identity*
_output_shapes
: *
value	B :*
dtype0
ą
)rnn/while/rnn/gru_cell/gates/gates/concatConcatV2rnn/while/TensorArrayReadV3rnn/while/Identity_2.rnn/while/rnn/gru_cell/gates/gates/concat/axis*
T0*(
_output_shapes
:’’’’’’’’’ä*
N*

Tidx0
×
/rnn/while/rnn/gru_cell/gates/gates/MatMul/EnterEnterrnn/gru_cell/gates/kernel/read*
T0* 
_output_shapes
:
ä*
parallel_iterations *$

frame_namernn/while/rnn/while/*
is_constant(
č
)rnn/while/rnn/gru_cell/gates/gates/MatMulMatMul)rnn/while/rnn/gru_cell/gates/gates/concat/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter*
T0*(
_output_shapes
:’’’’’’’’’*
transpose_b( *
transpose_a( 
¤
)rnn/gru_cell/gates/bias/Initializer/ConstConst*
_output_shapes	
:**
_class 
loc:@rnn/gru_cell/gates/bias*
valueB*  ?*
dtype0
±
rnn/gru_cell/gates/bias
VariableV2*
dtype0*
shared_name *
_output_shapes	
:**
_class 
loc:@rnn/gru_cell/gates/bias*
shape:*
	container 
ē
rnn/gru_cell/gates/bias/AssignAssignrnn/gru_cell/gates/bias)rnn/gru_cell/gates/bias/Initializer/Const*
T0**
_class 
loc:@rnn/gru_cell/gates/bias*
validate_shape(*
use_locking(*
_output_shapes	
:
g
rnn/gru_cell/gates/bias/readIdentityrnn/gru_cell/gates/bias*
T0*
_output_shapes	
:
Ń
0rnn/while/rnn/gru_cell/gates/gates/BiasAdd/EnterEnterrnn/gru_cell/gates/bias/read*
T0*
_output_shapes	
:*
parallel_iterations *$

frame_namernn/while/rnn/while/*
is_constant(
Ü
*rnn/while/rnn/gru_cell/gates/gates/BiasAddBiasAdd)rnn/while/rnn/gru_cell/gates/gates/MatMul0rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter*
T0*
data_formatNHWC*(
_output_shapes
:’’’’’’’’’

$rnn/while/rnn/gru_cell/gates/SigmoidSigmoid*rnn/while/rnn/gru_cell/gates/gates/BiasAdd*
T0*(
_output_shapes
:’’’’’’’’’
y
"rnn/while/rnn/gru_cell/gates/ConstConst^rnn/while/Identity*
_output_shapes
: *
value	B :*
dtype0

,rnn/while/rnn/gru_cell/gates/split/split_dimConst^rnn/while/Identity*
_output_shapes
: *
value	B :*
dtype0
×
"rnn/while/rnn/gru_cell/gates/splitSplit,rnn/while/rnn/gru_cell/gates/split/split_dim$rnn/while/rnn/gru_cell/gates/Sigmoid*
T0*<
_output_shapes*
(:’’’’’’’’’:’’’’’’’’’*
	num_split

$rnn/while/rnn/gru_cell/candidate/mulMul"rnn/while/rnn/gru_cell/gates/splitrnn/while/Identity_2*
T0*(
_output_shapes
:’’’’’’’’’
Į
>rnn/gru_cell/candidate/kernel/Initializer/random_uniform/shapeConst*
_output_shapes
:*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
valueB"d     *
dtype0
³
<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/minConst*
_output_shapes
: *0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
valueB
 *”½*
dtype0
³
<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/maxConst*
_output_shapes
: *0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
valueB
 *”=*
dtype0

Frnn/gru_cell/candidate/kernel/Initializer/random_uniform/RandomUniformRandomUniform>rnn/gru_cell/candidate/kernel/Initializer/random_uniform/shape*
T0*
dtype0*
seed2 * 
_output_shapes
:
ä*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*

seed 

<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/subSub<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/max<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/min*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
_output_shapes
: 
¦
<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/mulMulFrnn/gru_cell/candidate/kernel/Initializer/random_uniform/RandomUniform<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/sub*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel* 
_output_shapes
:
ä

8rnn/gru_cell/candidate/kernel/Initializer/random_uniformAdd<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/mul<rnn/gru_cell/candidate/kernel/Initializer/random_uniform/min*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel* 
_output_shapes
:
ä
Ē
rnn/gru_cell/candidate/kernel
VariableV2*
dtype0*
shared_name * 
_output_shapes
:
ä*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
shape:
ä*
	container 

$rnn/gru_cell/candidate/kernel/AssignAssignrnn/gru_cell/candidate/kernel8rnn/gru_cell/candidate/kernel/Initializer/random_uniform*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
ä
x
"rnn/gru_cell/candidate/kernel/readIdentityrnn/gru_cell/candidate/kernel*
T0* 
_output_shapes
:
ä

6rnn/while/rnn/gru_cell/candidate/candidate/concat/axisConst^rnn/while/Identity*
_output_shapes
: *
value	B :*
dtype0

1rnn/while/rnn/gru_cell/candidate/candidate/concatConcatV2rnn/while/TensorArrayReadV3$rnn/while/rnn/gru_cell/candidate/mul6rnn/while/rnn/gru_cell/candidate/candidate/concat/axis*
T0*(
_output_shapes
:’’’’’’’’’ä*
N*

Tidx0
ć
7rnn/while/rnn/gru_cell/candidate/candidate/MatMul/EnterEnter"rnn/gru_cell/candidate/kernel/read*
T0* 
_output_shapes
:
ä*
parallel_iterations *$

frame_namernn/while/rnn/while/*
is_constant(

1rnn/while/rnn/gru_cell/candidate/candidate/MatMulMatMul1rnn/while/rnn/gru_cell/candidate/candidate/concat7rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter*
T0*(
_output_shapes
:’’’’’’’’’*
transpose_b( *
transpose_a( 
¬
-rnn/gru_cell/candidate/bias/Initializer/ConstConst*
_output_shapes	
:*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
valueB*    *
dtype0
¹
rnn/gru_cell/candidate/bias
VariableV2*
dtype0*
shared_name *
_output_shapes	
:*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
shape:*
	container 
÷
"rnn/gru_cell/candidate/bias/AssignAssignrnn/gru_cell/candidate/bias-rnn/gru_cell/candidate/bias/Initializer/Const*
T0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
validate_shape(*
use_locking(*
_output_shapes	
:
o
 rnn/gru_cell/candidate/bias/readIdentityrnn/gru_cell/candidate/bias*
T0*
_output_shapes	
:
Ż
8rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/EnterEnter rnn/gru_cell/candidate/bias/read*
T0*
_output_shapes	
:*
parallel_iterations *$

frame_namernn/while/rnn/while/*
is_constant(
ō
2rnn/while/rnn/gru_cell/candidate/candidate/BiasAddBiasAdd1rnn/while/rnn/gru_cell/candidate/candidate/MatMul8rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter*
T0*
data_formatNHWC*(
_output_shapes
:’’’’’’’’’

%rnn/while/rnn/gru_cell/candidate/TanhTanh2rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd*
T0*(
_output_shapes
:’’’’’’’’’

rnn/while/rnn/gru_cell/mulMul$rnn/while/rnn/gru_cell/gates/split:1rnn/while/Identity_2*
T0*(
_output_shapes
:’’’’’’’’’
v
rnn/while/rnn/gru_cell/sub/xConst^rnn/while/Identity*
_output_shapes
: *
valueB
 *  ?*
dtype0

rnn/while/rnn/gru_cell/subSubrnn/while/rnn/gru_cell/sub/x$rnn/while/rnn/gru_cell/gates/split:1*
T0*(
_output_shapes
:’’’’’’’’’

rnn/while/rnn/gru_cell/mul_1Mulrnn/while/rnn/gru_cell/sub%rnn/while/rnn/gru_cell/candidate/Tanh*
T0*(
_output_shapes
:’’’’’’’’’

rnn/while/rnn/gru_cell/addAddrnn/while/rnn/gru_cell/mulrnn/while/rnn/gru_cell/mul_1*
T0*(
_output_shapes
:’’’’’’’’’
õ
3rnn/while/TensorArrayWrite/TensorArrayWriteV3/EnterEnterrnn/TensorArray*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*-
_class#
!loc:@rnn/while/rnn/gru_cell/add*
is_constant(

-rnn/while/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV33rnn/while/TensorArrayWrite/TensorArrayWriteV3/Enterrnn/while/Identityrnn/while/rnn/gru_cell/addrnn/while/Identity_1*
T0*-
_class#
!loc:@rnn/while/rnn/gru_cell/add*
_output_shapes
: 
f
rnn/while/add/yConst^rnn/while/Identity*
_output_shapes
: *
value	B :*
dtype0
Z
rnn/while/addAddrnn/while/Identityrnn/while/add/y*
T0*
_output_shapes
: 
X
rnn/while/NextIterationNextIterationrnn/while/add*
T0*
_output_shapes
: 
z
rnn/while/NextIteration_1NextIteration-rnn/while/TensorArrayWrite/TensorArrayWriteV3*
T0*
_output_shapes
: 
y
rnn/while/NextIteration_2NextIterationrnn/while/rnn/gru_cell/add*
T0*(
_output_shapes
:’’’’’’’’’
I
rnn/while/ExitExitrnn/while/Switch*
T0*
_output_shapes
: 
M
rnn/while/Exit_1Exitrnn/while/Switch_1*
T0*
_output_shapes
: 
_
rnn/while/Exit_2Exitrnn/while/Switch_2*
T0*(
_output_shapes
:’’’’’’’’’

&rnn/TensorArrayStack/TensorArraySizeV3TensorArraySizeV3rnn/TensorArrayrnn/while/Exit_1*
_output_shapes
: *"
_class
loc:@rnn/TensorArray

 rnn/TensorArrayStack/range/startConst*
_output_shapes
: *"
_class
loc:@rnn/TensorArray*
value	B : *
dtype0

 rnn/TensorArrayStack/range/deltaConst*
_output_shapes
: *"
_class
loc:@rnn/TensorArray*
value	B :*
dtype0
ä
rnn/TensorArrayStack/rangeRange rnn/TensorArrayStack/range/start&rnn/TensorArrayStack/TensorArraySizeV3 rnn/TensorArrayStack/range/delta*#
_output_shapes
:’’’’’’’’’*"
_class
loc:@rnn/TensorArray*

Tidx0

(rnn/TensorArrayStack/TensorArrayGatherV3TensorArrayGatherV3rnn/TensorArrayrnn/TensorArrayStack/rangernn/while/Exit_1*,
_output_shapes
:’’’’’’’’’*%
element_shape:’’’’’’’’’*
dtype0*"
_class
loc:@rnn/TensorArray
V
rnn/Const_1Const*
_output_shapes
:*
valueB:*
dtype0
J
rnn/RankConst*
_output_shapes
: *
value	B :*
dtype0
Q
rnn/range/startConst*
_output_shapes
: *
value	B :*
dtype0
Q
rnn/range/deltaConst*
_output_shapes
: *
value	B :*
dtype0
f
	rnn/rangeRangernn/range/startrnn/Rankrnn/range/delta*
_output_shapes
:*

Tidx0
f
rnn/concat_1/values_0Const*
_output_shapes
:*
valueB"       *
dtype0
S
rnn/concat_1/axisConst*
_output_shapes
: *
value	B : *
dtype0

rnn/concat_1ConcatV2rnn/concat_1/values_0	rnn/rangernn/concat_1/axis*
T0*
_output_shapes
:*
N*

Tidx0

rnn/transpose	Transpose(rnn/TensorArrayStack/TensorArrayGatherV3rnn/concat_1*
T0*,
_output_shapes
:’’’’’’’’’*
Tperm0

-dense/kernel/Initializer/random_uniform/shapeConst*
_output_shapes
:*
_class
loc:@dense/kernel*
valueB"   ”: *
dtype0

+dense/kernel/Initializer/random_uniform/minConst*
_output_shapes
: *
_class
loc:@dense/kernel*
valueB
 * ö¼*
dtype0

+dense/kernel/Initializer/random_uniform/maxConst*
_output_shapes
: *
_class
loc:@dense/kernel*
valueB
 * ö<*
dtype0
č
5dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform-dense/kernel/Initializer/random_uniform/shape*
T0*
dtype0*
seed2 *!
_output_shapes
:”õ*
_class
loc:@dense/kernel*

seed 
Ī
+dense/kernel/Initializer/random_uniform/subSub+dense/kernel/Initializer/random_uniform/max+dense/kernel/Initializer/random_uniform/min*
T0*
_class
loc:@dense/kernel*
_output_shapes
: 
ć
+dense/kernel/Initializer/random_uniform/mulMul5dense/kernel/Initializer/random_uniform/RandomUniform+dense/kernel/Initializer/random_uniform/sub*
T0*
_class
loc:@dense/kernel*!
_output_shapes
:”õ
Õ
'dense/kernel/Initializer/random_uniformAdd+dense/kernel/Initializer/random_uniform/mul+dense/kernel/Initializer/random_uniform/min*
T0*
_class
loc:@dense/kernel*!
_output_shapes
:”õ
§
dense/kernel
VariableV2*
dtype0*
shared_name *!
_output_shapes
:”õ*
_class
loc:@dense/kernel*
shape:”õ*
	container 
Ź
dense/kernel/AssignAssigndense/kernel'dense/kernel/Initializer/random_uniform*
T0*
_class
loc:@dense/kernel*
validate_shape(*
use_locking(*!
_output_shapes
:”õ
x
dense/kernel/readIdentitydense/kernel*
T0*
_class
loc:@dense/kernel*!
_output_shapes
:”õ

dense/bias/Initializer/zerosConst*
_output_shapes

:”õ*
_class
loc:@dense/bias*
valueB”õ*    *
dtype0


dense/bias
VariableV2*
dtype0*
shared_name *
_output_shapes

:”õ*
_class
loc:@dense/bias*
shape:”õ*
	container 
“
dense/bias/AssignAssign
dense/biasdense/bias/Initializer/zeros*
T0*
_class
loc:@dense/bias*
validate_shape(*
use_locking(*
_output_shapes

:”õ
m
dense/bias/readIdentity
dense/bias*
T0*
_class
loc:@dense/bias*
_output_shapes

:”õ

dense/MatMulMatMulrnn/while/Exit_2dense/kernel/read*
T0*)
_output_shapes
:’’’’’’’’’”õ*
transpose_b( *
transpose_a( 

dense/BiasAddBiasAdddense/MatMuldense/bias/read*
T0*
data_formatNHWC*)
_output_shapes
:’’’’’’’’’”õ
U
SoftmaxSoftmaxdense/BiasAdd*
T0*)
_output_shapes
:’’’’’’’’’”õ
v
)SparseSoftmaxCrossEntropyWithLogits/ShapeShapePlaceholder_1*
T0*
_output_shapes
:*
out_type0
Ž
GSparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits#SparseSoftmaxCrossEntropyWithLogitsdense/BiasAddPlaceholder_1*
T0*
Tlabels0*8
_output_shapes&
$:’’’’’’’’’:’’’’’’’’’”õ
O
ConstConst*
_output_shapes
:*
valueB: *
dtype0

MeanMeanGSparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogitsConst*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
R
gradients/ShapeConst*
_output_shapes
: *
valueB *
dtype0
T
gradients/ConstConst*
_output_shapes
: *
valueB
 *  ?*
dtype0
Y
gradients/FillFillgradients/Shapegradients/Const*
T0*
_output_shapes
: 
S
gradients/f_countConst*
_output_shapes
: *
value	B : *
dtype0
¤
gradients/f_count_1Entergradients/f_count*
T0*
_output_shapes
: *
parallel_iterations *$

frame_namernn/while/rnn/while/*
is_constant( 
r
gradients/MergeMergegradients/f_count_1gradients/NextIteration*
T0*
_output_shapes
: : *
N
b
gradients/SwitchSwitchgradients/Mergernn/while/LoopCond*
T0*
_output_shapes
: : 
f
gradients/Add/yConst^rnn/while/Identity*
_output_shapes
: *
value	B :*
dtype0
Z
gradients/AddAddgradients/Switch:1gradients/Add/y*
T0*
_output_shapes
: 
®
gradients/NextIterationNextIterationgradients/AddJ^gradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPushL^gradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPush_1J^gradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPushL^gradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPush_18^gradients/rnn/while/rnn/gru_cell/mul_grad/mul/StackPush:^gradients/rnn/while/rnn/gru_cell/mul_grad/mul_1/StackPushL^gradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPushN^gradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPush_1:^gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPush<^gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/StackPushJ^gradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPushT^gradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/StackPushO^gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/StackPushR^gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPushT^gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPush_1T^gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPushV^gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPush_1D^gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/StackPushC^gradients/rnn/while/rnn/gru_cell/gates/split_grad/concat/StackPushJ^gradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/StackPushL^gradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/StackPushG^gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/StackPushY^gradients/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/StackPush*
T0*
_output_shapes
: 
N
gradients/f_count_2Exitgradients/Switch*
T0*
_output_shapes
: 
S
gradients/b_countConst*
_output_shapes
: *
value	B :*
dtype0
°
gradients/b_count_1Entergradients/f_count_2*
T0*
_output_shapes
: *
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
is_constant( 
v
gradients/Merge_1Mergegradients/b_count_1gradients/NextIteration_1*
T0*
_output_shapes
: : *
N
·
gradients/GreaterEqual/EnterEntergradients/b_count*
T0*
_output_shapes
: *
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
is_constant(
x
gradients/GreaterEqualGreaterEqualgradients/Merge_1gradients/GreaterEqual/Enter*
T0*
_output_shapes
: 
O
gradients/b_count_2LoopCondgradients/GreaterEqual*
_output_shapes
: 
g
gradients/Switch_1Switchgradients/Merge_1gradients/b_count_2*
T0*
_output_shapes
: : 
i
gradients/SubSubgradients/Switch_1:1gradients/GreaterEqual/Enter*
T0*
_output_shapes
: 
£
gradients/NextIteration_1NextIterationgradients/SubG^gradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/b_sync*
T0*
_output_shapes
: 
P
gradients/b_count_3Exitgradients/Switch_1*
T0*
_output_shapes
: 
k
!gradients/Mean_grad/Reshape/shapeConst*
_output_shapes
:*
valueB:*
dtype0

gradients/Mean_grad/ReshapeReshapegradients/Fill!gradients/Mean_grad/Reshape/shape*
T0*
_output_shapes
:*
Tshape0
 
gradients/Mean_grad/ShapeShapeGSparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits*
T0*
_output_shapes
:*
out_type0

gradients/Mean_grad/TileTilegradients/Mean_grad/Reshapegradients/Mean_grad/Shape*
T0*#
_output_shapes
:’’’’’’’’’*

Tmultiples0
¢
gradients/Mean_grad/Shape_1ShapeGSparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits*
T0*
_output_shapes
:*
out_type0
^
gradients/Mean_grad/Shape_2Const*
_output_shapes
: *
valueB *
dtype0
c
gradients/Mean_grad/ConstConst*
_output_shapes
:*
valueB: *
dtype0

gradients/Mean_grad/ProdProdgradients/Mean_grad/Shape_1gradients/Mean_grad/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
e
gradients/Mean_grad/Const_1Const*
_output_shapes
:*
valueB: *
dtype0

gradients/Mean_grad/Prod_1Prodgradients/Mean_grad/Shape_2gradients/Mean_grad/Const_1*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
_
gradients/Mean_grad/Maximum/yConst*
_output_shapes
: *
value	B :*
dtype0

gradients/Mean_grad/MaximumMaximumgradients/Mean_grad/Prod_1gradients/Mean_grad/Maximum/y*
T0*
_output_shapes
: 

gradients/Mean_grad/floordivFloorDivgradients/Mean_grad/Prodgradients/Mean_grad/Maximum*
T0*
_output_shapes
: 
n
gradients/Mean_grad/CastCastgradients/Mean_grad/floordiv*

SrcT0*
_output_shapes
: *

DstT0

gradients/Mean_grad/truedivRealDivgradients/Mean_grad/Tilegradients/Mean_grad/Cast*
T0*#
_output_shapes
:’’’’’’’’’
 
gradients/zeros_like	ZerosLikeISparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits:1*
T0*)
_output_shapes
:’’’’’’’’’”õ
Æ
fgradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/PreventGradientPreventGradientISparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits:1*
T0*“
messageØ„Currently there is no way to take the second derivative of sparse_softmax_cross_entropy_with_logits due to the fused implementation's interaction with tf.gradients()*)
_output_shapes
:’’’’’’’’’”õ
°
egradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDims/dimConst*
_output_shapes
: *
valueB :
’’’’’’’’’*
dtype0
±
agradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDims
ExpandDimsgradients/Mean_grad/truedivegradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDims/dim*
T0*'
_output_shapes
:’’’’’’’’’*

Tdim0
ą
Zgradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mulMulagradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDimsfgradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/PreventGradient*
T0*)
_output_shapes
:’’’’’’’’’”õ
Ń
(gradients/dense/BiasAdd_grad/BiasAddGradBiasAddGradZgradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mul*
T0*
data_formatNHWC*
_output_shapes

:”õ
½
-gradients/dense/BiasAdd_grad/tuple/group_depsNoOp[^gradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mul)^gradients/dense/BiasAdd_grad/BiasAddGrad
š
5gradients/dense/BiasAdd_grad/tuple/control_dependencyIdentityZgradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mul.^gradients/dense/BiasAdd_grad/tuple/group_deps*
T0*m
_classc
a_loc:@gradients/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mul*)
_output_shapes
:’’’’’’’’’”õ

7gradients/dense/BiasAdd_grad/tuple/control_dependency_1Identity(gradients/dense/BiasAdd_grad/BiasAddGrad.^gradients/dense/BiasAdd_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients/dense/BiasAdd_grad/BiasAddGrad*
_output_shapes

:”õ
Ļ
"gradients/dense/MatMul_grad/MatMulMatMul5gradients/dense/BiasAdd_grad/tuple/control_dependencydense/kernel/read*
T0*(
_output_shapes
:’’’’’’’’’*
transpose_b(*
transpose_a( 
É
$gradients/dense/MatMul_grad/MatMul_1MatMulrnn/while/Exit_25gradients/dense/BiasAdd_grad/tuple/control_dependency*
T0*!
_output_shapes
:”õ*
transpose_b( *
transpose_a(

,gradients/dense/MatMul_grad/tuple/group_depsNoOp#^gradients/dense/MatMul_grad/MatMul%^gradients/dense/MatMul_grad/MatMul_1
ż
4gradients/dense/MatMul_grad/tuple/control_dependencyIdentity"gradients/dense/MatMul_grad/MatMul-^gradients/dense/MatMul_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients/dense/MatMul_grad/MatMul*(
_output_shapes
:’’’’’’’’’
ü
6gradients/dense/MatMul_grad/tuple/control_dependency_1Identity$gradients/dense/MatMul_grad/MatMul_1-^gradients/dense/MatMul_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients/dense/MatMul_grad/MatMul_1*!
_output_shapes
:”õ
T
gradients/zerosConst*
_output_shapes
: *
valueB
 *    *
dtype0
ö
&gradients/rnn/while/Exit_2_grad/b_exitEnter4gradients/dense/MatMul_grad/tuple/control_dependency*
T0*(
_output_shapes
:’’’’’’’’’*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
is_constant( 
æ
&gradients/rnn/while/Exit_1_grad/b_exitEntergradients/zeros*
T0*
_output_shapes
: *
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
is_constant( 
Ģ
*gradients/rnn/while/Switch_2_grad/b_switchMerge&gradients/rnn/while/Exit_2_grad/b_exit1gradients/rnn/while/Switch_2_grad_1/NextIteration*
T0**
_output_shapes
:’’’’’’’’’: *
N
ų
'gradients/rnn/while/Merge_2_grad/SwitchSwitch*gradients/rnn/while/Switch_2_grad/b_switchgradients/b_count_2*
T0*=
_class3
1/loc:@gradients/rnn/while/Switch_2_grad/b_switch*<
_output_shapes*
(:’’’’’’’’’:’’’’’’’’’
c
1gradients/rnn/while/Merge_2_grad/tuple/group_depsNoOp(^gradients/rnn/while/Merge_2_grad/Switch

9gradients/rnn/while/Merge_2_grad/tuple/control_dependencyIdentity'gradients/rnn/while/Merge_2_grad/Switch2^gradients/rnn/while/Merge_2_grad/tuple/group_deps*
T0*=
_class3
1/loc:@gradients/rnn/while/Switch_2_grad/b_switch*(
_output_shapes
:’’’’’’’’’

;gradients/rnn/while/Merge_2_grad/tuple/control_dependency_1Identity)gradients/rnn/while/Merge_2_grad/Switch:12^gradients/rnn/while/Merge_2_grad/tuple/group_deps*
T0*=
_class3
1/loc:@gradients/rnn/while/Switch_2_grad/b_switch*(
_output_shapes
:’’’’’’’’’

%gradients/rnn/while/Enter_2_grad/ExitExit9gradients/rnn/while/Merge_2_grad/tuple/control_dependency*
T0*(
_output_shapes
:’’’’’’’’’

/gradients/rnn/GRUCellZeroState/zeros_grad/ConstConst*
_output_shapes
:*
valueB"       *
dtype0
Ź
-gradients/rnn/GRUCellZeroState/zeros_grad/SumSum%gradients/rnn/while/Enter_2_grad/Exit/gradients/rnn/GRUCellZeroState/zeros_grad/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0

/gradients/rnn/while/rnn/gru_cell/add_grad/ShapeShapernn/while/rnn/gru_cell/mul*
T0*
_output_shapes
:*
out_type0

1gradients/rnn/while/rnn/gru_cell/add_grad/Shape_1Shapernn/while/rnn/gru_cell/mul_1*
T0*
_output_shapes
:*
out_type0
Ń
Egradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/f_accStack*

stack_name *B
_class8
64loc:@gradients/rnn/while/rnn/gru_cell/add_grad/Shape*
	elem_type0*
_output_shapes
:
Ų
Hgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/RefEnterRefEnterEgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*B
_class8
64loc:@gradients/rnn/while/rnn/gru_cell/add_grad/Shape*
is_constant(
Ż
Igradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPush	StackPushHgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/RefEnter/gradients/rnn/while/rnn/gru_cell/add_grad/Shape^gradients/Add*
T0*
swap_memory( *B
_class8
64loc:@gradients/rnn/while/rnn/gru_cell/add_grad/Shape*
_output_shapes
:
ė
Qgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop/RefEnterRefEnterEgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*B
_class8
64loc:@gradients/rnn/while/rnn/gru_cell/add_grad/Shape*
is_constant(
Ø
Hgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPopStackPopQgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop/RefEnter^gradients/Sub*
_output_shapes
:*B
_class8
64loc:@gradients/rnn/while/rnn/gru_cell/add_grad/Shape*
	elem_type0

Fgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/b_syncControlTriggerI^gradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPopK^gradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop_1I^gradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPopK^gradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop_17^gradients/rnn/while/rnn/gru_cell/mul_grad/mul/StackPop9^gradients/rnn/while/rnn/gru_cell/mul_grad/mul_1/StackPopK^gradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPopM^gradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop_19^gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPop;^gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/StackPopI^gradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPopS^gradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/StackPopN^gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/StackPopQ^gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPopS^gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop_1S^gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPopU^gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop_1C^gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/StackPopB^gradients/rnn/while/rnn/gru_cell/gates/split_grad/concat/StackPopI^gradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/StackPopK^gradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/StackPopF^gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/StackPopX^gradients/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/StackPop
Õ
Ggradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/f_acc_1Stack*

stack_name *D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/add_grad/Shape_1*
	elem_type0*
_output_shapes
:
Ž
Jgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/RefEnter_1RefEnterGgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/add_grad/Shape_1*
is_constant(
å
Kgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPush_1	StackPushJgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/RefEnter_11gradients/rnn/while/rnn/gru_cell/add_grad/Shape_1^gradients/Add*
T0*
swap_memory( *D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/add_grad/Shape_1*
_output_shapes
:
ń
Sgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop_1/RefEnterRefEnterGgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/add_grad/Shape_1*
is_constant(
®
Jgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop_1StackPopSgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop_1/RefEnter^gradients/Sub*
_output_shapes
:*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/add_grad/Shape_1*
	elem_type0
«
?gradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgsBroadcastGradientArgsHgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPopJgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop_1*
T0*2
_output_shapes 
:’’’’’’’’’:’’’’’’’’’
ņ
-gradients/rnn/while/rnn/gru_cell/add_grad/SumSum;gradients/rnn/while/Merge_2_grad/tuple/control_dependency_1?gradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
ž
1gradients/rnn/while/rnn/gru_cell/add_grad/ReshapeReshape-gradients/rnn/while/rnn/gru_cell/add_grad/SumHgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop*
T0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’*
Tshape0
ö
/gradients/rnn/while/rnn/gru_cell/add_grad/Sum_1Sum;gradients/rnn/while/Merge_2_grad/tuple/control_dependency_1Agradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0

3gradients/rnn/while/rnn/gru_cell/add_grad/Reshape_1Reshape/gradients/rnn/while/rnn/gru_cell/add_grad/Sum_1Jgradients/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/StackPop_1*
T0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’*
Tshape0
¬
:gradients/rnn/while/rnn/gru_cell/add_grad/tuple/group_depsNoOp2^gradients/rnn/while/rnn/gru_cell/add_grad/Reshape4^gradients/rnn/while/rnn/gru_cell/add_grad/Reshape_1
·
Bgradients/rnn/while/rnn/gru_cell/add_grad/tuple/control_dependencyIdentity1gradients/rnn/while/rnn/gru_cell/add_grad/Reshape;^gradients/rnn/while/rnn/gru_cell/add_grad/tuple/group_deps*
T0*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/add_grad/Reshape*(
_output_shapes
:’’’’’’’’’
½
Dgradients/rnn/while/rnn/gru_cell/add_grad/tuple/control_dependency_1Identity3gradients/rnn/while/rnn/gru_cell/add_grad/Reshape_1;^gradients/rnn/while/rnn/gru_cell/add_grad/tuple/group_deps*
T0*F
_class<
:8loc:@gradients/rnn/while/rnn/gru_cell/add_grad/Reshape_1*(
_output_shapes
:’’’’’’’’’

/gradients/rnn/while/rnn/gru_cell/mul_grad/ShapeShape$rnn/while/rnn/gru_cell/gates/split:1*
T0*
_output_shapes
:*
out_type0

1gradients/rnn/while/rnn/gru_cell/mul_grad/Shape_1Shapernn/while/Identity_2*
T0*
_output_shapes
:*
out_type0
Ń
Egradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/f_accStack*

stack_name *B
_class8
64loc:@gradients/rnn/while/rnn/gru_cell/mul_grad/Shape*
	elem_type0*
_output_shapes
:
Ų
Hgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/RefEnterRefEnterEgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*B
_class8
64loc:@gradients/rnn/while/rnn/gru_cell/mul_grad/Shape*
is_constant(
Ż
Igradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPush	StackPushHgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/RefEnter/gradients/rnn/while/rnn/gru_cell/mul_grad/Shape^gradients/Add*
T0*
swap_memory( *B
_class8
64loc:@gradients/rnn/while/rnn/gru_cell/mul_grad/Shape*
_output_shapes
:
ė
Qgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop/RefEnterRefEnterEgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*B
_class8
64loc:@gradients/rnn/while/rnn/gru_cell/mul_grad/Shape*
is_constant(
Ø
Hgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPopStackPopQgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop/RefEnter^gradients/Sub*
_output_shapes
:*B
_class8
64loc:@gradients/rnn/while/rnn/gru_cell/mul_grad/Shape*
	elem_type0
Õ
Ggradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/f_acc_1Stack*

stack_name *D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/mul_grad/Shape_1*
	elem_type0*
_output_shapes
:
Ž
Jgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/RefEnter_1RefEnterGgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/mul_grad/Shape_1*
is_constant(
å
Kgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPush_1	StackPushJgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/RefEnter_11gradients/rnn/while/rnn/gru_cell/mul_grad/Shape_1^gradients/Add*
T0*
swap_memory( *D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/mul_grad/Shape_1*
_output_shapes
:
ń
Sgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop_1/RefEnterRefEnterGgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/mul_grad/Shape_1*
is_constant(
®
Jgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop_1StackPopSgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop_1/RefEnter^gradients/Sub*
_output_shapes
:*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/mul_grad/Shape_1*
	elem_type0
«
?gradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgsBroadcastGradientArgsHgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPopJgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop_1*
T0*2
_output_shapes 
:’’’’’’’’’:’’’’’’’’’
¤
3gradients/rnn/while/rnn/gru_cell/mul_grad/mul/f_accStack*

stack_name *'
_class
loc:@rnn/while/Identity_2*
	elem_type0*
_output_shapes
:

6gradients/rnn/while/rnn/gru_cell/mul_grad/mul/RefEnterRefEnter3gradients/rnn/while/rnn/gru_cell/mul_grad/mul/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*'
_class
loc:@rnn/while/Identity_2*
is_constant(

7gradients/rnn/while/rnn/gru_cell/mul_grad/mul/StackPush	StackPush6gradients/rnn/while/rnn/gru_cell/mul_grad/mul/RefEnterrnn/while/Identity_2^gradients/Add*
T0*
swap_memory( *'
_class
loc:@rnn/while/Identity_2*(
_output_shapes
:’’’’’’’’’
¬
?gradients/rnn/while/rnn/gru_cell/mul_grad/mul/StackPop/RefEnterRefEnter3gradients/rnn/while/rnn/gru_cell/mul_grad/mul/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*'
_class
loc:@rnn/while/Identity_2*
is_constant(
÷
6gradients/rnn/while/rnn/gru_cell/mul_grad/mul/StackPopStackPop?gradients/rnn/while/rnn/gru_cell/mul_grad/mul/StackPop/RefEnter^gradients/Sub*(
_output_shapes
:’’’’’’’’’*'
_class
loc:@rnn/while/Identity_2*
	elem_type0
ć
-gradients/rnn/while/rnn/gru_cell/mul_grad/mulMulBgradients/rnn/while/rnn/gru_cell/add_grad/tuple/control_dependency6gradients/rnn/while/rnn/gru_cell/mul_grad/mul/StackPop*
T0*(
_output_shapes
:’’’’’’’’’
ä
-gradients/rnn/while/rnn/gru_cell/mul_grad/SumSum-gradients/rnn/while/rnn/gru_cell/mul_grad/mul?gradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
ž
1gradients/rnn/while/rnn/gru_cell/mul_grad/ReshapeReshape-gradients/rnn/while/rnn/gru_cell/mul_grad/SumHgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop*
T0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’*
Tshape0
“
5gradients/rnn/while/rnn/gru_cell/mul_grad/mul_1/f_accStack*

stack_name *5
_class+
)'loc:@rnn/while/rnn/gru_cell/gates/split*
	elem_type0*
_output_shapes
:
«
8gradients/rnn/while/rnn/gru_cell/mul_grad/mul_1/RefEnterRefEnter5gradients/rnn/while/rnn/gru_cell/mul_grad/mul_1/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*5
_class+
)'loc:@rnn/while/rnn/gru_cell/gates/split*
is_constant(
³
9gradients/rnn/while/rnn/gru_cell/mul_grad/mul_1/StackPush	StackPush8gradients/rnn/while/rnn/gru_cell/mul_grad/mul_1/RefEnter$rnn/while/rnn/gru_cell/gates/split:1^gradients/Add*
T0*
swap_memory( *5
_class+
)'loc:@rnn/while/rnn/gru_cell/gates/split*(
_output_shapes
:’’’’’’’’’
¾
Agradients/rnn/while/rnn/gru_cell/mul_grad/mul_1/StackPop/RefEnterRefEnter5gradients/rnn/while/rnn/gru_cell/mul_grad/mul_1/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*5
_class+
)'loc:@rnn/while/rnn/gru_cell/gates/split*
is_constant(

8gradients/rnn/while/rnn/gru_cell/mul_grad/mul_1/StackPopStackPopAgradients/rnn/while/rnn/gru_cell/mul_grad/mul_1/StackPop/RefEnter^gradients/Sub*(
_output_shapes
:’’’’’’’’’*5
_class+
)'loc:@rnn/while/rnn/gru_cell/gates/split*
	elem_type0
ē
/gradients/rnn/while/rnn/gru_cell/mul_grad/mul_1Mul8gradients/rnn/while/rnn/gru_cell/mul_grad/mul_1/StackPopBgradients/rnn/while/rnn/gru_cell/add_grad/tuple/control_dependency*
T0*(
_output_shapes
:’’’’’’’’’
ź
/gradients/rnn/while/rnn/gru_cell/mul_grad/Sum_1Sum/gradients/rnn/while/rnn/gru_cell/mul_grad/mul_1Agradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0

3gradients/rnn/while/rnn/gru_cell/mul_grad/Reshape_1Reshape/gradients/rnn/while/rnn/gru_cell/mul_grad/Sum_1Jgradients/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/StackPop_1*
T0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’*
Tshape0
¬
:gradients/rnn/while/rnn/gru_cell/mul_grad/tuple/group_depsNoOp2^gradients/rnn/while/rnn/gru_cell/mul_grad/Reshape4^gradients/rnn/while/rnn/gru_cell/mul_grad/Reshape_1
·
Bgradients/rnn/while/rnn/gru_cell/mul_grad/tuple/control_dependencyIdentity1gradients/rnn/while/rnn/gru_cell/mul_grad/Reshape;^gradients/rnn/while/rnn/gru_cell/mul_grad/tuple/group_deps*
T0*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/mul_grad/Reshape*(
_output_shapes
:’’’’’’’’’
½
Dgradients/rnn/while/rnn/gru_cell/mul_grad/tuple/control_dependency_1Identity3gradients/rnn/while/rnn/gru_cell/mul_grad/Reshape_1;^gradients/rnn/while/rnn/gru_cell/mul_grad/tuple/group_deps*
T0*F
_class<
:8loc:@gradients/rnn/while/rnn/gru_cell/mul_grad/Reshape_1*(
_output_shapes
:’’’’’’’’’

1gradients/rnn/while/rnn/gru_cell/mul_1_grad/ShapeShapernn/while/rnn/gru_cell/sub*
T0*
_output_shapes
:*
out_type0

3gradients/rnn/while/rnn/gru_cell/mul_1_grad/Shape_1Shape%rnn/while/rnn/gru_cell/candidate/Tanh*
T0*
_output_shapes
:*
out_type0
Õ
Ggradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/f_accStack*

stack_name *D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/mul_1_grad/Shape*
	elem_type0*
_output_shapes
:
Ž
Jgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/RefEnterRefEnterGgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/mul_1_grad/Shape*
is_constant(
å
Kgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPush	StackPushJgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/RefEnter1gradients/rnn/while/rnn/gru_cell/mul_1_grad/Shape^gradients/Add*
T0*
swap_memory( *D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/mul_1_grad/Shape*
_output_shapes
:
ń
Sgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop/RefEnterRefEnterGgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/mul_1_grad/Shape*
is_constant(
®
Jgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPopStackPopSgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop/RefEnter^gradients/Sub*
_output_shapes
:*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/mul_1_grad/Shape*
	elem_type0
Ł
Igradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/f_acc_1Stack*

stack_name *F
_class<
:8loc:@gradients/rnn/while/rnn/gru_cell/mul_1_grad/Shape_1*
	elem_type0*
_output_shapes
:
ä
Lgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/RefEnter_1RefEnterIgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*F
_class<
:8loc:@gradients/rnn/while/rnn/gru_cell/mul_1_grad/Shape_1*
is_constant(
ķ
Mgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPush_1	StackPushLgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/RefEnter_13gradients/rnn/while/rnn/gru_cell/mul_1_grad/Shape_1^gradients/Add*
T0*
swap_memory( *F
_class<
:8loc:@gradients/rnn/while/rnn/gru_cell/mul_1_grad/Shape_1*
_output_shapes
:
÷
Ugradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop_1/RefEnterRefEnterIgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*F
_class<
:8loc:@gradients/rnn/while/rnn/gru_cell/mul_1_grad/Shape_1*
is_constant(
“
Lgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop_1StackPopUgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop_1/RefEnter^gradients/Sub*
_output_shapes
:*F
_class<
:8loc:@gradients/rnn/while/rnn/gru_cell/mul_1_grad/Shape_1*
	elem_type0
±
Agradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgsBroadcastGradientArgsJgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPopLgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop_1*
T0*2
_output_shapes 
:’’’’’’’’’:’’’’’’’’’
·
5gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul/f_accStack*

stack_name *8
_class.
,*loc:@rnn/while/rnn/gru_cell/candidate/Tanh*
	elem_type0*
_output_shapes
:
®
8gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul/RefEnterRefEnter5gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*8
_class.
,*loc:@rnn/while/rnn/gru_cell/candidate/Tanh*
is_constant(
·
9gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPush	StackPush8gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul/RefEnter%rnn/while/rnn/gru_cell/candidate/Tanh^gradients/Add*
T0*
swap_memory( *8
_class.
,*loc:@rnn/while/rnn/gru_cell/candidate/Tanh*(
_output_shapes
:’’’’’’’’’
Į
Agradients/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPop/RefEnterRefEnter5gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*8
_class.
,*loc:@rnn/while/rnn/gru_cell/candidate/Tanh*
is_constant(

8gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPopStackPopAgradients/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPop/RefEnter^gradients/Sub*(
_output_shapes
:’’’’’’’’’*8
_class.
,*loc:@rnn/while/rnn/gru_cell/candidate/Tanh*
	elem_type0
é
/gradients/rnn/while/rnn/gru_cell/mul_1_grad/mulMulDgradients/rnn/while/rnn/gru_cell/add_grad/tuple/control_dependency_18gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPop*
T0*(
_output_shapes
:’’’’’’’’’
ź
/gradients/rnn/while/rnn/gru_cell/mul_1_grad/SumSum/gradients/rnn/while/rnn/gru_cell/mul_1_grad/mulAgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0

3gradients/rnn/while/rnn/gru_cell/mul_1_grad/ReshapeReshape/gradients/rnn/while/rnn/gru_cell/mul_1_grad/SumJgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop*
T0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’*
Tshape0
®
7gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/f_accStack*

stack_name *-
_class#
!loc:@rnn/while/rnn/gru_cell/sub*
	elem_type0*
_output_shapes
:
§
:gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/RefEnterRefEnter7gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*-
_class#
!loc:@rnn/while/rnn/gru_cell/sub*
is_constant(
„
;gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/StackPush	StackPush:gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/RefEnterrnn/while/rnn/gru_cell/sub^gradients/Add*
T0*
swap_memory( *-
_class#
!loc:@rnn/while/rnn/gru_cell/sub*(
_output_shapes
:’’’’’’’’’
ŗ
Cgradients/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/StackPop/RefEnterRefEnter7gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*-
_class#
!loc:@rnn/while/rnn/gru_cell/sub*
is_constant(

:gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/StackPopStackPopCgradients/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/StackPop/RefEnter^gradients/Sub*(
_output_shapes
:’’’’’’’’’*-
_class#
!loc:@rnn/while/rnn/gru_cell/sub*
	elem_type0
ķ
1gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul_1Mul:gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/StackPopDgradients/rnn/while/rnn/gru_cell/add_grad/tuple/control_dependency_1*
T0*(
_output_shapes
:’’’’’’’’’
š
1gradients/rnn/while/rnn/gru_cell/mul_1_grad/Sum_1Sum1gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul_1Cgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0

5gradients/rnn/while/rnn/gru_cell/mul_1_grad/Reshape_1Reshape1gradients/rnn/while/rnn/gru_cell/mul_1_grad/Sum_1Lgradients/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/StackPop_1*
T0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’*
Tshape0
²
<gradients/rnn/while/rnn/gru_cell/mul_1_grad/tuple/group_depsNoOp4^gradients/rnn/while/rnn/gru_cell/mul_1_grad/Reshape6^gradients/rnn/while/rnn/gru_cell/mul_1_grad/Reshape_1
æ
Dgradients/rnn/while/rnn/gru_cell/mul_1_grad/tuple/control_dependencyIdentity3gradients/rnn/while/rnn/gru_cell/mul_1_grad/Reshape=^gradients/rnn/while/rnn/gru_cell/mul_1_grad/tuple/group_deps*
T0*F
_class<
:8loc:@gradients/rnn/while/rnn/gru_cell/mul_1_grad/Reshape*(
_output_shapes
:’’’’’’’’’
Å
Fgradients/rnn/while/rnn/gru_cell/mul_1_grad/tuple/control_dependency_1Identity5gradients/rnn/while/rnn/gru_cell/mul_1_grad/Reshape_1=^gradients/rnn/while/rnn/gru_cell/mul_1_grad/tuple/group_deps*
T0*H
_class>
<:loc:@gradients/rnn/while/rnn/gru_cell/mul_1_grad/Reshape_1*(
_output_shapes
:’’’’’’’’’

/gradients/rnn/while/rnn/gru_cell/sub_grad/ShapeConst^gradients/Sub*
_output_shapes
: *
valueB *
dtype0

1gradients/rnn/while/rnn/gru_cell/sub_grad/Shape_1Shape$rnn/while/rnn/gru_cell/gates/split:1*
T0*
_output_shapes
:*
out_type0
Ó
Egradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/f_accStack*

stack_name *D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/sub_grad/Shape_1*
	elem_type0*
_output_shapes
:
Ś
Hgradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/RefEnterRefEnterEgradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/sub_grad/Shape_1*
is_constant(
į
Igradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPush	StackPushHgradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/RefEnter1gradients/rnn/while/rnn/gru_cell/sub_grad/Shape_1^gradients/Add*
T0*
swap_memory( *D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/sub_grad/Shape_1*
_output_shapes
:
ķ
Qgradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPop/RefEnterRefEnterEgradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/sub_grad/Shape_1*
is_constant(
Ŗ
Hgradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPopStackPopQgradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPop/RefEnter^gradients/Sub*
_output_shapes
:*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/sub_grad/Shape_1*
	elem_type0

?gradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgsBroadcastGradientArgs/gradients/rnn/while/rnn/gru_cell/sub_grad/ShapeHgradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPop*
T0*2
_output_shapes 
:’’’’’’’’’:’’’’’’’’’
ū
-gradients/rnn/while/rnn/gru_cell/sub_grad/SumSumDgradients/rnn/while/rnn/gru_cell/mul_1_grad/tuple/control_dependency?gradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
Ė
1gradients/rnn/while/rnn/gru_cell/sub_grad/ReshapeReshape-gradients/rnn/while/rnn/gru_cell/sub_grad/Sum/gradients/rnn/while/rnn/gru_cell/sub_grad/Shape*
T0*
_output_shapes
: *
Tshape0
’
/gradients/rnn/while/rnn/gru_cell/sub_grad/Sum_1SumDgradients/rnn/while/rnn/gru_cell/mul_1_grad/tuple/control_dependencyAgradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0

-gradients/rnn/while/rnn/gru_cell/sub_grad/NegNeg/gradients/rnn/while/rnn/gru_cell/sub_grad/Sum_1*
T0*
_output_shapes
:

3gradients/rnn/while/rnn/gru_cell/sub_grad/Reshape_1Reshape-gradients/rnn/while/rnn/gru_cell/sub_grad/NegHgradients/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/StackPop*
T0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’*
Tshape0
¬
:gradients/rnn/while/rnn/gru_cell/sub_grad/tuple/group_depsNoOp2^gradients/rnn/while/rnn/gru_cell/sub_grad/Reshape4^gradients/rnn/while/rnn/gru_cell/sub_grad/Reshape_1
„
Bgradients/rnn/while/rnn/gru_cell/sub_grad/tuple/control_dependencyIdentity1gradients/rnn/while/rnn/gru_cell/sub_grad/Reshape;^gradients/rnn/while/rnn/gru_cell/sub_grad/tuple/group_deps*
T0*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/sub_grad/Reshape*
_output_shapes
: 
½
Dgradients/rnn/while/rnn/gru_cell/sub_grad/tuple/control_dependency_1Identity3gradients/rnn/while/rnn/gru_cell/sub_grad/Reshape_1;^gradients/rnn/while/rnn/gru_cell/sub_grad/tuple/group_deps*
T0*F
_class<
:8loc:@gradients/rnn/while/rnn/gru_cell/sub_grad/Reshape_1*(
_output_shapes
:’’’’’’’’’
ž
=gradients/rnn/while/rnn/gru_cell/candidate/Tanh_grad/TanhGradTanhGrad8gradients/rnn/while/rnn/gru_cell/mul_1_grad/mul/StackPopFgradients/rnn/while/rnn/gru_cell/mul_1_grad/tuple/control_dependency_1*
T0*(
_output_shapes
:’’’’’’’’’
Ų
Mgradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/BiasAddGradBiasAddGrad=gradients/rnn/while/rnn/gru_cell/candidate/Tanh_grad/TanhGrad*
T0*
data_formatNHWC*
_output_shapes	
:
ź
Rgradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/group_depsNoOp>^gradients/rnn/while/rnn/gru_cell/candidate/Tanh_grad/TanhGradN^gradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/BiasAddGrad
’
Zgradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/control_dependencyIdentity=gradients/rnn/while/rnn/gru_cell/candidate/Tanh_grad/TanhGradS^gradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/group_deps*
T0*P
_classF
DBloc:@gradients/rnn/while/rnn/gru_cell/candidate/Tanh_grad/TanhGrad*(
_output_shapes
:’’’’’’’’’

\gradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/control_dependency_1IdentityMgradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/BiasAddGradS^gradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/group_deps*
T0*`
_classV
TRloc:@gradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/BiasAddGrad*
_output_shapes	
:

Mgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul/EnterEnter"rnn/gru_cell/candidate/kernel/read*
T0* 
_output_shapes
:
ä*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
is_constant(
Õ
Ggradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMulMatMulZgradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/control_dependencyMgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul/Enter*
T0*(
_output_shapes
:’’’’’’’’’ä*
transpose_b(*
transpose_a( 
Ż
Ogradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/f_accStack*

stack_name *D
_class:
86loc:@rnn/while/rnn/gru_cell/candidate/candidate/concat*
	elem_type0*
_output_shapes
:
ī
Rgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/RefEnterRefEnterOgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*D
_class:
86loc:@rnn/while/rnn/gru_cell/candidate/candidate/concat*
is_constant(

Sgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/StackPush	StackPushRgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/RefEnter1rnn/while/rnn/gru_cell/candidate/candidate/concat^gradients/Add*
T0*
swap_memory( *D
_class:
86loc:@rnn/while/rnn/gru_cell/candidate/candidate/concat*(
_output_shapes
:’’’’’’’’’ä

[gradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/StackPop/RefEnterRefEnterOgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*D
_class:
86loc:@rnn/while/rnn/gru_cell/candidate/candidate/concat*
is_constant(
Ģ
Rgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/StackPopStackPop[gradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/StackPop/RefEnter^gradients/Sub*(
_output_shapes
:’’’’’’’’’ä*D
_class:
86loc:@rnn/while/rnn/gru_cell/candidate/candidate/concat*
	elem_type0
Ō
Igradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1MatMulRgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/StackPopZgradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/control_dependency*
T0* 
_output_shapes
:
ä*
transpose_b( *
transpose_a(
ļ
Qgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/group_depsNoOpH^gradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMulJ^gradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1

Ygradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/control_dependencyIdentityGgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMulR^gradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/group_deps*
T0*Z
_classP
NLloc:@gradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul*(
_output_shapes
:’’’’’’’’’ä

[gradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/control_dependency_1IdentityIgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1R^gradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/group_deps*
T0*\
_classR
PNloc:@gradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1* 
_output_shapes
:
ä

Mgradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_accConst*
_output_shapes	
:*
valueB*    *
dtype0
«
Ogradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_acc_1EnterMgradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_acc*
T0*
_output_shapes	
:*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
is_constant( 
±
Ogradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_acc_2MergeOgradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_acc_1Ugradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/NextIteration*
T0*
_output_shapes
	:: *
N
ė
Ngradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/SwitchSwitchOgradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_acc_2gradients/b_count_2*
T0*"
_output_shapes
::
Ø
Kgradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/AddAddPgradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/Switch:1\gradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd_grad/tuple/control_dependency_1*
T0*
_output_shapes	
:
Ł
Ugradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/NextIterationNextIterationKgradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/Add*
T0*
_output_shapes	
:
Ķ
Ogradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_acc_3ExitNgradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/Switch*
T0*
_output_shapes	
:

Egradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/RankConst^gradients/Sub*
_output_shapes
: *
value	B :*
dtype0
Ż
Jgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/f_accStack*

stack_name *I
_class?
=;loc:@rnn/while/rnn/gru_cell/candidate/candidate/concat/axis*
	elem_type0*
_output_shapes
:
é
Mgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/RefEnterRefEnterJgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*I
_class?
=;loc:@rnn/while/rnn/gru_cell/candidate/candidate/concat/axis*
is_constant(
ń
Ngradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/StackPush	StackPushMgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/RefEnter6rnn/while/rnn/gru_cell/candidate/candidate/concat/axis^gradients/Add*
T0*
swap_memory( *I
_class?
=;loc:@rnn/while/rnn/gru_cell/candidate/candidate/concat/axis*
_output_shapes
: 
ü
Vgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/StackPop/RefEnterRefEnterJgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*I
_class?
=;loc:@rnn/while/rnn/gru_cell/candidate/candidate/concat/axis*
is_constant(
µ
Mgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/StackPopStackPopVgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/StackPop/RefEnter^gradients/Sub*
_output_shapes
: *I
_class?
=;loc:@rnn/while/rnn/gru_cell/candidate/candidate/concat/axis*
	elem_type0

Dgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/modFloorModMgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/mod/StackPopEgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/Rank*
T0*
_output_shapes
: 
”
Fgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeShapernn/while/TensorArrayReadV3*
T0*
_output_shapes
:*
out_type0
Å
Mgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/f_accStack*

stack_name *.
_class$
" loc:@rnn/while/TensorArrayReadV3*
	elem_type0*
_output_shapes
:
Ō
Pgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/RefEnterRefEnterMgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*.
_class$
" loc:@rnn/while/TensorArrayReadV3*
is_constant(
Ņ
Qgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPush	StackPushPgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/RefEnterrnn/while/TensorArrayReadV3^gradients/Add*
T0*
swap_memory( *.
_class$
" loc:@rnn/while/TensorArrayReadV3*'
_output_shapes
:’’’’’’’’’d
ē
Ygradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop/RefEnterRefEnterMgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*.
_class$
" loc:@rnn/while/TensorArrayReadV3*
is_constant(
±
Pgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPopStackPopYgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop/RefEnter^gradients/Sub*'
_output_shapes
:’’’’’’’’’d*.
_class$
" loc:@rnn/while/TensorArrayReadV3*
	elem_type0
Š
Ogradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/f_acc_1Stack*

stack_name *7
_class-
+)loc:@rnn/while/rnn/gru_cell/candidate/mul*
	elem_type0*
_output_shapes
:
į
Rgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/RefEnter_1RefEnterOgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/f_acc_1*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*7
_class-
+)loc:@rnn/while/rnn/gru_cell/candidate/mul*
is_constant(
é
Sgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPush_1	StackPushRgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/RefEnter_1$rnn/while/rnn/gru_cell/candidate/mul^gradients/Add*
T0*
swap_memory( *7
_class-
+)loc:@rnn/while/rnn/gru_cell/candidate/mul*(
_output_shapes
:’’’’’’’’’
ō
[gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop_1/RefEnterRefEnterOgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/f_acc_1*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*7
_class-
+)loc:@rnn/while/rnn/gru_cell/candidate/mul*
is_constant(
æ
Rgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop_1StackPop[gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop_1/RefEnter^gradients/Sub*(
_output_shapes
:’’’’’’’’’*7
_class-
+)loc:@rnn/while/rnn/gru_cell/candidate/mul*
	elem_type0
»
Ggradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeNShapeNPgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPopRgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop_1*
T0* 
_output_shapes
::*
out_type0*
N
ā
Mgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ConcatOffsetConcatOffsetDgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/modGgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeNIgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN:1* 
_output_shapes
::*
N

Fgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/SliceSliceYgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/control_dependencyMgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ConcatOffsetGgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN*
T0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’*
Index0

Hgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/Slice_1SliceYgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/control_dependencyOgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ConcatOffset:1Igradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN:1*
T0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’*
Index0
ķ
Qgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/group_depsNoOpG^gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/SliceI^gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/Slice_1

Ygradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/control_dependencyIdentityFgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/SliceR^gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/group_deps*
T0*Y
_classO
MKloc:@gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/Slice*'
_output_shapes
:’’’’’’’’’d

[gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/control_dependency_1IdentityHgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/Slice_1R^gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/group_deps*
T0*[
_classQ
OMloc:@gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/Slice_1*(
_output_shapes
:’’’’’’’’’
„
Lgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_accConst* 
_output_shapes
:
ä*
valueB
ä*    *
dtype0
®
Ngradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_acc_1EnterLgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_acc*
T0* 
_output_shapes
:
ä*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
is_constant( 
³
Ngradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_acc_2MergeNgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_acc_1Tgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/NextIteration*
T0*"
_output_shapes
:
ä: *
N
ó
Mgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/SwitchSwitchNgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_acc_2gradients/b_count_2*
T0*,
_output_shapes
:
ä:
ä
Ŗ
Jgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/AddAddOgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/Switch:1[gradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/tuple/control_dependency_1*
T0* 
_output_shapes
:
ä
Ü
Tgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/NextIterationNextIterationJgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/Add*
T0* 
_output_shapes
:
ä
Š
Ngradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_acc_3ExitMgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/Switch*
T0* 
_output_shapes
:
ä

9gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/ShapeShape"rnn/while/rnn/gru_cell/gates/split*
T0*
_output_shapes
:*
out_type0

;gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape_1Shapernn/while/Identity_2*
T0*
_output_shapes
:*
out_type0
å
Ogradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/f_accStack*

stack_name *L
_classB
@>loc:@gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape*
	elem_type0*
_output_shapes
:
ö
Rgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/RefEnterRefEnterOgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*L
_classB
@>loc:@gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape*
is_constant(

Sgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPush	StackPushRgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/RefEnter9gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape^gradients/Add*
T0*
swap_memory( *L
_classB
@>loc:@gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape*
_output_shapes
:

[gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop/RefEnterRefEnterOgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*L
_classB
@>loc:@gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape*
is_constant(
Ę
Rgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPopStackPop[gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop/RefEnter^gradients/Sub*
_output_shapes
:*L
_classB
@>loc:@gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape*
	elem_type0
é
Qgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/f_acc_1Stack*

stack_name *N
_classD
B@loc:@gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape_1*
	elem_type0*
_output_shapes
:
ü
Tgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/RefEnter_1RefEnterQgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*N
_classD
B@loc:@gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape_1*
is_constant(

Ugradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPush_1	StackPushTgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/RefEnter_1;gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape_1^gradients/Add*
T0*
swap_memory( *N
_classD
B@loc:@gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape_1*
_output_shapes
:

]gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop_1/RefEnterRefEnterQgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/f_acc_1*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*N
_classD
B@loc:@gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape_1*
is_constant(
Ģ
Tgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop_1StackPop]gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop_1/RefEnter^gradients/Sub*
_output_shapes
:*N
_classD
B@loc:@gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Shape_1*
	elem_type0
É
Igradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgsBroadcastGradientArgsRgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPopTgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop_1*
T0*2
_output_shapes 
:’’’’’’’’’:’’’’’’’’’

7gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mulMul[gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/control_dependency_16gradients/rnn/while/rnn/gru_cell/mul_grad/mul/StackPop*
T0*(
_output_shapes
:’’’’’’’’’

7gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/SumSum7gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mulIgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0

;gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/ReshapeReshape7gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/SumRgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop*
T0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’*
Tshape0
¾
?gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/f_accStack*

stack_name *5
_class+
)'loc:@rnn/while/rnn/gru_cell/gates/split*
	elem_type0*
_output_shapes
:
æ
Bgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/RefEnterRefEnter?gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*5
_class+
)'loc:@rnn/while/rnn/gru_cell/gates/split*
is_constant(
Å
Cgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/StackPush	StackPushBgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/RefEnter"rnn/while/rnn/gru_cell/gates/split^gradients/Add*
T0*
swap_memory( *5
_class+
)'loc:@rnn/while/rnn/gru_cell/gates/split*(
_output_shapes
:’’’’’’’’’
Ņ
Kgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/StackPop/RefEnterRefEnter?gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*5
_class+
)'loc:@rnn/while/rnn/gru_cell/gates/split*
is_constant(

Bgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/StackPopStackPopKgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/StackPop/RefEnter^gradients/Sub*(
_output_shapes
:’’’’’’’’’*5
_class+
)'loc:@rnn/while/rnn/gru_cell/gates/split*
	elem_type0

9gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1MulBgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/StackPop[gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/control_dependency_1*
T0*(
_output_shapes
:’’’’’’’’’

9gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Sum_1Sum9gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1Kgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs:1*
T0*
_output_shapes
:*
	keep_dims( *

Tidx0
¢
=gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Reshape_1Reshape9gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Sum_1Tgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/StackPop_1*
T0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’*
Tshape0
Ź
Dgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/tuple/group_depsNoOp<^gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Reshape>^gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Reshape_1
ß
Lgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/tuple/control_dependencyIdentity;gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/ReshapeE^gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/tuple/group_deps*
T0*N
_classD
B@loc:@gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Reshape*(
_output_shapes
:’’’’’’’’’
å
Ngradients/rnn/while/rnn/gru_cell/candidate/mul_grad/tuple/control_dependency_1Identity=gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Reshape_1E^gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/tuple/group_deps*
T0*P
_classF
DBloc:@gradients/rnn/while/rnn/gru_cell/candidate/mul_grad/Reshape_1*(
_output_shapes
:’’’’’’’’’
¢
gradients/AddNAddNBgradients/rnn/while/rnn/gru_cell/mul_grad/tuple/control_dependencyDgradients/rnn/while/rnn/gru_cell/sub_grad/tuple/control_dependency_1*
T0*D
_class:
86loc:@gradients/rnn/while/rnn/gru_cell/mul_grad/Reshape*
N*(
_output_shapes
:’’’’’’’’’
Ē
>gradients/rnn/while/rnn/gru_cell/gates/split_grad/concat/f_accStack*

stack_name *?
_class5
31loc:@rnn/while/rnn/gru_cell/gates/split/split_dim*
	elem_type0*
_output_shapes
:
Ē
Agradients/rnn/while/rnn/gru_cell/gates/split_grad/concat/RefEnterRefEnter>gradients/rnn/while/rnn/gru_cell/gates/split_grad/concat/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*?
_class5
31loc:@rnn/while/rnn/gru_cell/gates/split/split_dim*
is_constant(
Å
Bgradients/rnn/while/rnn/gru_cell/gates/split_grad/concat/StackPush	StackPushAgradients/rnn/while/rnn/gru_cell/gates/split_grad/concat/RefEnter,rnn/while/rnn/gru_cell/gates/split/split_dim^gradients/Add*
T0*
swap_memory( *?
_class5
31loc:@rnn/while/rnn/gru_cell/gates/split/split_dim*
_output_shapes
: 
Ś
Jgradients/rnn/while/rnn/gru_cell/gates/split_grad/concat/StackPop/RefEnterRefEnter>gradients/rnn/while/rnn/gru_cell/gates/split_grad/concat/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*?
_class5
31loc:@rnn/while/rnn/gru_cell/gates/split/split_dim*
is_constant(

Agradients/rnn/while/rnn/gru_cell/gates/split_grad/concat/StackPopStackPopJgradients/rnn/while/rnn/gru_cell/gates/split_grad/concat/StackPop/RefEnter^gradients/Sub*
_output_shapes
: *?
_class5
31loc:@rnn/while/rnn/gru_cell/gates/split/split_dim*
	elem_type0
­
8gradients/rnn/while/rnn/gru_cell/gates/split_grad/concatConcatV2Lgradients/rnn/while/rnn/gru_cell/candidate/mul_grad/tuple/control_dependencygradients/AddNAgradients/rnn/while/rnn/gru_cell/gates/split_grad/concat/StackPop*
T0*(
_output_shapes
:’’’’’’’’’*
N*

Tidx0
Ę
Egradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/f_accStack*

stack_name *7
_class-
+)loc:@rnn/while/rnn/gru_cell/gates/Sigmoid*
	elem_type0*
_output_shapes
:
Ķ
Hgradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/RefEnterRefEnterEgradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*7
_class-
+)loc:@rnn/while/rnn/gru_cell/gates/Sigmoid*
is_constant(
Õ
Igradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/StackPush	StackPushHgradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/RefEnter$rnn/while/rnn/gru_cell/gates/Sigmoid^gradients/Add*
T0*
swap_memory( *7
_class-
+)loc:@rnn/while/rnn/gru_cell/gates/Sigmoid*(
_output_shapes
:’’’’’’’’’
ą
Qgradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/StackPop/RefEnterRefEnterEgradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*7
_class-
+)loc:@rnn/while/rnn/gru_cell/gates/Sigmoid*
is_constant(
«
Hgradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/StackPopStackPopQgradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/StackPop/RefEnter^gradients/Sub*(
_output_shapes
:’’’’’’’’’*7
_class-
+)loc:@rnn/while/rnn/gru_cell/gates/Sigmoid*
	elem_type0

?gradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGradSigmoidGradHgradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/StackPop8gradients/rnn/while/rnn/gru_cell/gates/split_grad/concat*
T0*(
_output_shapes
:’’’’’’’’’
Ņ
Egradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/BiasAddGradBiasAddGrad?gradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad*
T0*
data_formatNHWC*
_output_shapes	
:
Ü
Jgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/group_depsNoOp@^gradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGradF^gradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/BiasAddGrad
ó
Rgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/control_dependencyIdentity?gradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGradK^gradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/group_deps*
T0*R
_classH
FDloc:@gradients/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad*(
_output_shapes
:’’’’’’’’’
ō
Tgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/control_dependency_1IdentityEgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/BiasAddGradK^gradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/group_deps*
T0*X
_classN
LJloc:@gradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/BiasAddGrad*
_output_shapes	
:
÷
Egradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul/EnterEnterrnn/gru_cell/gates/kernel/read*
T0* 
_output_shapes
:
ä*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
is_constant(
½
?gradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMulMatMulRgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/control_dependencyEgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul/Enter*
T0*(
_output_shapes
:’’’’’’’’’ä*
transpose_b(*
transpose_a( 
Ķ
Ggradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/f_accStack*

stack_name *<
_class2
0.loc:@rnn/while/rnn/gru_cell/gates/gates/concat*
	elem_type0*
_output_shapes
:
Ö
Jgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/RefEnterRefEnterGgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*<
_class2
0.loc:@rnn/while/rnn/gru_cell/gates/gates/concat*
is_constant(
ć
Kgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/StackPush	StackPushJgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/RefEnter)rnn/while/rnn/gru_cell/gates/gates/concat^gradients/Add*
T0*
swap_memory( *<
_class2
0.loc:@rnn/while/rnn/gru_cell/gates/gates/concat*(
_output_shapes
:’’’’’’’’’ä
é
Sgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/StackPop/RefEnterRefEnterGgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*<
_class2
0.loc:@rnn/while/rnn/gru_cell/gates/gates/concat*
is_constant(
“
Jgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/StackPopStackPopSgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/StackPop/RefEnter^gradients/Sub*(
_output_shapes
:’’’’’’’’’ä*<
_class2
0.loc:@rnn/while/rnn/gru_cell/gates/gates/concat*
	elem_type0
¼
Agradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1MatMulJgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1/StackPopRgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/control_dependency*
T0* 
_output_shapes
:
ä*
transpose_b( *
transpose_a(
×
Igradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/group_depsNoOp@^gradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMulB^gradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1
ń
Qgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/control_dependencyIdentity?gradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMulJ^gradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/group_deps*
T0*R
_classH
FDloc:@gradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul*(
_output_shapes
:’’’’’’’’’ä
ļ
Sgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/control_dependency_1IdentityAgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1J^gradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/group_deps*
T0*T
_classJ
HFloc:@gradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/MatMul_1* 
_output_shapes
:
ä

Egradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_accConst*
_output_shapes	
:*
valueB*    *
dtype0

Ggradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_acc_1EnterEgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_acc*
T0*
_output_shapes	
:*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
is_constant( 

Ggradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_acc_2MergeGgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_acc_1Mgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/NextIteration*
T0*
_output_shapes
	:: *
N
Ū
Fgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/SwitchSwitchGgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_acc_2gradients/b_count_2*
T0*"
_output_shapes
::

Cgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/AddAddHgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/Switch:1Tgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd_grad/tuple/control_dependency_1*
T0*
_output_shapes	
:
É
Mgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/NextIterationNextIterationCgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/Add*
T0*
_output_shapes	
:
½
Ggradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_acc_3ExitFgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/Switch*
T0*
_output_shapes	
:

=gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/RankConst^gradients/Sub*
_output_shapes
: *
value	B :*
dtype0
Ķ
Bgradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/f_accStack*

stack_name *A
_class7
53loc:@rnn/while/rnn/gru_cell/gates/gates/concat/axis*
	elem_type0*
_output_shapes
:
Ń
Egradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/RefEnterRefEnterBgradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*A
_class7
53loc:@rnn/while/rnn/gru_cell/gates/gates/concat/axis*
is_constant(
Ń
Fgradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/StackPush	StackPushEgradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/RefEnter.rnn/while/rnn/gru_cell/gates/gates/concat/axis^gradients/Add*
T0*
swap_memory( *A
_class7
53loc:@rnn/while/rnn/gru_cell/gates/gates/concat/axis*
_output_shapes
: 
ä
Ngradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/StackPop/RefEnterRefEnterBgradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*A
_class7
53loc:@rnn/while/rnn/gru_cell/gates/gates/concat/axis*
is_constant(

Egradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/StackPopStackPopNgradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/StackPop/RefEnter^gradients/Sub*
_output_shapes
: *A
_class7
53loc:@rnn/while/rnn/gru_cell/gates/gates/concat/axis*
	elem_type0
ļ
<gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/modFloorModEgradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/StackPop=gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/Rank*
T0*
_output_shapes
: 

>gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ShapeShapernn/while/TensorArrayReadV3*
T0*
_output_shapes
:*
out_type0

?gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ShapeNShapeNPgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/StackPop6gradients/rnn/while/rnn/gru_cell/mul_grad/mul/StackPop*
T0* 
_output_shapes
::*
out_type0*
N
Ā
Egradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ConcatOffsetConcatOffset<gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod?gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ShapeNAgradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ShapeN:1* 
_output_shapes
::*
N
ź
>gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/SliceSliceQgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/control_dependencyEgradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ConcatOffset?gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ShapeN*
T0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’*
Index0
š
@gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/Slice_1SliceQgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/control_dependencyGgradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ConcatOffset:1Agradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/ShapeN:1*
T0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’*
Index0
Õ
Igradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/tuple/group_depsNoOp?^gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/SliceA^gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/Slice_1
ī
Qgradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/tuple/control_dependencyIdentity>gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/SliceJ^gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/tuple/group_deps*
T0*Q
_classG
ECloc:@gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/Slice*'
_output_shapes
:’’’’’’’’’d
õ
Sgradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/tuple/control_dependency_1Identity@gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/Slice_1J^gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/tuple/group_deps*
T0*S
_classI
GEloc:@gradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/Slice_1*(
_output_shapes
:’’’’’’’’’

Dgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_accConst* 
_output_shapes
:
ä*
valueB
ä*    *
dtype0

Fgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_acc_1EnterDgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_acc*
T0* 
_output_shapes
:
ä*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
is_constant( 

Fgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_acc_2MergeFgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_acc_1Lgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/NextIteration*
T0*"
_output_shapes
:
ä: *
N
ć
Egradients/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/SwitchSwitchFgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_acc_2gradients/b_count_2*
T0*,
_output_shapes
:
ä:
ä

Bgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/AddAddGgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/Switch:1Sgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul_grad/tuple/control_dependency_1*
T0* 
_output_shapes
:
ä
Ģ
Lgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/NextIterationNextIterationBgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/Add*
T0* 
_output_shapes
:
ä
Ą
Fgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_acc_3ExitEgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/Switch*
T0* 
_output_shapes
:
ä
Ü
gradients/AddN_1AddNYgradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/tuple/control_dependencyQgradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/tuple/control_dependency*
T0*Y
_classO
MKloc:@gradients/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/Slice*
N*'
_output_shapes
:’’’’’’’’’d
§
Rgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3/EnterEnterrnn/TensorArray_1*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*4
_class*
(&loc:@rnn/while/TensorArrayReadV3/Enter*
is_constant(
Ņ
Tgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3/Enter_1Enter>rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
: *4
_class*
(&loc:@rnn/while/TensorArrayReadV3/Enter*
is_constant(

Lgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3TensorArrayGradV3Rgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3/EnterTgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3/Enter_1^gradients/Sub*
_output_shapes

:: *4
_class*
(&loc:@rnn/while/TensorArrayReadV3/Enter*
source	gradients
Š
Hgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/gradient_flowIdentityTgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3/Enter_1M^gradients/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3*
T0*4
_class*
(&loc:@rnn/while/TensorArrayReadV3/Enter*
_output_shapes
: 
Ć
Tgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/f_accStack*

stack_name *%
_class
loc:@rnn/while/Identity*
	elem_type0*
_output_shapes
:
Ł
Wgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/RefEnterRefEnterTgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/f_acc*
T0*
parallel_iterations *$

frame_namernn/while/rnn/while/*
_output_shapes
:*%
_class
loc:@rnn/while/Identity*
is_constant(
½
Xgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/StackPush	StackPushWgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/RefEnterrnn/while/Identity^gradients/Add*
T0*
swap_memory( *%
_class
loc:@rnn/while/Identity*
_output_shapes
: 
ģ
`gradients/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/StackPop/RefEnterRefEnterTgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/f_acc*
T0*
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
_output_shapes
:*%
_class
loc:@rnn/while/Identity*
is_constant(
„
Wgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/StackPopStackPop`gradients/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/StackPop/RefEnter^gradients/Sub*
_output_shapes
: *%
_class
loc:@rnn/while/Identity*
	elem_type0

Ngradients/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV3Lgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/TensorArrayGradV3Wgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/StackPopgradients/AddN_1Hgradients/rnn/while/TensorArrayReadV3_grad/TensorArrayGrad/gradient_flow*
T0*
_output_shapes
: 

gradients/AddN_2AddNDgradients/rnn/while/rnn/gru_cell/mul_grad/tuple/control_dependency_1Ngradients/rnn/while/rnn/gru_cell/candidate/mul_grad/tuple/control_dependency_1Sgradients/rnn/while/rnn/gru_cell/gates/gates/concat_grad/tuple/control_dependency_1*
T0*F
_class<
:8loc:@gradients/rnn/while/rnn/gru_cell/mul_grad/Reshape_1*
N*(
_output_shapes
:’’’’’’’’’
}
8gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/b_accConst*
_output_shapes
: *
valueB
 *    *
dtype0
ü
:gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_1Enter8gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc*
T0*
_output_shapes
: *
parallel_iterations *.

frame_name gradients/rnn/while/rnn/while/*
is_constant( 
ķ
:gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_2Merge:gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_1@gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/NextIteration*
T0*
_output_shapes
: : *
N
·
9gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/SwitchSwitch:gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_2gradients/b_count_2*
T0*
_output_shapes
: : 
ė
6gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/AddAdd;gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/Switch:1Ngradients/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3*
T0*
_output_shapes
: 
Ŗ
@gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/NextIterationNextIteration6gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/Add*
T0*
_output_shapes
: 

:gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3Exit9gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/Switch*
T0*
_output_shapes
: 

1gradients/rnn/while/Switch_2_grad_1/NextIterationNextIterationgradients/AddN_2*
T0*(
_output_shapes
:’’’’’’’’’
®
ogradients/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGrad/TensorArrayGradV3TensorArrayGradV3rnn/TensorArray_1:gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3*
_output_shapes

:: *$
_class
loc:@rnn/TensorArray_1*
source	gradients
ģ
kgradients/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGrad/gradient_flowIdentity:gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3p^gradients/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGrad/TensorArrayGradV3*
T0*$
_class
loc:@rnn/TensorArray_1*
_output_shapes
: 
²
agradients/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGatherV3TensorArrayGatherV3ogradients/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGrad/TensorArrayGradV3rnn/TensorArrayUnstack/rangekgradients/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGrad/gradient_flow*
_output_shapes
:*
element_shape:*
dtype0

^gradients/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/group_depsNoOp;^gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3b^gradients/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGatherV3
ā
fgradients/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/control_dependencyIdentityagradients/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGatherV3_^gradients/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/group_deps*
T0*t
_classj
hfloc:@gradients/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/TensorArrayGatherV3*+
_output_shapes
:’’’’’’’’’d

hgradients/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/control_dependency_1Identity:gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3_^gradients/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/group_deps*
T0*M
_classC
A?loc:@gradients/rnn/while/TensorArrayReadV3/Enter_1_grad/b_acc_3*
_output_shapes
: 
l
*gradients/transpose_grad/InvertPermutationInvertPermutationconcat*
T0*
_output_shapes
:

"gradients/transpose_grad/transpose	Transposefgradients/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3_grad/tuple/control_dependency*gradients/transpose_grad/InvertPermutation*
T0*+
_output_shapes
:’’’’’’’’’d*
Tperm0

%gradients/embedding_lookup_grad/ShapeConst*
_output_shapes
:*
_class
loc:@Variable*
valueB"”: d   *
dtype0
j
$gradients/embedding_lookup_grad/SizeSizePlaceholder*
T0*
_output_shapes
: *
out_type0
p
.gradients/embedding_lookup_grad/ExpandDims/dimConst*
_output_shapes
: *
value	B : *
dtype0
æ
*gradients/embedding_lookup_grad/ExpandDims
ExpandDims$gradients/embedding_lookup_grad/Size.gradients/embedding_lookup_grad/ExpandDims/dim*
T0*
_output_shapes
:*

Tdim0
}
3gradients/embedding_lookup_grad/strided_slice/stackConst*
_output_shapes
:*
valueB:*
dtype0

5gradients/embedding_lookup_grad/strided_slice/stack_1Const*
_output_shapes
:*
valueB: *
dtype0

5gradients/embedding_lookup_grad/strided_slice/stack_2Const*
_output_shapes
:*
valueB:*
dtype0

-gradients/embedding_lookup_grad/strided_sliceStridedSlice%gradients/embedding_lookup_grad/Shape3gradients/embedding_lookup_grad/strided_slice/stack5gradients/embedding_lookup_grad/strided_slice/stack_15gradients/embedding_lookup_grad/strided_slice/stack_2*
T0*
Index0*
new_axis_mask *

begin_mask *
ellipsis_mask *
_output_shapes
:*
shrink_axis_mask *
end_mask
m
+gradients/embedding_lookup_grad/concat/axisConst*
_output_shapes
: *
value	B : *
dtype0
ō
&gradients/embedding_lookup_grad/concatConcatV2*gradients/embedding_lookup_grad/ExpandDims-gradients/embedding_lookup_grad/strided_slice+gradients/embedding_lookup_grad/concat/axis*
T0*
_output_shapes
:*
N*

Tidx0
Ē
'gradients/embedding_lookup_grad/ReshapeReshape"gradients/transpose_grad/transpose&gradients/embedding_lookup_grad/concat*
T0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’*
Tshape0
©
)gradients/embedding_lookup_grad/Reshape_1ReshapePlaceholder*gradients/embedding_lookup_grad/ExpandDims*
T0*#
_output_shapes
:’’’’’’’’’*
Tshape0
{
beta1_power/initial_valueConst*
_output_shapes
: *
_class
loc:@Variable*
valueB
 *fff?*
dtype0

beta1_power
VariableV2*
shared_name *
dtype0*
_class
loc:@Variable*
_output_shapes
: *
	container *
shape: 
«
beta1_power/AssignAssignbeta1_powerbeta1_power/initial_value*
T0*
_class
loc:@Variable*
validate_shape(*
use_locking(*
_output_shapes
: 
g
beta1_power/readIdentitybeta1_power*
T0*
_class
loc:@Variable*
_output_shapes
: 
{
beta2_power/initial_valueConst*
_output_shapes
: *
_class
loc:@Variable*
valueB
 *w¾?*
dtype0

beta2_power
VariableV2*
shared_name *
dtype0*
_class
loc:@Variable*
_output_shapes
: *
	container *
shape: 
«
beta2_power/AssignAssignbeta2_powerbeta2_power/initial_value*
T0*
_class
loc:@Variable*
validate_shape(*
use_locking(*
_output_shapes
: 
g
beta2_power/readIdentitybeta2_power*
T0*
_class
loc:@Variable*
_output_shapes
: 

Variable/Adam/Initializer/zerosConst* 
_output_shapes
:
”õd*
_class
loc:@Variable*
valueB
”õd*    *
dtype0
¢
Variable/Adam
VariableV2*
dtype0*
shared_name * 
_output_shapes
:
”õd*
_class
loc:@Variable*
shape:
”õd*
	container 
æ
Variable/Adam/AssignAssignVariable/AdamVariable/Adam/Initializer/zeros*
T0*
_class
loc:@Variable*
validate_shape(*
use_locking(* 
_output_shapes
:
”õd
u
Variable/Adam/readIdentityVariable/Adam*
T0*
_class
loc:@Variable* 
_output_shapes
:
”õd

!Variable/Adam_1/Initializer/zerosConst* 
_output_shapes
:
”õd*
_class
loc:@Variable*
valueB
”õd*    *
dtype0
¤
Variable/Adam_1
VariableV2*
dtype0*
shared_name * 
_output_shapes
:
”õd*
_class
loc:@Variable*
shape:
”õd*
	container 
Å
Variable/Adam_1/AssignAssignVariable/Adam_1!Variable/Adam_1/Initializer/zeros*
T0*
_class
loc:@Variable*
validate_shape(*
use_locking(* 
_output_shapes
:
”õd
y
Variable/Adam_1/readIdentityVariable/Adam_1*
T0*
_class
loc:@Variable* 
_output_shapes
:
”õd
·
0rnn/gru_cell/gates/kernel/Adam/Initializer/zerosConst* 
_output_shapes
:
ä*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
valueB
ä*    *
dtype0
Ä
rnn/gru_cell/gates/kernel/Adam
VariableV2*
dtype0*
shared_name * 
_output_shapes
:
ä*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
shape:
ä*
	container 

%rnn/gru_cell/gates/kernel/Adam/AssignAssignrnn/gru_cell/gates/kernel/Adam0rnn/gru_cell/gates/kernel/Adam/Initializer/zeros*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
ä
Ø
#rnn/gru_cell/gates/kernel/Adam/readIdentityrnn/gru_cell/gates/kernel/Adam*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel* 
_output_shapes
:
ä
¹
2rnn/gru_cell/gates/kernel/Adam_1/Initializer/zerosConst* 
_output_shapes
:
ä*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
valueB
ä*    *
dtype0
Ę
 rnn/gru_cell/gates/kernel/Adam_1
VariableV2*
dtype0*
shared_name * 
_output_shapes
:
ä*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
shape:
ä*
	container 

'rnn/gru_cell/gates/kernel/Adam_1/AssignAssign rnn/gru_cell/gates/kernel/Adam_12rnn/gru_cell/gates/kernel/Adam_1/Initializer/zeros*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
ä
¬
%rnn/gru_cell/gates/kernel/Adam_1/readIdentity rnn/gru_cell/gates/kernel/Adam_1*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel* 
_output_shapes
:
ä
©
.rnn/gru_cell/gates/bias/Adam/Initializer/zerosConst*
_output_shapes	
:**
_class 
loc:@rnn/gru_cell/gates/bias*
valueB*    *
dtype0
¶
rnn/gru_cell/gates/bias/Adam
VariableV2*
dtype0*
shared_name *
_output_shapes	
:**
_class 
loc:@rnn/gru_cell/gates/bias*
shape:*
	container 
ö
#rnn/gru_cell/gates/bias/Adam/AssignAssignrnn/gru_cell/gates/bias/Adam.rnn/gru_cell/gates/bias/Adam/Initializer/zeros*
T0**
_class 
loc:@rnn/gru_cell/gates/bias*
validate_shape(*
use_locking(*
_output_shapes	
:

!rnn/gru_cell/gates/bias/Adam/readIdentityrnn/gru_cell/gates/bias/Adam*
T0**
_class 
loc:@rnn/gru_cell/gates/bias*
_output_shapes	
:
«
0rnn/gru_cell/gates/bias/Adam_1/Initializer/zerosConst*
_output_shapes	
:**
_class 
loc:@rnn/gru_cell/gates/bias*
valueB*    *
dtype0
ø
rnn/gru_cell/gates/bias/Adam_1
VariableV2*
dtype0*
shared_name *
_output_shapes	
:**
_class 
loc:@rnn/gru_cell/gates/bias*
shape:*
	container 
ü
%rnn/gru_cell/gates/bias/Adam_1/AssignAssignrnn/gru_cell/gates/bias/Adam_10rnn/gru_cell/gates/bias/Adam_1/Initializer/zeros*
T0**
_class 
loc:@rnn/gru_cell/gates/bias*
validate_shape(*
use_locking(*
_output_shapes	
:
”
#rnn/gru_cell/gates/bias/Adam_1/readIdentityrnn/gru_cell/gates/bias/Adam_1*
T0**
_class 
loc:@rnn/gru_cell/gates/bias*
_output_shapes	
:
æ
4rnn/gru_cell/candidate/kernel/Adam/Initializer/zerosConst* 
_output_shapes
:
ä*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
valueB
ä*    *
dtype0
Ģ
"rnn/gru_cell/candidate/kernel/Adam
VariableV2*
dtype0*
shared_name * 
_output_shapes
:
ä*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
shape:
ä*
	container 

)rnn/gru_cell/candidate/kernel/Adam/AssignAssign"rnn/gru_cell/candidate/kernel/Adam4rnn/gru_cell/candidate/kernel/Adam/Initializer/zeros*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
ä
“
'rnn/gru_cell/candidate/kernel/Adam/readIdentity"rnn/gru_cell/candidate/kernel/Adam*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel* 
_output_shapes
:
ä
Į
6rnn/gru_cell/candidate/kernel/Adam_1/Initializer/zerosConst* 
_output_shapes
:
ä*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
valueB
ä*    *
dtype0
Ī
$rnn/gru_cell/candidate/kernel/Adam_1
VariableV2*
dtype0*
shared_name * 
_output_shapes
:
ä*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
shape:
ä*
	container 

+rnn/gru_cell/candidate/kernel/Adam_1/AssignAssign$rnn/gru_cell/candidate/kernel/Adam_16rnn/gru_cell/candidate/kernel/Adam_1/Initializer/zeros*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
validate_shape(*
use_locking(* 
_output_shapes
:
ä
ø
)rnn/gru_cell/candidate/kernel/Adam_1/readIdentity$rnn/gru_cell/candidate/kernel/Adam_1*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel* 
_output_shapes
:
ä
±
2rnn/gru_cell/candidate/bias/Adam/Initializer/zerosConst*
_output_shapes	
:*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
valueB*    *
dtype0
¾
 rnn/gru_cell/candidate/bias/Adam
VariableV2*
dtype0*
shared_name *
_output_shapes	
:*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
shape:*
	container 

'rnn/gru_cell/candidate/bias/Adam/AssignAssign rnn/gru_cell/candidate/bias/Adam2rnn/gru_cell/candidate/bias/Adam/Initializer/zeros*
T0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
validate_shape(*
use_locking(*
_output_shapes	
:
©
%rnn/gru_cell/candidate/bias/Adam/readIdentity rnn/gru_cell/candidate/bias/Adam*
T0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
_output_shapes	
:
³
4rnn/gru_cell/candidate/bias/Adam_1/Initializer/zerosConst*
_output_shapes	
:*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
valueB*    *
dtype0
Ą
"rnn/gru_cell/candidate/bias/Adam_1
VariableV2*
dtype0*
shared_name *
_output_shapes	
:*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
shape:*
	container 

)rnn/gru_cell/candidate/bias/Adam_1/AssignAssign"rnn/gru_cell/candidate/bias/Adam_14rnn/gru_cell/candidate/bias/Adam_1/Initializer/zeros*
T0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
validate_shape(*
use_locking(*
_output_shapes	
:
­
'rnn/gru_cell/candidate/bias/Adam_1/readIdentity"rnn/gru_cell/candidate/bias/Adam_1*
T0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
_output_shapes	
:

#dense/kernel/Adam/Initializer/zerosConst*!
_output_shapes
:”õ*
_class
loc:@dense/kernel* 
valueB”õ*    *
dtype0
¬
dense/kernel/Adam
VariableV2*
dtype0*
shared_name *!
_output_shapes
:”õ*
_class
loc:@dense/kernel*
shape:”õ*
	container 
Š
dense/kernel/Adam/AssignAssigndense/kernel/Adam#dense/kernel/Adam/Initializer/zeros*
T0*
_class
loc:@dense/kernel*
validate_shape(*
use_locking(*!
_output_shapes
:”õ

dense/kernel/Adam/readIdentitydense/kernel/Adam*
T0*
_class
loc:@dense/kernel*!
_output_shapes
:”õ
”
%dense/kernel/Adam_1/Initializer/zerosConst*!
_output_shapes
:”õ*
_class
loc:@dense/kernel* 
valueB”õ*    *
dtype0
®
dense/kernel/Adam_1
VariableV2*
dtype0*
shared_name *!
_output_shapes
:”õ*
_class
loc:@dense/kernel*
shape:”õ*
	container 
Ö
dense/kernel/Adam_1/AssignAssigndense/kernel/Adam_1%dense/kernel/Adam_1/Initializer/zeros*
T0*
_class
loc:@dense/kernel*
validate_shape(*
use_locking(*!
_output_shapes
:”õ

dense/kernel/Adam_1/readIdentitydense/kernel/Adam_1*
T0*
_class
loc:@dense/kernel*!
_output_shapes
:”õ

!dense/bias/Adam/Initializer/zerosConst*
_output_shapes

:”õ*
_class
loc:@dense/bias*
valueB”õ*    *
dtype0

dense/bias/Adam
VariableV2*
dtype0*
shared_name *
_output_shapes

:”õ*
_class
loc:@dense/bias*
shape:”õ*
	container 
Ć
dense/bias/Adam/AssignAssigndense/bias/Adam!dense/bias/Adam/Initializer/zeros*
T0*
_class
loc:@dense/bias*
validate_shape(*
use_locking(*
_output_shapes

:”õ
w
dense/bias/Adam/readIdentitydense/bias/Adam*
T0*
_class
loc:@dense/bias*
_output_shapes

:”õ

#dense/bias/Adam_1/Initializer/zerosConst*
_output_shapes

:”õ*
_class
loc:@dense/bias*
valueB”õ*    *
dtype0
 
dense/bias/Adam_1
VariableV2*
dtype0*
shared_name *
_output_shapes

:”õ*
_class
loc:@dense/bias*
shape:”õ*
	container 
É
dense/bias/Adam_1/AssignAssigndense/bias/Adam_1#dense/bias/Adam_1/Initializer/zeros*
T0*
_class
loc:@dense/bias*
validate_shape(*
use_locking(*
_output_shapes

:”õ
{
dense/bias/Adam_1/readIdentitydense/bias/Adam_1*
T0*
_class
loc:@dense/bias*
_output_shapes

:”õ
W
Adam/learning_rateConst*
_output_shapes
: *
valueB
 *
×#<*
dtype0
O

Adam/beta1Const*
_output_shapes
: *
valueB
 *fff?*
dtype0
O

Adam/beta2Const*
_output_shapes
: *
valueB
 *w¾?*
dtype0
Q
Adam/epsilonConst*
_output_shapes
: *
valueB
 *wĢ+2*
dtype0
¹
Adam/update_Variable/UniqueUnique)gradients/embedding_lookup_grad/Reshape_1*
T0*
_class
loc:@Variable*
out_idx0*2
_output_shapes 
:’’’’’’’’’:’’’’’’’’’

Adam/update_Variable/ShapeShapeAdam/update_Variable/Unique*
T0*
_class
loc:@Variable*
out_type0*
_output_shapes
:

(Adam/update_Variable/strided_slice/stackConst*
_output_shapes
:*
_class
loc:@Variable*
valueB: *
dtype0

*Adam/update_Variable/strided_slice/stack_1Const*
_output_shapes
:*
_class
loc:@Variable*
valueB:*
dtype0

*Adam/update_Variable/strided_slice/stack_2Const*
_output_shapes
:*
_class
loc:@Variable*
valueB:*
dtype0
’
"Adam/update_Variable/strided_sliceStridedSliceAdam/update_Variable/Shape(Adam/update_Variable/strided_slice/stack*Adam/update_Variable/strided_slice/stack_1*Adam/update_Variable/strided_slice/stack_2*
T0*
Index0*
new_axis_mask *

begin_mask *
ellipsis_mask *
_class
loc:@Variable*
_output_shapes
: *
shrink_axis_mask*
end_mask 

'Adam/update_Variable/UnsortedSegmentSumUnsortedSegmentSum'gradients/embedding_lookup_grad/ReshapeAdam/update_Variable/Unique:1"Adam/update_Variable/strided_slice*
T0*
_class
loc:@Variable*
Tindices0*0
_output_shapes
:’’’’’’’’’’’’’’’’’’
|
Adam/update_Variable/sub/xConst*
_output_shapes
: *
_class
loc:@Variable*
valueB
 *  ?*
dtype0

Adam/update_Variable/subSubAdam/update_Variable/sub/xbeta2_power/read*
T0*
_class
loc:@Variable*
_output_shapes
: 
y
Adam/update_Variable/SqrtSqrtAdam/update_Variable/sub*
T0*
_class
loc:@Variable*
_output_shapes
: 

Adam/update_Variable/mulMulAdam/learning_rateAdam/update_Variable/Sqrt*
T0*
_class
loc:@Variable*
_output_shapes
: 
~
Adam/update_Variable/sub_1/xConst*
_output_shapes
: *
_class
loc:@Variable*
valueB
 *  ?*
dtype0

Adam/update_Variable/sub_1SubAdam/update_Variable/sub_1/xbeta1_power/read*
T0*
_class
loc:@Variable*
_output_shapes
: 

Adam/update_Variable/truedivRealDivAdam/update_Variable/mulAdam/update_Variable/sub_1*
T0*
_class
loc:@Variable*
_output_shapes
: 
~
Adam/update_Variable/sub_2/xConst*
_output_shapes
: *
_class
loc:@Variable*
valueB
 *  ?*
dtype0

Adam/update_Variable/sub_2SubAdam/update_Variable/sub_2/x
Adam/beta1*
T0*
_class
loc:@Variable*
_output_shapes
: 
¾
Adam/update_Variable/mul_1Mul'Adam/update_Variable/UnsortedSegmentSumAdam/update_Variable/sub_2*
T0*
_class
loc:@Variable*0
_output_shapes
:’’’’’’’’’’’’’’’’’’

Adam/update_Variable/mul_2MulVariable/Adam/read
Adam/beta1*
T0*
_class
loc:@Variable* 
_output_shapes
:
”õd
Į
Adam/update_Variable/AssignAssignVariable/AdamAdam/update_Variable/mul_2*
T0*
_class
loc:@Variable*
validate_shape(*
use_locking( * 
_output_shapes
:
”õd
ž
Adam/update_Variable/ScatterAdd
ScatterAddVariable/AdamAdam/update_Variable/UniqueAdam/update_Variable/mul_1^Adam/update_Variable/Assign*
T0*
_class
loc:@Variable*
Tindices0*
use_locking( * 
_output_shapes
:
”õd
Ė
Adam/update_Variable/mul_3Mul'Adam/update_Variable/UnsortedSegmentSum'Adam/update_Variable/UnsortedSegmentSum*
T0*
_class
loc:@Variable*0
_output_shapes
:’’’’’’’’’’’’’’’’’’
~
Adam/update_Variable/sub_3/xConst*
_output_shapes
: *
_class
loc:@Variable*
valueB
 *  ?*
dtype0

Adam/update_Variable/sub_3SubAdam/update_Variable/sub_3/x
Adam/beta2*
T0*
_class
loc:@Variable*
_output_shapes
: 
±
Adam/update_Variable/mul_4MulAdam/update_Variable/mul_3Adam/update_Variable/sub_3*
T0*
_class
loc:@Variable*0
_output_shapes
:’’’’’’’’’’’’’’’’’’

Adam/update_Variable/mul_5MulVariable/Adam_1/read
Adam/beta2*
T0*
_class
loc:@Variable* 
_output_shapes
:
”õd
Å
Adam/update_Variable/Assign_1AssignVariable/Adam_1Adam/update_Variable/mul_5*
T0*
_class
loc:@Variable*
validate_shape(*
use_locking( * 
_output_shapes
:
”õd

!Adam/update_Variable/ScatterAdd_1
ScatterAddVariable/Adam_1Adam/update_Variable/UniqueAdam/update_Variable/mul_4^Adam/update_Variable/Assign_1*
T0*
_class
loc:@Variable*
Tindices0*
use_locking( * 
_output_shapes
:
”õd

Adam/update_Variable/Sqrt_1Sqrt!Adam/update_Variable/ScatterAdd_1*
T0*
_class
loc:@Variable* 
_output_shapes
:
”õd
Ø
Adam/update_Variable/mul_6MulAdam/update_Variable/truedivAdam/update_Variable/ScatterAdd*
T0*
_class
loc:@Variable* 
_output_shapes
:
”õd

Adam/update_Variable/addAddAdam/update_Variable/Sqrt_1Adam/epsilon*
T0*
_class
loc:@Variable* 
_output_shapes
:
”õd
§
Adam/update_Variable/truediv_1RealDivAdam/update_Variable/mul_6Adam/update_Variable/add*
T0*
_class
loc:@Variable* 
_output_shapes
:
”õd
°
Adam/update_Variable/AssignSub	AssignSubVariableAdam/update_Variable/truediv_1*
T0*
_class
loc:@Variable*
use_locking( * 
_output_shapes
:
”õd
«
Adam/update_Variable/group_depsNoOp^Adam/update_Variable/AssignSub ^Adam/update_Variable/ScatterAdd"^Adam/update_Variable/ScatterAdd_1*
_class
loc:@Variable
æ
/Adam/update_rnn/gru_cell/gates/kernel/ApplyAdam	ApplyAdamrnn/gru_cell/gates/kernelrnn/gru_cell/gates/kernel/Adam rnn/gru_cell/gates/kernel/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilonFgradients/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter_grad/b_acc_3*
T0*,
_class"
 loc:@rnn/gru_cell/gates/kernel*
use_locking( *
use_nesterov( * 
_output_shapes
:
ä
±
-Adam/update_rnn/gru_cell/gates/bias/ApplyAdam	ApplyAdamrnn/gru_cell/gates/biasrnn/gru_cell/gates/bias/Adamrnn/gru_cell/gates/bias/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilonGgradients/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter_grad/b_acc_3*
T0**
_class 
loc:@rnn/gru_cell/gates/bias*
use_locking( *
use_nesterov( *
_output_shapes	
:
Ū
3Adam/update_rnn/gru_cell/candidate/kernel/ApplyAdam	ApplyAdamrnn/gru_cell/candidate/kernel"rnn/gru_cell/candidate/kernel/Adam$rnn/gru_cell/candidate/kernel/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilonNgradients/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter_grad/b_acc_3*
T0*0
_class&
$"loc:@rnn/gru_cell/candidate/kernel*
use_locking( *
use_nesterov( * 
_output_shapes
:
ä
Ķ
1Adam/update_rnn/gru_cell/candidate/bias/ApplyAdam	ApplyAdamrnn/gru_cell/candidate/bias rnn/gru_cell/candidate/bias/Adam"rnn/gru_cell/candidate/bias/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilonOgradients/rnn/while/rnn/gru_cell/candidate/candidate/BiasAdd/Enter_grad/b_acc_3*
T0*.
_class$
" loc:@rnn/gru_cell/candidate/bias*
use_locking( *
use_nesterov( *
_output_shapes	
:
ļ
"Adam/update_dense/kernel/ApplyAdam	ApplyAdamdense/kerneldense/kernel/Adamdense/kernel/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon6gradients/dense/MatMul_grad/tuple/control_dependency_1*
T0*
_class
loc:@dense/kernel*
use_locking( *
use_nesterov( *!
_output_shapes
:”õ
į
 Adam/update_dense/bias/ApplyAdam	ApplyAdam
dense/biasdense/bias/Adamdense/bias/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon7gradients/dense/BiasAdd_grad/tuple/control_dependency_1*
T0*
_class
loc:@dense/bias*
use_locking( *
use_nesterov( *
_output_shapes

:”õ
”
Adam/mulMulbeta1_power/read
Adam/beta1 ^Adam/update_Variable/group_deps0^Adam/update_rnn/gru_cell/gates/kernel/ApplyAdam.^Adam/update_rnn/gru_cell/gates/bias/ApplyAdam4^Adam/update_rnn/gru_cell/candidate/kernel/ApplyAdam2^Adam/update_rnn/gru_cell/candidate/bias/ApplyAdam#^Adam/update_dense/kernel/ApplyAdam!^Adam/update_dense/bias/ApplyAdam*
T0*
_class
loc:@Variable*
_output_shapes
: 

Adam/AssignAssignbeta1_powerAdam/mul*
T0*
_class
loc:@Variable*
validate_shape(*
use_locking( *
_output_shapes
: 
£

Adam/mul_1Mulbeta2_power/read
Adam/beta2 ^Adam/update_Variable/group_deps0^Adam/update_rnn/gru_cell/gates/kernel/ApplyAdam.^Adam/update_rnn/gru_cell/gates/bias/ApplyAdam4^Adam/update_rnn/gru_cell/candidate/kernel/ApplyAdam2^Adam/update_rnn/gru_cell/candidate/bias/ApplyAdam#^Adam/update_dense/kernel/ApplyAdam!^Adam/update_dense/bias/ApplyAdam*
T0*
_class
loc:@Variable*
_output_shapes
: 

Adam/Assign_1Assignbeta2_power
Adam/mul_1*
T0*
_class
loc:@Variable*
validate_shape(*
use_locking( *
_output_shapes
: 
ą
AdamNoOp ^Adam/update_Variable/group_deps0^Adam/update_rnn/gru_cell/gates/kernel/ApplyAdam.^Adam/update_rnn/gru_cell/gates/bias/ApplyAdam4^Adam/update_rnn/gru_cell/candidate/kernel/ApplyAdam2^Adam/update_rnn/gru_cell/candidate/bias/ApplyAdam#^Adam/update_dense/kernel/ApplyAdam!^Adam/update_dense/bias/ApplyAdam^Adam/Assign^Adam/Assign_1
ī
initNoOp^Variable/Assign!^rnn/gru_cell/gates/kernel/Assign^rnn/gru_cell/gates/bias/Assign%^rnn/gru_cell/candidate/kernel/Assign#^rnn/gru_cell/candidate/bias/Assign^dense/kernel/Assign^dense/bias/Assign^beta1_power/Assign^beta2_power/Assign^Variable/Adam/Assign^Variable/Adam_1/Assign&^rnn/gru_cell/gates/kernel/Adam/Assign(^rnn/gru_cell/gates/kernel/Adam_1/Assign$^rnn/gru_cell/gates/bias/Adam/Assign&^rnn/gru_cell/gates/bias/Adam_1/Assign*^rnn/gru_cell/candidate/kernel/Adam/Assign,^rnn/gru_cell/candidate/kernel/Adam_1/Assign(^rnn/gru_cell/candidate/bias/Adam/Assign*^rnn/gru_cell/candidate/bias/Adam_1/Assign^dense/kernel/Adam/Assign^dense/kernel/Adam_1/Assign^dense/bias/Adam/Assign^dense/bias/Adam_1/Assign""
train_op


model/Adam"ö
trainable_variablesŽŪ
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
dense/bias:0dense/bias/Assigndense/bias/read:0"s
while_contextss
s
 model/rnn/while/model/rnn/while/ *model/rnn/while/LoopCond:02model/rnn/while/Merge:0:model/rnn/while/Identity:0Bmodel/rnn/while/Exit:0Bmodel/rnn/while/Exit_1:0Bmodel/rnn/while/Exit_2:0Bmodel/gradients/f_count_2:0J¶p
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
 rnn/gru_cell/gates/kernel/read:0­
Smodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/f_acc:0Vmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/RefEnter:0[
 rnn/gru_cell/gates/kernel/read:07model/rnn/while/rnn/gru_cell/gates/gates/MatMul/Enter:0
Amodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/f_acc:0Dmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/mul/RefEnter:0±
Umodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/f_acc_1:0Xmodel/gradients/model/rnn/while/rnn/gru_cell/add_grad/BroadcastGradientArgs/RefEnter_1:0Į
]model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/f_acc_1:0`model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/RefEnter_1:0Į
]model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/f_acc:0`model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/RefEnter:0§
Pmodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/f_acc:0Smodel/gradients/model/rnn/while/rnn/gru_cell/gates/gates/concat_grad/mod/RefEnter:0­
Smodel/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/f_acc:0Vmodel/gradients/model/rnn/while/rnn/gru_cell/gates/Sigmoid_grad/SigmoidGrad/RefEnter:0
Lmodel/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat/f_acc:0Omodel/gradients/model/rnn/while/rnn/gru_cell/gates/split_grad/concat/RefEnter:0­
Smodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/f_acc:0Vmodel/gradients/model/rnn/while/rnn/gru_cell/sub_grad/BroadcastGradientArgs/RefEnter:0½
[model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/f_acc:0^model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/concat_grad/ShapeN/RefEnter:0
Emodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/f_acc:0Hmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/mul_1/RefEnter:0;
model/rnn/strided_slice_2:0model/rnn/while/Less/Enter:0Z
rnn/gru_cell/gates/bias/read:08model/rnn/while/rnn/gru_cell/gates/gates/BiasAdd/Enter:0Ė
bmodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/f_acc:0emodel/gradients/model/rnn/while/TensorArrayReadV3_grad/TensorArrayWrite/TensorArrayWriteV3/RefEnter:0”
Mmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/f_acc:0Pmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/mul_1/RefEnter:0V
model/rnn/TensorArray:0;model/rnn/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0­
Smodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/f_acc:0Vmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/RefEnter:0±
Umodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/f_acc:0Xmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/RefEnter:0g
$rnn/gru_cell/candidate/kernel/read:0?model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul/Enter:0±
Umodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/f_acc_1:0Xmodel/gradients/model/rnn/while/rnn/gru_cell/mul_grad/BroadcastGradientArgs/RefEnter_1:0Å
_model/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/f_acc_1:0bmodel/gradients/model/rnn/while/rnn/gru_cell/candidate/mul_grad/BroadcastGradientArgs/RefEnter_1:0F
model/rnn/TensorArray_1:0)model/rnn/while/TensorArrayReadV3/Enter:0µ
Wmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/f_acc_1:0Zmodel/gradients/model/rnn/while/rnn/gru_cell/mul_1_grad/BroadcastGradientArgs/RefEnter_1:0u
Fmodel/rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0+model/rnn/while/TensorArrayReadV3/Enter_1:0Į
]model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/f_acc:0`model/gradients/model/rnn/while/rnn/gru_cell/candidate/candidate/MatMul_grad/MatMul_1/RefEnter:0f
"rnn/gru_cell/candidate/bias/