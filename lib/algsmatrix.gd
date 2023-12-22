#############################################################################
##
##
#W algsmatrix.gd          The FFCSA Package               Nusa
##
##  Declaration file
##

##  <#GAPDoc Label="MultEvecMatrix">
##  <ManSection>
##  <Meth Name="MultEvecMatrix" Arg="vec1, M"/>
##  <Meth Name="MultMatrixEvec" Arg="M, vec2"/>
##  <Meth Name="MultEvecMatrixEvec" Arg="vec1, M, vec2"/>
##  <Description>
##  These methods are used to generates expressions for left and right
##  multiplications of vectors (elements) and matrices, returning expressions
##  for <A>vec1*M</A>, <A>M*vec2</A>, and <A>vec1*M*vec2</A>, respectively.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation( "MultEvecMatrix", [  IsVector, IsMatrix]);
DeclareOperation( "MultMatrixEvec", [  IsMatrix, IsVector]);
DeclareOperation( "MultEvecMatrixEvec", [ IsVector, IsMatrix, IsVector]);


#############################################################################
##
#F  MatrixMultByConstExpression(  <B> , <C> , <vec>) .
## . . . NB multiplication matrix for constant C
##
##  <#GAPDoc Label="MatrixMultByConstExpression">
##  <ManSection>
##  <Meth Name="MatrixMultByConstExpression" Arg="B, C, vec2"/>
##  <Meth Name="MatrixMultByConstExpression" Arg="M, vec2"/>
##  <Meth Name="TransitionMatrixExpression" Arg="B1, B2, vec2"/>
##  <Description>
##  <C>MatrixMultByConstExpression</C> generates expressions for multiplication
##  with a constant <A>C</A>, using either <Ref Oper="MatrixMultByConst"/>
##  to generate the matrix <A>M</A> of <A>C</A> w.r.t. given basis <A>B</A>,
##  or the precomputed matrix <A>M</A>. Note the method with precomputed
##  matrix does not check if <A>M</A> belongs to any constant, it simply returns
##  <A>M*vec</A>.<P/>
##  <C>TransitionMatrixExpression</C> generates expressions for transition
##  between two bases by first generating the transition matrix <A>T</A>with
##  method <Ref Oper="TransitionMatrix"/> and then returning <A>T*vec</A>.


##  <Example>
##  <![CDATA[
##  gap> K := GF(2);; x:= X(K, "x");;
##  gap> f:= x^2 + x + 1;; F := FieldExtension(K, f);;
##  gap> alfa := RootOfDefiningPolynomial(F); NB1 := GenerateNB(F, alfa);
##  Z(2^2)
##  Basis( GF(2^2), [ Z(2^2), Z(2^2)^2 ] )
##  gap> g := x^2 + x + alfa;; G := FieldExtension(F, g);;
##  gap> beta := RootOfDefiningPolynomial(G); NB2 := GenerateNB(G, beta);
##  Z(2^4)
##  Basis( AsField( GF(2^2), GF(2^4) ), [ Z(2^4), Z(2^4)^4 ] )
##  gap> ChooseFieldElms(G);
##
##  variables
##  [ "a_0", "a_1" ]
##  [ "b_0", "b_1" ]
##  [ "d_0", "d_1", "d_2" ]
##  gap> MatrixMultByConstExpression(NB2, beta^3, avec);
##  [ a_1, a_0+Z(2^2)^2*a_1 ]
##  ]]>
##  </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##  <NewPage>
DeclareOperation( "MatrixMultByConstExpression" , [IsBasis, IsFFE, IsVector]);
DeclareOperation( "MatrixMultByConstExpression" , [IsMatrix, IsVector]);
DeclareOperation( "TransitionMatrixExpression" , [IsBasis, IsBasis, IsVector]);


#############################################################################
##
#F  MatrixExpression(  <B> , <C> , <vec>) .
## . . . NB multiplication matrix for constant C
##
##  <#GAPDoc Label="MatrixExpression">
##  <ManSection>
##  <Meth Name="MatrixUExpression" Arg="B, vec"/>
##  <Meth Name="MatrixMExpression" Arg="B, vec"/>
##  <Description>
##  These methods generate a matrix whose entries are expressions with variables
##  from <A>vec</A>. The expressions are generated using <Ref Oper="MatrixU"/>
##  or <Ref Oper="MatrixM"/>, respectively.


