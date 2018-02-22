/****************************************************/
/*             Title : silkscreen top display       */
/*   Execute Command : silkscreen_dt_qb        		*/
/*            Author : QBB						    */
/*     Creation Date : 2018-02-20                   */
/*            Update :                              */
/*           Version : 1.0                          */
/*           Website :                              */
/*           E-maial : xwzjwwsz@gmail.com           */
/****************************************************/

axlCmdRegister( "silkscreen_dt_qb" `silkscreen_top_display)

;-------------------------------------
;Definition of silkscreen_dt command
;------------------------------------- 

defun(silkscreen_top_display ()

	axlVisibleDesign(nil)
	axlVisibleLayer("BOARD GEOMETRY/SILKSCREEN_TOP"  t)
	axlVisibleLayer("PACKAGE GEOMETRY/SILKSCREEN_TOP"  t)
	axlVisibleLayer("REF DES/SILKSCREEN_TOP"  t)    
	;axlVisibleLayer("DRC ERROR CLASS/TOP"  t)
	axlVisibleLayer("BOARD GEOMETRY/OUTLINE"  t)
	axlVisibleUpdate(t)
	axlUIWPrint(nil "silkscreen top display complet...")
				
);end defun