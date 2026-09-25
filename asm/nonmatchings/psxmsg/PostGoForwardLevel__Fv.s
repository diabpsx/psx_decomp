.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PostGoForwardLevel__Fv, 0xAC

glabel PostGoForwardLevel__Fv
    /* 87484 80097484 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 87488 80097488 1400BFAF */  sw         $ra, 0x14($sp)
    /* 8748C 8009748C 3E10020C */  jal        VID_GetTick__Fv
    /* 87490 80097490 1000B0AF */   sw        $s0, 0x10($sp)
    /* 87494 80097494 CCCC033C */  lui        $v1, (0xCCCCCCCD >> 16)
    /* 87498 80097498 CDCC6334 */  ori        $v1, $v1, (0xCCCCCCCD & 0xFFFF)
    /* 8749C 8009749C 19004300 */  multu      $v0, $v1
    /* 874A0 800974A0 1280063C */  lui        $a2, %hi(currlevel)
    /* 874A4 800974A4 0CC1C690 */  lbu        $a2, %lo(currlevel)($a2)
    /* 874A8 800974A8 10380000 */  mfhi       $a3
    /* 874AC 800974AC 82800700 */  srl        $s0, $a3, 2
    /* 874B0 800974B0 80181000 */  sll        $v1, $s0, 2
    /* 874B4 800974B4 21187000 */  addu       $v1, $v1, $s0
    /* 874B8 800974B8 23804300 */  subu       $s0, $v0, $v1
    /* 874BC 800974BC 0C80013C */  lui        $at, %hi(LevPals)
    /* 874C0 800974C0 21082600 */  addu       $at, $at, $a2
    /* 874C4 800974C4 589A2390 */  lbu        $v1, %lo(LevPals)($at)
    /* 874C8 800974C8 80000224 */  addiu      $v0, $zero, 0x80
    /* 874CC 800974CC 02006210 */  beq        $v1, $v0, .L800974D8
    /* 874D0 800974D0 00000000 */   nop
    /* 874D4 800974D4 21806000 */  addu       $s0, $v1, $zero
  .L800974D8:
    /* 874D8 800974D8 1280053C */  lui        $a1, %hi(leveltype)
    /* 874DC 800974DC 0DC1A590 */  lbu        $a1, %lo(leveltype)($a1)
    /* 874E0 800974E0 00000000 */  nop
    /* 874E4 800974E4 80100500 */  sll        $v0, $a1, 2
    /* 874E8 800974E8 21104500 */  addu       $v0, $v0, $a1
    /* 874EC 800974EC 21105000 */  addu       $v0, $v0, $s0
    /* 874F0 800974F0 40100200 */  sll        $v0, $v0, 1
    /* 874F4 800974F4 1180013C */  lui        $at, %hi(D_8011073C)
    /* 874F8 800974F8 21082200 */  addu       $at, $at, $v0
    /* 874FC 800974FC 3C072494 */  lhu        $a0, %lo(D_8011073C)($at)
    /* 87500 80097500 C76E020C */  jal        GLUE_StartBg__Fibi
    /* 87504 80097504 0100A52C */   sltiu     $a1, $a1, 0x1
    /* 87508 80097508 1280023C */  lui        $v0, %hi(currlevel)
    /* 8750C 8009750C 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 87510 80097510 0C80013C */  lui        $at, %hi(LevPals)
    /* 87514 80097514 21082200 */  addu       $at, $at, $v0
    /* 87518 80097518 589A30A0 */  sb         $s0, %lo(LevPals)($at)
    /* 8751C 8009751C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 87520 80097520 1000B08F */  lw         $s0, 0x10($sp)
    /* 87524 80097524 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 87528 80097528 0800E003 */  jr         $ra
    /* 8752C 8009752C 00000000 */   nop
endlabel PostGoForwardLevel__Fv
