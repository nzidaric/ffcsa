#############################################################################
##
##
#W  misc.gi           The FFC Package                Nusa
##
##  Installation file
##

#############################################################################
##
#O  CCLeaders( <p>, <m> ) . . . . . returns coset leaders modulo p^m-1
##

InstallMethod( CCLeaders,  "coset leaders modulo p^m-1", [ IsPosInt, IsPosInt],
function(p, m)

local md, i, dummy, ccllist, d, tmp;

if  not( IsPrime(p) ) then
	Error("Value p must be a prime!!!!\n");
fi;

	md := p^m-1;
	dummy := [];
	ccllist := [0]; # 0 will give element 1 , which is on its own
	for i in [1..md-1] do
		AddSet(dummy,i);
	od;
	while (Length(dummy)>0) do
		d := dummy[1];
		Add(ccllist, d);
		for i in [0 .. m-1] do
			tmp := (d*(p^i)) mod md; #remove the ones originating from d
			RemoveSet(dummy,tmp);
			# its ok for cosets that hold the subfield powers,
			# coz it will not do anything if its not in the set
		od;
	od;

return ccllist;
end);





#############################################################################
##
#O  PolyPhi( K,<n>) . . . . . . . checks if elm is a normal element of the f.f.
##
## based on menezes-ffa book, page 9, Phi for polynomials, FAST:)
## and HandbookFF 2.1.111
## cleaup the mess with the lists !?!
## this is a clumsy clumsy clumsy code ... no time atm

InstallMethod( PolyPhi, " number of normal elements in f.f.",
[IsField,IsUnivariatePolynomial], function(K,f)
local  nr, q, factors, distinct, i, k, pair, ni, ci ;

	q:=Characteristic(K)^DegreeOverPrimeField(K);

	factors := Factors(PolynomialRing(K), f);
	distinct := Collected(factors);	# see if they repeat
#	Print(Degree(f), " => ", distinct);
	k := Length(distinct);	#(if all distinct ill just get k = Length(factors))

	nr := 1;
	for i in [1..k] do
		pair := distinct[i];
		ni := Degree(pair[1]);
		ci := pair[2];				# how many times does factor pair[1] repeat
		nr := nr * (q^(ni*ci)- q^(ni*(ci-1))); 	# property (i) and (iii)
		# if it doesnt repeat ci=1 and this expression reduces to property (ii)
	od;

#	Print( " => ", nr/Degree(f), "\n");
return nr;
end);

#############################################################################
##
#O   NrNormalFFE( K,<n>) . . . . .number of normal elms in f.f. of deg m over K
##

InstallMethod( NrNormalFFE, " number of normal elms in f.f. of deg m over K",
[IsField,IsPosInt], function(K, m)
local x;
	x := X(K, "x");
	return PolyPhi(K, x^m-1);
end);

InstallMethod( NrNormalFFEIgnoreConjugates, " number of normal elements in f.f.",
[IsField,IsPosInt], function(K, m)
local x;
	x := X(K, "x");
	return PolyPhi(K, x^m-1)/m;
end);


#############################################################################
##
#O  NrIrreduciblePoly( K, deg) . . . # of irred. polys of degree m over f.f. K
##
## based on FF handbook, page 15, thm 2.1.24
# works for any deg >= 1 and any q = primepower  --> works for towerfields !!!
# note: this is number of MONIC irred poly !!!!
# if we want all them must multiply with size of multiplicative group

InstallMethod( NrIrreduciblePoly,
" number of irreducible monic polys of degree m over f.f. K",
[IsField,IsPosInt], function(K, deg)
local  nr, q, sum, D, d, i;
	q := Size(K);
	D := DivisorsInt(deg);

	sum := 0;
	for i in [1.. Length(D)] do
		d := D[i];
		sum := sum + MoebiusMu(d)*(q^(deg/d));
	od;

	return sum/deg;
end);

#############################################################################
##
#O  NrPrimitivePoly( K,deg) . . . # of irred. polys of degree m over f.f. K
##
## based on FF handbook, page 87, thm 4.1.3

InstallMethod( NrPrimitivePoly, "number of primitive polys of degree deg over f.f.",
[IsField,IsPosInt], function(K, deg)
	return Phi(Size(K)^deg - 1)/deg;
end);

InstallMethod( NrIrreducibleNotPrimitivePoly,
"number of irreducible but not primitive polys of degree deg over f.f.",
[IsField,IsPosInt], function(K,deg)
	return NrIrreduciblePoly(K, deg) - NrPrimitivePoly(K, deg);
end);

Print("misc.gi OK,\t");
#E  nb.gi  . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
