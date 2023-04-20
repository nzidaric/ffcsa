#############################################################################
##
##
#W  algs.gi           The FFCSA Package                Nusa
##
##  Installation file
##


#avec := []; bvec :=[];

#############################################################################
##
#F  ChooseField( <F> )
##
##  choose the underlying finite field for the
##  needed to create the indeterminates !!!!
##  :(
## ugly, take a second look at it !!!!
##

IndTos := 2000;
IndDowntos := 3000;
MaxLenOld:= 100;

InstallGlobalFunction( UnbindGlobalOld, function()
    local a, b, i , stra, strb,  alist, blist, MaxLen, avec, bvec, d, strd, dlist, dvec ;

		if IsBoundGlobal("a") then
			UnbindGlobal("a");
		fi;
		if IsBoundGlobal("b") then
			UnbindGlobal("b");
		fi;

		if IsBoundGlobal("alist") then
			UnbindGlobal("alist");
		fi;
		if IsBoundGlobal("avec") then
			UnbindGlobal("avec");
		fi;

		for i in [1..MaxLenOld] do
			stra :=  Concatenation("a_",String(i-1));
			if IsBoundGlobal(stra) then
#				Print("unbinding: ",stra," \n");
				UnbindGlobal(stra);
			fi;
			stra :=  Concatenation("a_",String(MaxLenOld -(i-1)));
			if IsBoundGlobal(stra) then
#				Print("unbinding: ",stra," \n");
				UnbindGlobal(stra);
			fi;
		od;

		if IsBoundGlobal("blist") then
			UnbindGlobal("blist");
		fi;
		if IsBoundGlobal("bvec") then
			UnbindGlobal("bvec");
		fi;

		for i in [1..MaxLenOld] do
			strb :=  Concatenation("b_",String(i-1));
			if IsBoundGlobal(strb) then
#				Print("unbinding: ",strb," \n");
				UnbindGlobal(strb);
			fi;
			strb :=  Concatenation("b_",String(MaxLenOld-(i-1)));
			if IsBoundGlobal(strb) then
#				Print("unbinding: ",strb," \n");
				UnbindGlobal(strb);
			fi;


		od;


	if IsBoundGlobal("d") then
			UnbindGlobal("d");
		fi;
		if IsBoundGlobal("dlist") then
			UnbindGlobal("dlist");
		fi;
		if IsBoundGlobal("dvec") then
			UnbindGlobal("dvec");
		fi;
	for i in [1..2*MaxLenOld] do
			strd :=  Concatenation("d_",String(i-1));
			if IsBoundGlobal(strd) then
#				Print("unbinding: ",strd," \n");
				UnbindGlobal(strd);
			fi;
			strb :=  Concatenation("d_",String(2*MaxLenOld-(i-1)));
			if IsBoundGlobal(strd) then
#				Print("unbinding: ",strd," \n");
				UnbindGlobal(strd);
			fi;


		od;
return;
end );


