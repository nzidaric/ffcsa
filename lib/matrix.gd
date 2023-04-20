#############################################################################
##
##
#W matrix.gd          The FFCSA Package               Nusa
##


#############################################################################
##
#M  MatrixMultByConst( <B>, <C> ) . . . matrix for multiplication with const
##
##  <#GAPDoc Label="MatrixMultByConst">
##  <ManSection>
##  <Meth Name="MatrixMultByConst" Arg="B, C"/>
##
##  <Description>
##  returns <M>m\times m</M> matrix <A>M</A> for multiplication with constant
##  <A>ffe</A> <A>C</A>.
##  To be used as a matrix-vector multiplier <M>M\cdot [A]_{B}</M> for the
##  product <M>[C\cdot A]_B</M>, where <A>A</A> is an aribtrary
##  <A>ffe</A> represented in basis <A>B</A>.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>

DeclareOperation("MatrixMultByConst",[IsBasis, IsFFE]);

#############################################################################
##
#M  TransitionMatrix( <B1>, <B2> ) . . . . . . transition matrix from B1 to B2
##
##  <#GAPDoc Label="TransitionMatrix">
##  <ManSection>
##  <Meth Name="TransitionMatrix" Arg="B1, B2"/>
##
##  <Description>
##  returns <M>m\times m</M> transition matrix <M>T</M> from basis <A>B1</A>
##  to basis <A>B2</A>.
##  To be used as a matrix-vector multiplier for basis transiotion
##  <M>T\cdot [A]_{B1}</M> to obtain <M>[A]_{B2}</M>, where <A>A</A> is
##  an aribtrary <A>ffe</A>.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>

DeclareOperation( "TransitionMatrix" , [IsBasis, IsBasis]);
# REMOVED : DeclareOperation( "TransitionMatrixNC" , [IsBasis, IsBasis]);

#############################################################################
##
#M  ReductionMatrix( <f> ) . . . . . reduction w.r.t. defining poly f
##
##  <#GAPDoc Label="ReductionMatrix">
##  <ManSection>
##  <Meth Name="ReductionMatrix" Arg="f"/>
##  <Meth Name="ReductionMatrixIR" Arg="f"  />
##  <Meth Name="ReductionMatrixDownto" Arg="f" Label="for downto PB"/>
##  <Meth Name="ReductionMatrixRI" Arg="f"  />
##
##  <Description>
##  <C>ReductionMatrix</C> returns <M>m\times (m-1)</M> reduction matrix <M>R</M>
##  w.r.t. <E>direction to</E>.
##  Columns of <M>R</M> are the elements <M>[\omega^m]</M>,
##  <M>[\omega^{m+1}]</M>, ..., <M>[\omega^{2m-2}]</M>.
##  <C>ReductionMatrixIR</C> returns the <M>m\times (2m-1)</M> matrix
##  <M>[I|R]</M>: columns of identity matrix <M>I</M> followed by the columns of
##  <C>R=ReductionMatrix(f)</C>. <P/>
##  <C>ReductionMatrixDownto</C> returns <M>m\times (m-1)</M> reduction matrix
##  <M>R</M> w.r.t. <E>direction downto</E>.
##  Columns of <M>R</M> are the elements <M>[\omega^{2m-2}]</M>,
##  <M>[\omega^{m+1}]</M>, ...,  <M>[\omega^m]</M>.
##  <C>ReductionMatrixRI</C> returns the <M>m\times (2m-1)</M> matrix
##  <M>[R|I]</M>: columns of <C>R=ReductionMatrixDownto(f)</C> followed
##  by the columns of identity matrix <M>I</M>.

##  </Description>
##  </ManSection>
##  <#/GAPDoc>

DeclareOperation( "ReductionMatrix", [ IsUnivariatePolynomial]);
DeclareOperation( "ReductionMatrixDownto", [ IsUnivariatePolynomial]);

DeclareOperation( "ReductionMatrixIR", [ IsUnivariatePolynomial]);
DeclareOperation( "ReductionMatrixRI", [ IsUnivariatePolynomial]);

#############################################################################
##
#M  MatrixU( <B> ) . . . . . Matrix U w.r.t. basis B
##
##  <#GAPDoc Label="MatrixU">
##  <ManSection>
##  <Meth Name="MatrixU" Arg="B"/>
##  <Meth Name="MatrixUi" Arg="B, i"/>
##  <Description>
##  <C>MatrixU</C> returns the $m\times m$ matrix <M>U</M> with components
##  <M>u_{i,j}=[\rho^{(j)}\cdot A]_{(i)}</M>. <C>MatrixUi</C> returns the
##  <M>i</M>-th component of  matrix <M>U</M>.
##  REF to Generalized Algo section for details!!!!<P/>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##

DeclareOperation( "MatrixU", [ IsBasis]);
DeclareOperation( "MatrixUi", [ IsBasis, IsInt]);

#############################################################################
##
#M  MatrixM( <B> ) . . . . . Matrix M w.r.t. basis B
##
##  <#GAPDoc Label="MatrixM">
##  <ManSection>
##  <Meth Name="MatrixM" Arg="B"/>
##  <Meth Name="MatrixMi" Arg="B, i"/>
##  <Description>
##  <C>MatrixM</C> returns the <M>m\times m</M> matrix <M>M</M> with components
##  <M>m_{j,k}=[\beta^{2^j+2^k}]</M> w.r.t. the normal basis
##  <M>B=\{\beta, \beta^2,\dots,\beta^{2^{m-1}}\} </M>.
##  <C>MatrixMi</C> returns the <M>i</M>-th component of  matrix <M>M</M>.
##  REF to Massey-Omura Algo section for details!!!!<P/>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareOperation( "MatrixM", [ IsBasis]);
DeclareOperation( "MatrixMi", [ IsBasis, IsInt]);


#############################################################################
##
#M  SRmatrix( <M>, <m> ) . . .  matrix M shifted to the right
#M  TSRTmatrix( <MNT>, <m> ) . . . unified matrix for the MTN>>MNT block
##
##  <#GAPDoc Label="SRmatrix">
##  <ManSection>
##  <Meth Name="SRmatrix" Arg="M, m"/>
##  <Meth Name="TSRTmatrix" Arg="M, m"/>
##
##  <Description>
##  <C>SRmatrix</C> returns a shifted version of matrix <A>M</A>, whose columns
##  have been shifted cyclically by <A>m</A> positions. <P/>
##  <C>TSRTmatrix</C> computes a single matrix to preform basis transition
##  followed by shift followed by basis transition. Hardware equivalent:
##  transition to NB, perform exponentioations to <M>2^m</M>, transition
##  back to original basis.##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation( "SRmatrix", [ IsFFECollColl, IsPosInt]);
DeclareOperation( "TSRTmatrix",[ IsFFECollColl, IsPosInt]);

## TODO
#DeclareOperation( "SLmatrix", [ IsFFECollColl, IsPosInt]);
#DeclareOperation( "TSLTmatrix",[ IsFFECollColl, IsPosInt]);


Print("matrix.gd OK,\t");
#E  matrix.gd  . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
