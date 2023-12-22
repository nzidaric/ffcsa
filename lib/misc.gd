#############################################################################
##
##
#W  misc.gd           The FFCSA Package                Nusa
##
##  Declaration file
##

#############################################################################
##
#O removed GetWorG( <f>) . . . .  return root or gen
## REPLACED BY GeneratorOfField
# removed DeclareOperation( "MinimalPolynomial" ,[ IsFFE]);
# must use: MinimalPolynomial(F,ffe) ... ALREADY EXISTS IN GAP !!!!

#############################################################################
##
#O  CCLeaders( <p>, <m> ) . . . . . returns coset leaders modulo p^m-1
##
##  <#GAPDoc Label="CCLeaders">
##  <ManSection>
##  <Meth Name="CCLeaders" Arg="p, m"/>
##
##  <Description>
##  Based on <Cite Key="sdgc" Where="(3.18)"/>, a (cyclotomic) coset <M>C_s</M>
##  modulo <M>p^m-1</M>   is defined to be
##  <Display>C_s=\{s, sp, \dots, sp^{m_s-1}\},</Display>
##  where <M>m_s</M> is the smallest positive integer such that
##  <M>s\equiv sp^{m_s}\,({\rm mod }p^m-1)</M>. The subscript <M>s</M> is chosen as
##  the smallest integer in <M>C_s</M>, and $s$ is called the
##  <E>coset leader</E> of <M>C_s</M>.
##  <C>CCLeaders</C> returns a list of coset leaders in
##  <M>{\mathbb Z}_{p^m-1}</M>.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation( "CCLeaders" ,[ IsPosInt, IsPosInt]);#tst

#############################################################################
##
#O  PolyPhi( K, <f>) . . . . . . poly phi
##
##  <#GAPDoc Label="PolyPhi">
##  <ManSection>
##  <Meth Name="PolyPhi" Arg="K, f "/>
##
##  <Description>
##  Based on <Cite Key="mullen" Where="(2.1.111)"/> and
##  For <M>f\in{\mathbb F}_q[x]</M>, the finite field polynomial
##  <M>{\Phi}</M> function, <M>{\Phi}_q(f)</M>, denotes
##  the number of polynomials over <M>{\mathbb F}_q</M>, which are of
##  smaller degree than degree of <A>f</A> and which are relatively prime
##  to <A>f</A>.
##
##  Method <Ref Func="PolyPhi" /> is implemented using properties of
##  <M>{\Phi}_q</M> and the existing GAP methods
##  <Ref Oper="Factors" BookName="ref"/> and
##  <Ref Oper="PolynomialRing" BookName="ref"/>
##  <Cite Key="gapX" Where="(66.10-1)"/> and <Cite Key="gapX" Where="(66.15-1)"/>.
##  to obtain factorization <M>f=\prod_i f_i^{c_i}</M>, where <M>f_i</M>
##  are irreducible, <M>\deg(f_i)=n_i</M> and <M>c_i</M> is the
##  multiplicity of <M>f_i</M>. Properties of <M>{\Phi}_q</M> used
##  <Cite Key="menezesFF" Where="(pp.9)"/>:
##  <List>
##  <Item>if <M>\gcd(f_i, f_j)=1</M> then
##  <M>{\Phi}_q(f_if_j)={\Phi}_q(f_i){\Phi}_q(f_j)</M>
##  </Item>
##  <Item>if <M>f_i</M> is irreducible of degree <M>n_i</M>
##  then <M>{\Phi}_q(f_i^{c_i})= q^{n_ic_i}-q^{n_i(c_i-1)}</M>
##  </Item>
##  </List>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation( "PolyPhi" , [IsField,IsUnivariatePolynomial]);#tst

#############################################################################
##
#O  NrNormalFFE( <K>, <m>) . . . . . . number of normal elements in f.f.
##
##  <#GAPDoc Label="NrNormalFFE">
##  <ManSection>
##  <Meth Name="NrNormalFFE" Arg="K, m "/>
##  <Meth Name="NrNormalFFEIgnoreConjugates" Arg="K, m "/>
##
##  <Description>
##  <C>NrNormalFFE</C> returns the number of normal elements in field extension of degree <A>m</A>
##  over the finite field <A>K</A><M>={\mathbb F}_q</M> using method
##  <Ref Meth="PolyPhi" />, that is the polynomial <M>{\Phi}_q</M> function,
##  on <A>K</A> and <M>x^m-1</M>:   <M>{\Phi}_q(x^m-1)</M>
##  <Cite Key="mullen" Where="(5.2.8)"/>.<P/>
##  <C>NrNormalFFEIgnoreConjugates</C> returns <M>\frac{1}{m}{\Phi}_q(x^m-1)</M>
##   <Cite Key="menezesFF" Where="(4.14)"/>.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>

DeclareOperation( "NrNormalFFE" , [IsField,IsPosInt]); #tst
DeclareOperation( "NrNormalFFEIgnoreConjugates" , [IsField,IsPosInt]);#tst

#############################################################################
##
#O  NrIrreduciblePoly( <K>, <m>) . . . # of irred. polys of degree m over f.f. K
##
##  <#GAPDoc Label="NrIrreduciblePoly">
##  <ManSection>
##  <Meth Name="NrIrreduciblePoly" Arg="K, m "/>
##  <Meth Name="NrPrimitivePoly" Arg="K, m "/>
##  <Meth Name="NrIrreducibleNotPrimitivePoly" Arg="K, m "/>
##
##  <Description>
##  <C>NrIrreduciblePoly</C> returns the number of monic irreducible polynomials
##  of degree <A>m</A> over the finite field <A>K</A>, computed as
##  <Math>I_q(m)=\frac{1}{m}\sum_{d|m}\mu(d)q^{\frac{m}{d}}</Math> by
##  <Cite Key="mullen" Where="(3.1.2)"/>, where
##  <M>\mu</M> is the Mobius function <Ref Oper="MoebiusMu" BookName="ref"/>
##  <Cite Key="gapX" Where="(15.5-3)"/>.<P/>
##	<C>NrPrimitivePoly</C> returns the number of primitive polynomials
##  of degree <A>m</A> over the finite field <A>K</A>, computed
##  using Euler <M>{\phi}</M> function as  <Math>\frac{1}{m}{\Phi}(q^m-1)</Math>
##  <Cite Key="mullen" Where="(4.1.3)"/>, where
##  <M>\Phi</M> is the Euler function
##  <Ref Oper="Phi" BookName="ref"/>
##  <Cite Key="gapX" Where="(15.2-2)"/>.<P/>
##  <C>NrIreducibleNotPrimitivePoly</C> returns the number of irreducible but
##  not primitive polynomials of degree <A>m</A> over the finite field <A>K</A>.<P/>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
## tests crosschecked with Green et al, Proc IEE,vol121,no9, 1974

DeclareOperation( "NrIrreduciblePoly" , [IsField,IsPosInt]);#tst
DeclareOperation( "NrPrimitivePoly" , [IsField,IsPosInt]);#tst
DeclareOperation( "NrIrreducibleNotPrimitivePoly" , [IsField,IsPosInt]);#tst

Print("misc.gd OK,\t");
#E  misc.gd  . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
