#############################################################################
##
#W  matrix.gi             The FFCSA Package                Nusa
##

#############################################################################
##
#F  MatrixMultByConst(  <B> , <C> ) . . multiplication matrix for constant C
##
InstallMethod(MatrixMultByConst, "multiplicatioin matrix for constant FFE",
[IsBasis, IsFFE], function(B, C)
	local  gt,  G,  i;

	# i think i can remove this check coz the Coefficients call should fail in this case
	if DefaultField(B) < DefaultField(C) then
		Print("The constant ",C," can not be represented with B = ",B, "\n");
		return fail;
	fi;

	G :=[];
	for i in [1..Length(B)] do
		gt := C * (B[i]);
		G[i]  :=  Coefficients(B, gt);
	od;
	return TransposedMat(G);
end);

#############################################################################
##
#M  TransitionMatrix( <B1>, <B2> ) . . . . . . transition matrix from B1 to B2
##
##### revisited for tower fields !!!! --> WORKS OK
### renamed TransitionMatrixNC to TransitionMatrix after removal!
InstallMethod(TransitionMatrix, "transition matrix", [IsBasis, IsBasis],
function(B1, B2)
	local  m, i, M;

	m := Length(B1);
	# from B1 to B2
	M := IdentityMat(m,  PrimeField(DefaultField(B1)));
	for i in [1..m] do
		M[i]  :=  Coefficients(B2,  B1[i]);
		 # expresses a basis vector of B1 as a lin comb of B2 vectors
		 #removed all the basis checks coz the Coefficients call will fail if anything is wrong!!!
	od;
	return  TransposedMat(M);	#transition matrix from B1 basis to B2
end);

###  REMOVED THE "CHECK" VERSION ENTIERLY !
#removed all the basis checks coz the Coefficients call will fail if anything is wrong!!!

#############################################################################
##
#M  ReductionMatrix( <f> ) . . . . . reduction w.r.t. defining poly f
##  two-step classic / schoolbook method
##

########
# works for towerfields :) tested ok
# (use the polynomial of the current TF level! )
InstallMethod(ReductionMatrix, "reduction matrix", [IsUnivariatePolynomial],
function(f)
	local  m, cf, M, j, i, x, tmp, c, dummy;

	m := Degree(f);
	x := IndeterminateOfLaurentPolynomial(f);
#	M := NullMat(m, m-1, PrimeField(DefaultField(f)));
# wont be true for IsFFECollColl :(
	M := [];
	dummy := [];

	for i in [1.. m] do
		dummy[i] := 0*Z(2);
	od;

	for i in [1 .. m-1] do
		tmp := x^(i+(m-1)) mod f;
		c := CoefficientsOfUnivariatePolynomial(tmp);
		M[i] := ShallowCopy(c) + ShallowCopy(dummy);
#		Print(i," with ", Length(M[i]), " -> ",tmp," -> ",c," -> ",M[i],"\n");
	od;
	return  TransposedMat(M);
end);

########
# assuming it works for towerfields, untested
InstallMethod(ReductionMatrixDownto, "reduction matrix", [IsUnivariatePolynomial],
function(f)
	local  m, cf, M, j, i, x, tmp, c, dummy;

	m := Degree(f);
	x := IndeterminateOfLaurentPolynomial(f);
#	M := NullMat(m, m-1, PrimeField(DefaultField(f)));
# wont be true for IsFFECollColl :(
	M := [];
	dummy := [];

	for i in [1.. m] do
		dummy[i] := 0*Z(2);
	od;

	for i in [1 .. m-1] do
		tmp := x^(i+(m-1)) mod f;
		c := CoefficientsOfUnivariatePolynomial(tmp);
		M[i] := Reversed(ShallowCopy(c) + ShallowCopy(dummy));
#		Print(i," with ", Length(M[i]), " -> ",tmp," -> ",c," -> ",M[i],"\n");
	od;
	return  TransposedMat(M);
end);

########
## for  matrix done by ReductionMatrix call , i.e. "To" case
InstallMethod( ReductionMatrixIR, "reduction matrix full ",
 [ IsUnivariatePolynomial], function (f)
 local R, I, IR, m, i ,j, row ;
 m := Degree(f);
 R := ReductionMatrix(f);
 I := Z(2)^0 * IdentityMat(m);
 IR := [];

 for i in [1..m] do
 	row := [];
 	for j in [1..m] do
 		row[j] := I[i][j];
 	od;
 	for j in [m+1 .. 2*m-1] do
 		row[j] := R[i][j-(m)];
 	od;
 	IR[i] := row;
 od;

return  IR ;
end);

########
## for  matrix done by ReductionMatrixDownto call , i.e. "Downto" case
InstallMethod( ReductionMatrixRI, "reduction matrix full ",
 [ IsUnivariatePolynomial], function (f)
 local R, I, RI, m, i ,j, row ;
 m := Degree(f);
 R := ReductionMatrixDownto(f);
 I := Z(2)^0 * IdentityMat(m);
 RI := [];

 for i in [1..m] do
 	row := [];
 	for j in [1..m-1] do
 		row[j] := R[i][j];
 	od;
 	for j in [m .. 2*m-1] do
 		row[j] := I[i][j-m +1];
 	od;
 	RI[i] := row;
 od;

return  RI ;
end);

