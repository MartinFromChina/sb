/****************************************************/
/*             Title : init skill         */
/*   Execute Command : skill_load         				*/
/*            Author : QBB(modify based on VivienLuo and Robert Feranec)  */
/*     Creation Date : 2018-02-22                   */
/*            Update :                              */
/*           Version : 1.0                          */
/*           Website :                              */
/*           E-maial : xwzjwwsz@gmail.com          */
/****************************************************/

axlCmdRegister("skill_load" 'skill_load ?cmdType "interactive")

procedure(skill_load()
load("initskill_load.il");the real file that load skill file
);end procedure

