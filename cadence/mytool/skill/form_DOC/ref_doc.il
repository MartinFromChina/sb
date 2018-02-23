/****************************************************/
/*             Title : ref_doc         */
/*   Execute Command : ref_doc         				*/
/*            Author : QBB(modify based on VivienLuo and Robert Feranec)  */
/*     Creation Date : 2018-02-20                   */
/*            Update :                              */
/*           Version : 1.0                          */
/*           Website :                              */
/*           E-maial : xwzjwwsz@gmail.com          */
/****************************************************/
axlCmdRegister("ref_doc" 'ref_doc ?cmdType "interactive")


;-------------------------------------
;Definition of callback function
;-------------------------------------
defun(_cb_dialog_ref_doc (fw)		
			if(fw->doneState == 1
			 	then  ;Note: 0 = action; 1 = done; 2 = cancel; 3 = abort
			 				
				axlUIWPrint(nil "Exit") ;console printing
				axlFormClose(fw)
			)		
);end defun

;-------------------------------------
;Definition of ref_doc command
;-------------------------------------

defun(ref_doc ()

	axlUIWPrint(nil "ref_doc...")

	fw = axlFormCreate( 
	(gensym)
	 "dialog_DOC.form" 
	 nil 
	 '_cb_dialog_ref_doc
	 t 
	 nil)
	 axlFormDisplay(fw)
		
);end defun