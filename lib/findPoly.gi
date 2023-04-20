#############################################################################
##
#W  findPoly.gi             The FFCSA Package                 Nusa
##
## note: unoptimized search !  (exhaustive)
## changed from function to method


#############################################################################
##
#M  FindPrimitivePolyAll2 (<m>)  ... over ground field !!!!
#M  FindPrimitivePolyAll( <K>, <m>) . . . . . . . . over K

# over ground field !!!!
InstallMethod( FindPrimitivePolyAll2 ,
"finds primitive polynomials of degree m over GF(2)", [IsPosInt], function( m)
local x, i, j, K, size, termlist, polylist, veclist, vec , polytemp, theoretical;

	K := GF(2); x:=X(K,"x");
	polylist := [];
	termlist :=[Z(2)^0];
	for i in [1..m] do
		termlist[i+1] := x^i;
	od;

#	size := Characteristic(K)^(DegreeOverPrimeField(K)*m);
	size := Characteristic(K)^(m);
	if size > 2^60 then size := 2^59; fi;

	for i in [3.. size] do
		vec:=  CoefficientsQadic(i,2); # cant work for towerfields !!!
		veclist := [];
		for j in [1..m] do
				veclist[j] := 0;
		od;
		veclist := vec + veclist;	veclist[m + 1] := 1;

		polytemp := veclist* termlist;
		if ((polytemp <> 0*Z(2)) and (polytemp <> Z(2)^0) and Degree(polytemp)= m) then
			if(IsPrimitivePolynomial(K, polytemp) ) then
					Add(polylist, polytemp);
			fi;
		fi;
	od;

	theoretical := NrPrimitivePoly(K,m);

	if theoretical  <> Length(polylist) then
		Print("Something went wrong, i should have found ",theoretical);
		Print(" primitive polynomials, but have found found " ,Length(polylist));
		Print(" :\n",polylist ,"\n");
	fi;
		return polylist;
end);

#over K
#InstallGlobalFunction( FindPrimitivePolyAll ,  function(K, m)
InstallMethod( FindPrimitivePolyAll ,
"finds primitive polynomials of degree m over K", [IsField,IsPosInt],
function(K,m)
local x, i, F, termlist, polylist, ffe, vec , veci, polytemp, theoretical ;

	if K = GF(2) then 		return  FindPrimitivePolyAll2(m);
	else
		x:=X(K,"x"); F := GF(K, m);
		polylist := [];
		termlist :=[Z(2)^0];
		for i in [1..m] do
			termlist[i+1] := x^i;
		od;

		for ffe in Elements(F) do
			vec := Coefficients(Basis(F), ffe);
			for i in Elements(K) do
				veci := ShallowCopy(vec);
				if IsZero(i) then
					continue;
				else
					Add(veci ,i, 1);
					polytemp := veci* termlist;

					if ((polytemp <> 0*Z(2)) and (polytemp <> Z(2)^0) and Degree(polytemp)= m) then
						if(IsPrimitivePolynomial(K, polytemp) ) then
								Add(polylist, polytemp);
						fi;
					fi;
				fi;
			od;
		od;

		theoretical := NrPrimitivePoly(K,m);
		if theoretical  <> Length(polylist) then
			Print("Something went wrong, i should have found ",theoretical);
			Print(" primitive polynomials, but have found found " ,Length(polylist));
			Print(" :\n",polylist ,"\n");
		fi;
		return polylist;
	fi;
end);


#############################################################################
##
#M  FindIrreduciblePolyAll2 (<m>)  ... over ground field !!!!
#M  FindIrreduciblePolyAll( <K>, <m>) . . . . . . . . over K

# over ground field !!!!
#InstallGlobalFunction( FindIrreduciblePolyAll2 ,  function(m)

InstallMethod( FindIrreduciblePolyAll2 ,
"finds irreducible polynomials of degree m over GF(2)", [IsPosInt], function(m)
local x, i, K, F, termlist, polylist, ffe, vec , polytemp, theoretical ;
	K := GF(2); x:=X(K,"x"); F := GF(K, m);
	polylist := [];
	termlist :=[Z(2)^0];
	for i in [1..m] do
		termlist[i+1] := x^i;
	od;

	for i in [3.. Size(F)] do
		ffe := Elements(F)[i];
		vec := Coefficients(Basis(F), ffe);
		Add(vec ,One(K), 1);

		polytemp := vec* termlist;
		if ((polytemp <> 0*Z(2)) and (polytemp <> Z(2)^0) and Degree(polytemp)= m) then
			if(IsIrreducibleRingElement(PolynomialRing(K), polytemp)) then
					Add(polylist, polytemp);
			fi;
		fi;
	od;

 theoretical := NrIrreduciblePoly(K,m);

	if theoretical  <> Length(polylist) then
		Print("Something went wrong, i should have found ",theoretical);
		Print(" irreducible polynomials, but have found found " ,Length(polylist));
		Print(" :\n",polylist ,"\n");
	fi;
	return polylist;
end);

