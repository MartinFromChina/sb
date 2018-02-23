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
;Definition of ref_doc_dt_qb command
;-------------------------------------
axlCmdRegister("ref_doc_dt_qb" 'ref_doc_displaytool ?cmdType "interactive")

defun(ref_doc_displaytool ()

	axlUIWPrint(nil "ref_doc for display tool...")

	fw = axlFormCreate( 
	(gensym)
	 "dialog_DOC_forDisplayTool.form" 
	 nil 
	 '_cb_dialog_ref_doc
	 t 
	 nil)
	 axlFormDisplay(fw)
		
);end defun


;-------------------------------------
;Definition of ref_doc_so_qb command
;-------------------------------------
axlCmdRegister("ref_doc_so_qb" 'ref_doc_specific_operation ?cmdType "interactive")

defun(ref_doc_specific_operation ()

	axlUIWPrint(nil "ref_doc for display tool...")

	fw = axlFormCreate( 
	(gensym)
	 "dialog_DOC_forSO.form" 
	 nil 
	 '_cb_dialog_ref_doc
	 t 
	 nil)
	 axlFormDisplay(fw)
		
);end defun