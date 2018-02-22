/****************************************************/
/*             Title :   DXF display     			*/
/*   Execute Command :   DiXiF_display_qb      			*/
/*            Author :   QBB						*/
/*     Creation Date :   20180220                   */
/*            Update :                              */
/*           Version : 1.0                          */
/*           Website :                              */
/*           E-maial : xwzjwwsz@gmail.com           */
/****************************************************/

axlCmdRegister( "DiXiF_display_qb" `DiXiF_display)

;-------------------------------------
;Definition of funtion display_switch
;------------------------------------- 

defun( DXF_display_SW (@optional (mul 0))
case(mul
	(0
		axlVisibleDesign(nil)
		axlVisibleLayer("BOARD GEOMETRY/SOLDERMASK_TOP"  t)
		axlVisibleLayer("PACKAGE GEOMETRY/PLACE_BOUND_TOP"  t)
		axlVisibleLayer("PIN/TOP"  t)    
		axlVisibleLayer("BOARD GEOMETRY/OUTLINE"  t)
		axlVisibleUpdate(t)
		axlUIWPrint(nil "DXF display top complet...")
	)
	(1
	 	axlVisibleDesign(nil)
		axlVisibleLayer("BOARD GEOMETRY/SOLDERMASK_BOTTOM"  t)
		axlVisibleLayer("PACKAGE GEOMETRY/PLACE_BOUND_BOTTOM"  t)
		axlVisibleLayer("PIN/BOTTOM"  t)    
		axlVisibleLayer("BOARD GEOMETRY/OUTLINE"  t)
		axlVisibleUpdate(t)
		axlUIWPrint(nil "DXF display bottom complet...")
 	
 	)
 	(2
	 	axlVisibleDesign(nil)
		axlVisibleLayer("BOARD GEOMETRY/SOLDERMASK_TOP"  t)
		axlVisibleLayer("PACKAGE GEOMETRY/PLACE_BOUND_TOP"  t)
		axlVisibleLayer("PIN/TOP"  t)    
	
		axlVisibleLayer("BOARD GEOMETRY/SOLDERMASK_BOTTOM"  t)
		axlVisibleLayer("PACKAGE GEOMETRY/PLACE_BOUND_BOTTOM"  t)
		axlVisibleLayer("PIN/BOTTOM"  t)    
	
		axlVisibleLayer("BOARD GEOMETRY/OUTLINE"  t)
		axlVisibleUpdate(t)
		axlUIWPrint(nil "DXF display top and bottom complet...")
 	
 	)
 	(t
 		axlUIWPrint(nil "Error,Wrong layer argument! ~~~~(>_<)~~~~ ")
 	)
		 	
	);end case 
);end defun

;-------------------------------------
;Definition of callback function
;-------------------------------------
defun(_cb_dialog_inputnum_DXF (fw)
		(prog (layer)
			if((fw->doneState == 1) then  ;Note: 0 = action; 1 = done; 2 = cancel; 3 = abort
			
			layer = atoi(axlFormGetField(fw "layer_num"))
			
			if((layer == nil) then
				axlUIConfirm("Please Input argument\n" 'warn)
				axlFormClose(fw)
				return()
				)
			
				
			DXF_display_SW(layer)
				
			axlUIWPrint(nil "Done") ;console printing
			axlFormClose(fw)
			)
			return()
		)
);end defun

;-------------------------------------
;Definition of DXF_display command
;------------------------------------- 

defun(DiXiF_display (@optional (situation ""))

	if(situation != "" && atoi(situation)
		 then
		 
		 	situation = atoi(situation)
		 	DXF_display_SW(situation)
		 
		 else
		 	axlUIWPrint(nil "Please Input argument...")
			fw = axlFormCreate( 
			(gensym)
			 "dialog_inputnum.form" 
			 nil 
			 '_cb_dialog_inputnum_DXF
			 t 
			 t)
			 axlFormDisplay(fw)
		
		)
	

	
				
);end defun