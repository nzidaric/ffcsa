gap> K := GF(2);; F := GF(2^4);; x:= X(K, "x");; f:= x^4 + x + 1;;
gap> g := GeneratorOfField(F); e := FindNormalFFEs(F)[1]; a := g^e;
Z(2^4)
3
Z(2^4)^3
gap> NB := GenerateNB(F, a);
Basis( GF(2^4), [ Z(2^4)^3, Z(2^4)^6, Z(2^4)^12, Z(2^4)^9 ] )
gap> nx := 0;;
gap> for i in [1..Length(NB)] do   nx := nx + Trace(F, NB[1]*NB[i])*x^(i-1); od;
gap> nx; dx := FindInvCyc(F,nx);
x^3+x+Z(2)^0
x^3+x+Z(2)^0
gap> b := GeneratorOfDBtoNB(F, a);
Z(2^4)^11
gap> DB := GenerateDBtoNB(F, a);
Basis( GF(2^4), [ Z(2^4)^11, Z(2^4)^7, Z(2^4)^14, Z(2^4)^13 ] )
gap> IsDualBasisPair(NB, DB);
true
gap> DB = GenerateNB(F, b);
true
gap> K := GF(2);; x:= X(K, "x");; f:= x^4 + x + 1;;
gap> F := FieldExtension(K, f);;
gap> PB1 := GeneratePB(F, RootOfDefiningPolynomial(F));
Basis( GF(2^4), [ Z(2)^0, Z(2^4), Z(2^4)^2, Z(2^4)^3 ] )
gap> PB2 := GeneratePBdownto(F, RootOfDefiningPolynomial(F));
Basis( GF(2^4), [ Z(2^4)^3, Z(2^4)^2, Z(2^4), Z(2)^0 ] )
gap> DB1 := GenerateDBtoPB(F, RootOfDefiningPolynomial(F));
Basis( GF(2^4), [ Z(2^4)^14, Z(2^4)^2, Z(2^4), Z(2)^0 ] )
gap> DB2 := GenerateDBtoPBdownto(F, RootOfDefiningPolynomial(F));
Basis( GF(2^4), [ Z(2)^0, Z(2^4), Z(2^4)^2, Z(2^4)^14 ] )
gap> IsDualBasisPair(PB1,DB1);
true
gap> IsDualBasisPair(PB2,DB2);
true
gap> IsDualBasisPair(PB1,DB2);
false
gap> IsDualBasisPair(PB2,DB1);
false
gap> FindEDPLAllfromEDL([2]);
[ [ x^2+x+Z(2)^0 ] ]
gap> FindEDPLAllfromRDL([2]);
[ [ x^2+x+Z(2)^0 ] ]
gap> FindEDPLAllfromEDL([2,2]);
[ [ x^2+x+Z(2)^0 ], [ x^2+Z(2^2)*x+Z(2)^0, x^2+Z(2^2)*x+Z(2^2), x^2+x+Z(2^2), x^2+x+Z(2^2)^2, x^2+Z(2^2)^2*x+Z(2)^0, x^2+Z(2^2)^2*x+Z(2^2)^2 ] ]
gap> FindEDPLAllfromRDL([2,4]);
[ [ x^2+x+Z(2)^0 ], [ x^2+Z(2^2)*x+Z(2)^0, x^2+Z(2^2)*x+Z(2^2), x^2+x+Z(2^2), x^2+x+Z(2^2)^2, x^2+Z(2^2)^2*x+Z(2)^0, x^2+Z(2^2)^2*x+Z(2^2)^2 ] ]
gap> K := GF(2);; x:= X(K, "x");;
gap> EDPlist := [ x^2+x+Z(2)^0, x^2+Z(2^2)*x+Z(2)^0, x^2+Z(2^2)*x+Z(2^4) ];
[ x^2+x+Z(2)^0, x^2+Z(2^2)*x+Z(2)^0, x^2+Z(2^2)*x+Z(2^4) ]
gap> Mlist := [["PB", "to"], ["NB", "to"], ["PB", "downto"]];
[ [ "PB", "to" ], [ "NB", "to" ], [ "PB", "downto" ] ]
gap> TFB1 := GenerateTFBfromEDPLwithMB(EDPlist, Mlist);
Basis( GF(2^8), [ Z(2^8)^178, Z(2^8)^8, Z(2^8)^229, Z(2^8)^59, Z(2^4)^6,
Z(2^4)^11, Z(2^4)^9, Z(2^4)^14 ] )
gap> f1 := EDPlist[1];; f2 := EDPlist[2];; f3 := EDPlist[3];;
gap> F1 := FieldExtension(K,  f1);;  lambda := RootOfDefiningPolynomial(F1);
Z(2^2)
gap> F2 := FieldExtension(F1, f2);;  mu := RootOfDefiningPolynomial(F2);
Z(2^4)^6
gap> F3 := FieldExtension(F2, f3);;  nu := RootOfDefiningPolynomial(F3);
Z(2^8)^76
gap> B1 := GeneratePB(F1, lambda);
Basis( GF(2^2), [ Z(2)^0, Z(2^2) ] )
gap> B2 := GenerateNB(F2, mu);
Basis( AsField( GF(2^2), GF(2^4) ), [ Z(2^4)^6, Z(2^4)^9 ] )
gap> B3 := GeneratePBdownto(F3, nu);
Basis( AsField( AsField( GF(2^2), GF(2^4) ), GF(2^8) ), [ Z(2^8)^76, Z(2)^0 ] )
gap> for i in [1..2] do for j in [1..2] do for k in [1..2] do
>   Print(TFB1[4*(i-1)+2*(j-1)+ k], "=" ,  B3[i],"*",B2[j],"*",B1[k], " is ",
> TFB1[4*(i-1)+2*(j-1)+ k] = B3[i]*B2[j]*B1[k], "\n");
> od; od; od;
Z(2^8)^178=Z(2^8)^76*Z(2^4)^6*Z(2)^0 is true
Z(2^8)^8=Z(2^8)^76*Z(2^4)^6*Z(2^2) is true
Z(2^8)^229=Z(2^8)^76*Z(2^4)^9*Z(2)^0 is true
Z(2^8)^59=Z(2^8)^76*Z(2^4)^9*Z(2^2) is true
Z(2^4)^6=Z(2)^0*Z(2^4)^6*Z(2)^0 is true
Z(2^4)^11=Z(2)^0*Z(2^4)^6*Z(2^2) is true
Z(2^4)^9=Z(2)^0*Z(2^4)^9*Z(2)^0 is true
Z(2^4)^14=Z(2)^0*Z(2^4)^9*Z(2^2) is true
gap> lambda*mu*nu=TFB1[2];
true
gap> poly := Z(2)^0;; for i in [1..8] do poly := poly*(x-TFB1[i]); od; poly;
x^8+Z(2^8)^113*x^7+Z(2^4)^14*x^6+Z(2^8)^211*x^5+Z(2^8)^211*x^4+Z(2^8)^117*x^3+Z(2^8)^50*x^2+Z(2^8)^86*x+Z(2^8)^134
gap> K := GF(2);; x:= X(K, "x");;
gap> edpl := [ x^2+x+Z(2)^0, x^2+Z(2^2)*x+Z(2)^0, x^2+Z(2^2)*x+Z(2^4) ];
[ x^2+x+Z(2)^0, x^2+Z(2^2)*x+Z(2)^0, x^2+Z(2^2)*x+Z(2^4) ]
gap> f1 := edpl[1];; f2 := edpl[2];; f3 := edpl[3];;
gap> F1 := FieldExtension(K,  f1);;
gap> F2 := FieldExtension(F1, f2);;
gap> F3 := FieldExtension(F2, f3);;
gap> nu := RootOfDefiningPolynomial(F3);;
gap> B3 := GeneratePB(F3, nu);  ChooseFieldElms(F3);
Basis( AsField( AsField( GF(2^2), GF(2^4) ), GF(2^8) ), [ Z(2)^0, Z(2^8)^76 ] )

