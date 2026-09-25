.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetCur__C4CPad_8009dba0, 0x28

glabel GetCur__C4CPad_8009dba0
    /* 8DBA0 8009DBA0 00008290 */  lbu        $v0, 0x0($a0)
    /* 8DBA4 8009DBA4 00000000 */  nop
    /* 8DBA8 8009DBA8 04004014 */  bnez       $v0, .L8009DBBC
    /* 8DBAC 8009DBAC 00000000 */   nop
    /* 8DBB0 8009DBB0 08008294 */  lhu        $v0, 0x8($a0)
    /* 8DBB4 8009DBB4 F0760208 */  j          .L8009DBC0
    /* 8DBB8 8009DBB8 00000000 */   nop
  .L8009DBBC:
    /* 8DBBC 8009DBBC 12008294 */  lhu        $v0, 0x12($a0)
  .L8009DBC0:
    /* 8DBC0 8009DBC0 0800E003 */  jr         $ra
    /* 8DBC4 8009DBC4 00000000 */   nop
endlabel GetCur__C4CPad_8009dba0
