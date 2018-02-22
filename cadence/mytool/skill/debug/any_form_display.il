/****************************************************/
/*             Title : form display         */
/*   Execute Command : form_disp         				*/
/*            Author : QBB(modify based on VivienLuo and Robert Feranec)  */
/*     Creation Date : 2018-02-20                   */
/*            Update :                              */
/*           Version : 1.0                          */
/*           Website :                              */
/*           E-maial : xwzjwwsz@gmail.com          */
/****************************************************/
axlCmdRegister("form_disp" 'form_display ?cmdType "interactive")


;-------------------------------------
;Definition of callback function
;-------------------------------------
defun(_cb_dialog_form_display (fw)		
			if(fw->doneState == 1
			 	then  ;Note: 0 = action; 1 = done; 2 = cancel; 3 = abort
			 				
				axlUIWPrint(nil "Exit") ;console printing
				axlFormClose(fw)
			)		
);end defun

;-------------------------------------
;Definition of form_display command
;example:  form_disp helptip.form  (you must copy the helptip.form into path :share\local\pcb\forms        first)
;-------------------------------------

defun(form_display (@optional (formfile "dialog_undevelopment.form"))
	
	if(formfile != ""
	then
		axlUIWPrint(nil "form_display bbbbbbbb...")
		fw = axlFormCreate( 
		(gensym)
		 formfile
		 nil 
		 '_cb_dialog_form_display
		 t 
		 nil)
		 axlFormDisplay(fw)
	 
	 else
	 	 axlUIWPrint(nil "please input a form file name ?--?  ")
	 )
	 
		
);end defun