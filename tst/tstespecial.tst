gap> F := GF(2^7);; B := Basis(F);; FindNormalFFEsIgnoreConjugates(F);
[ 13, 19, 21, 27, 31, 43, 63 ]
gap> ProfileNBGenerators(F);
[ [ 13, 19 ], [ 19, 27 ], [ 21, 21 ], [ 27, 27 ], [ 31, 25 ], [ 43, 21 ], [ 63, 21 ] ]
gap> FindSmallestTNBGenerator(F);
Z(2^7)^13
gap> FindSmallestTNBGenerator(GF(2,11));
Z(2^11)^439
gap> lambda := RootOfDefiningPolynomial(F); B := GeneratePB(F, lambda);
Z(2^7)
Basis( GF(2^7), [ Z(2)^0, Z(2^7), Z(2^7)^2, Z(2^7)^3, Z(2^7)^4, Z(2^7)^5, Z(2^7)^6 ] )
gap> ProfileNBtoBTransitionMat(B);
[ [ 7, 29, 7, 31, 13 ], [ 7, 33, 6, 25, 19 ], [ 7, 33, 6, 27, 21 ], [ 7, 27, 6, 33, 27 ], [ 7, 31, 6, 29, 31 ], [ 7, 27, 5, 27, 43 ], [ 7, 25, 6, 33, 63 ] ]
gap> FindSmallestAreaNBtoBProfile(B);
[ 7, 27, 5, 27, 43 ]
gap> g := GeneratorOfField(F);; NB := GenerateNB(F, g^43);; profile := ProfileGamma(NB);;
gap> for i in profile do Display(i); od;
[ 4, 20, 1, 11 ]
[ 4, 22, 3 ]
[ 5, 24, 5 ]
[ 4, 19, 7, 47 ]
[ 5, 26, 9 ]
[ 5, 27, 13 ]
[ 6, 26, 15, 23 ]
[ 6, 31, 19 ]
[ 7, 29, 21 ]
[ 6, 23, 27 ]
[ 6, 32, 29 ]
[ 5, 29, 31 ]
[ 4, 21, 43 ]
[ 6, 28, 55 ]
[ 5, 25, 63 ]
gap> FindSmallestAreaGamma(NB);
Z(2^7)^7
gap> FindSmallestDelayGamma(NB);
Z(2^7)^7
