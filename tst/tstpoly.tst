gap> FindPrimitivePolyAll2(4);
[ x^4+x+Z(2)^0, x^4+x^3+Z(2)^0 ]
gap> FindPrimitivePolyAll2(5);
[ x^5+x^2+Z(2)^0, x^5+x^3+Z(2)^0, x^5+x^3+x^2+x+Z(2)^0, x^5+x^4+x^2+x+Z(2)^0, x^5+x^4+x^3+x+Z(2)^0, x^5+x^4+x^3+x^2+Z(2)^0 ]
gap> FindPrimitivePolyAll(GF(2), 4);
[ x^4+x+Z(2)^0, x^4+x^3+Z(2)^0 ]
gap> FindPrimitivePolyAll(GF(2), 5);
[ x^5+x^2+Z(2)^0, x^5+x^3+Z(2)^0, x^5+x^3+x^2+x+Z(2)^0, x^5+x^4+x^2+x+Z(2)^0, x^5+x^4+x^3+x+Z(2)^0, x^5+x^4+x^3+x^2+Z(2)^0 ]
gap> FindPrimitivePolyAll(GF(2^2), 2);
[ x^2+Z(2^2)*x+Z(2^2), x^2+x+Z(2^2), x^2+x+Z(2^2)^2, x^2+Z(2^2)^2*x+Z(2^2)^2 ]
gap> FindPrimitivePolyAll(GF(2^2), 4);
[ x^4+x^2+Z(2^2)*x+Z(2^2)^2, x^4+x^2+Z(2^2)^2*x+Z(2^2), x^4+Z(2^2)^2*x^3+Z(2^2)^2*x^2+Z(2^2), x^4+Z(2^2)*x^3+Z(2^2)^2*x+Z(2^2), x^4+Z(2^2)*x^2+Z(2^2)*x+Z(2^2), x^4+Z(2^2)*x^2+Z(2^2)*x+Z(2^2)^2, x^4+Z(2^2)*x^3+Z(2^2)*x+Z(2^2), x^4+Z(2^2)^2*x^3+Z(2^2)*x^2+Z(2^2),
  x^4+x^3+Z(2^2)*x^2+Z(2^2)*x+Z(2^2), x^4+Z(2^2)*x^3+x^2+Z(2^2)*x+Z(2^2)^2, x^4+x^3+x^2+Z(2^2)^2*x+Z(2^2)^2, x^4+x^3+x+Z(2^2), x^4+x^3+x+Z(2^2)^2, x^4+x^3+Z(2^2)^2*x^2+Z(2^2)^2*x+Z(2^2)^2, x^4+x^3+Z(2^2)*x^2+Z(2^2)^2, x^4+Z(2^2)*x^3+x+Z(2^2)^2,
  x^4+Z(2^2)^2*x^2+Z(2^2)*x+Z(2^2), x^4+Z(2^2)^2*x^3+Z(2^2)*x^2+Z(2^2)^2*x+Z(2^2), x^4+Z(2^2)^2*x^3+Z(2^2)^2*x+Z(2^2)^2, x^4+Z(2^2)^2*x^3+x+Z(2^2), x^4+x^3+Z(2^2)^2*x^2+Z(2^2), x^4+Z(2^2)*x^3+Z(2^2)*x^2+Z(2^2)^2, x^4+Z(2^2)*x^3+Z(2^2)^2*x^2+Z(2^2)^2,
  x^4+Z(2^2)*x^2+Z(2^2)^2*x+Z(2^2)^2, x^4+Z(2^2)^2*x^3+Z(2^2)*x+Z(2^2)^2, x^4+x^3+x^2+Z(2^2), x^4+x^3+x^2+Z(2^2)^2, x^4+Z(2^2)^2*x^3+x^2+Z(2^2)^2*x+Z(2^2), x^4+Z(2^2)*x^3+Z(2^2)^2*x^2+Z(2^2)*x+Z(2^2)^2, x^4+Z(2^2)^2*x^2+Z(2^2)^2*x+Z(2^2),
  x^4+Z(2^2)^2*x^2+Z(2^2)^2*x+Z(2^2)^2, x^4+x^3+x^2+Z(2^2)*x+Z(2^2) ]