InstallGlobalFunction( ChooseFieldElms, function( F )
    local a, b, i , stra, strb,  alist, blist, MaxLen, avec, bvec, d , dlist, dvec, strd ;

	if(IsField(F)) then

		 UnbindGlobalOld();


		a := X(F, "a");		b := X(F, "b");
			BindGlobal("a" ,  a); 	MakeReadWriteGlobal("a");
			BindGlobal("b" ,  b);		MakeReadWriteGlobal("b");
#		MaxLen := DegreeOverPrimeField(F);
		MaxLen := Dimension(F);
		alist := []; avec:=[];



	 for i in [1..MaxLen] do
			stra :=  Concatenation("a_",String(i-1));

#			Print("binding: ",stra," \n");
				SetIndeterminateName(FamilyObj(a), IndTos+(i-1), stra);
				BindGlobal(stra,Indeterminate(F, IndTos+(i-1)));
				MakeReadWriteGlobal(stra);

			Add(alist, stra );
			Add(avec,Indeterminate(F, IndTos+(i-1)));
		od;
#				Print("binding alist and avec \n");
			BindGlobal("alist" , alist);
			BindGlobal("avec" , avec);
				MakeReadWriteGlobal("alist");
				MakeReadWriteGlobal("avec");

		blist := []; bvec:=[];


		for i in [1..MaxLen] do
			strb :=  Concatenation("b_",String(i-1));

#				Print("binding: ",strb," \n");
				SetIndeterminateName(FamilyObj(b),  IndTos+MaxLenOld+(i-1), strb);
				BindGlobal(strb,Indeterminate(F, IndTos+MaxLenOld+(i-1)));
				MakeReadWriteGlobal(strb);

			Add(blist, strb );
			Add(bvec,Indeterminate(F, IndTos+MaxLenOld+(i-1)));
		od;
#				Print("binding blist and bvec \n");
			BindGlobal("blist" , blist);
			BindGlobal("bvec" , bvec);
				MakeReadWriteGlobal("blist");
				MakeReadWriteGlobal("bvec");


		d := X(F,"d");
		BindGlobal("d" ,  d); 	MakeReadWriteGlobal("d");
		dlist := []; 	dvec:=[];


		for i in [1..2*MaxLen-1] do
			strd :=  Concatenation("d_",String(i-1));

#				Print("binding: ",strd," \n");
				SetIndeterminateName(FamilyObj(d),  IndTos+2*MaxLenOld+(i-1), strd);
				BindGlobal(strd,Indeterminate(F, IndTos+2*MaxLenOld+(i-1)));
				MakeReadWriteGlobal(strd);

			Add(dlist, strd );
			Add(dvec,Indeterminate(F, IndTos+2*MaxLenOld+(i-1)));
		od;
#				Print("binding dlist and dvec \n");
			BindGlobal("dlist" , dlist);
			BindGlobal("dvec" , dvec);
				MakeReadWriteGlobal("dlist");
				MakeReadWriteGlobal("dvec");


Print("\nvariables" );
Print("\n", alist );
Print("\n", blist);
Print("\n", dlist, "\n");
	else
	    Error("F is not a field !!!! \n");
	  fi;
return;
end );


InstallGlobalFunction( ChooseFieldElmsDownto, function( F )
    local a, b, i , stra, strb,  alist, blist, MaxLen, avec, bvec , d, strd, dlist, dvec;

	if(IsField(F)) then

		 UnbindGlobalOld();


		a := X(F, "a");		b := X(F, "b");
    #		MaxLen := DegreeOverPrimeField(F);
    		MaxLen := Dimension(F);
		alist := []; avec:=[];

	 for i in [1..MaxLen] do
			stra :=  Concatenation("a_",String(MaxLen-(i)));

#			Print("binding: ",stra," \n");
				SetIndeterminateName(FamilyObj(a), IndDowntos+(MaxLen-i), stra);
				BindGlobal(stra,Indeterminate(F, IndDowntos+(MaxLen-i)));
				MakeReadWriteGlobal(stra);

			Add(alist, stra );
			Add(avec,Indeterminate(F, IndDowntos+(MaxLen-i)));
		od;
#				Print("binding alist and avec \n");
			BindGlobal("alist" , alist);
			BindGlobal("avec" , avec);
				MakeReadWriteGlobal("alist");
				MakeReadWriteGlobal("avec");

		blist := []; bvec:=[];


		for i in [1..MaxLen] do
			strb :=  Concatenation("b_",String(MaxLen-(i)));

#				Print("binding: ",strb," \n");
				SetIndeterminateName(FamilyObj(b), IndDowntos+MaxLenOld+(MaxLen-i), strb);
				BindGlobal(strb,Indeterminate(F, IndDowntos+MaxLenOld+(MaxLen-i)));
				MakeReadWriteGlobal(strb);

			Add(blist, strb );
			Add(bvec,Indeterminate(F, IndDowntos+MaxLenOld+(MaxLen-i)));
		od;
#				Print("binding blist and bvec \n");
			BindGlobal("blist" , blist);
			BindGlobal("bvec" , bvec);
				MakeReadWriteGlobal("blist");
				MakeReadWriteGlobal("bvec");

		d := X(F,"d");
		BindGlobal("d" ,  d); 	MakeReadWriteGlobal("d");
		dlist := []; 	dvec:=[];


		for i in [1..2*MaxLen-1] do
			strd :=  Concatenation("d_",String(2*MaxLen - i - 1));

#				Print("binding: ",strd," \n");
				SetIndeterminateName(FamilyObj(d),  IndDowntos+2*MaxLenOld+(2*MaxLen - i - 1 ), strd);
				BindGlobal(strd,Indeterminate(F, IndDowntos+2*MaxLenOld+(2*MaxLen - i - 1 )));
				MakeReadWriteGlobal(strd);

			Add(dlist, strd );
			Add(dvec,Indeterminate(F, IndTos+2*MaxLenOld+(2*MaxLen - i - 1)));
		od;
#				Print("binding dlist and dvec \n");
			BindGlobal("dlist" , dlist);
			BindGlobal("dvec" , dvec);
				MakeReadWriteGlobal("dlist");
				MakeReadWriteGlobal("dvec");


Print("\nvariables" );
Print("\n", alist );
Print("\n", blist);
Print("\n", dlist, "\n");


	else
	    Error("F is not a field !!!! \n");
	  fi;
return;
end );

