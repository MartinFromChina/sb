prog( ( n, s, key, z )
  n=0  
  z=0.1
  while( n < 50
         sprintf(key "%.1f", z)
         sprintf(s "FORM mini acon_line_width %.1f", z)
         axlSetAlias( key, s)
		 z=z+0.1
         n++
       );end-while
	   
	z=0.01   
	n=0
  while( n < 100
         sprintf(key "%.2f", z)
         sprintf(s "FORM mini acon_line_width %.2f", z)
         axlSetAlias( key, s)
		 z=z+0.01
         n++
       );end-while	   
	   
	   n=0
  while( n < 200
         sprintf(key "%d", n)
         sprintf(s "FORM mini acon_line_width %d",n)
         axlSetAlias( key, s)
         n++
       );end-while
);end-prog

