.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SysEnqIntRP, 0xC

glabel SysEnqIntRP
    /* 1E5C 80011E5C C0000A24 */  addiu      $t2, $zero, 0xC0
    /* 1E60 80011E60 08004001 */  jr         $t2
    /* 1E64 80011E64 02000924 */   addiu     $t1, $zero, 0x2
endlabel SysEnqIntRP
    /* 1E68 80011E68 00000000 */  nop
