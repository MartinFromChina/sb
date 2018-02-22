/****************************************************/
/*             Title : nothing         */
/*   Execute Command : nothing_qb         				*/
/*            Author : QBB(modify based on VivienLuo and Robert Feranec)  */
/*     Creation Date : 2018-02-20                   */
/*            Update :                              */
/*           Version : 1.0                          */
/*           Website :                              */
/*           E-maial : xwzjwwsz@gmail.com          */
/****************************************************/
axlCmdRegister("nothing_qb" 'nothing_display ?cmdType "interactive")


;-------------------------------------
;Definition of callback function
;-------------------------------------
defun(_cb_dialog_undevelopment (fw)		
			if(fw->doneState == 1
			 	then  ;Note: 0 = action; 1 = done; 2 = cancel; 3 = abort
			 				
				axlUIWPrint(nil "Exit") ;console printing
				axlFormClose(fw)
			)		
);end defun

;-------------------------------------
;Definition of nothing_qb command
;-------------------------------------

defun(nothing_display (@optional (layer ""))

	axlUIWPrint(nil "undevelopment function...")

	fw = axlFormCreate( 
	(gensym)
	 "dialog_undevelopment.form" 
	 nil 
	 '_cb_dialog_undevelopment
	 t 
	 nil)
	 axlFormDisplay(fw)
		
);end defun