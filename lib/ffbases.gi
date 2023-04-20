#############################################################################
##
#W  ffbases.gi              The FFCSA Package                        nusa
##

#############################################################################
##
#M  GenerateNB(<field>, <elm>)
#M  GeneratePB( <F> , <elm>)    . . . ..
#M  GeneratePBdownto( <F> , <elm>)    . . . ..
##
InstallMethod(GenerateNB, "generate NB of F using normal elm", [IsField, IsFFE],
 function(F, elm)
# no need to check if elm \in F coz the Conjugates call will complain if its not
# no need to check if its actually normal element of F because Basis call will
# complain if its not
  return Basis(F, Conjugates(F, elm));
end);

InstallMethod(GeneratePB, "generate PB of F using  elm",  [IsField, IsFFE],
 function(F, elm)
# no need to check if elm \in F coz the Basis call will complain if its not
local B, S, i, m;
	S := [];
#	m := DegreeOverPrimeField(F);
	m := Dimension(F);
	for i in [1..m] do
		S[i] := elm^(i-1);
	od;

	B := Basis(F, S);
return B;
end);

InstallMethod(GeneratePBdownto, "generate PB of F using  elm",  [IsField, IsFFE],
 function(F, elm)

# no need to check if elm \in F coz the Basis call will complain if its not
local B, S, i, m;
	S := [];
#	m := DegreeOverPrimeField(F);
	m := Dimension(F);
	for i in [1..m] do
		S[i] := elm^(i-1);
	od;

	B := Basis(F, Reversed(S));
return B;
end);

#############################################################################
##
#O  IsDualBasisPair( <B1> , <B2>)    . . . ..
##

InstallMethod(IsDualBasisPair, "check if B1 dual wrt B2", [IsBasis, IsBasis], function(B1,B2)
local i,j,dual, belm1, belm2, trace;
  dual := true;
  if UnderlyingLeftModule(B1) = UnderlyingLeftModule(B2) then
  	for i in [1..Length(B1)] do
  		belm1 := B1[i];

  		for j in [1..Length(B2)] do
  			belm2 := B2[j];
  			trace := Trace(UnderlyingLeftModule(B1), belm1*belm2);
  			if i=j and IsZero(trace) then
  				dual := false;
  			elif 	i<>j and IsOne(trace) then
  				dual := false;
  			fi;
  		od;
  	od;
  	return dual;
  else
  	Error(B1," and ",B2," belong to different fields!!\n");
  	return fail;
  fi;
end);

InstallMethod(FindInvCyc, "find D(x): D(x)N(x)=1 mod x^m+1",
[IsField, IsPolynomial], function(F, nx)
# no need to check if elm \in F coz the Conjugates call will complain if its not
local x, m, g, eea, dx, prod;
		x := X(GF(Characteristic(F)), "x");
		m := DegreeOverPrimeField(F);
		g := x^m+1;

		eea := GcdRepresentation(nx,g);
		dx := eea[1];
		prod := dx*nx mod g;

		if  IsOne(prod) then
	#				Print("FOUND1:",g,":\t", nx," -> ",dx1,"-> ",prod1,"\n");
	#				Print(eea,"\n");
			return dx;
		else
#			Print("error:",g,":\t", nx," -> ",dx,"->",prod,"\n");
#  		Print(eea,"\n");
   		return fail;
		fi;
end);

InstallMethod(GeneratorOfDBtoNB, "generate NB of F using normal elm",
[IsField, IsFFE], function(F, elm)
# no need to check if elm \in F coz the Conjugates call will complain if its not
local NB, beta, i, m, x, nx, dx, cdx;

	NB :=  GenerateNB(F, elm);
	x := X(PrimeField(F), "x");
	nx := 0;

	for i in [1..Length(NB)] do
		nx := nx + Trace(F, NB[1]*NB[i])*x^(i-1);
	od;

	dx := FindInvCyc(F,nx);
	if dx=fail then
		return fail;
	else
		cdx := CoefficientsOfUnivariatePolynomial(dx);
		beta := 0;

		for i in [1..Length(cdx)] do
			beta := beta + cdx[i]*NB[i];
		od;
		return beta;

	fi;
end);

InstallMethod(GenerateDBtoNB, "generate NB of F using normal elm",  [IsField, IsFFE], function(F, elm)
	return GenerateNB(F, GeneratorOfDBtoNB(F,elm));
end);

