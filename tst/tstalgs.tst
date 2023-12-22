gap> ChooseFieldElms(GF(2,5));

variables
[ "a_0", "a_1", "a_2", "a_3", "a_4" ]
[ "b_0", "b_1", "b_2", "b_3", "b_4" ]
[ "d_0", "d_1", "d_2", "d_3", "d_4", "d_5", "d_6", "d_7", "d_8" ]
gap> SLL(avec, 3); SRL(avec,1);
[ a_3, a_4, 0*Z(2), 0*Z(2), 0*Z(2) ]
[ 0*Z(2), a_0, a_1, a_2, a_3 ]
gap> SLA(avec, 3); SRA(avec,1);
[ a_3, a_4, a_4, a_4, a_4 ]
[ a_0, a_0, a_1, a_2, a_3 ]
gap> ROL(avec,3); ROR(avec,2);
[ a_3, a_4, a_0, a_1, a_2 ]
[ a_3, a_4, a_0, a_1, a_2 ]
gap> ANDbw(avec,bvec);
[ a_0*b_0, a_1*b_1, a_2*b_2, a_3*b_3, a_4*b_4 ]
gap> XORbw(avec,bvec);
[ a_0+b_0, a_1+b_1, a_2+b_2, a_3+b_3, a_4+b_4 ]
gap> UnbindGlobalOld();
gap> ChooseFieldElms(GF(2,3));

variables
[ "a_0", "a_1", "a_2" ]
[ "b_0", "b_1", "b_2" ]
[ "d_0", "d_1", "d_2", "d_3", "d_4" ]
gap> vec :=  [ Z(2^4)^3, Z(2^4)^2, Z(2^4) ];;
gap> SLL(vec, 3); SRL(vec,1);
[ 0*Z(2), 0*Z(2), 0*Z(2) ]
[ 0*Z(2), Z(2^4)^3, Z(2^4)^2 ]
gap> SLA(vec, 3); SRA(vec,1);
[ Z(2^4), Z(2^4), Z(2^4) ]
[ Z(2^4)^3, Z(2^4)^3, Z(2^4)^2 ]
gap> ROL(vec,3); ROR(vec,2);
[ Z(2^4)^3, Z(2^4)^2, Z(2^4) ]
[ Z(2^4)^2, Z(2^4), Z(2^4)^3 ]
gap> ANDbw(vec,bvec);
[ Z(2^4)^3*b_0, Z(2^4)^2*b_1, Z(2^4)*b_2 ]
gap> XORbw(avec,vec);
[ a_0+Z(2^4)^3, a_1+Z(2^4)^2, a_2+Z(2^4) ]
gap> ANDbw(vec, SRL(vec,1));
[ 0*Z(2), Z(2^2), Z(2^4)^3 ]
gap> K := GF(2);; x := X(K, "x");;
gap> f := x^4+x^3+x^2+x+1;; F := FieldExtension(K,  f);;
gap> ChooseFieldElms(F);

variables
[ "a_0", "a_1", "a_2", "a_3" ]
[ "b_0", "b_1", "b_2", "b_3" ]
[ "d_0", "d_1", "d_2", "d_3", "d_4", "d_5", "d_6" ]
gap> M := [[ 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0 ],
>       [ Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0 ],
>       [ Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2) ],
>       [ Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2) ]];;
gap> MultEvecMatrix(avec, M);
[ a_1+a_2+a_3, a_0+a_1+a_3, a_0+a_1+a_2+a_3, a_0+a_1 ]
gap> MultMatrixEvec(M, avec);
[ a_1+a_2+a_3, a_0+a_1+a_2+a_3, a_0+a_2, a_0+a_1+a_2 ]
gap> PB := GeneratePB(F, RootOfDefiningPolynomial(F));
Basis( GF(2^4), [ Z(2)^0, Z(2^4)^3, Z(2^4)^6, Z(2^4)^9 ] )
gap> MatrixMultByConstExpression(PB, Z(2^4)^3, avec);
[ a_3, a_0+a_3, a_1+a_3, a_2+a_3 ]
gap> MatrixMultByConstExpression(M , avec);
[ a_1+a_2+a_3, a_0+a_1+a_2+a_3, a_0+a_2, a_0+a_1+a_2 ]
gap> K := GF(2);; x:= X(K, "x");;
gap> f:= x^2 + x + 1;; IsPrimitivePolynomial(K, f);
true
gap> F := FieldExtension(K, f);; alfa := RootOfDefiningPolynomial(F);
Z(2^2)
gap> ChooseFieldElms(F);

