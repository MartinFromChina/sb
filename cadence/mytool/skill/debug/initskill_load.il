/****************************************************/
/*             Title : init skill load         */
/*   Execute Command : skill_load_real         				*/
/*            Author : QBB(modify based on VivienLuo and Robert Feranec)  */
/*     Creation Date : 2018-02-22                   */
/*            Update :                              */
/*           Version : 1.0                          */
/*           Website :                              */
/*           E-maial : xwzjwwsz@gmail.com          */
/****************************************************/

axlCmdRegister("skill_load_real" 'skill_load_real ?cmdType "interactive")

procedure(skill_load_real()
load("ref_doc.il")
;axlUIWPrint(nil "skill file ref_doc load...")
load("any_form_display.il")
;axlUIWPrint(nil "skill file any_form_display load...")
axlUIWPrint(nil "skill file load...")
);end procedure