#############################################################################
##
#O  GeneratorOfDBtoNB( <F> , <elm>)    . . . ..
##
InstallMethod(GenerateDBtoPB, "generate DB of a PB",
[IsField, IsFFE], function(F, elm)
# no need to check if elm \in F coz the Conjugates call will complain if its not
local PB, f, roots, g, cg, fd, fa, i, S, x;

	f := MinimalPolynomial(F, elm);
	roots := Conjugates(F,elm);

	x := X(PrimeField(F), "x");
	g := x-roots[2];
	for i in [3.. Length(roots)] do
		g := g*(x-roots[i]);
	od;
	cg := CoefficientsOfUnivariatePolynomial(g); # checked , it goes from lower to higher powers

	fd := Derivative(g* (x-roots[1]));
	fa := Value(fd, roots[1]);
	S := ShallowCopy(cg);
	for i in [1..Length(cg)] do
		S[i] :=  cg[i]/fa;
	od;

	PB := Basis(F, S);
	return PB;
end);

InstallMethod(GenerateDBtoPBdownto, "generate DB of a PBdownto",
[IsField, IsFFE], function(F, elm)
# no need to check if elm \in F coz the Conjugates call will complain if its not
local PB, f, roots, g, cg, fd, fa, i, S, x;

	f := MinimalPolynomial(F, elm);
	roots := Conjugates(F,elm);

	x := X(PrimeField(F), "x");
	g := x-roots[2];
	for i in [3.. Length(roots)] do
		g := g*(x-roots[i]);
	od;
	cg := CoefficientsOfUnivariatePolynomial(g); # checked , it goes from lower to higher powers

	fd := Derivative(g* (x-roots[1]));
	fa := Value(fd, roots[1]);
	S := ShallowCopy(cg);
	for i in [1..Length(cg)] do
		S[i] :=  cg[i]/fa;
	od;

	PB := Basis(F, Reversed(S));
	return PB;
end);

#############################################################################
##
#O  GenerateTFBfromEBlist( <edpl> )    . . . ..
##
validBasisTypes := ["PB", "NB", "B"];
validBasisDirections :=  ["to", "downto", ""];
# na = not applicable, for now as empty string

dictBases := NewDictionary("BasesCalls",  true);;
AddDictionary(dictBases , "PBto", "GeneratePB");;
AddDictionary(dictBases , "PBdownto", "GeneratePBdownto");;
AddDictionary(dictBases , "NBto", "GenerateNB");;
# add new: DB variants

InstallMethod(CheckMBlistFormat, "check MB list format and length",
	[ IsList, IsPosInt], function(mbl, len)
local i;

  if Length(mbl) = len then
  	for i in [1 ..len] do
  		if not (\in(mbl[i][1],validBasisTypes )) then
  				Error( "basis type at index ",i,"! must be: ",validBasisTypes,"\n" );
  				return fail;
  		elif not (\in(mbl[i][2],validBasisDirections  )) then
  					Error( "basis direction  at index ",i,"! must  ",validBasisDirections ,"\n" );
  					return fail;
  		fi;
  		if mbl[i][1] = "NB" and mbl[i][2] = "downto" then
  					Error( "basis direction  at index ",i,"! cant do conjugates downto!!\n" );
  					return fail;
  		fi;
  	od;
  else

	Error("check number of TF levels!\n");
	return false;
fi;

return true;

end);

# a bit of a mess, cleanup when time
InstallMethod(GenerateTFBfromEBlist, "generate TFB from EBlist (ext basis list)",
	[IsRingElementCollColl], function(EBlist)
# fields F/E --> EFlist
local len, K, mok,   i,  CBVlist, j, k,
CBVtmp, tmpj, tmpk, bv, TFBlist, TFB;
  len := Length(EBlist);
	K := GF(2);
  mok := [];  	#degree of extension over prime subfeield K
  CBVlist := []; 	# concateneted basisVectors
  CBVtmp := []; 	# one entry
  TFBlist := [];
	mok[1]   := Length(EBlist[1]);
 	# start tower of extensions
	for i in [2..len] do
			mok[i]   := mok[i-1] * Length(EBlist[i]);
	od;
	# Print(EBlist,"  -> len = ",len,"\n");
	#start the TF basis TFB  of Ftop/K
		tmpj := mok[len]/mok[1];
		for j in [1..tmpj] do
			CBVtmp := Concatenation(CBVtmp , BasisVectors(EBlist[1]));
		od;
		CBVlist[1] := CBVtmp;
#    Print(CBVlist,"\n");
		for i in [2 .. len] do
			tmpj := mok[i-1];
			tmpk := mok[i]/tmpj;
			bv := BasisVectors(EBlist[i]);
			CBVtmp := [];
			for k in [1..tmpk] do
				for j in [1..tmpj] do
# Print("(k,j)=",k,",",j,"\ttmpj=",tmpj,"\ttmpk=", tmpk, "\tidx = ", (k-1)*tmpj + j,"\n");

				CBVtmp[(k-1)*tmpj + j] := bv[k];
				od;
# Print("CBVtmp=",CBVtmp,"\n");
			od;
			while Length(CBVtmp) < mok[len] do
				CBVtmp := Concatenation(CBVtmp , CBVtmp);
			od;

			CBVlist[i] := CBVtmp;
# Print("CBVlist[i]=",CBVlist[i],"\n");
		od;
#Print("CBVlist=",CBVlist,"\n");

		for i in [1 .. mok[len]] do
			TFBlist[i] := One(K);
			for j in [1 .. len] do
				TFBlist[i] := TFBlist[i] * CBVlist[j][i];
			od;
		od;
#Print(TFBlist,"\n");
	TFB := Basis(GF(K, mok[len]), TFBlist);
return TFB;
end);

