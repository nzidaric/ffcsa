gap> CCLeaders(2,4);
[ 0, 1, 3, 5, 7 ]
gap> CCLeaders(2,5);
[ 0, 1, 3, 5, 7, 11, 15 ]
gap> CCLeaders(3,4);
[ 0, 1, 2, 4, 5, 7, 8, 10, 11, 13, 14, 16, 17, 20, 22, 23, 25, 26, 40, 41, 44, 50, 53 ]
gap> K := GF(2);; x :=X(K, "x");;
gap> f := x^5 + x^2 + 1;; PolyPhi(K, f);
31
gap> f := x^7 + x + 1;; PolyPhi(K, f);
127
gap> f := x^142 + x^21 + 1;; PolyPhi(K, f);
5575186299632655785383929568162090376495103
gap> f := x^279 + x^5 + 1;; PolyPhi(K, f);
971334446112864535459730953411759453321203419526069760625906204869452142602604249087
gap> f := x^5 + x^2 + 1;; F := FieldExtension(K,f);;
gap> g := x^5+Z(2^5)^2*x^4+Z(2^5)^5*x^3+Z(2^5)^27*x^2+Z(2^5)^17;;  PolyPhi(F, g);
33554431
gap> f := x^2 + x + 1;; F := FieldExtension(K,f);; PolyPhi(F, f);
9
gap> for i in [2..30] do Display(NrNormalFFEIgnoreConjugates(K, i)); od;;
1
1
2
3
4
7
16
21
48
93
128
315
448
675
2048
3825
5376
13797
24576
27783
95232
182183
262144
629145
1290240
1835001
3670016
9256395
11059200
gap> NrIrreduciblePoly(GF(2,2),1);
4
gap> NrIrreduciblePoly(GF(2,2),2);
6
gap> NrIrreduciblePoly(GF(2,2),3);
20
gap> NrIrreduciblePoly(GF(2,3),1);
8
gap> NrIrreduciblePoly(GF(2,3),2);
28
gap> NrPrimitivePoly(GF(2,2),1);
2
gap> NrPrimitivePoly(GF(2,2),2);
4
gap> NrPrimitivePoly(GF(2,2),3);
12
gap> NrPrimitivePoly(GF(2,3),1);
6
gap> 
gap> NrIrreducibleNotPrimitivePoly(GF(2,2),1);
2
gap> NrIrreducibleNotPrimitivePoly(GF(2,2),2);
2
gap> NrIrreducibleNotPrimitivePoly(GF(2,2),3);
8
gap> NrIrreducibleNotPrimitivePoly(GF(2,3),1);
2