##  <Example>
##  <![CDATA[
##  gap> K := GF(2);; x := X(K, "x");;
##  gap> f := x^4+x^3+x^2+x+1;; F := FieldExtension(K,  f);;
##  gap> alfa := RootOfDefiningPolynomial(F); PB := GeneratePB(F,alfa);
##  Z(2^4)^3
##  Basis( GF(2^4), [ Z(2)^0, Z(2^4)^3, Z(2^4)^6, Z(2^4)^9 ] )
##  gap> ChooseFieldElms(F);
##
##  variables
##  [ "a_0", "a_1", "a_2", "a_3" ]
##  [ "b_0", "b_1", "b_2", "b_3" ]
##  [ "d_0", "d_1", "d_2", "d_3", "d_4", "d_5", "d_6" ]
##  gap> MatrixUExpression(PB, avec);
##  [ [ a_0, a_3, a_2+a_3, a_1+a_2 ], [ a_1, a_0+a_3, a_2, a_1+a_3 ],
##    [ a_2, a_1+a_3, a_0+a_2, a_1 ], [ a_3, a_2+a_3, a_1+a_2, a_0+a_1 ] ]
##  gap> NB := GenerateNB(F, alfa);
##  Basis( GF(2^4), [ Z(2^4)^3, Z(2^4)^6, Z(2^4)^12, Z(2^4)^9 ] )
##  gap> MatrixMExpression(NB, avec);
##  Warning: if used as expression then only to get the expressions for M matrix
##  with basis element entries or use vec = BasisVectors to get actual M entries,
##  then multiply
##  [ [ a_1, a_3, a_0+a_1+a_2+a_3, a_2 ], [ a_3, a_2, a_0, a_0+a_1+a_2+a_3 ],
##    [ a_0+a_1+a_2+a_3, a_0, a_3, a_1 ], [ a_2, a_0+a_1+a_2+a_3, a_1, a_0 ] ]
##  ]]>
##  </Example>

##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation( "MatrixExpression", [ IsFFECollCollColl and  IsRectangularTable, IsVector]);
DeclareOperation( "MatrixUExpression", [ IsBasis, IsVector]);
DeclareOperation( "MatrixMExpression", [ IsBasis, IsVector]); # do NOT use for product !!!!
# jsut for the expression - ie theoretically !
#<M>\mathcal{F}/\mathcal{K}</M>

