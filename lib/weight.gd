#############################################################################
##
##
#W  weight.gd          The FFCSA Package                   Nusa
##
## NOTE: need to install alt. methods for bigger fields, FFE will break!!!
## TODO: same with basis so that you can tell exactly the HW of components
## once over extension fields !!!!
## TODO: subexpression elimiation variants based on Gaussian elimination


##DeclareSynonym("IsFFESqMatrix", IsRectangularTable and IsFFECollColl);
# not working for method selection :(

#############################################################################
##
#F  WeightMatrixBoth( <M>) . . . . . . . . retrns the Hamming Weights of matrix
##
##  <#GAPDoc Label="WeightMatrixBoth">
##  <ManSection>
##  <Meth Name="WeightMatrixBoth" Arg="M"/>
##  <Meth Name="WeightMatrixMaxRow" Arg="M"/>
##  <Meth Name="WeightMatrix" Arg="M"/>
##
##  <Description>
##  <C>WeightMatrixBoth</C> returns the Hamming Weights (HW) of matrix <A>M</A>
##  over a finite field.<P/>
##  <C>WeightMatrixMaxRow</C> retrns the Hamming Weight of matrix <A>M</A>
##  over a finite field.<P/>
##  <C>WeightMatrix</C> returns the Hamming Weight of matrix <A>M</A> over a
##  finite field.<P/>
##  Returned values are the maximal row HW (naive estimate for the circuit delay)
##  and the HW of the the entire matrix (naive estimate for the circuit area).
##  Estimates are naive because they do not account for subexpression eliminations.
##  <P/>Methods are using <Ref Oper="WeightVecFFE" BookName="ref"/>
##  <Cite Key="gapX" Where="(23.6-1)"/>.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>

DeclareOperation( "WeightMatrixBoth" , [ IsFFECollColl]);
DeclareOperation( "WeightMatrix" , [IsFFECollColl]);
DeclareOperation( "WeightMatrixMaxRow" , [IsFFECollColl]);



#############################################################################
##
#F  WeightPolynomial( <f>) . . . . Hamming Weight of coeff. vector of polynomial
##
##  <#GAPDoc Label="WeightPolynomial">
##  <ManSection>
##  <Meth Name="WeightPolynomial" Arg="f"/>
##
##  <Description>
##  returns the Hamming Weight (HW) of the coefficient vector of univariate
##  polynomial <A>f</A>. For polynomials used as (N)LFSR feedbacks, the
##  HW gives an estimate of both circuit delay and area.<P/>
##  Method is using <Ref Oper="WeightVecFFE" BookName="ref"/>
##  <Cite Key="gapX" Where="(23.6-1)"/>.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation( "WeightPolynomial" , [IsUnivariatePolynomial]);


Print("weight.gd OK,\t");
#E  weight.gd  . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
