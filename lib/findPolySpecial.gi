#############################################################################
##
#W  findPolySpecial.gi               TowerFields Package                  Nusa
##
##  Installation file for functions of the TowerFields Package

#############################################################################
##
#F  FindPrimitivePolyFixedTapsList( <output>,  <F>,  <poly> ) . . . . .
##
##return a list of powers for which the poly l(x)=poly+g^pwr  is primitive

InstallGlobalFunction( FindPrimitivePolyFixedTapsList,
 function(output, F, poly, jlist)
local g, s, j, pwrlist, poly1;

	pwrlist := [];
	g := GeneratorOfField(F);
	for j in jlist do
			s := g^j;
			poly1 := poly+s;

			if(IsPrimitivePolynomial(F, poly1)) then
					Add(pwrlist, j);
					AppendTo(output, poly1, "\n");
			fi;

	od;
	Print("Done,  ", Length(pwrlist), " primitive polynomials found !\n");

return pwrlist;
end);

#############################################################################
##
#F  FindPrimitivePolyFixedTaps( <output>,  <F>,  <poly> ) . . . . .
##
##return a list of powers for which the poly l(x)=poly+g^pwr  is primitive
## exhaustive! do ccleaders

InstallGlobalFunction( FindPrimitivePolyFixedTaps,   function(output, F, poly)
local  nd, j, jlist;

# Dimension(F) = deg(extension)=number of base elements
	nd := Size(LeftActingDomain(F))^Dimension(F)-1;

	jlist := [];
	for j in  [1..nd] do
			Add(jlist, j);
	od;

return FindPrimitivePolyFixedTapsList(output, F, poly, jlist);
end);


#############################################################################
##
#F  FindPrimitivePolyFixedTaps( <output>,  <F>,  <poly> ) . . . . .
##
##return a list of powers for which the poly l(x)=poly+g^pwr  is primitive

InstallGlobalFunction( FindPrimitivePolyFixedTapsIgnoreConjugates,
   function(output, F, poly)
local jlist;

#	jlist :=  CCLeaders(Characteristic(F), DegreeOverPrimeField(F));
	jlist :=  CCLeaders(Size(LeftActingDomain(F)), Dimension(F));


return FindPrimitivePolyFixedTapsList(output, F, poly, jlist);
end);

#############################################################################
##
#F  FindPrimitivePolyFixedMinArea( <output>,  <F>,  <poly> , <B>) . . . . . . . . finds all normal elements in a f.f.
##
##return a list of powers for which the poly l(x)=poly+g^pwr  is primitive
## and g^pwr is has min area (same as profiling gamma for area)

InstallGlobalFunction( FindPrimitivePolyFixedMinArea,   function(output, F, poly, B)
local q, g, n, nd, s, j, y,  pwrlist, poly1, Xw, CN, minCN, minRowCN, pmin;
	q := Size(PrimeField(F));

#	n :=  DegreeOverPrimeField(F);
	n :=  Dimension(F);
# deg(poly)=deg(extension)=number of base elements
	nd := q^n-1;
	g := GeneratorOfField(F);


minCN := n*n*2;
minRowCN := n*2;
pmin := 0;
	pwrlist := [];
	for j in [1..nd] do
			s := g^j;
			poly1 := poly+s;

			if(IsPrimitivePolynomial(F, poly1)) then
					Add(pwrlist, j);
				AppendTo(output, poly1, "\twith ");

				Xw := MatrixMultByConst(B, s);
				CN := WeightMatrixBoth(Xw);
				AppendTo(output, "row HW=",CN[1], ", total HW=", CN[2], "\n");

	# area first , delay second
				if (CN[2]< minCN)then
					minRowCN := CN[1];
					minCN := CN[2];
					pmin := j;
				elif (CN[2]=minCN)  and (CN[1]<minRowCN )  then
					minRowCN := CN[1];
					minCN := CN[2];
					pmin := j;
				fi;
			fi;

	od;

		Print("Done,  ", Length(pwrlist), " primitive polynomials found !\n");

return [Length(pwrlist), pmin, minRowCN, minCN];
end);




#############################################################################
##
#F  FindPrimitivePolyFixedMinDelay( <output>,  <F>,  <poly> , <B>) . . . . . . . . finds all normal elements in a f.f.
##
##return a list of powers for which the poly l(x)=poly+g^pwr  is primitive
## and g^pwr is has min area (same as profiling gamma for area)

InstallGlobalFunction( FindPrimitivePolyFixedMinDelay,   function(output, F, poly, B)
local q, g, n, nd, s, j, y,  pwrlist, poly1, Xw, CN, minCN, minRowCN, pmin;
	q := Size(PrimeField(F));

#	n :=  DegreeOverPrimeField(F);
	n :=  Dimension(F);
# deg(poly)=deg(extension)=number of base elements
	nd := q^n-1;
	g := GeneratorOfField(F);


minCN := n*n*2;
minRowCN := n*2;
pmin := 0;
	pwrlist := [];
	for j in [1..nd] do
			s := g^j;
			poly1 := poly+s;

			if(IsPrimitivePolynomial(F, poly1)) then
					Add(pwrlist, j);
				AppendTo(output, poly1, "\twith ");

				Xw := MatrixMultByConst(B, s);
				CN := WeightMatrixBoth(Xw);
				AppendTo(output, "row HW=",CN[1], ", total HW=", CN[2], "\n");

	## delay first , area second
				if (CN[1]<minRowCN ) then
					minRowCN := CN[1];
					minCN := CN[2];
					pmin := j;
				elif (CN[1]=minRowCN)  and (CN[2]< minCN) then
					minRowCN := CN[1];
					minCN := CN[2];
					pmin := j;
				fi;

			fi;

	od;

		Print("Done,  ", Length(pwrlist), " primitive polynomials found !\n");

return [Length(pwrlist), pmin, minRowCN, minCN];
end);


Print("findPolySpecial.gi OK,\t");
#E  search.gi  . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