## main search method
#InstallGlobalFunction( FindIrreduciblePolyAll ,  function(K, m)
InstallMethod( FindIrreduciblePolyAll ,
"finds irreducible polynomials of degree m over K", [IsField,IsPosInt],
function(K,m)

local x, i, F, termlist, polylist, ffe, vec , veci, polytemp, theoretical ;

if K = GF(2) then return  FindIrreduciblePolyAll2(m);
else
	x:=X(K,"x"); 	F := GF(K, m);
	polylist := [];
	termlist :=[Z(2)^0];
	for i in [1..m] do
		termlist[i+1] := x^i;
	od;

	for ffe in Elements(F) do
		vec := Coefficients(Basis(F), ffe);
		for i in Elements(K) do
			veci := ShallowCopy(vec);
			if IsZero(i) then
				continue;
			else
				Add(veci ,i, 1);
				polytemp := veci* termlist;

				if ((polytemp <> 0*Z(2)) and (polytemp <> Z(2)^0) and Degree(polytemp)= m) then
					if(IsIrreducibleRingElement(PolynomialRing(K), polytemp)) then
							Add(polylist, polytemp);
					fi;
				fi;
			fi;
		od;
	od;

	#theoretical := NrIrreduciblePoly(K,m); # monic
	theoretical := NrIrreduciblePoly(K,m) * (Size(K) - 1) ;

	if theoretical  <> Length(polylist) then
		Print("Something went wrong, i should have found ",theoretical);
		Print(" irreducible polynomials, but have found found " ,Length(polylist));
		Print(" :\n",polylist ,"\n");
	fi;
		return polylist;
	fi;
end);



## monic
#InstallGlobalFunction(  FindMonicIrreduciblePolyAll ,  function(K, m)
InstallMethod( FindMonicIrreduciblePolyAll ,
"finds monic irreducible polynomials of degree m over K", [IsField,IsPosInt],
function(K,m)
local x, i, F, termlist, polylist, ffe, vec , veci, polytemp, theoretical ;

	x:=X(K,"x"); 	F := GF(K, m);
	polylist := [];
	termlist :=[Z(2)^0];
	for i in [1..m] do
		termlist[i+1] := x^i;
	od;

	for ffe in Elements(F) do
		vec := Coefficients(Basis(F), ffe);
		for i in Elements(K) do
			veci := ShallowCopy(vec);
			if IsZero(i) then
				continue;
			elif veci[Length(veci)] <> Z(2)^0 then
				continue;
			else
				Add(veci ,i, 1);
				polytemp := veci* termlist;

				if ((polytemp <> 0*Z(2)) and (polytemp <> Z(2)^0) and Degree(polytemp)= m) then
					if(IsIrreducibleRingElement(PolynomialRing(K), polytemp)) then
							Add(polylist, polytemp);
					fi;
				fi;
			fi;
		od;
	od;

	theoretical := NrIrreduciblePoly(K,m); # monic

	if theoretical  <> Length(polylist) then
		Print("Something went wrong, i should have found ",theoretical);
		Print(" irreducible polynomials, but have found found " ,Length(polylist));
		Print(" :\n",polylist ,"\n");
	fi;
		return polylist;
end);



#InstallGlobalFunction( FindMonicIrreducibleNotPrimitivePolyAll ,  function(K, m)
InstallMethod(FindMonicIrreducibleNotPrimitivePolyAll ,
"finds monic irreducible not primitive polynomials of degree m over K",
[IsField,IsPosInt], function(K,m)

local x, i, F, termlist, polylist, ffe, vec , veci, polytemp, theoretical ;

x:=X(K,"x"); F := GF(K,m);
polylist := [];
termlist :=[Z(2)^0];
for i in [1..m] do
	termlist[i+1] := x^i;
od;

	for ffe in Elements(F) do
		vec := Coefficients(Basis(F), ffe);
		for i in Elements(K) do
			veci := ShallowCopy(vec);
			if IsZero(i) then
				continue;
			elif veci[Length(veci)] <> Z(2)^0 then
				continue;
			else
				Add(veci ,i, 1);
				polytemp := veci* termlist;

				if ((polytemp <> 0*Z(2)) and (polytemp <> Z(2)^0) and Degree(polytemp)= m) then
					if(IsIrreducibleRingElement(PolynomialRing(K), polytemp) and (not IsPrimitivePolynomial(K, polytemp))) then
						Add(polylist, polytemp);
					fi;
				fi;
			fi;
		od;
	od;


 theoretical := NrIrreducibleNotPrimitivePoly(K,m);

if theoretical  <> Length(polylist) then
	Print("Something went wrong, i should have found ",theoretical);
	Print(" irreducible not primitive polynomials, but have found found " ,Length(polylist));
	Print(" :\n",polylist ,"\n");
fi;
		return polylist;
end);


Print("findPoly.gi OK,\t");
#E  search.gi  . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
