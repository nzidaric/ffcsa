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
