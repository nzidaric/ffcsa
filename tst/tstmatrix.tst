gap> K := GF(2);; x := X(K,"x");;
gap> f := x^4 + x^3 + 1;; F := FieldExtension(K, f);
GF(2^4)
gap> w := RootOfDefiningPolynomial(F);;
gap> B := GeneratePB(F,w);
Basis( GF(2^4), [ Z(2)^0, Z(2^4)^7, Z(2^4)^14, Z(2^4)^6 ] )
gap> m := DegreeOverPrimeField(F);;
gap> c := w; M := MatrixMultByConst(B, c);
Z(2^4)^7
[ [ 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0 ], [ Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2) ], [ 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2) ], [ 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0 ] ]
gap>  B1 := GeneratePB(F,w^3);
Basis( GF(2^4), [ Z(2)^0, Z(2^4)^6, Z(2^4)^12, Z(2^4)^3 ] )
gap> T1 := TransitionMatrix(B,B1);
[ [ Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2) ], [ 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0 ], [ 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2) ], [ 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2) ] ]
gap> T2 := TransitionMatrix(B1,B);
[ [ Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0 ], [ 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2) ], [ 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0 ], [ 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2) ] ]
gap>  T1 = Inverse(T2);
true
gap> B2 := GeneratePBdownto(F, w);
Basis( GF(2^4), [ Z(2^4)^6, Z(2^4)^14, Z(2^4)^7, Z(2)^0 ] )
gap> TransitionMatrix(B, B2);
[ [ 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0 ], [ 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2) ], [ 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2) ], [ Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2) ] ]
gap> R1 := ReductionMatrix(f);
[ [ Z(2)^0, Z(2)^0, Z(2)^0 ], [ 0*Z(2), Z(2)^0, Z(2)^0 ], [ 0*Z(2), 0*Z(2), Z(2)^0 ], [ Z(2)^0, Z(2)^0, Z(2)^0 ] ]
gap> R2 := ReductionMatrixDownto(f);
[ [ Z(2)^0, Z(2)^0, Z(2)^0 ], [ 0*Z(2), 0*Z(2), Z(2)^0 ], [ 0*Z(2), Z(2)^0, Z(2)^0 ], [ Z(2)^0, Z(2)^0, Z(2)^0 ] ]
gap> ReductionMatrixIR(f);
[ [ Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0 ], [ 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0 ], [ 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0 ], [ 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0 ] ]
gap> ReductionMatrixRI(f);
[ [ Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2) ], [ 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2) ], [ 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2) ], [ Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0 ] ]
gap> MatrixM(B);
[ [ [ Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2) ], [ Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2) ], [ Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2) ], [ Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2) ] ], [ [ Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2) ], [ Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2) ], [ Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2) ],
      [ Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2) ] ], [ [ Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2) ], [ Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2) ], [ Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2) ], [ Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2) ] ], [ [ Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2) ], [ Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2) ],
      [ Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2) ], [ Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2) ] ] ]
gap>  MatrixMi(B,0);
[ [ Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0 ], [ Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0 ], [ Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0 ], [ Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0 ] ]
gap> MatrixU(B);
[ [ [ Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2) ], [ 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0 ], [ 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0 ], [ 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0 ] ], [ [ 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2) ], [ Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2) ], [ 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0 ],
      [ 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0 ] ], [ [ 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2) ], [ 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2) ], [ Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2) ], [ 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0 ] ], [ [ 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0 ], [ 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0 ],
      [ 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0 ], [ Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0 ] ] ]
gap> MatrixUi(B,0);
[ [ Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2) ], [ 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2) ], [ 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2) ], [ 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0 ] ]