#main/most used method - needed for testbenches only
InstallMethod(GenerateTFBfromEDPLwithMB, "generate TFB from EDPL with MB",
	[IsRingElementCollection, IsList], function(edpl, mbl)
# fields F/E --> EFlist
local len, K, mok, EFlist, wlist, EBlist, i, f, basistype, cmd, CBVlist, j, k,
CBVtmp, tmpj, tmpk, bv, TFBlist, TFB;
  len := Length(edpl);
  if CheckMBlistFormat(mbl, len) then
    K := GF(2);
    mok := [];  	#degree of extension over prime subfeield K
    EFlist := [];	#extension field for each level
    wlist := []; 	#root of def. poly for each level
    EBlist := []; 	#B for each level,  #basisVectors= degreeOfExtension
    CBVlist := []; 	# concateneted basisVectors
    CBVtmp := []; 	# one entry
    TFBlist := [];

   	## start tower of extensions
  	for i in [1..len] do
  		f := edpl[i];
  		if i=1 then
  		# no need to check if edpls are irreducible coz if theyre not the FieldExt will fail
  			EFlist[i] := FieldExtension(K, f);
  		else
  			EFlist[i] := FieldExtension(EFlist[i-1], f);
  		fi;
  		mok[i]   := DegreeOverPrimeField(EFlist[i]);
  		wlist[i] := RootOfDefiningPolynomial(EFlist[i]);
  		# we are not worried about a reference polynomial untill we have a
  		# transition matrix to the top level as F_2[x]/(fref)
  	od;

  	## start the "per level" bases B of F/E
  	for i in [1 .. len] do
  		basistype := Concatenation(mbl[i][1], mbl[i][2]);
  	   #retrieve basis call
  	   cmd := 	LookupDictionary(dictBases , basistype );;
  		##Print(cmd,"\n");
  		cmd := Concatenation(cmd, "(", String(EFlist[i]), ",", String(wlist[i]), ");");
  		EBlist[i] := EvalString(cmd);
  	od;
#	Print(EBlist,"\n");

  	##start the TF basis TFB  of Ftop/K
  		tmpj := mok[len]/mok[1];
  		for j in [1..tmpj] do
  			CBVtmp := Concatenation(CBVtmp , BasisVectors(EBlist[1]));
  		od;
  		CBVlist[1] := CBVtmp;
  		for i in [2 .. len] do
  			tmpj := mok[i-1];
  			tmpk := mok[i]/tmpj;
  			bv := BasisVectors(EBlist[i]);
  			CBVtmp := [];
  			for k in [1..tmpk] do
  				for j in [1..tmpj] do
  #Print("(k,j)=",k,",",j,"\ttmpj=",tmpj,"\ttmpk=", tmpk, "\tidx = ", (k-1)*tmpj + j,"\n");

  				CBVtmp[(k-1)*tmpj + j] := bv[k];
  				od;
  #Print("CBVtmp=",CBVtmp,"\n");
  			od;
  			while Length(CBVtmp) < mok[len] do
  				CBVtmp := Concatenation(CBVtmp , CBVtmp);
  			od;
  			CBVlist[i] := CBVtmp;
  #Print("CBVlist[i]=",CBVlist[i],"\n");
  		od;

  #Print("CBVlist=",CBVlist,"\n");

  		for i in [1 .. mok[len]] do
  			TFBlist[i] := One(K);
  			for j in [1 .. len] do
  				TFBlist[i] := TFBlist[i] * CBVlist[j][i];
  			od;
  		od;

  #Print(TFBlist,"\n");
	TFB := Basis(GF(K, mok[len]), TFBlist);
 else
 return fail;
 fi;
#Print("GenerateTFBfromEDPLwithMB\n");
return TFB;
end);


