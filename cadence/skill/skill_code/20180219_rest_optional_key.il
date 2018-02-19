defun(nothing ()
   nil
);end defun


;example  : SayHello("Amy")
procedure(SayHello(name)
		  printf("hello ,%s \n" name)
);end procedure


;example  : SerialNumber('plus 1 2 3)
procedure( SerialNumber(fun @rest args)
		  printf("calling %s passing %L\n" fun args)
		  result=apply(fun args)
		  printf("returing from %s with %L\n" fun args)
		  result
);end procedure


;example : AskName()    /  AskName("Martin" 27)
procedure(AskName(@optional  (name "Bob")  (age 15))
		  printf("what's your name ? %s ? year %d ?\n" name age)
);end procedure


;example : AskName2()/AskName2(?age 27) /AskName2(?name "Martin" )/AskName2(?name "Martin" ?age 27)
procedure(AskName2(@key  (name "Bob")  (age 15))
		  printf("what's your name ? %s ? year %d ?\n" name age)
);end procedure


;example : odd_or_not(100)
procedure(odd_or_not(num)
		value = oddp(num)
		when(value == t
		    printf("%d is an odd number \n" num)
		    value
		)
		when(value == nil
		    printf("%d is a even number \n" num)
		    value
		)
); end procedure


;example : NameHeigh(?name "Martin" ?height 179)/NameHeigh(?height 179)/NameHeigh(?name "Martin")
defun(NameHeigh (@key (name "nobody") (height 160))
		when(name == "nobody"
			axlUIConfirm("you have to enter a name\n" 'error)
			name
		)
		
		when(height <= 160
			printf("%s 's height is lower than 160 \n" name)
			height
		)
		when(height > 160
			printf("%s 's height is %d \n" name height)
			height
		)

); end defun
