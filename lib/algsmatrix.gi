#############################################################################
##
#W  algsmatrix.gi             The FFC Package                Nusa
##

###############################


InstallMethod(MultEvecMatrix, "vec * M expression", [IsVector, IsMatrix],
function(vec, M)
	return vec*M;
end);

InstallMethod(MultMatrixEvec, "M*vec expression", [IsMatrix, IsVector],
function(M, vec)
	return M*vec;
end);

InstallMethod(MultEvecMatrixEvec, "vec1 expression* M * vec2 expression", [IsVector, IsMatrix, IsVector],
function(vec1, M, vec2)
	return vec1*M*vec2;
end);

#############################################################################
##
#F  MatrixMultByConstExpression(  <B> , <C> , <vec>) . . NB multiplication matrix for constant C
##
InstallMethod(MatrixMultByConstExpression, "multiplicatioin matrix for constant FFE",
[IsBasis, IsFFE, IsVector], function(B, C, vec)
	return MatrixMultByConst(B, C)*vec;
end);

InstallMethod(MatrixMultByConstExpression, "multiplicatioin matrix for constant FFE",
[IsMatrix, IsVector], function(M, vec)
	return M*vec;
end);

InstallMethod(TransitionMatrixExpression, "transition matrix", [IsBasis, IsBasis, IsVector],
function(B1, B2, vec)
 	return TransitionMatrix(B1, B2)*vec;
end);

#############################################################################
##
#F  MatrixExpression(  <M> , <vec>) .
## . . . general matrix M
##
InstallMethod(MatrixExpression, "for general matrix M",
[ IsFFECollCollColl and  IsRectangularTable, IsVector], function(M, vec)
local  m, n, Mnew, i, j, row ;
	m := Length(M);
	n := Length(M[1]);
	Mnew := [];
	# make one T matrix for each column of U
	for i in [1..m] do
		row := [];
	#	Print("T for column ", i-1, "\n" );
		for j in [1..n] do
			row[j] := M[i][j] * vec;
		od;
		Mnew[i] := row;
	od;

	return Mnew;
end);

##not sure why would we even use the second one
#InstallOtherMethod(MatrixExpression, "for general matrix M",
#[ IsFFECollColl and  IsRectangularTable, IsVector], function(M, vec)
#local  m, n, Mnew, i, j, row ;
#	m := Length(M);
#	n := Length(M[1]);
#	Mnew := [];
#	# make one T matrix for each column of U
#	for i in [1..m] do
#		row := [];
#	#	Print("T for column ", i-1, "\n" );
#		for j in [1..n] do
#			row[j] := M[i][j] * vec;
#		od;
#		Mnew[i] := row;
#	od;
#
#	return Mnew;
#end);



InstallMethod(MatrixUExpression, "multiplication matrix U", [IsBasis, IsVector],
function(B, vec)
local  m, U ;
	m := Length(B);
	if m <> Length(vec) then
		Error("something went wrong, check dimensions","\n");
		return fail;
	fi;
	U := MatrixU(B);

	return MatrixExpression(U, vec);
end);

InstallMethod(MatrixMExpression, "multiplication matrix M", [IsBasis, IsVector],
function(B, vec)
local  m, M ;
	Print("Warning: if used as expression then only to get the expressions ");
	Print("for M matrix with basis element entries \n");
	Print("or use vec = BasisVectors to get actual M entries, then multiply\n");

	m := Length(B);
	if m <> Length(vec) then
		Error("something went wrong, check dimensions","\n");
		return fail;
	fi;
	M := MatrixM(B);

	return MatrixExpression(M, vec);
end);


## for FFA_mult_convolution: to get shifted columns with first vector
InstallMethod(MatrixA, "multiplication matrix A", [ IsVector],
function(vec)
local  m, M, i, j, row ;

	m := Length(vec);
	row := []; M := [];
	# make fir row
	for i in [1..m] do
		row[i] := vec[i];
	od;
	for i in [m+1 .. 2*m-1] do
		row[i] := 0;
	od;
	for i in [1.. 2*m-1 - (m-1)] do
		M[i] := SRL(row, i-1);
	od;
	M := TransposedMat(M);

	return M;
end);