InstallMethod(GenerateTFBfromEDPLwithPB, "generate TFB from EDPL with PB",
	[IsRingElementCollection], function(edpl)
  local mbl, i;
  mbl := [];
  for i in [1 .. Length(edpl)] do
  	mbl[i] := ["PB", "to"];
  od;
  return GenerateTFBfromEDPLwithMB(edpl, mbl);
end);

InstallMethod(GenerateTFBfromEDPLwithPBdownto, "generate TFB from EDPL with PB",
	[IsRingElementCollection], function(edpl)
  local mbl, i;
  mbl := [];
  for i in [1 .. Length(edpl)] do
  	mbl[i] := ["PB", "downto"];
  od;
  return GenerateTFBfromEDPLwithMB(edpl, mbl);
end);

InstallMethod(GenerateTFBfromEDPLwithNB, "generate TFB from EDPL with PB",
	[IsRingElementCollection], function(edpl)
  local mbl, i;
  mbl := [];
  for i in [1 .. Length(edpl)] do
  	mbl[i] := ["NB", "to"];
  od;
  return GenerateTFBfromEDPLwithMB(edpl, mbl);
end);

#############################################################################
##
#O  FindEDPLAllfromEDL( <elist> )    . . . ..
##
## TODO: find only PrimitivePoly, find only NrIrreducibleNotPrimitivePoly
## TODO: find only normal poly

InstallMethod(FindEDPLAllfromEDL, "find all EDPL from EDL",
	[IsList], function(edl)
local i, K, m , mground, masterlist;
	masterlist 	:= [];
	masterlist[1] := FindMonicIrreduciblePolyAll(GF(2), edl[1]);

	mground := 1;
	for i in [2..Length(edl)] do
			mground := mground * edl[i-1];
			K := GF(2, mground);
		masterlist[i] := FindMonicIrreduciblePolyAll(K, edl[i]);
	od;

return masterlist;
end);

InstallMethod(FindEDPLAllfromRDL, "find all EDPL from RDL",
	[IsList], function(rdl)
local i, edl, prod, m;
	edl := [];
	edl[1]  := rdl[1];
	prod := rdl[1];
	for i in [2.. Length(rdl)] do
		m := rdl[i]/prod;
		if IsInt(m) then
			edl[i] := m;
		else
			Error("something went wrong! degrees must be divisors !\n");
			return fail;
		fi;
			prod := prod * m;
	od;
return FindEDPLAllfromEDL(edl);
end);

InstallMethod(FindEDPLAllfromRDPL, "find all EDPL from RDPL",
	[IsRingElementCollection], function(rdpl)
  local rdl, i;
	rdl := [];
	for i in [1.. Length(rdpl)] do
		rdl[i] := Degree(rdpl[i]);
	od;

return FindEDPLAllfromRDL(rdl);
end);

InstallMethod(CheckTuple, "check the index tuple",
	[IsList, IsList], function(tup, lenlist)
  local j ;

		for j in [1 .. Length(tup)] do
			if tup[j] > lenlist[j]  then
				return false;
			fi;
		od;
return true;
end);

InstallMethod(ExtractEDPLs, "extract EDPLs from all EDPL",
	[IsRingElementCollColl], function(edplall)
  local i, j, enm,  nrlevels, nrtowers, masterlist, edpl, lenlist, tmp, maxlen;
	nrlevels := Length(edplall);
	nrtowers := 1;
	lenlist := [];
	masterlist := [];
	maxlen := 1;
	for i in [1.. nrlevels] do
		tmp			:= 		Length(edplall[i]);
		if tmp > maxlen then maxlen := tmp; fi;
		lenlist[i] 	:= 		tmp;
		nrtowers 	:= nrtowers * tmp;
	od;

	enm := EnumeratorOfTuples([1..maxlen], nrlevels);

	for i in enm do
		if CheckTuple(i, lenlist) then 	# check is valid
			edpl := [];
			for j in [1 .. nrlevels] do
				edpl[j] := edplall[j][i[j]];
			od;
			Add(masterlist, edpl);
		fi;
	od;

	if Length(masterlist) <> nrtowers then
		Error("we lost some TFs :( \n"); return fail;
	else
		return masterlist;
	fi;
end);


Print("ffbases.gi  OK,\t");
#E  ffbases.gi  . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
