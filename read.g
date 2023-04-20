#############################################################################
##
#W    read.g                 The FFCSA package              
#W                                                               
##

#############################################################################
##
#R  Read the install files.
##

ReadPackage( "FFCSA", "lib/misc.gi"); # the misc functions

ReadPackage( "FFCSA", "lib/weight.gi" ); # the output functions

ReadPackage( "FFCSA", "lib/matrix.gi" ); # the matrix functions

ReadPackage( "FFCSA", "lib/nb.gi" ); 		# the NB functions

ReadPackage( "FFCSA", "lib/findElm.gi" ); # the search for elements

ReadPackage( "FFCSA", "lib/findPoly.gi" ); # the sea

ReadPackage( "FFCSA", "lib/ffbases.gi" );# the basis functions

ReadPackage( "FFCSA", "lib/findElmSpecial.gi" ); # the search for elements

ReadPackage( "FFCSA", "lib/findPolySpecial.gi" ); # the search for elements

ReadPackage( "FFCSA", "lib/algs.gi" ); # the algorithms

ReadPackage( "FFCSA", "lib/algsmatrix.gi" ); # the matrix algorithms

#ReadPackage( "TowerFields", "lib/search.gi" ); # the search functions

#ReadPackage( "TowerFields", "lib/crypto.gi" ); # the funtions for analyzing WG

#ReadPackage( "TowerFields", "lib/noname.gi" ); # the funtions for analyzing WG
#ReadPackage( "TowerFields", "lib/VHDLmodule.gi" ); # the funtions for analyzing WG


Print("read.g done!!!\n");
#E  read.g . . . . . . . . . . . . . . . . . . . . . . . . . . . .  ends here