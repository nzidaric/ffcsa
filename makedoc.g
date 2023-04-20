###########################################################################
##
#W buildman.g                Based on the buildman.g from the SCSCP package
##
###########################################################################

SetPackagePath("fsr", "/home/sonce/kres/fsr");; LoadPackage("fsr");
SetPackagePath("ffcsa", "/home/sonce/kres/ffcsa");; LoadPackage("ffcsa");




ExtractMyManualExamples:=function( pkgname, main, files )
local path, tst, i, s, name, output, ch, a;
path:=Directory(
        Concatenation(PackageInfo(pkgname)[1].InstallationPath, "/doc") );
Print("Extracting manual examples for ", pkgname, " package ...\n" );
tst:=ExtractExamples( path, main, files, "Chapter" );
Print(Length(tst), " chapters detected\n");
for i in [ 1 .. Length(tst) ] do
  Print( "Chapter ", i, " : \c" );
  if Length( tst[i] ) > 0 then
    s := String(i);
    if Length(s)=1 then
      # works for <100 chapters
      s:=Concatenation("0",s);
    fi;
    name := Filename(
              Directory(
                Concatenation( PackageInfo(pkgname)[1].InstallationPath,
                               "/tst" ) ),
                Concatenation( LowercaseString(pkgname), s, ".tst" ) );
    output := OutputTextFile( name, false ); # to empty the file first
    SetPrintFormattingStatus( output, false ); # to avoid line breaks
    ch := tst[i];
    AppendTo(output, "# ", pkgname, ", chapter ",i,"\n");
    for a in ch do
      AppendTo(output, "\n# ",a[2], a[1]);
    od;
    Print("extracted ", Length(ch), " examples \n");
  else
    Print("no examples \n" );
  fi;
od;
end;

###########################################################################

#FFCSAMANUALFILES:=[
#"../PackageInfo.g",
#"../lib/misc.gd",
#];

FFCSAMANUALFILES:=[
"../lib/misc.gd",
"../lib/weight.gd",
"../lib/matrix.gd",
"../lib/findPoly.gd",
"../lib/findElm.gd",
"../lib/nb.gd",
"../lib/ffbases.gd",
"../lib/findElmSpecial.gd",
"../lib/findPolySpecial.gd",
"../lib/algs.gd",
"../lib/algsmatrix.gd",
];
Print(FFCSAMANUALFILES,"\n");

###########################################################################
##
##  FSRBuildManual()
##
FFCSABuildManualOld := function()
local path, main, files, bookname;
path:="doc";
main:="manual.xml";
bookname:="ffcsa";
MakeGAPDocDoc( path, main, FFCSAMANUALFILES, bookname, "../../..", "MathJax" );
CopyHTMLStyleFiles( path );
GAPDocManualLab( "ffcsa" );;
end;


FFCSABuildManual := function()
local path, main, files, bookname, doc, r, t, l, lname,sname;
path:="./doc";;
main:="manual.xml";
bookname:="FFCSA";
doc := ComposedDocument("GAPDoc", path, main,  FFCSAMANUALFILES, true);;
Print(doc,"\n");
#MakeGAPDocDoc( path, main, FFCSAMANUALFILES, bookname, "../../..", "MathJax" );
#CopyHTMLStyleFiles( path );
r := ParseTreeXMLString(doc[1], doc[2]);
CheckAndCleanGapDocTree(r);
Print(r);
t := GAPDoc2Text(r, path);;
GAPDoc2TextPrintTextFiles(t, path);
l := GAPDoc2LaTeX(r);;
lname := Filename(DirectoryHome(), "/kres/ffcsa/doc/FFCSA.tex");
sname := Filename(DirectoryHome(), "/kres/ffcsa/doc/manual.six");
if IsExistingFile(lname) then RemoveFile(lname); fi;
FileString(lname, l);
#AddPageNumbersToSix(r,sname);
#PrintSixFile(sname, r, bookname);


#GAPDocManualLab( "ffcsa" );;
end;



###########################################################################

FFCSABuildManual();

###########################################################################
##
#E
##
