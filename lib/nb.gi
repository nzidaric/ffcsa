#############################################################################
##
##
#W  nb.gi           The FFCSA Package                Nusa
##

#############################################################################
##
#O  IsONBI(<q>, <m>) . . . . . . . . checks if an ONB type I exists for GF(q^m)
##
InstallMethod(IsONBI, "checks if an ONB type I exists ", [IsPosInt,IsPosInt],
function(q,m)
	local p, ONBIflag;
	ONBIflag := false;

	if  not( IsPrime(q) or IsPrimePowerInt(q)) then
		Error("Value q must be a prime or a prime power !!!!\n");
	fi;
	p := m+1;
	if (IsPrime(p)) then 				# condition 1 and
		if (IsPrimitiveRootMod(q,p)) then 	# condition 2
			ONBIflag := true;
		fi;
	fi;
	return ONBIflag;
end);

#############################################################################
##
#O  IsONBI( <F>) . . . . . . . . checks if an ONB type I exists for GF(q^m)
##
InstallMethod(IsONBI, "checks if an ONB type I exists ", [IsField],
function(F)
	return IsONBI( Characteristic(F), DegreeOverPrimeField(F));
end);

#############################################################################
##
#O  IsONBII( <m>, <q>) . . . . . . checks if an ONB type II exists for GF(2^m)
##  check for char = 2 !!!
InstallMethod(IsONBII, " checks if an ONB type II exists", [IsPosInt,IsPosInt],
function(q,m)
	local p, ONBIIflag;
	ONBIIflag := false;

#	if  not ( IsPrime(q) or IsPrimePowerInt(q)) then
	if  q <> 2 then
		Error("Value q must be 2 !!!!\n");
	fi;
	p := 2*m+1;
	if (IsPrime(p)) then  				# condition 1 and
		if (IsPrimitiveRootMod(q,p) or  #either condition 2
					(p mod 4 = 3   and  OrderMod(q,p) = m )) then    #or condition 3
					ONBIIflag := true;
		fi;
	fi;
	return ONBIIflag;
end);

#############################################################################
##
#O  IsONBII( <F>) . . . . . . . . checks if an ONB type I exists for GF(2^m)
##
InstallMethod(IsONBII, "checks if an ONB type II exists", [IsField],
function(F)
	return IsONBII( Characteristic(F), DegreeOverPrimeField(F));
end);

#############################################################################
##
#O  IsNormalFFE( <K>, <f>, <elm> ) . . . checks if elm is a normal elm of f.f.
##
## USE FOR EXH SEARCH (fastest one)
## ff handbook, thm 5.2.11(1.)

InstallMethod( IsNormalFFE, "is ffe a normal elm of the ext. field ",
[IsField,IsUnivariatePolynomial, IsRingElement], function(K, f, elm)

local   F, n, q, y, polyref,  i, Telm;

	n  := Degree(f);
#	q  := Characteristic(K)^DegreeOverPrimeField(K); #this doesnt work for tower
	q  := Characteristic(K)^Dimension(K);
	F  := FieldExtension(K,  f);
	# this will complain if f not irreducible, so no need for the check itself
	y  :=  X(F,  "y");
	polyref  :=  y^n - 1;
	Telm  :=  0;

	for i in [0..(n-1)] do
		Telm  :=  Telm + (elm^(q^i)) * y^i;
	od;
	if (Gcd(polyref,  Telm)  =  Gcd(y,  polyref)) then
			return true;
	else 	return false;
	fi;

end);

#############################################################################
##
#O  IsNormalFFE( <F>, <elm> ) . . . .checks if elm is a normal elm of f.f.
##
InstallMethod( IsNormalFFE, "is ffe a normal elm of the ext. field ",
[IsField, IsRingElement], function( F, elm)

local K;
	K  :=  GF(Characteristic(elm));
	return IsNormalFFE(K, DefiningPolynomial(F),elm);
end);

#############################################################################
##
#O  IsNormalFFE( <f>, <elm> ) . . . .checks if elm is a normal elm of f.f.
##
InstallMethod( IsNormalFFE, "is ffe a normal elm of the ext. field ",
[IsUnivariatePolynomial, IsRingElement], function( f, elm)
local K;
	K  :=  GF(Characteristic(elm));
	return IsNormalFFE(K, f, elm);
end);

#############################################################################
##
#O  IsNormalFFEB( <K>, <f>, <elm> ) . . . .checks if elm is a normal elm of f.f.
##
InstallMethod( IsNormalFFEB, "is ffe a normal elm of the ext. field ",
[IsField,IsUnivariatePolynomial, IsRingElement], function(K, f, elm)
local  F,  test, conj;
		F  := FieldExtension(K,  f);
		conj := Conjugates(F, elm);
		test := Basis(F, conj); # returns fail if conj not lin indep.
		if test = fail then
				return false;
		else 	return true;
		fi;
end);

#############################################################################
##
#O  IsNormalFFEB( <F>, <elm> ) . . . .checks if elm is a normal elm of f.f.
##
InstallMethod( IsNormalFFEB, "is ffe a normal elm of the ext. field ",
[IsField,IsRingElement], function(F, elm)
local K;
	K  :=  GF(Characteristic(elm));
	return IsNormalFFEB(K, DefiningPolynomial(F),elm);
end);

#############################################################################
##
#O  IsNormalFFEB( <f>, <elm> ) . . . .checks if elm is a normal elm of f.f.
##
InstallMethod( IsNormalFFEB, "is ffe a normal elm of the ext. field ",
[IsUnivariatePolynomial, IsRingElement], function( f, elm)
local K;
	K  :=  GF(Characteristic(elm));
	return IsNormalFFEB(K, f,elm);
end);

#############################################################################
##
#O  MultiplicationTableT( <B> ) . . . . . . . . checks if an ONB type II exists for GF(q^m)
##

InstallMethod(MultiplicationTableT, "multiplicatioin matrix T for basis B",
[IsBasis], function(B)
return TransposedMat(MatrixMultByConst(B, B[1]));
### should be same at MatrixMi(B, 1) ????
end);

InstallMethod(ComplexityOfT, "returns the number of nonzero entries",
[IsBasis], function(B)
local HW ;
HW := WeightMatrixBoth(MultiplicationTableT(B));
# with max rowHW= HW[1],  and matrix HW=HW[2]
return HW[2];
end);


Print("nb.gi OK,\t");
#E  nb.gi  . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
