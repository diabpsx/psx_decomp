.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PostLoadGame__Fv, 0x78

glabel PostLoadGame__Fv
    /* 870B8 800970B8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 870BC 800970BC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 870C0 800970C0 1D55020C */  jal        OVR_LoadGame__Fv
    /* 870C4 800970C4 00000000 */   nop
    /* 870C8 800970C8 FA03020C */  jal        SyncPortals__Fv
    /* 870CC 800970CC 00000000 */   nop
    /* 870D0 800970D0 1280063C */  lui        $a2, %hi(currlevel)
    /* 870D4 800970D4 0CC1C690 */  lbu        $a2, %lo(currlevel)($a2)
    /* 870D8 800970D8 0C80013C */  lui        $at, %hi(LevPals)
    /* 870DC 800970DC 21082600 */  addu       $at, $at, $a2
    /* 870E0 800970E0 589A2390 */  lbu        $v1, %lo(LevPals)($at)
    /* 870E4 800970E4 1280053C */  lui        $a1, %hi(leveltype)
    /* 870E8 800970E8 0DC1A590 */  lbu        $a1, %lo(leveltype)($a1)
    /* 870EC 800970EC 80006238 */  xori       $v0, $v1, 0x80
    /* 870F0 800970F0 2B100200 */  sltu       $v0, $zero, $v0
    /* 870F4 800970F4 23100200 */  negu       $v0, $v0
    /* 870F8 800970F8 24186200 */  and        $v1, $v1, $v0
    /* 870FC 800970FC 80100500 */  sll        $v0, $a1, 2
    /* 87100 80097100 21104500 */  addu       $v0, $v0, $a1
    /* 87104 80097104 21104300 */  addu       $v0, $v0, $v1
    /* 87108 80097108 40100200 */  sll        $v0, $v0, 1
    /* 8710C 8009710C 1180013C */  lui        $at, %hi(D_8011073C)
    /* 87110 80097110 21082200 */  addu       $at, $at, $v0
    /* 87114 80097114 3C072494 */  lhu        $a0, %lo(D_8011073C)($at)
    /* 87118 80097118 C76E020C */  jal        GLUE_StartBg__Fibi
    /* 8711C 8009711C 0100A52C */   sltiu     $a1, $a1, 0x1
    /* 87120 80097120 1000BF8F */  lw         $ra, 0x10($sp)
    /* 87124 80097124 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 87128 80097128 0800E003 */  jr         $ra
    /* 8712C 8009712C 00000000 */   nop
endlabel PostLoadGame__Fv