gap> FindIrreduciblePolyAll(GF(2), 5);
[ x^5+x^3+Z(2)^0, x^5+x^4+x^3+x+Z(2)^0, x^5+x^4+x^2+x+Z(2)^0, x^5+x^4+x^3+x^2+Z(2)^0, x^5+x^3+x^2+x+Z(2)^0, x^5+x^2+Z(2)^0 ]
gap> FindIrreduciblePolyAll2(5);
[ x^5+x^3+Z(2)^0, x^5+x^4+x^3+x+Z(2)^0, x^5+x^4+x^2+x+Z(2)^0, x^5+x^4+x^3+x^2+Z(2)^0, x^5+x^3+x^2+x+Z(2)^0, x^5+x^2+Z(2)^0 ]
gap> FindIrreduciblePolyAll(GF(2), 2);
[ x^2+x+Z(2)^0 ]
gap> FindIrreduciblePolyAll(GF(2), 4);
[ x^4+x^3+Z(2)^0, x^4+x^3+x^2+x+Z(2)^0, x^4+x+Z(2)^0 ]
gap> FindIrreduciblePolyAll(GF(2^2),2);
[ x^2+Z(2^2)*x+Z(2)^0, x^2+Z(2^2)*x+Z(2^2), Z(2^2)^2*x^2+Z(2^2)*x+Z(2^2), Z(2^2)^2*x^2+Z(2^2)*x+Z(2^2)^2, x^2+x+Z(2^2), x^2+x+Z(2^2)^2, Z(2^2)*x^2+Z(2^2)^2*x+Z(2^2), Z(2^2)*x^2+Z(2^2)^2*x+Z(2^2)^2, x^2+Z(2^2)^2*x+Z(2)^0, x^2+Z(2^2)^2*x+Z(2^2)^2,
  Z(2^2)*x^2+Z(2^2)*x+Z(2)^0, Z(2^2)*x^2+Z(2^2)*x+Z(2^2)^2, Z(2^2)^2*x^2+x+Z(2)^0, Z(2^2)^2*x^2+x+Z(2^2)^2, Z(2^2)*x^2+x+Z(2)^0, Z(2^2)*x^2+x+Z(2^2), Z(2^2)^2*x^2+Z(2^2)^2*x+Z(2)^0, Z(2^2)^2*x^2+Z(2^2)^2*x+Z(2^2) ]