InstallMethod(FFA_mult_convolution,
"convolution for input vectors avec and bvec", [ IsVector, IsVector],
function(vec1, vec2)
local  A, M ;
	A := MatrixA(vec1);
	M := A*vec2;
	return M;
end);

InstallMethod( ReductionMatrixExpression, "reduction matrix full expression",
[ IsUnivariatePolynomial, IsVector], function(f,vec)
local IR;
	IR := ReductionMatrixIR(f);
return IR * vec;
end);

InstallMethod( ReductionMatrixExpressionDownto, "reduction matrix full expression",
[ IsUnivariatePolynomial, IsVector], function(f,vec)
local RI;
	RI := ReductionMatrixRI(f);
return RI * vec;
end);

InstallMethod( FFA_mult_2stepClassic, "2 step classic multiplication for PB",
[  IsUnivariatePolynomial, IsVector, IsVector, IsString], function(f, vec1, vec2, dir)
local dexpr;
	if not (\in(dir,validBasisDirections )) then
		Error( "basis direction ",dir,"! must be one of ",validBasisDirections ,"\n" );
		return fail;
	fi;
	dexpr := FFA_mult_convolution(vec1, vec2);
	if dir = "to" then
		return ReductionMatrixExpression(f, dexpr);
	else
		return ReductionMatrixExpressionDownto(f, dexpr);
	fi;
end);

InstallMethod( FFA_mult_2stepClassic, "2 step classic multiplication for PB",
[  IsUnivariatePolynomial, IsString], function(f, dir)
	if dir = "to" then
		ChooseFieldElms(FieldExtension(GF(2), f));
	else
		ChooseFieldElmsDownto(FieldExtension(GF(2), f));
	fi;
	return FFA_mult_2stepClassic(f, avec, bvec, dir);
end);

#############################################################################
##
#F   FFA_mult_matrixU(  <B> , <C> , <vec>) .
## . . .
# use this one for TF for each PLB!!!
InstallMethod( FFA_mult_matrixU, "matrixU multiplication for any basis",
[  IsBasis, IsVector, IsVector], function(B, vec1, vec2)
local Uexpr, tmp, i;
	Uexpr := MatrixUExpression(B, vec1);
#	Print(Uexpr*vec2,"\n");
#	return Uexpr*vec2;
	tmp := Uexpr*vec2;
	for i in [1..Length(tmp)] do
		if not IsZero(tmp[i]) then
			tmp[i] := ReduceMonomialsOverField(LeftActingDomain(UnderlyingLeftModule(B)),tmp[i]); #for TF
		fi;
	od;
	return  tmp;
end);


wgffe := Z(2)^0; Finternal := GF(2);

# this method will do one extension
InstallMethod( FFA_mult_matrixU, "matrixU multiplication for any basis",
[  IsUnivariatePolynomial, IsString, IsString], function(f, basisType, dir)
local F, w, cmd, B, basistype, Uexpr;
	if not (\in(dir,validBasisDirections )) then
		Error( "basis direction ",dir,"! must be one of ",validBasisDirections ,"\n" );
		return fail;
	fi;
	if not (\in(basisType,validBasisTypes )) then
			Error( "basis type ",basisType,"! must be one of ",validBasisTypes,"\n" );
			return fail;
	fi;
	if basisType = "NB" and dir = "downto" then
				Error( "basis direction ",dir,"! cant do conjugates downto!!\n" );
				return fail;
	fi;

		Finternal := FieldExtension(GF(2), f);
		wgffe := RootOfDefiningPolynomial(Finternal); # instead of w
		basistype := Concatenation(basisType, dir);
	   #retrieve basis call
	   cmd := 	LookupDictionary(dictBases , basistype );;
		##Print(cmd,"\n");
		cmd := Concatenation(cmd, "(Finternal, wgffe);");
		B := EvalString(cmd);
#		Print(B,"\n");	#ok

	if dir = "to" then
		ChooseFieldElms(Finternal);
	else
		ChooseFieldElmsDownto(Finternal);
	fi;

	return FFA_mult_matrixU(B, avec, bvec);
#	Uexpr := MatrixUExpression(B, avec);
#	Print(Uexpr,"\n");
#	Print(Uexpr*bvec,"\n");
#	return  Uexpr*bvec;
end);

