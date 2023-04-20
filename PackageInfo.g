#############################################################################
##
##  PackageInfo.g for the package `ffcsa'
#
SetPackageInfo( rec(
PackageName := "FFCSA",
Subtitle := "FFCSA - Finite Field Constructions, Search and Algorithms",
Version := "1.0.4",
Date := "17/04/2023",
##<#GAPDoc Label="PKGVERSIONDATA">
##  <!ENTITY VERSION "1.0.4">
##  <!ENTITY RELEASEDATE "17 April 2023">
##  <!ENTITY RELEASEYEAR "2022">
##<#/GAPDoc>

Persons := [
  rec(
    LastName      := "Zidaric",
    FirstNames    := "Nusa",
    IsAuthor      := true,
    IsMaintainer  := true,
    Email         := "nzidaric@uwaterloo.ca",
    WWWHome       := "http://comsec.uwaterloo.ca/",
    PostalAddress := Concatenation( [
                       "200 University Ave W",
                       "Waterloo",
                       "Canada",
                       "ON N2L 3G1" ] ),
    Place         := "Waterloo",
    Institution   := "UW-ComSec Lab"
  ),
],


Status := "other",


PackageDoc := rec(
  BookName  := "FFCSA",
  PDFFile   := "doc/ffcsa.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "FFCSA - Finite Field Constructions, Search and Algorithms",
  Autoload := true
),

Dependencies := rec(
  GAP := "4.8",
  NeededOtherPackages := [["GAPDoc", "1.6"], ["FSR", "1.0.0"]],
  SuggestedOtherPackages := [],
  ExternalConditions := []

),

AvailabilityTest := ReturnTrue,

TestFile := "tst/testall.g",

Keywords := ["package FFCSA", "finite fields", "constructions", "representations", "search", "algorithms"]

));
