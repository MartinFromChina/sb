axlCmdRegister("HelloWorld" 'helloworldMain)  ;HelloWorld 和helloworldMain中间的空格不能少

defun(helloworldMain ()  ;helloworldMain和()之间的空格不能少

	 ; printf("Hello,World!\n")
	  
	  axlUIConfirm("Hello,World!\n")
	  
	  printf("this is my first skill program!")
);end defun