#############################################################################
##
#F   FFA_mult_convolution(  <B> , <C> , <vec>) .
## . . .
##  <#GAPDoc Label="FFA_mult_convolution">
##  <ManSection>
##  <Meth Name="FFA_mult_convolution" Arg="avec, bvec"/>
##  <Meth Name="ReductionMatrixExpression" Arg="f, dvec"/>
##  <Meth Name="ReductionMatrixExpressionDownto" Arg="f, dvec"/>
##  <Meth Name="FFA_mult_2stepClassic" Arg="f, avec, bvec, dir"/>
##  <Meth Name="FFA_mult_2stepClassic" Arg="f, dir"/>
##  <Description>
##  Methods in this section are generate expressions needed to implement
##  the two-step classic multiplication (school-book multiplication) of two
##  elements from <M>{\mathbb F}_{q}[x]/(f(x))</M>, where <M>deg(f(x))=m</M>.
##  The first step, method <C>FFA_mult_convolution</C>, computes the
##  (intermediate) product
##  <M>d(x)=a(x)\cdot b(x)</M>, and the higest possible degree of <M>d(x)</M> is
##  <M>2m-2</M>. The second step is the reduction <M>c(x)=d(x)\,mod f(x)</M>. It
##  depends on the direction and is using methods <Ref Oper="ReductionMatrixIR"/>
##  and <Ref Oper="ReductionMatrixRI"/>, respectively. Care is needed with
##  direction when methods are used separately.
##  <C>FFA_mult_2stepClassic</C> methods return final expressions for
##  multiplication, e.i., the component functions
##  <M>c_i=f_i(a_0,\dots,a_{m-1},b_0,\dots,b_{m-1})</M>  for each component
##  of the product.
##  <Example>
##  <![CDATA[
##  gap> K := GF(2);; x := X(K, "x");;
##  gap> f := x^4 + x + 1;; F := FieldExtension(K,  f);;
##  gap> alfa := RootOfDefiningPolynomial(F); PB := GeneratePB(F,alfa);
##  Z(2^4)
##  Basis( GF(2^4), [ Z(2)^0, Z(2^4), Z(2^4)^2, Z(2^4)^3 ] )
##  gap> ChooseFieldElms(F);
##
##  variables
##  [ "a_0", "a_1", "a_2", "a_3" ]
##  [ "b_0", "b_1", "b_2", "b_3" ]
##  [ "d_0", "d_1", "d_2", "d_3", "d_4", "d_5", "d_6" ]
##  gap> M := FFA_mult_convolution(avec,bvec);; for i in M do Display(i); od;
##  a_0*b_0
##  a_0*b_1+a_1*b_0
##  a_0*b_2+a_1*b_1+a_2*b_0
##  a_0*b_3+a_1*b_2+a_2*b_1+a_3*b_0
##  a_1*b_3+a_2*b_2+a_3*b_1
##  a_2*b_3+a_3*b_2
##  a_3*b_3
##  gap> ReductionMatrixExpression(f, dvec);
##  [ d_0+d_4, d_1+d_4+d_5, d_2+d_5+d_6, d_3+d_6 ]
##  gap> M := FFA_mult_2stepClassic(f, "to");; for i in M do Display(i); od;
##
##  variables
##  [ "a_0", "a_1", "a_2", "a_3" ]
##  [ "b_0", "b_1", "b_2", "b_3" ]
##  [ "d_0", "d_1", "d_2", "d_3", "d_4", "d_5", "d_6" ]
##  a_0*b_0+a_1*b_3+a_2*b_2+a_3*b_1
##  a_0*b_1+a_1*b_0+a_1*b_3+a_2*b_2+a_2*b_3+a_3*b_1+a_3*b_2
##  a_0*b_2+a_1*b_1+a_2*b_0+a_2*b_3+a_3*b_2+a_3*b_3
##  a_0*b_3+a_1*b_2+a_2*b_1+a_3*b_0+a_3*b_3
##  ]]>
##  </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation( "MatrixA", [ IsVector]);
DeclareOperation( "FFA_mult_convolution", [ IsVector, IsVector]);

DeclareOperation( "ReductionMatrixExpression",
						[ IsUnivariatePolynomial, IsVector]);
DeclareOperation( "ReductionMatrixExpressionDownto",
						[ IsUnivariatePolynomial, IsVector]);

DeclareOperation( "FFA_mult_2stepClassic",
						[  IsUnivariatePolynomial, IsVector, IsVector, IsString]);
DeclareOperation( "FFA_mult_2stepClassic",
						[  IsUnivariatePolynomial, IsString]);

#############################################################################
##
#F   FFA_mult_matrixU(  <B> , <C> , <vec>) .
## . . .
##  <#GAPDoc Label="FFA_mult_matrixU">
##  <ManSection>
##  <Meth Name="FFA_mult_matrixU" Arg="B, avec, bvec"/>
##  <Meth Name="FFA_sq_matrixU" Arg="B, avec, bvec"/>
##  <Meth Name="FFA_exp_matrixU" Arg="B, avec, e"/>
##  <Meth Name="FFA_inv_matrixU" Arg="B, avec"/>
##  <Description>
##  These methods return final expressions for
##  multiplication, squaring, exponentiation and inversion, respectively.
##  They rely on method <Ref Oper="MatrixU"/> for arbitrary basis.
##  These methods are based on the <E> Generalized algorithm for
##  multiplication</E>  <Cite Key="AHnotes" />. This method produces a
##  matrix-vector multiplier, where one of the factors is merged into the
##  matrix, as shown in example <Ref Oper="MatrixUExpression"/>, and then
##  the matrix is multiplied by the other factor. This algorithm for
##  multiplication is universal: it works for an arbitrary basis.
##
##  <Example>
##  <![CDATA[