InstallMethod( FFA_sq_matrixU, "matrixU squaring for any basis",
[  IsBasis, IsVector], function(B, vec)
local Uexpr, i;
	Uexpr := MatrixUExpression(B, vec);
#	Print(Uexpr*vec2,"\n");
	Uexpr := Uexpr*vec;
	for i in [1..Length(Uexpr)] do
		if not IsZero(Uexpr[i]) then
			Uexpr[i] := ReduceMonomialsOverField(LeftActingDomain(UnderlyingLeftModule(B)),Uexpr[i]);#for TF
			#Uexpr[i] := ReduceMonomialsOverField(UnderlyingLeftModule(B),Uexpr[i]);#for TF  ### wrong, because coeffs are from subfield!!!!
		fi;
	od;
	return  Uexpr;
end);

# something was complaining without this, i think EvalString
wgffe := Z(2)^0; #root omega or generator
Finternal := GF(2);

InstallMethod( FFA_sq_matrixU, "matrixU squaring for any basis",
[  IsUnivariatePolynomial, IsString, IsString], function(f, basisType, dir)
local F, w, cmd, B, basistype, Uexpr;
	if not (\in(dir,validBasisDirections )) then
		Error( "basis direction ",dir,"! must be one of ",validBasisDirections ,"\n" );
		return fail;
	fi;

	if not (\in(basisType,validBasisTypes )) then
			Error( "basis type ",basisType,"! must be one of ",validBasisTypes,"\n" );
			return fail;
	fi;
	if basisType = "NB" and dir = "downto" then
				Error( "basis direction ",dir,"! cant do conjugates downto!!\n" );
				return fail;
	fi;

		Finternal := FieldExtension(GF(2), f);
		wgffe := RootOfDefiningPolynomial(Finternal); # instead of w
		basistype := Concatenation(basisType, dir);
	   #retrieve basis call
	   cmd := 	LookupDictionary(dictBases , basistype );;
		##Print(cmd,"\n");
		cmd := Concatenation(cmd, "(Finternal, wgffe);");
		B := EvalString(cmd);
#		Print(B,"\n");	#ok

	if dir = "to" then
		ChooseFieldElms(Finternal);
	else
		ChooseFieldElmsDownto(Finternal);
	fi;

	return FFA_sq_matrixU(B, avec);
#	Uexpr := MatrixUExpression(B, avec);
#	Print(Uexpr,"\n");
#	Print(Uexpr*bvec,"\n");

#	return  Uexpr*bvec;
end);


InstallMethod( FFA_exp_matrixU, "matrixU exp for any basis",
[  IsBasis, IsVector, IsPosInt], function(B, vec, pwr)
local A, i, j, exponent, S;
	exponent := CoefficientsQadic(pwr, 2);
	S := FFA_sq_matrixU(B, vec);
	if exponent[1] = 1 then A := vec;
	else A := Coefficients(B, Z(2)^0); fi;
	for j in [2.. Length(exponent)] do
		if exponent[j] = 1 then
		 A := MatrixUExpression(B, S) * A;
			for i in [1..Length(A)] do
			  if not IsZero(A[i]) then
						A[i] := ReduceMonomialsOverField(LeftActingDomain(UnderlyingLeftModule(B)),A[i]); #for TF
						#A[i] := ReduceMonomialsOverField(UnderlyingLeftModule(B),A[i]); #for TF ### wrong, because coeffs are from subfield!!!!
				fi;
			od;
		fi;
		S := FFA_sq_matrixU(B, S);
	od;
	return A;
end);