ChooseFieldElms(GF(2^10));

#############################################################################
##
#  SLL( <vec>, <pos> )
##
InstallMethod(SLL, "Shift Left Logical", [IsVector, IsInt], function(vec, pos)

local new, i, m;

m := Length(vec);
if pos<0 or pos>m then
	Error("pos is out of range!\n ");
fi;

new :=[];
for i in [1.. m-pos] do
	new[i] := vec[i+pos];
od;

for i in [m-pos+1..m] do
	new[i] := Zero(GF(2));
od;

return new;
end);

#############################################################################
##
#  SLL( <vec>, <pos> )
##
#InstallMethod(SLL, "Shift Left Logical", [IsVector, IsInt], function(vec, pos)
InstallMethod(SLL, "Shift Left Logical", [IsList, IsInt], function(vec, pos)
local new, i, m;

m := Length(vec);
if pos<0 or pos>m then
	Error("pos is out of range!\n ");
fi;

new :=[];
for i in [1.. m-pos] do
	new[i] := vec[i+pos];
od;

for i in [m-pos+1..m] do
	new[i] := 0;
od;

return new;
end);


#############################################################################
##
#  SRL( <vec>, <pos> )
##
InstallMethod(SRL, "Shift Left Logical", [IsVector, IsInt], function(vec, pos)
#InstallMethod(SRL, "Shift Left Logical", [IsList, IsInt], function(vec, pos)
local new, i, m;

m := Length(vec);
if pos<0 or pos>m then
	Error("pos is out of range!\n ");
fi;

new :=[];
for i in [1.. pos] do
	new[i] := Zero(GF(2));
od;

for i in [pos+1..m] do
	new[i] := vec[i-pos];
od;

return new;
end);


#############################################################################
##
#  SRL( <vec>, <pos> )
##
#InstallMethod(SRL, "Shift Left Logical", [IsVector, IsInt], function(vec, pos)
InstallMethod(SRL, "Shift Left Logical", [IsList, IsInt], function(vec, pos)
local new, i, m;

m := Length(vec);
if pos<0 or pos>m then
	Error("pos is out of range!\n ");
fi;

new :=[];
for i in [1.. pos] do
	new[i] := 0;
od;

for i in [pos+1..m] do
	new[i] := vec[i-pos];
od;

return new;
end);



#############################################################################
##
#  SLA( <vec>, <pos> )
##
#InstallMethod(SLA, "Shift Left Arithmetic", [IsVector, IsInt], function(vec, pos)
InstallMethod(SLA, "Shift Left Arithmetic", [IsList, IsInt], function(vec, pos)
local new, i, m;

m := Length(vec);
if pos<0 or pos>m then
	Error("pos is out of range!\n ");
fi;

new :=[];
for i in [1.. m-pos] do
	new[i] := vec[i+pos];
od;

for i in [m-pos+1..m] do
	new[i] := vec[m];
od;

return new;
end);