gap> FindMonicIrreduciblePolyAll(GF(2^2),2);
[ x^2+Z(2^2)*x+Z(2)^0, x^2+Z(2^2)*x+Z(2^2), x^2+x+Z(2^2), x^2+x+Z(2^2)^2, x^2+Z(2^2)^2*x+Z(2)^0, x^2+Z(2^2)^2*x+Z(2^2)^2 ]
gap> FindIrreduciblePolyAll(GF(2^2),4);
[ Z(2^2)*x^4+Z(2^2)*x^2+Z(2^2)^2*x+Z(2)^0, Z(2^2)*x^4+Z(2^2)*x^2+Z(2^2)^2*x+Z(2^2), Z(2^2)*x^4+Z(2^2)*x^2+x+Z(2^2), Z(2^2)*x^4+Z(2^2)*x^2+x+Z(2^2)^2, Z(2^2)^2*x^4+Z(2^2)^2*x^2+x+Z(2^2), Z(2^2)^2*x^4+Z(2^2)^2*x^2+x+Z(2^2)^2, Z(2^2)^2*x^4+Z(2^2)^2*x^2+Z(2^2)*x+Z(2)^0,
  Z(2^2)^2*x^4+Z(2^2)^2*x^2+Z(2^2)*x+Z(2^2)^2, x^4+x^2+Z(2^2)*x+Z(2)^0, x^4+x^2+Z(2^2)*x+Z(2^2)^2, x^4+x^2+Z(2^2)^2*x+Z(2)^0, x^4+x^2+Z(2^2)^2*x+Z(2^2), Z(2^2)^2*x^4+x^3+Z(2^2)^2*x^2+x+Z(2^2), Z(2^2)^2*x^4+x^3+Z(2^2)^2*x^2+x+Z(2^2)^2, Z(2^2)*x^4+Z(2^2)*x^3+x+Z(2^2),
  Z(2^2)^2*x^4+Z(2^2)*x^3+Z(2^2)^2*x^2+Z(2^2)^2, x^4+Z(2^2)*x^3+x^2+x+Z(2^2), Z(2^2)^2*x^4+Z(2^2)^2*x^3+Z(2^2)^2*x^2+Z(2^2)*x+Z(2^2), Z(2^2)*x^4+Z(2^2)^2*x^3+x^2+Z(2)^0, Z(2^2)*x^4+Z(2^2)^2*x^3+x^2+Z(2^2), x^4+Z(2^2)*x^3+Z(2^2)^2*x^2+Z(2^2)^2*x+Z(2)^0,
  Z(2^2)^2*x^4+x^3+x^2+Z(2^2)*x+Z(2^2), Z(2^2)^2*x^4+x^3+x^2+Z(2^2)*x+Z(2^2)^2, Z(2^2)*x^4+Z(2^2)^2*x^2+x+Z(2)^0, Z(2^2)*x^4+Z(2^2)^2*x^2+x+Z(2^2), Z(2^2)*x^4+x^3+Z(2^2)^2*x+Z(2)^0, Z(2^2)^2*x^4+Z(2^2)^2*x^3+Z(2^2)^2*x+Z(2)^0,
  Z(2^2)^2*x^4+Z(2^2)^2*x^3+Z(2^2)^2*x+Z(2^2), x^4+Z(2^2)*x^3+x^2+Z(2)^0, Z(2^2)^2*x^4+Z(2^2)^2*x^3+Z(2^2)*x^2+Z(2^2)*x+Z(2)^0, Z(2^2)^2*x^4+Z(2^2)^2*x^3+Z(2^2)*x^2+Z(2^2)*x+Z(2^2), Z(2^2)^2*x^4+Z(2^2)^2*x^3+x^2+Z(2^2), Z(2^2)*x^4+Z(2^2)*x^3+Z(2^2)*x^2+Z(2)^0,
  Z(2^2)*x^4+Z(2^2)*x^3+Z(2^2)*x^2+Z(2^2)^2, x^4+Z(2^2)^2*x^3+Z(2^2)^2*x^2+Z(2^2), Z(2^2)*x^4+x^3+Z(2^2)*x^2+Z(2^2)*x+Z(2)^0, Z(2^2)^2*x^4+x^3+x^2+Z(2^2)^2*x+Z(2)^0, Z(2^2)^2*x^4+x^3+Z(2^2)^2*x+Z(2^2), Z(2^2)^2*x^4+x^3+Z(2^2)^2*x+Z(2^2)^2,
  Z(2^2)*x^4+x^3+Z(2^2)*x^2+x+Z(2^2), Z(2^2)*x^4+x^3+Z(2^2)*x^2+x+Z(2^2)^2, x^4+Z(2^2)^2*x^3+Z(2^2)^2*x^2+x+Z(2^2)^2, Z(2^2)^2*x^4+Z(2^2)*x^2+x+Z(2)^0, Z(2^2)^2*x^4+Z(2^2)*x^2+x+Z(2^2)^2, Z(2^2)^2*x^4+Z(2^2)^2*x^3+x+Z(2^2)^2, x^4+Z(2^2)^2*x^3+Z(2^2)*x^2+Z(2^2)*x+Z(2)^0
    , Z(2^2)*x^4+Z(2^2)^2*x^3+x^2+Z(2^2)^2*x+Z(2)^0, x^4+Z(2^2)*x^3+Z(2^2)^2*x+Z(2^2), Z(2^2)^2*x^4+Z(2^2)*x^3+x^2+Z(2^2)*x+Z(2)^0, x^4+Z(2^2)*x^2+Z(2^2)*x+Z(2^2), x^4+Z(2^2)*x^2+Z(2^2)*x+Z(2^2)^2, x^4+Z(2^2)*x^3+Z(2^2)*x+Z(2^2), Z(2^2)^2*x^4+Z(2^2)*x^3+Z(2^2)*x+Z(2^2)
    , x^4+x^3+Z(2^2)^2*x^2+x+Z(2)^0, x^4+Z(2^2)^2*x^3+Z(2^2)*x^2+Z(2)^0, x^4+Z(2^2)^2*x^3+Z(2^2)*x^2+Z(2^2), Z(2^2)*x^4+x^3+x^2+Z(2^2)^2*x+Z(2^2), Z(2^2)*x^4+x^3+x^2+Z(2^2)^2*x+Z(2^2)^2, Z(2^2)^2*x^4+Z(2^2)*x^3+Z(2^2)^2*x+Z(2)^0,
  Z(2^2)^2*x^4+Z(2^2)*x^3+Z(2^2)^2*x+Z(2^2)^2, x^4+x^3+Z(2^2)*x^2+x+Z(2)^0, Z(2^2)^2*x^4+Z(2^2)^2*x^3+Z(2^2)*x^2+Z(2)^0, Z(2^2)^2*x^4+x^3+x^2+Z(2^2), Z(2^2)*x^4+x^2+x+Z(2)^0, Z(2^2)*x^4+x^2+x+Z(2^2)^2, Z(2^2)*x^4+Z(2^2)*x^3+Z(2^2)*x^2+Z(2^2)^2*x+Z(2^2)^2,
  x^4+x^3+Z(2^2)*x^2+Z(2^2)*x+Z(2^2), x^4+x^3+Z(2^2)*x^2+Z(2^2)*x+Z(2^2)^2, x^4+Z(2^2)*x^3+x^2+Z(2^2)*x+Z(2)^0, x^4+Z(2^2)*x^3+x^2+Z(2^2)*x+Z(2^2)^2, Z(2^2)^2*x^4+Z(2^2)^2*x^3+Z(2^2)*x+Z(2^2)^2, x^4+Z(2^2)^2*x^3+x^2+Z(2)^0,
  Z(2^2)*x^4+Z(2^2)^2*x^3+Z(2^2)*x^2+Z(2^2)*x+Z(2^2)^2, x^4+x^3+x^2+Z(2^2)^2*x+Z(2^2)^2, Z(2^2)^2*x^4+x^3+Z(2^2)*x^2+Z(2^2), Z(2^2)^2*x^4+x^3+Z(2^2)*x^2+Z(2^2)^2, Z(2^2)*x^4+Z(2^2)^2*x^3+x^2+x+Z(2^2), x^4+Z(2^2)*x^3+Z(2^2)*x^2+Z(2^2)^2*x+Z(2)^0,
  x^4+Z(2^2)*x^3+Z(2^2)*x^2+Z(2^2)^2*x+Z(2^2)^2, Z(2^2)^2*x^4+x^2+Z(2^2)*x+Z(2^2), Z(2^2)^2*x^4+x^2+Z(2^2)*x+Z(2^2)^2, Z(2^2)^2*x^4+Z(2^2)*x^3+x+Z(2^2), x^4+x^3+x+Z(2^2), x^4+x^3+x+Z(2^2)^2, Z(2^2)*x^4+Z(2^2)^2*x^3+Z(2^2)*x^2+Z(2^2),
  x^4+x^3+Z(2^2)^2*x^2+Z(2^2)^2*x+Z(2^2), x^4+x^3+Z(2^2)^2*x^2+Z(2^2)^2*x+Z(2^2)^2, x^4+x^3+Z(2^2)*x^2+Z(2^2)^2, Z(2^2)^2*x^4+Z(2^2)^2*x^3+Z(2^2)^2*x^2+Z(2)^0, Z(2^2)^2*x^4+Z(2^2)^2*x^3+Z(2^2)^2*x^2+Z(2^2), Z(2^2)*x^4+x^3+x^2+Z(2^2)^2,
  Z(2^2)^2*x^4+Z(2^2)*x^3+Z(2^2)^2*x^2+Z(2^2)^2*x+Z(2^2), x^4+Z(2^2)*x^3+Z(2^2)*x^2+x+Z(2^2), x^4+Z(2^2)*x^3+x+Z(2)^0, x^4+Z(2^2)*x^3+x+Z(2^2)^2, Z(2^2)^2*x^4+Z(2^2)*x^3+Z(2^2)^2*x^2+Z(2^2)*x+Z(2)^0, Z(2^2)^2*x^4+Z(2^2)*x^3+Z(2^2)^2*x^2+Z(2^2)*x+Z(2^2)^2,
  Z(2^2)*x^4+x^3+x^2+Z(2^2)*x+Z(2)^0, x^4+Z(2^2)^2*x^2+Z(2^2)*x+Z(2)^0, x^4+Z(2^2)^2*x^2+Z(2^2)*x+Z(2^2), x^4+x^3+Z(2^2)*x+Z(2)^0, Z(2^2)*x^4+x^3+Z(2^2)^2*x^2+Z(2^2)^2*x+Z(2^2), Z(2^2)^2*x^4+x^3+Z(2^2)*x^2+x+Z(2^2), Z(2^2)*x^4+Z(2^2)^2*x^3+x+Z(2^2)^2,
  x^4+Z(2^2)^2*x^3+Z(2^2)*x^2+Z(2^2)^2*x+Z(2^2), Z(2^2)*x^4+Z(2^2)^2*x^2+Z(2^2)^2*x+Z(2)^0, Z(2^2)*x^4+Z(2^2)^2*x^2+Z(2^2)^2*x+Z(2^2)^2, Z(2^2)*x^4+Z(2^2)^2*x^3+Z(2^2)^2*x+Z(2^2)^2, x^4+Z(2^2)^2*x^3+Z(2^2)^2*x+Z(2^2)^2, Z(2^2)*x^4+Z(2^2)*x^3+x^2+Z(2^2)*x+Z(2^2),
  Z(2^2)*x^4+x^3+Z(2^2)^2*x^2+Z(2^2), Z(2^2)*x^4+x^3+Z(2^2)^2*x^2+Z(2^2)^2, Z(2^2)^2*x^4+Z(2^2)*x^3+Z(2^2)*x^2+x+Z(2)^0, Z(2^2)^2*x^4+Z(2^2)*x^3+Z(2^2)*x^2+x+Z(2^2)^2, x^4+Z(2^2)^2*x^3+x+Z(2)^0, x^4+Z(2^2)^2*x^3+x+Z(2^2),
  Z(2^2)*x^4+Z(2^2)*x^3+Z(2^2)^2*x^2+Z(2^2)*x+Z(2^2), x^4+x^3+Z(2^2)^2*x^2+Z(2^2), x^4+Z(2^2)*x^3+Z(2^2)*x^2+Z(2^2)^2, Z(2^2)^2*x^4+Z(2^2)*x^2+Z(2^2)*x+Z(2)^0, Z(2^2)^2*x^4+Z(2^2)*x^2+Z(2^2)*x+Z(2^2), Z(2^2)^2*x^4+Z(2^2)^2*x^3+Z(2^2)^2*x^2+x+Z(2)^0,
  Z(2^2)*x^4+Z(2^2)*x^3+Z(2^2)^2*x^2+Z(2^2)^2*x+Z(2)^0, Z(2^2)*x^4+Z(2^2)*x^3+Z(2^2)^2*x^2+Z(2^2)^2*x+Z(2^2)^2, Z(2^2)*x^4+Z(2^2)^2*x^3+Z(2^2)*x^2+Z(2^2)^2*x+Z(2)^0, Z(2^2)*x^4+Z(2^2)^2*x^3+Z(2^2)*x^2+Z(2^2)^2*x+Z(2^2), x^4+x^3+Z(2^2)^2*x+Z(2)^0,
  Z(2^2)*x^4+x^3+Z(2^2)*x^2+Z(2^2), Z(2^2)^2*x^4+x^3+Z(2^2)^2*x^2+Z(2^2)^2*x+Z(2)^0, Z(2^2)*x^4+Z(2^2)*x^3+Z(2^2)*x^2+x+Z(2)^0, x^4+Z(2^2)*x^3+Z(2^2)^2*x^2+Z(2)^0, x^4+Z(2^2)*x^3+Z(2^2)^2*x^2+Z(2^2)^2, Z(2^2)^2*x^4+x^3+Z(2^2)*x^2+Z(2^2)*x+Z(2^2)^2,
  Z(2^2)*x^4+Z(2^2)^2*x^3+Z(2^2)^2*x^2+x+Z(2)^0, Z(2^2)*x^4+Z(2^2)^2*x^3+Z(2^2)^2*x^2+x+Z(2^2), x^4+Z(2^2)*x^2+Z(2^2)^2*x+Z(2)^0, x^4+Z(2^2)*x^2+Z(2^2)^2*x+Z(2^2)^2, x^4+Z(2^2)^2*x^3+Z(2^2)*x+Z(2^2)^2, Z(2^2)*x^4+Z(2^2)*x^3+Z(2^2)*x+Z(2)^0,
  Z(2^2)*x^4+Z(2^2)*x^3+Z(2^2)*x+Z(2^2)^2, Z(2^2)^2*x^4+x^3+Z(2^2)^2*x^2+Z(2^2)^2, Z(2^2)*x^4+Z(2^2)*x^3+x^2+x+Z(2)^0, Z(2^2)*x^4+Z(2^2)*x^3+x^2+x+Z(2^2)^2, Z(2^2)*x^4+Z(2^2)*x^3+Z(2^2)^2*x^2+Z(2)^0, x^4+x^3+x^2+Z(2^2), x^4+x^3+x^2+Z(2^2)^2,
  Z(2^2)^2*x^4+Z(2^2)*x^3+Z(2^2)*x^2+Z(2)^0, x^4+Z(2^2)^2*x^3+x^2+x+Z(2^2)^2, Z(2^2)*x^4+Z(2^2)^2*x^3+Z(2^2)^2*x^2+Z(2^2)*x+Z(2^2)^2, Z(2^2)*x^4+Z(2^2)^2*x^3+Z(2^2)*x+Z(2)^0, Z(2^2)*x^4+Z(2^2)^2*x^3+Z(2^2)*x+Z(2^2), x^4+Z(2^2)^2*x^3+x^2+Z(2^2)^2*x+Z(2)^0,
  x^4+Z(2^2)^2*x^3+x^2+Z(2^2)^2*x+Z(2^2), Z(2^2)^2*x^4+Z(2^2)*x^3+Z(2^2)*x^2+Z(2^2)^2*x+Z(2^2), Z(2^2)*x^4+x^2+Z(2^2)^2*x+Z(2^2), Z(2^2)*x^4+x^2+Z(2^2)^2*x+Z(2^2)^2, Z(2^2)*x^4+Z(2^2)*x^3+Z(2^2)^2*x+Z(2^2), Z(2^2)^2*x^4+Z(2^2)*x^3+x^2+x+Z(2^2)^2,
  x^4+Z(2^2)*x^3+Z(2^2)^2*x^2+Z(2^2)*x+Z(2^2)^2, Z(2^2)^2*x^4+x^3+Z(2^2)*x+Z(2)^0, Z(2^2)*x^4+x^3+Z(2^2)^2*x^2+x+Z(2^2)^2, Z(2^2)^2*x^4+x^2+x+Z(2)^0, Z(2^2)^2*x^4+x^2+x+Z(2^2), Z(2^2)^2*x^4+x^3+x+Z(2)^0, Z(2^2)*x^4+x^3+x+Z(2)^0,
  Z(2^2)^2*x^4+Z(2^2)^2*x^3+Z(2^2)*x^2+Z(2^2)^2*x+Z(2^2)^2, Z(2^2)^2*x^4+Z(2^2)*x^3+x^2+Z(2)^0, Z(2^2)^2*x^4+Z(2^2)*x^3+x^2+Z(2^2)^2, x^4+Z(2^2)^2*x^3+Z(2^2)^2*x^2+Z(2^2)*x+Z(2)^0, x^4+Z(2^2)^2*x^3+Z(2^2)^2*x^2+Z(2^2)*x+Z(2^2), Z(2^2)*x^4+x^3+Z(2^2)*x+Z(2^2),
  Z(2^2)*x^4+x^3+Z(2^2)*x+Z(2^2)^2, Z(2^2)^2*x^4+Z(2^2)^2*x^3+x^2+Z(2^2)^2*x+Z(2^2)^2, Z(2^2)*x^4+Z(2^2)*x^3+x^2+Z(2^2)^2, Z(2^2)*x^4+Z(2^2)^2*x^3+Z(2^2)^2*x^2+Z(2)^0, x^4+Z(2^2)^2*x^2+Z(2^2)^2*x+Z(2^2), x^4+Z(2^2)^2*x^2+Z(2^2)^2*x+Z(2^2)^2,
  x^4+x^3+x^2+Z(2^2)*x+Z(2^2), Z(2^2)^2*x^4+Z(2^2)^2*x^3+x^2+x+Z(2)^0, Z(2^2)^2*x^4+Z(2^2)^2*x^3+x^2+x+Z(2^2) ]
