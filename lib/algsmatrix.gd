#############################################################################
##
##
#W algsmatrix.gd          The FFCSA Package               Nusa
##
##  Declaration file
##
#Y
#Y
##



##  <#GAPDoc Label="MultEvecMatrix">
##  <ManSection>
##  <Meth Name="MultEvecMatrix" Arg="vec1, M"/>
##  <Meth Name="MultMatrixEvec" Arg="M, vec2"/>
##  <Meth Name="MultEvecMatrixEvec" Arg="vec1, M, vec2"/>
##  <Description>
##  left and right multiplications of vectors and matrices, returning
##  <A>vec1*M</A>, <A>M*vec2</A>, and <A>vec1*M*vec2</A>, respectively.
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
##   
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
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
##  <Meth Name="MatrixExpression" Arg="M, vec"/>
##  <Meth Name="MatrixUExpression" Arg="M, vec2"/>
##  <Meth Name="MatrixMExpression" Arg="B1, B2, vec2"/>
##  <Description>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation( "MatrixExpression", [ IsFFECollCollColl and  IsRectangularTable, IsVector]);
DeclareOperation( "MatrixUExpression", [ IsBasis, IsVector]);
DeclareOperation( "MatrixMExpression", [ IsBasis, IsVector]); # do NOT use for product !!!!
# jsut for the expression - ie theoretically !


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
##  <Meth Name="FFA_exp_matrixU" Arg="B, avec, bvec"/>
##  <Meth Name="FFA_inv_matrixU" Arg="B, avec, bvec"/>
##  <Description>
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
##  <Description>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation( "FFA_mult_matrixM", [  IsBasis, IsVector, IsVector]);
DeclareOperation( "FFA_mult_matrixM", [  IsUnivariatePolynomial ]);
DeclareOperation( "FFA_mult_matrixMi", [  IsBasis, IsVector, IsVector, IsInt]);


Print("algsmatrix.gd OK,\t");



#E  matrix.gd  . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
