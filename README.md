# The FFCSA package for GAP

This is the README file for the GAP package

"FFCSA" (Finite Fields Constructions, Search and Algorithms).

## Contact

Nusa zidaric
nzidaric@uwaterloo.ca

## Installation and usage

Extract to `gapinstallation/pkg/`.
That's it. Now start GAP and type
```
LoadPackage("FFCSA");
```
The "FFCSA" package banner should appear on the screen.

If you update a single `*.gd/*.gi` pair:
```
gap> RereadPackage("FFCSA", "lib/*.gd");
true
gap> RereadPackage("FFCSA", "lib/*.gi");
true
```
