axlCmdRegister("h_via" `h_via )
axlSetAlias( "~H" "h_via")

defun( h_via ()
    via_form()
    axlSetFindFilter(?enabled `("NOALL" "PINS" "vias")	?onButtons `("PINS" "vias"))

    while( axlSingleSelectPoint()
    if( axlGetSelSet()!=nil then
	a=car(axlGetSelSet())
	s=a->name
	axlFormSetField(fs "padstack_name"	s)
	if( axlFormGetField( fs "window")=="1" then
	    axlAddSelectBox(axlWindowBoxGet())
	else
	    axlAddSelectAll()
	)
	foreach( a axlGetSelSet()
	    if( a->name!=s then axlSubSelectObject(a))
	)
    
    ))
    axlFinishEnterFun()
)

defun( via_form ()
	drain()
    ;定义form文件名
    via_form_file="via_form_file.form"
    ;创建form
    p=outfile(via_form_file "w")
   ; if(p != nil then
	fprintf(p "FILE_TYPE=FORM_DEFN VERSION=2\n")
	fprintf(p "FORM\n")
	fprintf(p "FIXED\n")
	fprintf(p "PORT 40 60\n")
	fprintf(p "HEADER \"Highlight via\"\n")
	fprintf(p "TILE\n")
	fprintf(p "\n")
	
    	fprintf(p "GROUP \"Range\"\n")
	fprintf(p "GLOC 1 0\n")
	fprintf(p "GSIZE 20 4\n")
	fprintf(p "ENDGROUP\n")
	fprintf(p "\n")
	fprintf(p "FIELD window\n")
	fprintf(p "FLOC 2 2\n")
	fprintf(p "CHECKLIST \"Window\" \"1\"\n")
	fprintf(p "ENDFIELD\n")
	fprintf(p "\n")
	fprintf(p "FIELD design\n")
	fprintf(p "FLOC 12 2\n")
	fprintf(p "CHECKLIST \"design\" \"1\"\n")
	fprintf(p "ENDFIELD\n")
	fprintf(p "\n")

	fprintf(p "TEXT \"Select highlight padstack\"\n")
	fprintf(p "TLOC 1 4\n")
	fprintf(p "ENDTEXT\n")
	fprintf(p "\n")
	fprintf(p "FIELD padstack_name\n")
	fprintf(p "FLOC 1 6\n")
	fprintf(p "REALFILLIN 19 30\n")
	fprintf(p "ENDFIELD\n")
	fprintf(p "\n")
	fprintf(p "FIELD vias_list\n")
	fprintf(p "FLOC 1 8\n")
	fprintf(p "LIST \"\" 20 6\n")
	fprintf(p "ENDFIELD\n")
	fprintf(p "\n")
	fprintf(p "ENDTILE\n")
	fprintf(p "ENDFORM\n")
    ;else
	;printf("ERROR,can't create form file!")
   ; )
    close(p)
    ;打开form
    ;axlFormCreate('fs via_form_file '("msgLines" 0) 'hl_via nil nil )
    axlMiniStatusLoad( 'fs via_form_file  'hl_via t )
   
    ;过孔列表
    vd_list=axlDBGetDesign()->padstacks
    vn_list=nil
    foreach(a vd_list
    ;@@@@@@@@@@@@@@@@@@@@
	if( nindex(upperCase(a->name) "VIA")!=nil then
	    vn_list=append1(vn_list a->name)
	)
    ;@@@@@@@@@@@@@@@@@@@@
    )
    if( vn_list!=nil then
	ps=""
	vn_list=sort(vn_list nil)
	axlFormListDeleteAll(fs "vias_list")
	axlFormSetField(fs "vias_list" vn_list)
	axlFormSetField(fs "window" t)
	;显示form
	axlFormDisplay(fs)
    )
    ;删除form文件
   ; if(isFile(via_form_file) then
 	;deleteFile(via_form_file)
    ;)
)

defun( hl_via (fs)
	axlFormSetFieldVisible(fs "vias_list" 1)
	if( fs->curField=="vias_list" then
	    s=fs->curValue
	    axlFormSetField(fs "padstack_name"	s)
	    ;axlSetFindFilter(?enabled list("vias") ?onButtons list("vias"))
	    axlClearSelSet()
	    if( axlFormGetField( fs "window")=="1" then
		axlAddSelectBox(axlWindowBoxGet())
	    else
		axlAddSelectAll()
	    )
	    foreach( a axlGetSelSet()
		if( a->name!=s then axlSubSelectObject(a))
	    )
	)

)