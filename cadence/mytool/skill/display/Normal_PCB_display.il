/****************************************************/
/*             Title : Normal PCB display       	*/
/*   Execute Command : normal_pd_qb        			*/
/*            Author : QBB						    */
/*     Creation Date : 2018-02-22                   */
/*            Update :                              */
/*           Version : 1.0                          */
/*           Website :                              */
/*           E-maial : xwzjwwsz@gmail.com           */
/****************************************************/

axlCmdRegister( "normal_pd_qb" `normal_pcb_display)

;-------------------------------------
;Definition of funtion display_switch
;------------------------------------- 

defun( DXF_display_SW_ver2 (@optional (mul 0))
case(mul
	(0
		;axlVisibleDesign(nil)
		axlVisibleLayer("BOARD GEOMETRY/SOLDERMASK_TOP"  t)
		axlVisibleLayer("PACKAGE GEOMETRY/PLACE_BOUND_TOP"  t)
		axlVisibleLayer("PIN/TOP"  t)    
		axlVisibleLayer("BOARD GEOMETRY/OUTLINE"  t)
		axlVisibleUpdate(t)
		;axlUIWPrint(nil "DXF display top complet...")
	)
	(1
	 	;axlVisibleDesign(nil)
		axlVisibleLayer("BOARD GEOMETRY/SOLDERMASK_BOTTOM"  t)
		axlVisibleLayer("PACKAGE GEOMETRY/PLACE_BOUND_BOTTOM"  t)
		axlVisibleLayer("PIN/BOTTOM"  t)    
		axlVisibleLayer("BOARD GEOMETRY/OUTLINE"  t)
		axlVisibleUpdate(t)
		;axlUIWPrint(nil "DXF display bottom complet...")
 	
 	)
 	(2
	 	;axlVisibleDesign(nil)
		axlVisibleLayer("BOARD GEOMETRY/SOLDERMASK_TOP"  t)
		axlVisibleLayer("PACKAGE GEOMETRY/PLACE_BOUND_TOP"  t)
		axlVisibleLayer("PIN/TOP"  t)    
	
		axlVisibleLayer("BOARD GEOMETRY/SOLDERMASK_BOTTOM"  t)
		axlVisibleLayer("PACKAGE GEOMETRY/PLACE_BOUND_BOTTOM"  t)
		axlVisibleLayer("PIN/BOTTOM"  t)    
	
		axlVisibleLayer("BOARD GEOMETRY/OUTLINE"  t)
		axlVisibleUpdate(t)
		;axlUIWPrint(nil "DXF display top and bottom complet...")
 	
 	)
 	(t
 		axlUIWPrint(nil "Error,Wrong layer argument! (DXF_display_SW_ver2)~~~~(>_<)~~~~ ")
 	)
		 	
	);end case 
);end defun

;-------------------------------------
;Definition of funtion display_switch
;------------------------------------- 

defun( SilkScreen_display_SW_ver2 (@optional (mul 0))
case(mul
	(0
		axlVisibleLayer("BOARD GEOMETRY/SILKSCREEN_TOP"  t)
		axlVisibleLayer("PACKAGE GEOMETRY/SILKSCREEN_TOP"  t)
		axlVisibleLayer("REF DES/SILKSCREEN_TOP"  t)    
		axlVisibleUpdate(t)
	)
	(1
	 	axlVisibleLayer("BOARD GEOMETRY/SILKSCREEN_BOTTOM"  t)
		axlVisibleLayer("PACKAGE GEOMETRY/SILKSCREEN_BOTTOM"  t)
		axlVisibleLayer("REF DES/SILKSCREEN_BOTTOM"  t)    
		axlVisibleUpdate(t)
 	)
 	(2
	 	axlVisibleLayer("BOARD GEOMETRY/SILKSCREEN_TOP"  t)
		axlVisibleLayer("PACKAGE GEOMETRY/SILKSCREEN_TOP"  t)
		axlVisibleLayer("REF DES/SILKSCREEN_TOP"  t)  
		;------------------------------------- 
		axlVisibleLayer("BOARD GEOMETRY/SILKSCREEN_BOTTOM"  t)
		axlVisibleLayer("PACKAGE GEOMETRY/SILKSCREEN_BOTTOM"  t)
		axlVisibleLayer("REF DES/SILKSCREEN_BOTTOM"  t)      
		axlVisibleUpdate(t)
		
 	
 	)
 	(t
 		axlUIWPrint(nil "Error,Wrong layer argument! (SilkScreen_display_SW_ver2)~~~~(>_<)~~~~ ")
 	)
		 	
	);end case 
);end defun



;-------------------------------------
;Definition of normal_pd_qb command
;------------------------------------- 

defun(normal_pcb_display (@optional (sw "0"))
let((allLayer countLayer param)
	allLayer = axlGetParam("paramLayerGroup:ETCH")->groupMembers
	countLayer = length(allLayer)
	
	
	case(atoi(sw)
		(1								;DXF + silkscreen
			;------------------------------------- 
			axlVisibleDesign(nil)
			
			DXF_display_SW_ver2(2)
			SilkScreen_display_SW_ver2(2)
			
			foreach(l allLayer
						axlVisibleLayer(strcat("DRC ERROR CLASS/" l) t)		
					)
					
			axlVisibleUpdate(t)
			axlUIWPrint(nil "DXF + silkscreen display complet...")
			;------------------------------------- 
			
			
		
			
		
		)
		(2								;DXF + AREA/routekeepout
			;------------------------------------- 
			axlVisibleDesign(nil)
			
			DXF_display_SW_ver2(2)
			
			foreach(l allLayer
						axlVisibleLayer(strcat("DRC ERROR CLASS/" l) t)		
						axlVisibleLayer(strcat("ROUTE KEEPOUT/" l) t)		
					)
			
			axlVisibleUpdate(t)
			axlUIWPrint(nil "DXF + AREA/routekeepout display complet...")
			;------------------------------------- 
		)
		(3								;previous display + AREA/constraint 
			;------------------------------------- 
			foreach(l allLayer
						axlVisibleLayer(strcat("CONSTRAINT REGION/" l) t)		
						   	
					)
			axlVisibleLayer("CONSTRAINT REGION /INNER_LAANE_LAYERS" t)	
			axlVisibleLayer("CONSTRAINT REGION /INNER_SIGNAL_LAYERS" t)	
			axlVisibleLayer("CONSTRAINT REGION /OUTER_LAYERS" t)	
			axlVisibleLayer("CONSTRAINT REGION /ALL" t)	
			axlVisibleUpdate(t)
			axlUIWPrint(nil "previous display + AREA/constraint region complet...")
			
			
		
		)
		(t								;normal 
			;------------------------------------- 
			axlVisibleDesign(nil)
			
			DXF_display_SW_ver2(2)
			
			foreach(l allLayer
						axlVisibleLayer(strcat("DRC ERROR CLASS/" l) t)		
						axlVisibleLayer(strcat("ETCH/" l) t)
						axlVisibleLayer(strcat("PIN/" l) t)
						axlVisibleLayer(strcat("VIA CLASS/" l) t)    	
					)
					
			axlVisibleUpdate(t)
			axlUIWPrint(nil "normal pcb display complet...")
			
			
		
		)
	);endcase
	
	);end let

	
				
);end defun