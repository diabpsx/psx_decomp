.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PostNewLevel__Fv, 0xB4

glabel PostNewLevel__Fv
    /* 87288 80097288 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8728C 8009728C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 87290 80097290 1D55020C */  jal        OVR_LoadGame__Fv
    /* 87294 80097294 1000B0AF */   sw        $s0, 0x10($sp)
    /* 87298 80097298 3E10020C */  jal        VID_GetTick__Fv
    /* 8729C 8009729C 00000000 */   nop
    /* 872A0 800972A0 CCCC033C */  lui        $v1, (0xCCCCCCCD >> 16)
    /* 872A4 800972A4 CDCC6334 */  ori        $v1, $v1, (0xCCCCCCCD & 0xFFFF)
    /* 872A8 800972A8 19004300 */  multu      $v0, $v1
    /* 872AC 800972AC 1280063C */  lui        $a2, %hi(currlevel)
    /* 872B0 800972B0 0CC1C690 */  lbu        $a2, %lo(currlevel)($a2)
    /* 872B4 800972B4 10380000 */  mfhi       $a3
    /* 872B8 800972B8 82800700 */  srl        $s0, $a3, 2
    /* 872BC 800972BC 80181000 */  sll        $v1, $s0, 2
    /* 872C0 800972C0 21187000 */  addu       $v1, $v1, $s0
    /* 872C4 800972C4 23804300 */  subu       $s0, $v0, $v1
    /* 872C8 800972C8 0C80013C */  lui        $at, %hi(LevPals)
    /* 872CC 800972CC 21082600 */  addu       $at, $at, $a2
    /* 872D0 800972D0 589A2390 */  lbu        $v1, %lo(LevPals)($at)
    /* 872D4 800972D4 80000224 */  addiu      $v0, $zero, 0x80
    /* 872D8 800972D8 02006210 */  beq        $v1, $v0, .L800972E4
    /* 872DC 800972DC 00000000 */   nop
    /* 872E0 800972E0 21806000 */  addu       $s0, $v1, $zero
  .L800972E4:
    /* 872E4 800972E4 1280053C */  lui        $a1, %hi(leveltype)
    /* 872E8 800972E8 0DC1A590 */  lbu        $a1, %lo(leveltype)($a1)
    /* 872EC 800972EC 00000000 */  nop
    /* 872F0 800972F0 80100500 */  sll        $v0, $a1, 2
    /* 872F4 800972F4 21104500 */  addu       $v0, $v0, $a1
    /* 872F8 800972F8 21105000 */  addu       $v0, $v0, $s0
    /* 872FC 800972FC 40100200 */  sll        $v0, $v0, 1
    /* 87300 80097300 1180013C */  lui        $at, %hi(D_8011073C)
    /* 87304 80097304 21082200 */  addu       $at, $at, $v0
    /* 87308 80097308 3C072494 */  lhu        $a0, %lo(D_8011073C)($at)
    /* 8730C 8009730C C76E020C */  jal        GLUE_StartBg__Fibi
    /* 87310 80097310 0100A52C */   sltiu     $a1, $a1, 0x1
    /* 87314 80097314 1280023C */  lui        $v0, %hi(currlevel)
    /* 87318 80097318 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 8731C 8009731C 0C80013C */  lui        $at, %hi(LevPals)
    /* 87320 80097320 21082200 */  addu       $at, $at, $v0
    /* 87324 80097324 589A30A0 */  sb         $s0, %lo(LevPals)($at)
    /* 87328 80097328 1400BF8F */  lw         $ra, 0x14($sp)
    /* 8732C 8009732C 1000B08F */  lw         $s0, 0x10($sp)
    /* 87330 80097330 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 87334 80097334 0800E003 */  jr         $ra
    /* 87338 80097338 00000000 */   nop
endlabel PostNewLevel__Fv