gap> FindMonicIrreduciblePolyAll(GF(2^2),4);
[ x^4+x^2+Z(2^2)*x+Z(2)^0, x^4+x^2+Z(2^2)*x+Z(2^2)^2, x^4+x^2+Z(2^2)^2*x+Z(2)^0, x^4+x^2+Z(2^2)^2*x+Z(2^2), x^4+Z(2^2)*x^3+x^2+x+Z(2^2), x^4+Z(2^2)*x^3+Z(2^2)^2*x^2+Z(2^2)^2*x+Z(2)^0, x^4+Z(2^2)*x^3+x^2+Z(2)^0, x^4+Z(2^2)^2*x^3+Z(2^2)^2*x^2+Z(2^2),
  x^4+Z(2^2)^2*x^3+Z(2^2)^2*x^2+x+Z(2^2)^2, x^4+Z(2^2)^2*x^3+Z(2^2)*x^2+Z(2^2)*x+Z(2)^0, x^4+Z(2^2)*x^3+Z(2^2)^2*x+Z(2^2), x^4+Z(2^2)*x^2+Z(2^2)*x+Z(2^2), x^4+Z(2^2)*x^2+Z(2^2)*x+Z(2^2)^2, x^4+Z(2^2)*x^3+Z(2^2)*x+Z(2^2), x^4+x^3+Z(2^2)^2*x^2+x+Z(2)^0,
  x^4+Z(2^2)^2*x^3+Z(2^2)*x^2+Z(2)^0, x^4+Z(2^2)^2*x^3+Z(2^2)*x^2+Z(2^2), x^4+x^3+Z(2^2)*x^2+x+Z(2)^0, x^4+x^3+Z(2^2)*x^2+Z(2^2)*x+Z(2^2), x^4+x^3+Z(2^2)*x^2+Z(2^2)*x+Z(2^2)^2, x^4+Z(2^2)*x^3+x^2+Z(2^2)*x+Z(2)^0, x^4+Z(2^2)*x^3+x^2+Z(2^2)*x+Z(2^2)^2,
  x^4+Z(2^2)^2*x^3+x^2+Z(2)^0, x^4+x^3+x^2+Z(2^2)^2*x+Z(2^2)^2, x^4+Z(2^2)*x^3+Z(2^2)*x^2+Z(2^2)^2*x+Z(2)^0, x^4+Z(2^2)*x^3+Z(2^2)*x^2+Z(2^2)^2*x+Z(2^2)^2, x^4+x^3+x+Z(2^2), x^4+x^3+x+Z(2^2)^2, x^4+x^3+Z(2^2)^2*x^2+Z(2^2)^2*x+Z(2^2),
  x^4+x^3+Z(2^2)^2*x^2+Z(2^2)^2*x+Z(2^2)^2, x^4+x^3+Z(2^2)*x^2+Z(2^2)^2, x^4+Z(2^2)*x^3+Z(2^2)*x^2+x+Z(2^2), x^4+Z(2^2)*x^3+x+Z(2)^0, x^4+Z(2^2)*x^3+x+Z(2^2)^2, x^4+Z(2^2)^2*x^2+Z(2^2)*x+Z(2)^0, x^4+Z(2^2)^2*x^2+Z(2^2)*x+Z(2^2), x^4+x^3+Z(2^2)*x+Z(2)^0,
  x^4+Z(2^2)^2*x^3+Z(2^2)*x^2+Z(2^2)^2*x+Z(2^2), x^4+Z(2^2)^2*x^3+Z(2^2)^2*x+Z(2^2)^2, x^4+Z(2^2)^2*x^3+x+Z(2)^0, x^4+Z(2^2)^2*x^3+x+Z(2^2), x^4+x^3+Z(2^2)^2*x^2+Z(2^2), x^4+Z(2^2)*x^3+Z(2^2)*x^2+Z(2^2)^2, x^4+x^3+Z(2^2)^2*x+Z(2)^0, x^4+Z(2^2)*x^3+Z(2^2)^2*x^2+Z(2)^0,
  x^4+Z(2^2)*x^3+Z(2^2)^2*x^2+Z(2^2)^2, x^4+Z(2^2)*x^2+Z(2^2)^2*x+Z(2)^0, x^4+Z(2^2)*x^2+Z(2^2)^2*x+Z(2^2)^2, x^4+Z(2^2)^2*x^3+Z(2^2)*x+Z(2^2)^2, x^4+x^3+x^2+Z(2^2), x^4+x^3+x^2+Z(2^2)^2, x^4+Z(2^2)^2*x^3+x^2+x+Z(2^2)^2, x^4+Z(2^2)^2*x^3+x^2+Z(2^2)^2*x+Z(2)^0,
  x^4+Z(2^2)^2*x^3+x^2+Z(2^2)^2*x+Z(2^2), x^4+Z(2^2)*x^3+Z(2^2)^2*x^2+Z(2^2)*x+Z(2^2)^2, x^4+Z(2^2)^2*x^3+Z(2^2)^2*x^2+Z(2^2)*x+Z(2)^0, x^4+Z(2^2)^2*x^3+Z(2^2)^2*x^2+Z(2^2)*x+Z(2^2), x^4+Z(2^2)^2*x^2+Z(2^2)^2*x+Z(2^2), x^4+Z(2^2)^2*x^2+Z(2^2)^2*x+Z(2^2)^2,
  x^4+x^3+x^2+Z(2^2)*x+Z(2^2) ]
gap> FindMonicIrreducibleNotPrimitivePolyAll(GF(2^2),2);
[ x^2+Z(2^2)*x+Z(2)^0, x^2+Z(2^2)^2*x+Z(2)^0 ]