##  gap> K := GF(2);; x := X(K, "x");;
##  gap> f := x^4 + x + 1;; F := FieldExtension(K,  f);;
##  gap> alfa := RootOfDefiningPolynomial(F); PB := GeneratePB(F,alfa);
##  Z(2^4)
##  Basis( GF(2^4), [ Z(2)^0, Z(2^4), Z(2^4)^2, Z(2^4)^3 ] )
##  gap> ChooseFieldElms(F);
##
##  variables
##  [ "a_0", "a_1", "a_2", "a_3" ]
##  [ "b_0", "b_1", "b_2", "b_3" ]
##  [ "d_0", "d_1", "d_2", "d_3", "d_4", "d_5", "d_6" ]
##  gap> M := FFA_mult_matrixU(PB, avec, bvec);; for i in M do Display(i); od;
##  a_0*b_0+a_1*b_3+a_2*b_2+a_3*b_1
##  a_0*b_1+a_1*b_0+a_1*b_3+a_2*b_2+a_2*b_3+a_3*b_1+a_3*b_2
##  a_0*b_2+a_1*b_1+a_2*b_0+a_2*b_3+a_3*b_2+a_3*b_3
##  a_0*b_3+a_1*b_2+a_2*b_1+a_3*b_0+a_3*b_3
##  gap> M := FFA_sq_matrixU(PB, avec);; for i in M do Display(i); od;
##  a_0+a_2
##  a_2
##  a_1+a_3
##  a_3
##  gap> M := FFA_sq_matrixU(PB, bvec);; for i in M do Display(i); od;
##  b_0+b_2
##  b_2
##  b_1+b_3
##  b_3
##  gap> M := FFA_exp_matrixU(PB, bvec, 13);; for i in M do Display(i); od;
##  b_0*b_1*b_2+b_0*b_2*b_3+b_1*b_2*b_3+b_0*b_1+b_0*b_3+b_1*b_2+b_0+b_1
##  b_0*b_2*b_3+b_0*b_1+b_0*b_2+b_0*b_3+b_2+b_3
##  b_0*b_1*b_3+b_1*b_2*b_3+b_0*b_1+b_0*b_2+b_0*b_3+b_1*b_2+b_2*b_3+b_1+b_2
##  b_1*b_2*b_3+b_0*b_3+b_1*b_3+b_2*b_3+b_1+b_2+b_3
##  gap> M := FFA_inv_matrixU(PB, avec);; for i in M do Display(i); od;
##  a_0*a_1*a_2+a_1*a_2*a_3+a_0*a_2+a_1*a_2+a_0+a_1+a_2+a_3
##  a_0*a_1*a_3+a_0*a_1+a_0*a_2+a_1*a_2+a_1*a_3+a_3
##  a_0*a_2*a_3+a_0*a_1+a_0*a_2+a_0*a_3+a_2+a_3
##  a_1*a_2*a_3+a_0*a_3+a_1*a_3+a_2*a_3+a_1+a_2+a_3

##  ]]>
##  </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation( "FFA_mult_matrixU", [  IsBasis, IsVector, IsVector]);
DeclareOperation( "FFA_mult_matrixU",
						[  IsUnivariatePolynomial,  IsString, IsString]);

DeclareOperation( "FFA_sq_matrixU", [  IsBasis, IsVector]);
DeclareOperation( "FFA_sq_matrixU",
						[  IsUnivariatePolynomial,  IsString, IsString]);

DeclareOperation( "FFA_exp_matrixU", [  IsBasis, IsVector, IsPosInt]);
DeclareOperation( "FFA_exp_matrixU",
						[  IsUnivariatePolynomial,  IsString, IsString, IsPosInt]);

DeclareOperation( "FFA_inv_matrixU", [  IsBasis, IsVector]);
DeclareOperation( "FFA_inv_matrixU",
						[  IsUnivariatePolynomial,  IsString, IsString]);

#############################################################################
##
#F   FFA_mult_matrixM(  <B> , <C> , <vec>) .
## . . .
##  <#GAPDoc Label="FFA_mult_matrixM">
##  <ManSection>
##  <Meth Name="FFA_mult_matrixM" Arg="B, avec, bvec"/>
##  <Meth Name="FFA_mult_matrixMi" Arg="B, avec, bvec, i"/>
##  <Description>
##  Methods <C>FFA_mult_matrixM</C> and <C>FFA_mult_matrixMi</C> return the
##  expressions for Massey-Omura multiplication  <Cite Key="MO" />.
##  <C>FFA_mult_matrixM</C> returns all <M>m</M> expressions and
##  <C>FFA_mult_matrixMi</C> returns the expression for component <A>i</A>, that
##  is w.r.t. the <M>i</M>-th basis element.
##  Let <M>B=\{\beta, \beta^q, \dots , \beta^{q^{m-1}}\}</M> be a normal basis
##  of  <M>{\mathbb F}_{q^m}/{\mathbb F}_{q}</M>.
##  Using notation from section <Ref Sect="XMLmatrix" />, the product
##  can be expressed as
##  <M>c=[a]_B\cdot B^T \cdot B\cdot [b]_B^T</M> and matrix <M>M</M> defined as
##  <M>M=B\cdot B^T=[\beta^{q^i+q^j}]_{i,j=0}^{m-1}</M>.
##  <M>M</M> can also be expressed as a sum of component matrices, i.e.,
##  <M>M=\sum_{i=0}^{m-1}M_i\beta^{q^i}</M>, and the component functions
##  computed as <M>c_i=[a]_B\cdot M_i\cdot [b]_B^T</M>.