variables
[ "a_0", "a_1" ]
[ "b_0", "b_1" ]
[ "d_0", "d_1", "d_2" ]
gap> multB3 := FFA_mult_matrixU(B3, avec, bvec);;
gap> for i in multB3 do Display(i); od;
a_0*b_0+Z(2^4)*a_1*b_1
a_0*b_1+a_1*b_0+Z(2^2)*a_1*b_1
gap> lambda := RootOfDefiningPolynomial(F1);;
gap> mu := RootOfDefiningPolynomial(F2);;
gap> lambda^2*mu; lambda;
Z(2^4)
Z(2^2)
gap> TFB2 := GenerateTFBfromEDPLwithPB(EDPlist);
Basis( GF(2^8), [ Z(2)^0, Z(2^2), Z(2^4)^6, Z(2^4)^11, Z(2^8)^76, Z(2^8)^161, Z(2^8)^178, Z(2^8)^8 ] )
gap> nu*mu*lambda;
Z(2^8)^8
gap> Mlist := [["PB", "to"], ["PB", "to"], ["PB", "to"]];
[ [ "PB", "to" ], [ "PB", "to" ], [ "PB", "to" ] ]
gap> TFB3 := GenerateTFBfromEDPLwithMB(EDPlist, Mlist);
Basis( GF(2^8), [ Z(2)^0, Z(2^2), Z(2^4)^6, Z(2^4)^11, Z(2^8)^76, Z(2^8)^161, Z(2^8)^178, Z(2^8)^8 ] )
gap> TFB2 := GenerateTFBfromEDPLwithPB(EDPlist);
Basis( GF(2^8), [ Z(2)^0, Z(2^2), Z(2^4)^6, Z(2^4)^11, Z(2^8)^76, Z(2^8)^161, Z(2^8)^178, Z(2^8)^8 ] )
gap> TFB3 := GenerateTFBfromEDPLwithMB(EDPlist, Mlist);
Basis( GF(2^8), [ Z(2)^0, Z(2^2), Z(2^4)^6, Z(2^4)^11, Z(2^8)^76, Z(2^8)^161, Z(2^8)^178, Z(2^8)^8 ] )
gap> TFB2 = TFB3;
true
