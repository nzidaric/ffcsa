#############################################################################
##
#W    init.g                 The FFCSA Package            
#W
##


#############################################################################
##
#R  Read the declaration files.
##

ReadPackage( "FFCSA", "lib/misc.gd" ); # the misc functions

ReadPackage( "FFCSA", "lib/weight.gd" ); # the hamming weight functions

ReadPackage( "FFCSA", "lib/matrix.gd" ); # the matrix functions

ReadPackage( "FFCSA",  "lib/nb.gd" ); 	# the NB functions

ReadPackage( "FFCSA", "lib/findElm.gd" ); # the search for elements

ReadPackage( "FFCSA", "lib/findPoly.gd" ); # the search for polys

ReadPackage( "FFCSA", "lib/ffbases.gd" );# the basis functions

ReadPackage( "FFCSA", "lib/findElmSpecial.gd" ); # the search for elements

ReadPackage( "FFCSA", "lib/findPolySpecial.gd" ); # the search for polys

ReadPackage( "FFCSA", "lib/algs.gd" ); # the algorithms

ReadPackage( "FFCSA", "lib/algsmatrix.gd" ); # the matrix algorithms


#ReadPackage( "TowerFields", "lib/search.gd" ); # the search functions

#ReadPackage( "TowerFields", "lib/crypto.gd" ); # the funtions for analyzing WG

#ReadPackage( "TowerFields", "lib/noname.gd" ); # the funtions for analyzing WG
#ReadPackage( "TowerFields", "lib/VHDLmodule.gd" ); # the funtions for analyzing WG


Print("init.g done!!!\n");
#E  init.g . . . . . . . . . . . . . . . . . . . . . . . . . . . .  ends here
