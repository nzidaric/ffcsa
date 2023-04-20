#############################################################################
##
##
#W  nb.gi           The FFC Package                Nusa
##
##  Installation file
##
# the searches below do NOT call IsNormalFFE or ProfileNBGenerators
# to save time !!!!

#############################################################################
##
#O  FindONBIGenerator( <f> ) . . . . . . .
#  profiling phase
InstallMethod( FindONBIGenerator,
" finds ONBI normal element  in a f.f., skipping  conjugates",
[IsField],  function(F)
local   m, cn, g, nelist, pwrlist, i, ne, B, hw;
	if not IsONBI(F) then
		Error(F, " does not have ONBI!!!\n");
		return fail;
	fi;

	m := DegreeOverPrimeField(F);
	cn := 2*m -1;
	g := GeneratorOfField(F);

	nelist := FindNormalFFEsIgnoreConjugates(F);
	pwrlist :=[];

	for i in [1..Length(nelist)] do
		ne := g^nelist[i];
		B := GenerateNB(F, ne);
		hw := ComplexityOfT(B);

		if hw = cn then
			Add(pwrlist, nelist[i]);
			break;
		fi;
	od;
	return  g^pwrlist[1];  # there should be just one of em
end);

InstallMethod( FindONBIGeneratorB,
" finds ONBI normal elements in a f.f., skipping their conjugates",
[IsField],  function(F)
local   m, cn, g, nelist, pwrlist, i, ne, B, hw;
	if not IsONBI(F) then
		Error(F, " does not have ONBI!!!\n");
		return fail;
	fi;

	m := DegreeOverPrimeField(F);
	cn := 2*m -1;
	g := GeneratorOfField(F);

	nelist := FindNormalFFEsBIgnoreConjugates(F);
	pwrlist :=[];

	for i in [1..Length(nelist)] do
		ne := g^nelist[i];
		B := GenerateNB(F, ne);
		hw := ComplexityOfT(B);

		if hw = cn then
			Add(pwrlist, nelist[i]);
		fi;
	od;
	return   g^pwrlist[1];  # there should be just one of em
end);

#############################################################################
##
#O  FindONBIIGenerator( <F> ) . . . . . . . . finds all normal elements in a f.f.
#  profiling phase
InstallMethod( FindONBIIGenerator,
" finds ONBII normal elements in a f.f., skipping their conjugates",
[IsField],  function(F)
local   m, cn, g, nelist, pwrlist, i, ne, B, hw;

	if not IsONBII(F) then
		Error(F, " does not have ONBII!!!\n");
		return fail;
	fi;

	m := DegreeOverPrimeField(F);
	cn := 2*m -1;
	g := GeneratorOfField(F);


	nelist := FindNormalFFEsIgnoreConjugates(F);
	pwrlist :=[];

	for i in [1..Length(nelist)] do
		ne := g^nelist[i];
		B := GenerateNB(F, ne);
		hw := ComplexityOfT(B);

		if hw = cn then
			Add(pwrlist, nelist[i]);
		fi;
	od;
	return   g^pwrlist[1];  # there should be just one of em
end);

InstallMethod( FindONBIIGeneratorB,
" finds ONBII normal elements in a f.f., skipping their conjugates",
[IsField],  function(F)
local   m, cn, g, nelist, pwrlist, i, ne, B, hw;

	if not IsONBII(F) then
		Error(F, " does not have ONBII!!!\n");
		return fail;
	fi;

	m := DegreeOverPrimeField(F);
	cn := 2*m -1;
	g := GeneratorOfField(F);

	nelist := FindNormalFFEsBIgnoreConjugates(F);
	pwrlist :=[];

	for i in [1..Length(nelist)] do
		ne := g^nelist[i];
		B := GenerateNB(F, ne);
		hw := ComplexityOfT(B);

		if hw = cn then
			Add(pwrlist, nelist[i]);
		fi;
	od;
	return   g^pwrlist[1];  # there should be just one of em
end);

#############################################################################
##
#O  FindONBIGenerator( <f>) . . . . . . . . finds all normal elements in a f.f.
#  profiling phase
InstallMethod( ProfileNBGenerators,
"profiling phase for  normal FFEs ",  [IsField] , function(F)
local    g, nelist, pwr,  i, ne, B, hw, profile, prof;
	g := GeneratorOfField(F);
	profile := [];
	nelist := FindNormalFFEsBIgnoreConjugates(F);
	for i in [1..Length(nelist)] do
		pwr := nelist[i];
		ne := g^pwr;
		B := GenerateNB(F, ne);
		hw := ComplexityOfT(B);
		prof := [pwr, hw];
		Add(profile, prof);
	od;
	return  profile;
end);

InstallMethod( FindBestTNBGeneratorProfile,
"profiling phase for  normal FFEs ",  [IsField] , function(F)
local  profile, min, best;
	profile := ProfileNBGenerators(F);
	Sort( profile, function(v,w) return v[2] < w[2]; end );
 	min := profile[1][2]; # min complexity
	best := Filtered(profile, x -> x[2] = min);
	Sort( best, function(v,w) return v[1] < w[1]; end );
	return best[1];
end);