variables
[ "a_0", "a_1" ]
[ "b_0", "b_1" ]
[ "d_0", "d_1", "d_2" ]
gap> NB1 := GenerateNB(F, alfa);
Basis( GF(2^2), [ Z(2^2), Z(2^2)^2 ] )
gap> g := x^2 + x + alfa;; IsPrimitivePolynomial(F, g);
true
gap> G := FieldExtension(F, g);; beta := RootOfDefiningPolynomial(G);
Z(2^4)
gap> ChooseFieldElms(G);

variables
[ "a_0", "a_1" ]
[ "b_0", "b_1" ]
[ "d_0", "d_1", "d_2" ]
gap> NB2 := GenerateNB(G, beta);
Basis( AsField( GF(2^2), GF(2^4) ), [ Z(2^4), Z(2^4)^4 ] )
gap> MatrixMultByConstExpression(NB2, beta^3, avec);
[ a_1, a_0+Z(2^2)^2*a_1 ]
gap> K := GF(2);; x := X(K, "x");;
gap> f := x^4+x^3+x^2+x+1;; F := FieldExtension(K,  f);;
gap> alfa := RootOfDefiningPolynomial(F); PB := GeneratePB(F,alfa);
Z(2^4)^3
Basis( GF(2^4), [ Z(2)^0, Z(2^4)^3, Z(2^4)^6, Z(2^4)^9 ] )
gap> ChooseFieldElms(F);

variables
[ "a_0", "a_1", "a_2", "a_3" ]
[ "b_0", "b_1", "b_2", "b_3" ]
[ "d_0", "d_1", "d_2", "d_3", "d_4", "d_5", "d_6" ]
gap> MatrixUExpression(PB, avec);
[ [ a_0, a_3, a_2+a_3, a_1+a_2 ], [ a_1, a_0+a_3, a_2, a_1+a_3 ], [ a_2, a_1+a_3, a_0+a_2, a_1 ], [ a_3, a_2+a_3, a_1+a_2, a_0+a_1 ] ]
gap> MatrixMExpression(PB, avec);
Warning: if used as expression then only to get the expressions for M matrix with basis element entries
or use vec = BasisVectors to get actual M entries, then multiply
[ [ a_0, a_0, a_0, a_0 ], [ a_0, a_0, a_0, a_0 ], [ a_0, a_0, a_0, a_0 ], [ a_0, a_0, a_0, a_0 ] ]
gap> NB := GenerateNB(F, alfa);
Basis( GF(2^4), [ Z(2^4)^3, Z(2^4)^6, Z(2^4)^12, Z(2^4)^9 ] )
gap> MatrixMExpression(NB, avec);
Warning: if used as expression then only to get the expressions for M matrix with basis element entries
or use vec = BasisVectors to get actual M entries, then multiply
[ [ a_1, a_3, a_0+a_1+a_2+a_3, a_2 ], [ a_3, a_2, a_0, a_0+a_1+a_2+a_3 ], [ a_0+a_1+a_2+a_3, a_0, a_3, a_1 ], [ a_2, a_0+a_1+a_2+a_3, a_1, a_0 ] ]
gap> K := GF(2);; x := X(K, "x");;
gap> f := x^4 + x + 1;; F := FieldExtension(K,  f);;
gap> alfa := RootOfDefiningPolynomial(F); PB := GeneratePB(F,alfa);
Z(2^4)
Basis( GF(2^4), [ Z(2)^0, Z(2^4), Z(2^4)^2, Z(2^4)^3 ] )
gap> ChooseFieldElms(F);

variables
[ "a_0", "a_1", "a_2", "a_3" ]
[ "b_0", "b_1", "b_2", "b_3" ]
[ "d_0", "d_1", "d_2", "d_3", "d_4", "d_5", "d_6" ]
gap> FFA_mult_convolution(avec,bvec);
[ a_0*b_0, a_0*b_1+a_1*b_0, a_0*b_2+a_1*b_1+a_2*b_0, a_0*b_3+a_1*b_2+a_2*b_1+a_3*b_0, a_1*b_3+a_2*b_2+a_3*b_1, a_2*b_3+a_3*b_2, a_3*b_3 ]
gap> ReductionMatrixExpression(f, dvec);
[ d_0+d_4, d_1+d_4+d_5, d_2+d_5+d_6, d_3+d_6 ]
gap> FFA_mult_2stepClassic(f, avec, bvec, "to");
[ a_0*b_0+a_1*b_3+a_2*b_2+a_3*b_1, a_0*b_1+a_1*b_0+a_1*b_3+a_2*b_2+a_2*b_3+a_3*b_1+a_3*b_2, a_0*b_2+a_1*b_1+a_2*b_0+a_2*b_3+a_3*b_2+a_3*b_3,
  a_0*b_3+a_1*b_2+a_2*b_1+a_3*b_0+a_3*b_3 ]
