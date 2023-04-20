#############################################################################
##
##
#W  nb.gi           The FFCSA Package                Nusa
##
# some searches below do NOT call IsNormalFFE to save time !!!!

#############################################################################
##
#O  FindNormalFFEs( <f> ) . . . . . . . . finds all normal elements in a f.f.
##
InstallMethod( FindNormalFFEs,
"finds normal elements in a f.f.", [IsField],  function(F)
local g, i, z, pwrlist, theoretical;

	g := GeneratorOfField(F);
	pwrlist  :=  [];

	#and now for each element
		for i in [1..Size(F)-1] do
			z  :=  g^(i);
			if IsNormalFFE(F,z) then
				Add(pwrlist,  i);
			fi;
		od;

	theoretical := NrNormalFFE(PrimeField(F),DegreeOverPrimeField(F));
	if theoretical  <> Length(pwrlist) then
		Print("Something went wrong, i should have found ",theoretical );
		Print(" noremal elements, but have found found " ,Length(pwrlist));
		Print(" :\n",pwrlist ,"\n");
	fi;

	return  pwrlist;
end);

########### NC method ###########
InstallMethod( FindNormalFFEsNC,
"finds normal elements in a f.f.", [IsField],  function(F)
local g, i, z, pwrlist;

	g := GeneratorOfField(F);
	pwrlist  :=  [];

	#and now for each element
		for i in [1..Size(F)-1] do
			z  :=  g^(i);
			if IsNormalFFE(F,z) then
				Add(pwrlist,  i);
			fi;
		od;

	return  pwrlist;
end);

########### trick using GAP call Basis ###########
InstallMethod( FindNormalFFEsB, " finds normal elements in a f.f.",
[IsField],  function(F)
local nd, g, test, pwrlist,  conj,  y,  j,   z, theoretical;

	nd := Size(F)-1;
	g := GeneratorOfField(F);

	pwrlist  :=  [];

		#and now for each element (faster than calling IsNormalFFEB)
		for j in [1..nd] do
			z  :=  g^(j);
			conj := Conjugates(F,z);
			test := Basis(F, conj);
			# add to list of normal elms
			if test<>fail then
				Add(pwrlist,  j);
			fi;
		od;

	theoretical := NrNormalFFE(PrimeField(F),DegreeOverPrimeField(F));
	if theoretical  <> Length(pwrlist) then
		Print("Something went wrong, i should have found ",theoretical );
		Print(" noremal elements, but have found found " ,Length(pwrlist));
		Print(" :\n",pwrlist ,"\n");
	fi;

	return  pwrlist;
end);

########### NC method ###########
InstallMethod( FindNormalFFEsBNC, " finds normal elements in a f.f.",
[IsField],  function(F)
local  nd, g, test, pwrlist,  conj,  y,  j,   z;

	nd := Size(F)-1;
	g := GeneratorOfField(F);

	pwrlist  :=  [];

		#and now for each element
		for j in [1..nd] do
			z  :=  g^(j);
			conj := Conjugates(F,z);
			test := Basis(F, conj);
			# add to list of normal elms
			if test<>fail then
				Add(pwrlist,  j);
			fi;
		od;

	return  pwrlist;
end);

#############################################################################
##
## IgnoreConjugates methods
InstallMethod( FindNormalFFEsIgnoreConjugates,
" finds normal elements in a f.f., skipping their conjugates",
[IsField],  function(F)

	local   g, cons, pwrlist, i, z, theoretical;

	g := GeneratorOfField(F);
	#cons := CCLeaders(Characteristic(F), DegreeOverPrimeField(F));
	cons := CCLeaders(Size(LeftActingDomain(F)), Dimension(F));
	pwrlist  :=  [];

	#and now for each element
		for i in [1..Length(cons)] do
			z  :=  g^(cons[i]);
			if IsNormalFFE(F,z) then
				Add(pwrlist,  cons[i]);
			fi;
		od;

	theoretical:=NrNormalFFEIgnoreConjugates(PrimeField(F),DegreeOverPrimeField(F));
	if theoretical  <> Length(pwrlist) then
		Print("Something went wrong, i should have found ",theoretical );
		Print(" noremal elements, but have found found " ,Length(pwrlist));
		Print(" :\n",pwrlist ,"\n");
	fi;

	return  pwrlist;
end);

########### NC method ###########
InstallMethod( FindNormalFFEsIgnoreConjugatesNC,
" finds normal elements in a f.f., skipping their conjugates",
[IsField],  function(F)
local   g, cons, pwrlist, i, z;

	g := GeneratorOfField(F);
	#cons := CCLeaders(Characteristic(F), DegreeOverPrimeField(F));# doesnt work for tower
	cons := CCLeaders(Size(LeftActingDomain(F)), Dimension(F));
	pwrlist  :=  [];

	#and now for each element
		for i in [1..Length(cons)] do
			z  :=  g^(cons[i]);
			if IsNormalFFE(F,z) then
				Add(pwrlist,  cons[i]);
			fi;
		od;

	return  pwrlist;
end);

# basis methods are REALLY fast !!!
#############################################################################
##
## trick using GAP call Basis

InstallMethod( FindNormalFFEsBIgnoreConjugates,
" finds normal elements in a f.f., skipping their conjugates",
[IsField],  function(F)
local   g, cons, pwr, test, pwrlist,  conj,  j,   z, theoretical;

	#cons := CCLeaders(Characteristic(F), DegreeOverPrimeField(F));
	cons := CCLeaders(Size(LeftActingDomain(F)), Dimension(F));
	g := GeneratorOfField(F);
	pwrlist  :=  [];

		#and now for each element (obtained with coset leaders)
		for j in [1..Length(cons)] do
			pwr := cons[j];
			z  :=  g^pwr;
			if IsNormalFFEB(F, z) then
			 	Add(pwrlist,  pwr);
			# 	Print("added ",pwr,"\t");
			fi;

		od;

	theoretical:=NrNormalFFEIgnoreConjugates(PrimeField(F),DegreeOverPrimeField(F));
	if theoretical  <> Length(pwrlist) then
		Print("Something went wrong, i should have found ",theoretical );
		Print(" noremal elements, but have found found " ,Length(pwrlist));
		Print(" :\n",pwrlist ,"\n");
	fi;

	return pwrlist;
end);

########### NC method ###########
InstallMethod( FindNormalFFEsBIgnoreConjugatesNC,
" finds normal elements in a f.f., skipping their conjugates",
[IsField],  function(F)
local   g, cons, pwr, test, pwrlist,  conj,  j,   z;

	#cons := CCLeaders(Characteristic(F), DegreeOverPrimeField(F));
	cons := CCLeaders(Size(LeftActingDomain(F)), Dimension(F));
	g := GeneratorOfField(F);
	pwrlist  :=  [];

	#and now for each element (obtained with coset leaders)
	for j in [1..Length(cons)] do
		pwr := cons[j];
		z  :=  g^pwr;
		if IsNormalFFEB(F, z) then
		 	Add(pwrlist,  pwr);
		# 	Print("added ",pwr,"\t");
		fi;

	od;

	return pwrlist;
end);

Print("findElm.gi OK,\t");
#E  findElm.gi  . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
