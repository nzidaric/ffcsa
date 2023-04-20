#############################################################################
##
##
#W  findPoly.gd             The FFCSA Package                 Nusa
##
## TODO: must add reduced search space methods that ignore reciprocal polys in the search

#############################################################################
##
#M  Find*PolyAll
#M  FindPrimitivePolyAll2 (<m>)
#M  FindPrimitivePolyAll (<K>, <m>)
#M  FindIrreduciblePolyAll2 (<m>)
#M  FindIrreduciblePolyAll (<K>, <m>)
#M  FindMonicIrreduciblePolyAll (<K>, <m>)
#M  FindMonicIrreducibleNotPrimitivePolyAll(<K>, <m>)
##
##  <#GAPDoc Label="FindPoly">
##  <ManSection>
##  <Meth Name="FindPrimitivePolyAll" Arg="K, m"/>
##  <Meth Name="FindIrreduciblePolyAll" Arg="K, m"/>
##  <Meth Name="FindPrimitivePolyAll2" Arg="m"/>
##  <Meth Name="FindIrreduciblePolyAll2" Arg="m"/>
##  <Meth Name="FindMonicIrreduciblePolyAll" Arg="K, m"/>
##  <Meth Name="FindMonicIrreducibleNotPrimitivePolyAll" Arg="K, m"/>
##  <Description>
##  Exhanustive search methods for defining polynomials of degree <A>m</A>,
##  they only differ in search critera: primitive, irreducible, irreducible
##  not primitive, monic irreducible, monic irreducible not primitive.
##  <Ref Oper="IsPrimitivePolynomial" BookName="ref"/>,
##  <Ref Oper="IsIrreducibleRingElement" BookName="ref"/>,  and
##  <Ref Oper="PolynomialRing" BookName="ref"/>. <P/>
##  <C>FindPrimitivePolyAll2</C> and <C>FindIrreduciblePolyAll2</C> search
##  over ground field <M>{\mathbb F_2}</M>,
##  and <C>FindPrimitivePolyAll</C> and <C>FindIrreduciblePolyAll</C> over
##  arbitrary field <A>K</A>. <P/>
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##

DeclareOperation("FindPrimitivePolyAll2", [IsPosInt]); #tst
DeclareOperation("FindPrimitivePolyAll",  [IsField,IsPosInt]); #tst
DeclareOperation("FindIrreduciblePolyAll2", [IsPosInt]);#tst
DeclareOperation("FindIrreduciblePolyAll",  [IsField,IsPosInt]); #tst
DeclareOperation("FindMonicIrreduciblePolyAll",  [IsField,IsPosInt]); #tst
DeclareOperation("FindMonicIrreducibleNotPrimitivePolyAll",  [IsField,IsPosInt]); #tst



Print("findPoly.gd OK,\t");
#E  search.gd  . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