gap> FFA_mult_2stepClassic(f, "downto");

variables
[ "a_3", "a_2", "a_1", "a_0" ]
[ "b_3", "b_2", "b_1", "b_0" ]
[ "d_6", "d_5", "d_4", "d_3", "d_2", "d_1", "d_0" ]
[ a_0*b_3+a_1*b_2+a_1*b_3+a_2*b_1+a_2*b_2+a_3*b_0+a_3*b_1, a_0*b_2+a_1*b_1+a_1*b_3+a_2*b_0+a_2*b_2+a_2*b_3+a_3*b_1+a_3*b_2,
a_0*b_1+a_1*b_0+a_2*b_3+a_3*b_2+a_3*b_3, a_0*b_0+a_3*b_3 ]
gap> M := FFA_mult_convolution(avec,bvec);; for i in M do Display(i); od;
a_3*b_3
a_2*b_3+a_3*b_2
a_1*b_3+a_2*b_2+a_3*b_1
a_0*b_3+a_1*b_2+a_2*b_1+a_3*b_0
a_0*b_2+a_1*b_1+a_2*b_0
a_0*b_1+a_1*b_0
a_0*b_0
gap> M := FFA_mult_2stepClassic(f, "to");; for i in M do Display(i); od;

variables
[ "a_0", "a_1", "a_2", "a_3" ]
[ "b_0", "b_1", "b_2", "b_3" ]
[ "d_0", "d_1", "d_2", "d_3", "d_4", "d_5", "d_6" ]
a_0*b_0+a_1*b_3+a_2*b_2+a_3*b_1
a_0*b_1+a_1*b_0+a_1*b_3+a_2*b_2+a_2*b_3+a_3*b_1+a_3*b_2
a_0*b_2+a_1*b_1+a_2*b_0+a_2*b_3+a_3*b_2+a_3*b_3
a_0*b_3+a_1*b_2+a_2*b_1+a_3*b_0+a_3*b_3
gap> K := GF(2);; x := X(K, "x");;
gap> f := x^4 + x + 1;; F := FieldExtension(K,  f);;
gap> alfa := RootOfDefiningPolynomial(F); PB := GeneratePB(F,alfa);
Z(2^4)
Basis( GF(2^4), [ Z(2)^0, Z(2^4), Z(2^4)^2, Z(2^4)^3 ] )
gap> K := GF(2);; x := X(K, "x");;
gap> f := x^4 + x + 1;; F := FieldExtension(K,  f);;
gap> alfa := RootOfDefiningPolynomial(F); PB := GeneratePB(F,alfa);
Z(2^4)
Basis( GF(2^4), [ Z(2)^0, Z(2^4), Z(2^4)^2, Z(2^4)^3 ] )
gap> ChooseFieldElms(F);

variables
[ "a_0", "a_1", "a_2", "a_3" ]
[ "b_0", "b_1", "b_2", "b_3" ]
[ "d_0", "d_1", "d_2", "d_3", "d_4", "d_5", "d_6" ]
gap> M := FFA_mult_matrixU(PB, avec, bvec);; for i in M do Display(i); od;
a_0*b_0+a_1*b_3+a_2*b_2+a_3*b_1
a_0*b_1+a_1*b_0+a_1*b_3+a_2*b_2+a_2*b_3+a_3*b_1+a_3*b_2
a_0*b_2+a_1*b_1+a_2*b_0+a_2*b_3+a_3*b_2+a_3*b_3
a_0*b_3+a_1*b_2+a_2*b_1+a_3*b_0+a_3*b_3
gap> M := FFA_sq_matrixU(PB, avec);; for i in M do Display(i); od;
a_0+a_2
a_2
a_1+a_3
a_3
gap> M := FFA_sq_matrixU(PB, bvec);; for i in M do Display(i); od;
b_0+b_2
b_2
b_1+b_3
b_3
gap> M := FFA_exp_matrixU(PB, bvec, 13);; for i in M do Display(i); od;
b_0*b_1*b_2+b_0*b_2*b_3+b_1*b_2*b_3+b_0*b_1+b_0*b_3+b_1*b_2+b_0+b_1
b_0*b_2*b_3+b_0*b_1+b_0*b_2+b_0*b_3+b_2+b_3
b_0*b_1*b_3+b_1*b_2*b_3+b_0*b_1+b_0*b_2+b_0*b_3+b_1*b_2+b_2*b_3+b_1+b_2
b_1*b_2*b_3+b_0*b_3+b_1*b_3+b_2*b_3+b_1+b_2+b_3
gap> M := FFA_inv_matrixU(PB, avec);; for i in M do Display(i); od;
a_0*a_1*a_2+a_1*a_2*a_3+a_0*a_2+a_1*a_2+a_0+a_1+a_2+a_3
a_0*a_1*a_3+a_0*a_1+a_0*a_2+a_1*a_2+a_1*a_3+a_3
a_0*a_2*a_3+a_0*a_1+a_0*a_2+a_0*a_3+a_2+a_3
a_1*a_2*a_3+a_0*a_3+a_1*a_3+a_2*a_3+a_1+a_2+a_3
gap> K := GF(2);; x:= X(K, "x");;
gap> f:= x^2 + x + 1;;
gap> IsPrimitivePolynomial(K, f);
true
gap> F := FieldExtension(K, f);; alfa := RootOfDefiningPolynomial(F);
Z(2^2)
gap> ChooseFieldElms(F);

