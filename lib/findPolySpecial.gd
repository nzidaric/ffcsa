#############################################################################
##
##
#W search.gd          TowerFields Package                  Nusa
##
##  Declaration file
##




#############################################################################
##
#F  FindPrimitiveLFSRPolyFixed( <output>,  <f>,  <poly> ) . . . . . . . . finds primitive polys
##
##return a list of powers for which the poly l(x)=poly+s  is primitive
##  <#GAPDoc Label="FindPrimitivePolyFixedTaps">
##  <ManSection>
##  <!--<Func Name="FindPrimitivePolyFixedTapsList" Arg="of, F, poly, explist"/>-->
##  <Func Name="FindPrimitivePolyFixedTaps*" Arg="of, F, poly"/>
##  <Func Name="FindPrimitivePolyFixedMinArea*" Arg="of, F, poly"/>
##  <Func Name="FindPrimitivePolyFixedMinDelay*" Arg="of, F, poly"/>
##
##  <Description>
##
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "FindPrimitivePolyFixedTapsList" );
DeclareGlobalFunction( "FindPrimitivePolyFixedTaps" );
DeclareGlobalFunction( "FindPrimitivePolyFixedMinArea" );
DeclareGlobalFunction( "FindPrimitivePolyFixedMinDelay" );

DeclareGlobalFunction( "FindPrimitivePolyFixedTapsIgnoreConjugates" );
DeclareGlobalFunction( "FindPrimitivePolyFixedMinAreaIgnoreConjugates" );
DeclareGlobalFunction( "FindPrimitivePolyFixedMinDelayIgnoreConjugates" );


Print("findPolySpecial.gd OK,\t");

#E  search.gd  . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
