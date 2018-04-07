
axlCmdRegister("runscr" 'run_script ?cmdType "general");?cmdType "general"

defun (run_script ()

          Script_File=outfile("fa_qb.scr" "w")
          
          fprintf(Script_File "setwindow pcb\n")
          fprintf(Script_File "trapsize 9237\n")
          fprintf(Script_File "setwindow form.find\n")
          fprintf(Script_File "FORM find all_on\n")
          fprintf(Script_File "setwindow pcb\n")
          
          close(Script_File)
          
          axlShell("replay fa_qb.scr")
); end DREND
