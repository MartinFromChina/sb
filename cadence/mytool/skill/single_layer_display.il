/****************************************************/
/*             Title : single layer display         */
/*   Execute Command : s_layer_qb         				*/
/*            Author : QBB(modify based on VivienLuo and Robert Feranec)  */
/*     Creation Date : 2018-02-20                   */
/*            Update :                              */
/*           Version : 1.0                          */
/*           Website :                              */
/*           E-maial : xwzzjwwsz@gmail.com          */
/****************************************************/
axlCmdRegister("s_layer_qb" 'single_layer_display ?cmdType "interactive")


;-------------------------------------
;Definition of callback function
;-------------------------------------
defun(_cb_dialog_inputnum_SLD (fw)
		(prog (allLayer countLayer layer)
			if((fw->doneState == 1) then  ;Note: 0 = action; 1 = done; 2 = cancel; 3 = abort
			
			layer = atoi(axlFormGetField(fw "layer_num"))
			
			if((layer == nil) then
				axlUIConfirm("Please Input argument\n" 'warn)
				axlFormClose(fw)
				return()
				)
			
			
				allLayer = axlGetParam("paramLayerGroup:ETCH")->groupMembers
				countLayer = length(allLayer)
				
				
				if( layer <= countLayer && layer > 0
					then
						axlVisibleDesign(nil)
						axlVisibleLayer(strcat("ETCH/" nthelem(layer allLayer)) t)
						axlVisibleLayer(strcat("PIN/" nthelem(layer allLayer)) t)
						axlVisibleLayer(strcat("VIA CLASS/" nthelem(layer allLayer)) t)    
						axlVisibleLayer(strcat("DRC ERROR CLASS/" nthelem(layer allLayer)) t)
						axlVisibleLayer(strcat("BOARD GEOMETRY/OUTLINE" ) t)
						axlVisibleUpdate(t)
						axlUIWPrint(nil "Swtich layer complet...")
					else
						axlUIWPrint(nil "Error,Wrong layer argument! ~~~~(>_<)~~~~ ")
				);end if		
				
			
			;printf("number = %d \n" num)
				
			axlUIWPrint(nil "Done") ;console printing
			axlFormClose(fw)
			)
			return()
		)
);end defun

;-------------------------------------
;Definition of add_layer_name command
;-------------------------------------

defun(single_layer_display (@optional (layer ""))
let((allLayer countLayer)
	allLayer = axlGetParam("paramLayerGroup:ETCH")->groupMembers
	countLayer = length(allLayer)
	if(layer != "" && atoi(layer)
		then
			layer = atoi(layer)
			if( layer <= countLayer && layer > 0
				then
					axlVisibleDesign(nil)
					axlVisibleLayer(strcat("ETCH/" nthelem(layer allLayer)) t)
					axlVisibleLayer(strcat("PIN/" nthelem(layer allLayer)) t)
					axlVisibleLayer(strcat("VIA CLASS/" nthelem(layer allLayer)) t)    
					axlVisibleLayer(strcat("DRC ERROR CLASS/" nthelem(layer allLayer)) t)
					axlVisibleLayer(strcat("BOARD GEOMETRY/OUTLINE" ) t)
					axlVisibleUpdate(t)
					axlUIWPrint(nil "Swtich layer complet...")
				else
					axlUIWPrint(nil "Error,Wrong layer argument! ~~~~(>_<)~~~~ ")
			);end if
		else
			axlUIWPrint(nil "Please Input argument...")
			;axlUIConfirm("Please Input argument\n" 'warn)
			fw = axlFormCreate( 
			(gensym)
			 "dialog_inputnum.form" 
			 nil 
			 '_cb_dialog_inputnum_SLD
			 t 
			 t)
			 axlFormDisplay(fw)
			
	);end if 
);end let
);end defun