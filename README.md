[![Build Status](https://github.com/nzidaric/ffcsa/workflows/CI/badge.svg?branch=main)](https://github.com/nzidaric/ffcsa/actions?query=workflow%3ACI+branch%3Amain)
[![Code Coverage](https://codecov.io/github/nzidaric/ffcsa/coverage.svg?branch=main&token=)](https://codecov.io/gh/nzidaric/ffcsa)

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
