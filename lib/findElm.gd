#############################################################################
##
##
#W  findElm.gd         The FFCSA Package                Nusa
##

#############################################################################
##
#O  FindNormalFFEs( <f>) . . . . . . . . finds all normal elements in a f.f.
##
##  <#GAPDoc Label="FindNormalFFEs">
##  <ManSection>
##  <Meth Name="FindNormalFFEs" Arg="F"/>
##  <Meth Name="FindNormalFFEsNC" Arg="F"/>
##  <Meth Name="FindNormalFFEsB" Arg="F"/>
##  <Meth Name="FindNormalFFEsBNC" Arg="F"/>
##  <Meth Name="FindNormalFFEsIgnoreConjugates" Arg="F"/>
##  <Meth Name="FindNormalFFEsBIgnoreConjugates" Arg="F"/>
##  <Meth Name="FindNormalFFEsBIgnoreConjugatesNC" Arg="F"/>
##
##  <Description>
##  returns <C>pwrlist</C> with all exponents <M>e_i</M> such that <M>g^{e_i}</M>
##  is a normal element in field <A>F</A>, where <A>g</A> is a generator
##  of <A>F</A>. <P/>
##  The methods with suffix <C>B</C> use the basis trick, all other methods
##  use <Ref Meth="IsNormalFFE" /> to test candidates. The methods with suffix
##  <C>NC</C> (NoCheck) skip the check with <Ref Meth="NrNormalFFE" /> to
##  determine all normal elements have been found. The reduced search space
##  methods <C>IgnoreConjugates</C> are using only coset leaders.<P/>
##  Element <A>g</A> is the root of the defining polynomial if primitive,
##  otherwise <A>g</A> is the first element such that <M>order(x)=Size(F)-1</M>.
##  (obtained with <Ref Oper="GeneratorOfField" BookName="fsr"/>).
##  </Description>
##  </ManSection>
##  <#/GAPDoc>

DeclareOperation( "FindNormalFFEs" , [IsField]); #tst
DeclareOperation( "FindNormalFFEsNC" , [IsField]); #tst
DeclareOperation( "FindNormalFFEsB" , [IsField]); #tst
DeclareOperation( "FindNormalFFEsBNC" , [IsField]); #tst
DeclareOperation( "FindNormalFFEsIgnoreConjugates" , [IsField]); #tst
DeclareOperation( "FindNormalFFEsIgnoreConjugatesNC" , [IsField]); #tst
# renamed from "FindNormalFFEsIgnoreConjugatesB"
DeclareOperation( "FindNormalFFEsBIgnoreConjugates" , [IsField]); #tst
DeclareOperation( "FindNormalFFEsBIgnoreConjugatesNC" , [IsField]); #tst

Print("findElm.gd OK,\t");
#E  findElm.gd  . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