variables
[ "a_0", "a_1" ]
[ "b_0", "b_1" ]
[ "d_0", "d_1", "d_2" ]
gap> NB1 := GenerateNB(F, alfa);
Basis( GF(2^2), [ Z(2^2), Z(2^2)^2 ] )
gap> g := x^2 + x + alfa;
x^2+x+Z(2^2)
gap> IsPrimitivePolynomial(F, g);
true
gap> G := FieldExtension(F, g);; beta := RootOfDefiningPolynomial(G);
Z(2^4)
gap> ChooseFieldElms(G);

variables
[ "a_0", "a_1" ]
[ "b_0", "b_1" ]
[ "d_0", "d_1", "d_2" ]
gap> NB2 := GenerateNB(G, beta);
Basis( AsField( GF(2^2), GF(2^4) ), [ Z(2^4), Z(2^4)^4 ] )
gap> r :=  Int(Float((Size(F)^2-1)/(Size(F)-1)));
5
gap> Ar := FFA_exp_matrixU(NB2, avec, r);
[ Z(2^2)*a_0^2+a_0*a_1+Z(2^2)*a_1^2, Z(2^2)*a_0^2+a_0*a_1+Z(2^2)*a_1^2 ]
gap> Arinv := FFA_inv_matrixU(NB2, Ar);
[ a_0^2*a_1^2+Z(2^2)^2*a_0+Z(2^2)^2*a_1, a_0^2*a_1^2+Z(2^2)^2*a_0+Z(2^2)^2*a_1 ]
gap> Ar[1] = Ar[2]; Arinv[1] = Arinv[2]; # to check if really subfield
true
true
gap> Ar1 := FFA_exp_matrixU(NB2, avec, r-1); # should be just re-wire as q=4 and NB
[ a_1, a_0 ]
gap> Ainv := FFA_inv_matrixU(NB2, avec);
[ a_0^2+Z(2^2)^2*a_0*a_1+Z(2^2)^2*a_1^2, Z(2^2)^2*a_0^2+Z(2^2)^2*a_0*a_1+a_1^2 ]
gap> Ainv2 := FFA_mult_matrixU(NB2, Arinv, Ar1);
[ a_0^2+Z(2^2)^2*a_0*a_1+Z(2^2)^2*a_1^2, Z(2^2)^2*a_0^2+Z(2^2)^2*a_0*a_1+a_1^2 ]
gap> Ainv = Ainv2;
true
gap> K := GF(2);; x:= X(K, "x");;
gap> f:= x^2 + x + 1;; F := FieldExtension(K, f);;
gap> alfa := RootOfDefiningPolynomial(F); NB1 := GenerateNB(F, alfa);
Z(2^2)
Basis( GF(2^2), [ Z(2^2), Z(2^2)^2 ] )
gap> ChooseFieldElms(F);

variables
[ "a_0", "a_1" ]
[ "b_0", "b_1" ]
[ "d_0", "d_1", "d_2" ]
gap> M := FFA_mult_matrixM(NB1, avec, bvec);
[ a_0*b_1+a_1*b_0+a_1*b_1, a_0*b_0+a_0*b_1+a_1*b_0 ]
gap> M0 := FFA_mult_matrixMi(NB1, avec, bvec, 0);
a_0*b_1+a_1*b_0+a_1*b_1
gap> M1 := FFA_mult_matrixMi(NB1, avec, bvec, 1);
a_0*b_0+a_0*b_1+a_1*b_0
gap> MatrixMi(NB1, 0);
[ [ 0*Z(2), Z(2)^0 ], [ Z(2)^0, Z(2)^0 ] ]
gap> MatrixMi(NB1, 1);
[ [ Z(2)^0, Z(2)^0 ], [ Z(2)^0, 0*Z(2) ] ]