#############################################################################
##
#M  MatrixU( <B> ) . . . . . Matrix U w.r.t. basis B
##
##  generalized algo for multiplication
##

InstallMethod(MatrixU, "multiplication matrix U", [IsBasis],
function(B)
local  m, T, U , bv, i, j ;

m := Length(B);
bv := BasisVectors(B);

U := []; T := [];
# make one T matrix for each column of U
for i in [1..m] do
#	Print("T for column ", i-1, "\n" );
	for j in [1..m] do
		T[j] := Coefficients(B, bv[i]* bv[j]);
	od;
	T := TransposedMat(T);
	U[i] := T;
#	Print(IntMatFFExt(T),"\n");
	T := [];
od;

#Print(U); ## correct but needs transpose:)

U := TransposedMat(U);

return U;
end);

########

InstallMethod(MatrixUi, "i-th component of multiplication matrix U",
 [IsBasis, IsInt], function(B, idx)
local  m, Ui, U , row, newrow, i, j ,k;

m := Length(B);
U := MatrixU(B);
Ui := [];

if idx<0 or idx>m-1 then
	Error("Index ",idx," is out of range!\n");
	return fail;
fi;

 row := [];
 newrow := [];

for i in [1..m] do
	row := U[i];
 	newrow := [];
	for j in [1..m] do
		newrow[j] := row[j][idx+1];
	od;
	Ui[i]:= newrow;

od;

return Ui;
end);

#############################################################################
##
#M  MatrixM( <B> ) . . . . . Matrix M w.r.t. basis B
##
## massey-omura mult for normal bases
##
InstallMethod(MatrixM, "NB multiplication matrix M", [IsBasis],
function(B)
	local  m, T, M , bv, i, j ,ne;

	m := Length(B);
	bv := BasisVectors(B);
	ne := bv[1];
	M := [];

	for i in [1..m] do
		T := [];
		for j in [1..m] do
			T[j] := Coefficients(B, ne^(2^(i-1)+2^(j-1)));
		od;

		M[i] := T;
	od;

	return M;
end);

########

InstallMethod(MatrixMi, "i-th component of NB multiplication matrix M",
[IsBasis, IsInt], function(B, idx)
	local  m, M, Mi , row, newrow, i, j ,k;

	m := Length(B);
	M := MatrixM(B);
	Mi := [];

	if idx<0 or idx>m-1 then
		Error("Index ",idx," is out of range!\n");
		return fail;
	fi;

	 row := [];
	 newrow := [];

	for i in [1..m] do
		row := M[i];
	 	newrow := [];
		for j in [1..m] do
			newrow[j] := row[j][idx+1];
		od;
		Mi[i]:= newrow;
	od;

	return Mi;
end);

InstallMethod(MatrixMByFFE, "NB multiplication matrix M", [IsBasis],
function(B)
	local  m, T, M , bv, i, j ,ne;

	m := Length(B);
	bv := BasisVectors(B);
	ne := bv[1];
	M := [];

	for i in [1..m] do
		T := [];
		for j in [1..m] do
			T[j] :=  ne^(2^(i-1)+2^(j-1));
		od;

		M[i] := T;
	od;

	return M;
end);


#############################################################################
##
#F  SRmatrix( <M>, <m> ) . . .  matrix M shifted to the right
##
## UNTESTED !!!!
InstallMethod(SRmatrix,  "matrix M shifted to the right" ,
[ IsFFECollColl, IsPosInt] , function(M,  m)
local  K, d, drows, dcols, MT, SM, i, j;

#maybe just set K = GF(2) to speed-up ?
	K := DefaultFieldOfMatrix(M);

	MT := TransposedMat(M);
	d  :=  DimensionsMat(MT);
	drows  :=  d[1];
	dcols  :=  d[2];
	SM  :=  IdentityMat(drows, K);

	for i in [1..drows] do
		j := (i+m) mod dcols;
		if j=0 then j:= dcols; fi;
		SM[i] := MT[j];
	od;
	MT := TransposedMat(SM);

return MT;
end);

#############################################################################
##
#F  TSRTmatrix( <MNT>, <m> ) . . . unified matrix for the MTN>>MNT block
##
## UNTESTED !!!!
InstallMethod( TSRTmatrix, "unified matrix for the MTN>>MNT block",
[ IsFFECollColl, IsPosInt],  function(M,  m)
local K, d, drows, I, S, MI, MS;

#maybe just set K = GF(2) to speed-up ?
	K := DefaultFieldOfMatrix(M);
	d  :=  DimensionsMat(M);
	drows  :=  d[1];
	I  :=  IdentityMat(drows,  K);
	S := SRmatrix(I,m);
	MI := Inverse(M);
	MS := M*S*MI;

return MS;
end);

#moved to algsmatrix.gd/gi

Print("matrix.gi OK,\t");
#E  matrix.gi  . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