##  <Example>
##  <![CDATA[
##  gap> K := GF(2);; x:= X(K, "x");;
##  gap> f:= x^4 + x^3 + 1;; F := FieldExtension(K, f);;
##  gap> beta := RootOfDefiningPolynomial(F); B := GenerateNB(F, beta);
##  Z(2^4)^7
##  Basis( GF(2^4), [ Z(2^4)^7, Z(2^4)^14, Z(2^4)^13, Z(2^4)^11 ] )
##  gap> ChooseFieldElms(F);
##
##  variables
##  [ "a_0", "a_1", "a_2", "a_3" ]
##  [ "b_0", "b_1", "b_2", "b_3" ]
##  [ "d_0", "d_1", "d_2", "d_3", "d_4", "d_5", "d_6" ]
##  gap>
##  gap> M := FFA_mult_matrixM(B, avec, bvec);
##  [ a_0*b_1+a_0*b_2+a_0*b_3+a_1*b_0+a_1*b_2+a_2*b_0+a_2*b_1+a_3*b_0+a_3*b_3,
##  a_0*b_0+a_0*b_1+a_1*b_0+a_1*b_2+a_1*b_3+a_2*b_1+a_2*b_3+a_3*b_1+a_3*b_2,
##  a_0*b_2+a_0*b_3+a_1*b_1+a_1*b_2+a_2*b_0+a_2*b_1+a_2*b_3+a_3*b_0+a_3*b_2,
##  a_0*b_1+a_0*b_3+a_1*b_0+a_1*b_3+a_2*b_2+a_2*b_3+a_3*b_0+a_3*b_1+a_3*b_2 ]
##  gap> M2 := FFA_mult_matrixMi(B, avec, bvec, 2);
##  a_0*b_2+a_0*b_3+a_1*b_1+a_1*b_2+a_2*b_0+a_2*b_1+a_2*b_3+a_3*b_0+a_3*b_2
##  gap> IntMatFFExt(MatrixMi(B,2));
##  [ [ 0, 0, 1, 1 ], [ 0, 1, 1, 0 ], [ 1, 1, 0, 1 ], [ 1, 0, 1, 0 ] ]
##  ]]>
##  </Example>

##  For example <M>B=\{\beta, \beta^2, \beta^4, \beta^8\}</M>, where
##  <M>g(\beta)=0</M> and <M>g(x)=x^4+x^3+1</M>:
##  <Alt Only="LaTeX">\begin{figure}[h!]\centering\includegraphics{writeMO}
##  \end{figure}</Alt>
##  <Alt Only="HTML">&lt;img src="writeMO.jpg" align="center" /></Alt>
##  <Alt Only="Text">/See diagrams in HTML and PDF versions of the manual/</Alt>
##  <P/>
##  <Alt Only="LaTeX">\begin{figure}[h!]\centering\includegraphics{writeMi}
##  \end{figure}</Alt>
##  <Alt Only="HTML">&lt;img src="writeMi.jpg" align="center" /></Alt>
##  <Alt Only="Text">/See diagrams in HTML and PDF versions of the manual/</Alt>

##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation( "FFA_mult_matrixM", [  IsBasis, IsVector, IsVector]);
DeclareOperation( "FFA_mult_matrixM", [  IsUnivariatePolynomial ]);
DeclareOperation( "FFA_mult_matrixMi", [  IsBasis, IsVector, IsVector, IsInt]);


Print("algsmatrix.gd OK,\t");



#E  matrix.gd  . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