InstallMethod( FindSmallestTNBGenerator,
"profiling phase for  normal FFEs ",  [IsField] , function(F)
local g, best;
	g := GeneratorOfField(F);
	best := FindBestTNBGeneratorProfile(F);
	return g^best[1];
end);

#############################################################################
##
#O  ProfileNBtoBTransitionMat <B>.) . . .
#  profiling phase
# assume: conjugates will give same HW matrices, just shifted !!!

#InstallMethod( FindNormalFFETransitionMatProfile, #remnamed
InstallMethod( ProfileNBtoBTransitionMat,
"profiling phase for  normal FFEs and their transition matrices",
 [IsBasis] , function(B)
local F, g, m, pwr, z, i, j, T1, T2, profilelist, memberlist, masterlist,
NB, hws1, hws2, hws, profile, pwrlist , members, master, p, v, w;
	F := UnderlyingLeftModule(B);
	m := DegreeOverPrimeField(F);
	g := GeneratorOfField(F);
	#ccleaders := CCLeaders(Characteristic(F), m);
 	pwrlist := FindNormalFFEsBIgnoreConjugates(F); #already using ccleaders

	profilelist := [];
	memberlist := [];
	masterlist := [];
	for i in [1..Length(pwrlist )] do
		pwr := pwrlist[i];
		z  := g^pwr;

		NB := GenerateNB(F, z);
		T1 := TransitionMatrix(NB, B);
		T2 := Inverse(T1);

		hws1 := 	WeightMatrixBoth(T1);
		hws2 := 	WeightMatrixBoth(T2);
 		hws := [ hws1[1], hws1[2], hws2[1], hws2[2]];

		if IsEmpty(profilelist)  then
			Add(profilelist, hws);
			Add(memberlist, [pwr]);
		else
			# find the position with same hws and
			# do not modify the profilelist:
			# add pwr to the sublist at that position in memberlist
			if Position(profilelist,hws)=fail then
				Add(profilelist, hws);
				Add(memberlist, [pwr]);
			else
				p :=  Position(profilelist,hws);
				members := Remove(memberlist, p);
				Add(members,pwr);
				Add(memberlist, members, p);
			fi;
		fi;
	od;
#### TODO: how do we want to sort anyways - what is most commonly used?
	for i in [1 .. Length(profilelist)] do
		master := [profilelist[i][1] , profilelist[i][2], profilelist[i][3], profilelist[i][4]];
		members := memberlist[i];
		Sort(members,function(v,w) return v < w; end );
		for j in [1.. Length(members)] do
					Add(master, members[j]);
		od;
		masterlist[i] := master;
	od;
return masterlist;
end);

#############################################################################
##
#O  FindSmallestAreaNBtoBProfile( <B>.) . . .
# area first , delay second
#InstallMethod( FindNormalFFEBestTransitionMatA, #remnamed
InstallMethod( FindSmallestAreaNBtoBProfile,
"finds the normal FFE that yields best AREA transition matrices",
 [IsBasis] , function(B)
local list1, list2, min1, min2, l1, l2, x, v, w;
	list1 := ProfileNBtoBTransitionMat(B);
	list2 := ShallowCopy(list1);
	#sort list1 by area(T1)
	Sort( list1, function(v,w) return v[3] < w[3]; end );
	#sort list2 by area(T2)
	Sort( list2, function(v,w) return v[5] < w[5]; end );

	min1 := list1[1][3]; # min area(T1)
	min2 := list2[1][5]; # min area(T2)

	if min1< min2 then
		l1 := Filtered(list1, x -> x[3] = min1 and x[5]= min2);
	 	l2 := Filtered(list1, x -> x[3] = min1 );
	else
	 	l1 := Filtered(list2, x -> x[3] = min1 and x[5]= min2);
	 	l2 := Filtered(list2, x -> x[5] = min2 );
	fi;
  if  Length(l1) = 1 then
 			return l1[1]; # RETURN THIS
  elif Length(l1) > 1 then
	 	Sort( l1, function(v,w) return v[2] < w[2]; end );
	 	min1 := l1[1][2]; # min delay(T1)
	 	Sort( l1, function(v,w) return v[4] < w[4]; end );
	 	min2 := l1[1][4]; # min delay(T1)

		 l1 := Filtered(l1, x -> x[2] = min1 and x[4]= min2);
		 if Length(l1) > 0 then
				# sort by power and return
			 	Sort( l1, function(v,w) return v[1] < w[1]; end );
				return  l1[1]; # RETURN THIS
		 else
				l1 := Filtered(l1, x -> x[2] = min1 and v[5] < w[5]);
			 	return l1[1]; # RETURN THIS
		 fi;
	else
	 	min1 := l2[1][3]; # min area(T1)
	 	Sort( l2, function(v,w) return v[5] < w[5]; end );
	 	min2 := l2[1][5]; # min area(T1)
		l2 := Filtered(l2, x -> x[3] = min1 and x[5]= min2);

		Sort( l2, function(v,w) return v[2] < w[2]; end );
		min1 := l2[1][2]; # min delay(T1)
		Sort( l2, function(v,w) return v[4] < w[4]; end );
		min2 := l2[1][4]; # min delay(T1)

		l2 := Filtered(l2, x -> x[2] = min1 and x[4]= min2);
		if Length(l2) > 0 then
			# sort by power and return
		 	Sort( l2, function(v,w) return v[1] < w[1]; end );
			return l2[1]; # RETURN THIS
		else
			l2 := Filtered(l2, x -> x[2] = min1 and v[5] < w[5]);
		 	return l2[1]; # RETURN THIS
		fi;
	fi;
end);

