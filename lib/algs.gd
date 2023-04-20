#############################################################################
##
##
#W  algs.gd           The FFCSA Package                Nusa
##

##  <#GAPDoc Label="ChooseFieldElms">
##  <ManSection>
##  <Func Name="ChooseFieldElm" Arg="F"/>
##  <Func Name="ChooseFieldElmdownto" Arg="F"/>
##  <Description>
##  In order to generate the expressions for hardware implementations,
##  the GAP variables $a_i, b_j$ need to be created for symbollic computatioin.
##  Method <C>ChooseFieldElms</C> prepares vectors
##  <M>avec=\left[a_0, \dots , a_{m-1}\right]</M>,
##  <M>bvec=\left[b_0,\dots,b_{m-1}\right]</M>, and
##  <M>dvec=\left[d_0,\dots,d_{2m-2}\right]</M>, with default direction {\tt To},
##  where <M>m=[F:K]</M> is the degree of extension. Vector <M>dvec</M>
##  is needed for the two-step classic multiplication. <P/>
##  Method <C>ChooseFieldElmsDownto</C> creates vectors
##  <M>avec=\left[a_{m-1}, \dots , a_0\right]</M>,
##  <M>bvec=\left[b_{m-1}, \dots , b_0\right]</M>, and
##  <M>dvec=\left[d_{2m-2},\dots,d_0\right]</M>, with default direction {\tt To},
##  Note that <M>a_i, b_j, d_k</M> are not coefficients, but
##  GAP variables to allow symbolic computation.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "UnbindGlobalOld" );
DeclareGlobalFunction( "ChooseFieldElms" );
DeclareGlobalFunction( "ChooseFieldElmsDownto" );

##  <#GAPDoc Label="SLL">
##  <ManSection>
##  <Meth Name="SLL" Arg="vec, i"/>
##  <Meth Name="SRL" Arg="vec, i"/>
##  <Meth Name="SLA" Arg="vec, i"/>
##  <Meth Name="SRA" Arg="vec, i"/>
##  <Meth Name="ROL" Arg="vec, i"/>
##  <Meth Name="ROR" Arg="vec, i"/>
##  <Meth Name="ANDbw" Arg="vec, i"/>
##  <Meth Name="XORbw" Arg="vec, i"/>
##  <Description>
##  Simple vector manipulation functions: left/right logical/arithmetic shift,
##  left/right rotation, bitwise <C>AND</C>, <C>XOR</C>.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
## all of them are in tst, FIX needed for matrices !!!

DeclareOperation("SLL", [IsVector, IsInt]);
DeclareOperation("SLL", [IsList, IsInt]);
DeclareOperation("SRL", [IsVector, IsInt]);
DeclareOperation("SRL", [IsList, IsInt]);

#DeclareOperation("SLA", [IsVector, IsInt]);
DeclareOperation("SLA", [IsList, IsInt]);
#DeclareOperation("SRA", [IsVector, IsInt]);
DeclareOperation("SRA", [IsList, IsInt]);

#DeclareOperation("ROL", [IsVector, IsInt]);
DeclareOperation("ROL", [IsList, IsInt]);
#DeclareOperation("ROR", [IsVector, IsInt]);
DeclareOperation("ROR", [IsList, IsInt]);

##  <#GAPDoc Label="ANDbw">
##  <ManSection>
##  <Meth Name="ANDbw" Arg="vec1, vec2"/>
##  <Meth Name="XORbw" Arg="vec1, vec2"/>
##  <Description>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>


DeclareGlobalFunction( "ANDbw" ); # bitwise and
DeclareGlobalFunction( "XORbw" ); # bitwise xor


DeclareOperation("FFA_trace_PB",
	[  IsUnivariatePolynomial,  IsString]);

Print("algs.gd OK,\t");

#E  algs.gd  . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
