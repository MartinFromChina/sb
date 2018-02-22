/****************************************************/
/*             Title : silkscreen bottom display       */
/*   Execute Command : silkscreen_db_qb        		*/
/*            Author : QBB						    */
/*     Creation Date : 2018-02-20                   */
/*            Update :                              */
/*           Version : 1.0                          */
/*           Website :                              */
/*           E-maial : xwzjwwsz@gmail.com           */
/****************************************************/

axlCmdRegister( "silkscreen_db_qb" `silkscreen_bottom_display)

;-------------------------------------
;Definition of silkscreen_db command
;------------------------------------- 

defun(silkscreen_bottom_display ()

	axlVisibleDesign(nil)
	axlVisibleLayer("BOARD GEOMETRY/SILKSCREEN_BOTTOM"  t)
	axlVisibleLayer("PACKAGE GEOMETRY/SILKSCREEN_BOTTOM"  t)
	axlVisibleLayer("REF DES/SILKSCREEN_BOTTOM"  t)    
	;axlVisibleLayer("DRC ERROR CLASS/BOTTOM"  t)
	axlVisibleLayer("BOARD GEOMETRY/OUTLINE"  t)
	axlVisibleUpdate(t)
	axlUIWPrint(nil "silkscreen bottom display complet...")
				
);end defun