##############################################################################
###TODO !!!!
##O  FindSmallestDelayNBtoBProfile( <B>.) . . .
## delay first , area second


#############################################################################
##
#O  ProfileGamma <B>.) . . .
#  profiling phase
##
#InstallMethod( FindGammaProfile, #renamed
InstallMethod( ProfileGamma,
"profiling phase for constants and their matrix-vector multipliers",
 [IsBasis] , function(B)
local F, g, ccleaders, profilelist, memberlist, i, j, gamma,
G, hws, p, members, masterlist, master, v, w;
	F := UnderlyingLeftModule(B);
	g := GeneratorOfField(F);
	ccleaders := CCLeaders(Characteristic(F), DegreeOverPrimeField(F));
	profilelist := [];
	memberlist := [];
	masterlist := [];
	for i in [2..Length(ccleaders)] do
		gamma := g^ccleaders[i];
		G := MatrixMultByConst(B,gamma);
		hws := 	WeightMatrixBoth(G);
		#add to lists
		if IsEmpty(profilelist)  then
			Add(profilelist, hws);
			Add(memberlist, [ccleaders[i]]);
		else
			# find the position with same hws and
			# do not modify the profilelist
			# but add ccleaders[i] to the sublist at that position in memberlist
			if Position(profilelist,hws)=fail then
				Add(profilelist, hws);
				Add(memberlist, [ccleaders[i]]);
			else
				p :=  Position(profilelist,hws);
				members := Remove(memberlist, p);
				Add(members,ccleaders[i]);
				Add(memberlist, members, p);
			fi;
		fi;
	od;
	for i in [1 .. Length(profilelist)] do
		master := [profilelist[i][1] , profilelist[i][2]];
		members := memberlist[i];
#		Sort(members,function(v,w) return v < w; end );
		for j in [1.. Length(members)] do
					Add(master, members[j]);
		od;
		masterlist[i] := master;
	od;
return masterlist;
end);

#############################################################################
##
#O  ProfileGamma <B>.) . . .
#  profiling phase
##


InstallMethod( FindSmallestAreaGamma,
"profiling phase for constants and their matrix-vector multipliers",
 [IsBasis] , function(B)
	local  list1, min1, min2, l1, l2, master, power, g, x, v, w;
		g := GeneratorOfField(UnderlyingLeftModule(B));
		list1 := ShallowCopy(ProfileGamma(B));
		#sort  list1 by area
		Sort( list1, function(v,w) return v[2] < w[2]; end );
		min1 := list1[1][2]; # min area
		l1 := Filtered(list1, x -> x[2] = min1);

		#sort  l1 by delay
		Sort( l1, function(v,w) return v[1] < w[1]; end );
		min2 := l1[1][1]; # min delay
		l2 := Filtered(l1, x -> x[1] = min2);

		# now my l2 should have only one master left!!!
		master := l2[1];
		power := master[3]; # is the smallest one coz thats how master members were created
 return g^power;
end);

InstallMethod( FindSmallestDelayGamma,
"profiling phase for constants and their matrix-vector multipliers",
 [IsBasis] , function(B)
local  list1, min1, min2, l1, l2, master, power, g, x, v, w;
		g := GeneratorOfField(UnderlyingLeftModule(B));
		list1 := ShallowCopy(ProfileGamma(B));

		#sort  list1 by delay
		Sort( list1, function(v,w) return v[1] < w[1]; end );
		min1 := list1[1][1]; # min delay
		l1 := Filtered(list1, x -> x[1] = min1);

		#sort  l1 by area
		Sort( l1, function(v,w) return v[2] < w[2]; end );
		min2 := l1[1][2]; # min area
		l2 := Filtered(l1, x -> x[2] = min2);

		# now my l2 should have only one master left!!!
		master := l2[1];
		power := master[3]; # is the smallest one coz thats how master members were created
	return g^power;
end);

Print("findElmSpecial.gi OK,\t");
#E  findElmSpecial.gi . . . . . . . . . . . . . . . . . . . . . . . . ends here
