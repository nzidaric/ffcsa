gap> K := GF(2);; x := X(K,"x");; f := x^4 + x^3 + 1;; F := FieldExtension(K, f);;
gap> w := RootOfDefiningPolynomial(F);; B := GeneratePB(F,w);;
gap> M := MatrixMultByConst(B, w); WeightMatrixBoth(M); WeightMatrix(M); WeightMatrixMaxRow(M);
[ [ 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0 ], [ Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2) ], [ 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2) ], [ 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0 ] ]
[ 2, 5 ]
5
2
gap> M := [ [ Z(2^4)^2, Z(2^4)^4, Z(2^4)^12 ], [ Z(2^4)^7, Z(2^4)^11, Z(2^4)^3 ] ];;
gap> WeightMatrixBoth(M); WeightMatrix(M); WeightMatrixMaxRow(M);
[ 3, 6 ]
6
3
gap> WeightPolynomial(f);
3
gap> g := x^5+Z(2^5)^2*x^4+Z(2^5)^5*x^3+Z(2^5)^27*x^2+Z(2^5)^17;;
gap> WeightPolynomial(g);
5
