#############################################################################
##
##
#W  nb.gd           The FFCSA Package                Nusa
##
##  Declaration file

#############################################################################
##
#O  IsONBI( <m>, <q>) . . . . . . . . checks if an ONB type I exists for GF(q^m)
##
##  <#GAPDoc Label="IsONBI">
##  <ManSection>
##  <Meth Name="IsONBI" Arg="m, q"/>
##  <Meth Name="IsONBI" Arg="F" Label="f.f."/>
##
##  <Description>
##  Based on <Cite Key="mullen" Where="(5.3.6)"/> and
##  <Cite Key="desch" Where="(8.6)"/> the following
##  condition on <M>m</M> and <M>q</M> is used to determine if
##  an optimal normalbasis of type I exists for the finite field
##  <M>{\mathbb F}_{q^m}/{\mathbb F}_q</M>:
##  <List>
##  <Item>  <M>m+1</M> is a prime and </Item>
##  <Item>  <M>q</M> is a primitive element modulo <M>m+1</M>, </Item>
##  </List>
##  computed using <Ref Oper="IsPrimitiveRootMod" BookName="ref"/>
##  (i.e., the multiplicative order of <M>q</M> modulo <M>m+1</M> is <M>m</M>).
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("IsONBI", [IsPosInt,IsPosInt] );#tst
DeclareOperation("IsONBI", [IsField] );#tst

#############################################################################
##
#O  IsONBII( <m>, <q>) . . . . .  . checks if an ONB type II exists for GF(2^m)
##
##  <#GAPDoc Label="IsONBII">
##  <ManSection>
##  <Meth Name="IsONBII" Arg="m, q"/>
##  <Meth Name="IsONBII" Arg="F" Label="f.f."/>
##
##  <Description>
##  returns true or false.
##  Based on <Cite Key="mullen" Where="(5.3.6)"/> and
##  <Cite Key="desch" Where="(8.6)"/> the following
##  condition on <M>m</M> and <M>q</M> is used to determine if
##  an optimal normalbasis of type I exists for the finite field
##  <M>{\mathbb F}_{2^m}/{\mathbb F}_2</M>:
##  <List>
##  <Item> <M>2m+1</M> is a prime and </Item>
##  <Item> either
##  <List>
##  <Item> <M>2</M> is a primitive element modulo <M>2m+1</M>, or</Item>
##  <Item> <M>2m+1\equiv 3\pmod 4</M> and multiplicative order of 2
##  modulo  <M>2m+1</M> is <M>m</M>,</Item>
##  </List>
##  </Item>
##  </List>
##  computed using <Ref Oper="IsPrimitiveRootMod" BookName="ref"/>
##  and <Ref Oper="OrderMod" BookName="ref"/>.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("IsONBII", [IsPosInt,IsPosInt]);#tst
DeclareOperation("IsONBII", [IsField] );#tst

#############################################################################
##
#O  IsNormalFFE( <f>, <elm>) . . . checks if elm is a normal element of the f.f.
##
##  <#GAPDoc Label="IsNormalFFE">
##  <ManSection>
##  <Meth Name="IsNormalFFE" Arg="K, f, ffe"/>
##  <Meth Name="IsNormalFFE" Arg="F, ffe"/>
##  <Meth Name="IsNormalFFE" Arg="f, ffe"/>
##  <Meth Name="IsNormalFFEB" Arg="K, f, ffe"/>
##  <Meth Name="IsNormalFFEB" Arg="F, ffe"/>
##  <Meth Name="IsNormalFFEB" Arg="f, ffe"/>
##
##  <Description>
##  returns true or false. Field <A>K</A>=<M>{\mathbb F}_{q}</M>
##  (if not explicitly given, then <A>q=2</A> is used),
##  <A>f</A> is a defining polynomial of degree <A>m</A>, and
##  <A>F</A>=<M>{\mathbb F}_{q^m}</M>.<P/>
##  Based on <Cite Key="mullen" Where="(5.2.11)"/>:
##  element <A>ffe</A>=<M>\alpha\in{\mathbb F}_{q^m}</M> define
##  <Display>T_{\alpha}(x)=\sum_{i=0}^{m-1}\sigma^i(\alpha)x^i\;
##  \in{\mathbb F}_{2^m}[x] </Display>
##  Element <M>\alpha\in{\mathbb F}_{q^m}</M> is normal over
##  <M>{\mathbb F}_q</M> if and only if  <M>\gcd(T_{\alpha}(x),  x^m-1)=1</M>
##  in <M>{\mathbb F}_{q^m}[x]</M>. <P/>
##  The <C>IsNormalFFEB</C> are the basis methods (suffix <C>B</C>),
##  they compute the set <A>S</A>
##  of conjugates of <A>ffe</A> and tie it to the field as <C>Basis(F,S)</C>;
##  the latter is only succesful, if <A>ffe</A>  is indeed a normal element
##  (for details see <Ref Oper="Basis" BookName="ref"/>).
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
#DeclareOperation( "IsNormalFFE", [IsUnivariatePolynomial, IsFFE]);
# note: IsFFE returns true only as long as field size < 2^16 (those are using zechs log rep)
# GF(2^17) is already using polynomial rep and IsFFE(elm) will return false
## first one is the fastest one - USE FOR EXH SEARCH (fastest one)
DeclareOperation( "IsNormalFFE", [IsField, IsUnivariatePolynomial, IsRingElement]);#tst
DeclareOperation( "IsNormalFFE", [IsUnivariatePolynomial, IsRingElement]);#tst
DeclareOperation( "IsNormalFFE", [IsField, IsRingElement]);#tst
DeclareOperation( "IsNormalFFEB", [IsField, IsUnivariatePolynomial, IsRingElement]);#tst
DeclareOperation( "IsNormalFFEB", [IsField, IsRingElement]);#tst
DeclareOperation( "IsNormalFFEB", [IsUnivariatePolynomial, IsRingElement]);#tst

#############################################################################
##
#O  MultiplicationTableT( <B> ) . . . . . multiplication table for a NB
##
##  <#GAPDoc Label="MultiplicationTableT">
##  <ManSection>
##  <Meth Name="MultiplicationTableT" Arg="B"/>
##  <Meth Name="ComplexityOfT" Arg="T"/>
##
##  <Description>
##  <C>MultiplicationTableT</C> returns the multiplication table
##  for the first element in basis <A>B</A>.<P/>
##  <C>ComplexityOfT</C> returns the number of nonzero entries in <A>T</A>
##  using <Ref Oper="WeightMatrix"/>.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("MultiplicationTableT", [IsBasis]);#tst
DeclareOperation("ComplexityOfT", [IsBasis]);#tst

Print("nb.gd OK,\t");
#E  nb.gd  . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
