#############################################################################
##
##
#W  weight.gi          			The FFC Package 		                Nusa
##
## NOTE: need to install alt. methods for bigger fields, FFE will break!!!

#############################################################################
##
#F  WeightMatrixBoth( <M>) . . . . . . . . retrns the Hamming Weights of matrix.
##
InstallMethod( WeightMatrixBoth,
"get MAX(row Hamming Weight) and Hamming Weight of the whole matrix",
[IsFFECollColl],  function(M)
local d,i, row,  HW,  rowHW,  maxRowHW;
	rowHW  :=  0;
	maxRowHW := 0;
	HW  :=  0;
	d  :=  DimensionsMat(M);
# for each row
	for i in [1..d[1]] do
		row  :=  M[i];
		rowHW  :=  WeightVecFFE(row);
		HW  :=  HW + rowHW;
		if rowHW > maxRowHW then maxRowHW :=  rowHW; fi;
	od;

	return [maxRowHW,  HW];
end);




#############################################################################
##
#F  WeightMatrix( <M>) . . . . . . . . retrns the Hamming Weight of matrix
##

InstallMethod( WeightMatrix ,"Hamming Weight of the whole matrix",
[IsFFECollColl],  function(M)
local HW ;

HW := WeightMatrixBoth(M);
# with max rowHW= HW[1],  and matrix HW=HW[2]

return HW[2];
end);


#############################################################################
##
#F  WeightMatrixMaxRow( <M>) . . . . retrns the max row Hamming Weight of matrix
##
InstallMethod( WeightMatrixMaxRow ,"MAX_i(row_i Hamming Weight) of the matrix",
[IsFFECollColl],  function(M)
local HW ;

HW := WeightMatrixBoth(M);
# with max rowHW= HW[1],  and matrix HW=HW[2]

return HW[1];
end);



#############################################################################
##
#F  WeightPolynomial( <f>) . . . .  retrns the Hamming Weight of coefficient
##  vector of polynomial
##

InstallMethod(WeightPolynomial , "Hamming Weight of coeff. vector of poly",
[IsUnivariatePolynomial], function(f)

return WeightVecFFE(CoefficientsOfUnivariatePolynomial(f));

end);

Print("weight.gi OK,\t");
#E  weight.gi  . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