#############################################################################
##
#  SRA( <vec>, <pos> )
##
#InstallMethod(SRA, "Shift Right Arithmetic", [IsVector, IsInt], function(vec, pos)
InstallMethod(SRA, "Shift Right Arithmetic", [IsList, IsInt], function(vec, pos)
local new, i, m;

m := Length(vec);
if pos<0 or pos>m then
	Error("pos is out of range!\n ");
fi;

new :=[];
for i in [1.. pos] do
	new[i] := vec[1];
od;

for i in [pos+1..m] do
	new[i] := vec[i-pos];
od;

return new;
end);



#############################################################################
##
#  ROL( <vec>, <pos> )
##
#InstallMethod(ROL, "Rotate left", [IsVector, IsInt], function(vec, pos)
InstallMethod(ROL, "Rotate left", [IsList, IsInt], function(vec, pos)
local new, i, m;

m := Length(vec);
if pos<0 or pos>m then
	Error("pos is out of range!\n ");
fi;

new :=[];
for i in [1.. m-pos] do
	new[i] := vec[i+pos];
od;

for i in [m-pos+1..m] do
	new[i] := vec[i-(m-pos)];
od;

return new;
end);


#############################################################################
##
#  ROR( <vec>, <pos> )
##
#InstallMethod(ROR, "Rotate right", [IsVector, IsInt], function(vec, pos)
InstallMethod(ROR, "Rotate right", [IsList, IsInt], function(vec, pos)
local new, i, m;

m := Length(vec);
if pos<0 or pos>m then
	Error("pos is out of range!\n ");
fi;

new :=[];
for i in [1.. pos] do
	new[i] := vec[m-(pos-i)];
od;

for i in [pos+1..m] do
	new[i] := vec[i-pos];
od;

return new;
end);

##################################################
# as function because if dont want type check here
# bit \in F_2 --> will work correct
# if i would have type check then make it IsRingElementCollection
# will we ever feed in extension field elms and try bitwise AND ?
# because now it just multiplies them :D

InstallGlobalFunction( ANDbw, function(vecx1, vecx2)
local newvec, i;

if Length(vecx1) <> Length(vecx2) then
	Error("the two vectors must be of same length !\n");
	return fail;
fi;

newvec := [];
for i in [1..Length(vecx1)] do
	newvec[i] := vecx1[i] * vecx2[i];
od;

return newvec;
end);

##################################################

InstallGlobalFunction( XORbw, function(vecx1, vecx2)
local newvec, i;

if Length(vecx1) <> Length(vecx2) then
	Error("the two vectors must be of same length !\n");
	return fail;
fi;

newvec := [];
for i in [1..Length(vecx1)] do
	newvec[i] := vecx1[i] + vecx2[i];
od;

return newvec;
end);


## note absolute trace, maybe rethink the name ?
InstallMethod( FFA_trace_PB, "2 step classic multiplication for PB",
[  IsUnivariatePolynomial, IsString], function(f, dir)
local trace, F, w, PB, DB ;
	if not (\in(dir,validBasisDirections )) then
		Error( "basis direction ",dir,"! must be one of ",validBasisDirections ,"\n" );
		return fail;
	fi;

  F:=FieldExtension(GF(2),f);   	w := RootOfDefiningPolynomial(F);

  if dir = "to" then
    ChooseFieldElms(F);;
  	PB := GeneratePB(F, w);
  else
    ChooseFieldElmsDownto(F);;
    Error("check if correct for downto!!!"); return fail;
  fi;
  DB := GenerateDBtoPB(F, w);
  if  IsDualBasisPair(PB,DB) then
#		Print("PB = ",BasisVectors(PB),"\n");
#		Print("DB = ",BasisVectors(DB),"\n");
    trace := Coefficients(DB, One(F)) * avec;
#		Print(Coefficients(DB, One(F)), "\n");
  fi;

return trace;
end);

Print("algs.gi OK,\t");

#E  algs.gi  . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