InstallMethod( FFA_exp_matrixU, "matrixU exp for any basis",
[  IsUnivariatePolynomial, IsString, IsString, IsPosInt],
function(f, basisType, dir, pwr)
local F, w, cmd, B, basistype, Uexpr;
	if not (\in(dir,validBasisDirections )) then
		Error( "basis direction ",dir,"! must be one of ",validBasisDirections ,"\n" );
		return fail;
	fi;
	if not (\in(basisType,validBasisTypes )) then
			Error( "basis type ",basisType,"! must be one of ",validBasisTypes,"\n" );
			return fail;
	fi;
	if basisType = "NB" and dir = "downto" then
				Error( "basis direction ",dir,"! cant do conjugates downto!!\n" );
				return fail;
	fi;

		Finternal := FieldExtension(GF(2), f);
		wgffe := RootOfDefiningPolynomial(Finternal); # instead of w
		basistype := Concatenation(basisType, dir);
	   #retrieve basis call
	   cmd := 	LookupDictionary(dictBases , basistype );;
		##Print(cmd,"\n");
		cmd := Concatenation(cmd, "(Finternal, wgffe);");
		B := EvalString(cmd);
#		Print(B,"\n");	#ok

	if dir = "to" then
		ChooseFieldElms(Finternal);
	else
		ChooseFieldElmsDownto(Finternal);
	fi;
	return FFA_exp_matrixU(B, avec, pwr);
end);


InstallMethod( FFA_inv_matrixU, "matrixU inv for any basis",
[  IsUnivariatePolynomial, IsString, IsString],
function(f, basisType, dir)
	return FFA_exp_matrixU(f, basisType, dir, 2^Degree(f)-2);
end);

InstallMethod( FFA_inv_matrixU, "matrixU inv for any basis",
[  IsBasis, IsVector], function(B, vec)
local e;
	#e := 2*Length(vec)-2; #only works for one extension
	#e := Size(LeftActingDomain(UnderlyingLeftModule(B)))-2; #wrong, we need THIS field, not subfield
	e := Size(UnderlyingLeftModule(B))-2;
	return FFA_exp_matrixU(B, vec, e);
end);


#############################################################################
##
#F   FFA_mult_matrixM(  <B> , <C> , <vec>) .
## . . .
#DeclareOperation( "FFA_mult_matrixM", [  IsBasis, IsVector, IsVector]);
InstallMethod( FFA_mult_matrixM , "matrixM multiplication for normal basis",
[  IsBasis, IsVector, IsVector], function (NB, vec1, vec2)
local product, Mi, i;
product := [];
for i in [1.. Length(NB)] do
	Mi := MatrixMi(NB, i-1);
	product[i] := MultEvecMatrixEvec(vec1, Mi, vec2);
od;
return product;
end);

InstallMethod( FFA_mult_matrixM , "matrixM multiplication for normal basis",
[ IsUnivariatePolynomial ], function (f)
local F, w, NB;
		F := FieldExtension(GF(2), f);
		w := RootOfDefiningPolynomial(F);
		NB := GenerateNB(F, w);
		ChooseFieldElms(F);
	return FFA_mult_matrixM(NB, avec, bvec);
end);

InstallMethod( FFA_mult_matrixMi , "matrixM multiplication for normal basis",
[   IsBasis, IsVector, IsVector, IsInt ], function (NB, vec1, vec2, pos)
local Mi;
	Mi := MatrixMi(NB, pos);
	return MultEvecMatrixEvec(vec1, Mi, vec2);
end);



Print("algsmatrix.gi OK,\t");

#E  matrix.gi  . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
