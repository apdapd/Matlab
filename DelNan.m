function  resap  = DelNan( ap)
 resap = ap;
 for i = 1:length(resap)
   if(isnan(resap(i)))
     resap(i) = 0;
   end 
 end
end

