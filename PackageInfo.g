#############################################################################
##
##  PackageInfo.g for the package `ffcsa'
#
SetPackageInfo( rec(
PackageName := "FFCSA",
Subtitle := "FFCSA - Finite Field Constructions, Search and Algorithms",
Version := "0.9.4",
Date := "20/04/2023",
##<#GAPDoc Label="PKGVERSIONDATA">
##  <!ENTITY VERSION "0.9.4">
##  <!ENTITY RELEASEDATE "20 April 2023">
##  <!ENTITY RELEASEYEAR "2023">
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

Status := "dev",

SourceRepository := rec(
    Type := "git",
    URL := Concatenation( "https://github.com/nzidaric/", LowercaseString(~.PackageName) ),
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
PackageWWWHome  := Concatenation( "https://nzidaric.github.io/", LowercaseString(~.PackageName) ),
README_URL      := Concatenation( ~.PackageWWWHome, "/README.md" ),
PackageInfoURL  := Concatenation( ~.PackageWWWHome, "/PackageInfo.g" ),
ArchiveURL      := Concatenation( ~.SourceRepository.URL,
                                 "/releases/download/v", ~.Version,
                                 "/", ~.PackageName, "-", ~.Version ),
ArchiveFormats := ".tar.gz",

AbstractHTML := "This package was designed for implementations of (cryptographic) hardware based on finite field arithmetic.",

PackageDoc := rec(
  BookName := "FFCSA",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0_mj.html",
  PDFFile := "doc/manual.pdf",
  SixFile := "doc/manual.six",
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
