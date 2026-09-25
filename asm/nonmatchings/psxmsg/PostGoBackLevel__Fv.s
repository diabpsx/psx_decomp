.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PostGoBackLevel__Fv, 0xAC

glabel PostGoBackLevel__Fv
    /* 87384 80097384 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 87388 80097388 1400BFAF */  sw         $ra, 0x14($sp)
    /* 8738C 8009738C 3E10020C */  jal        VID_GetTick__Fv
    /* 87390 80097390 1000B0AF */   sw        $s0, 0x10($sp)
    /* 87394 80097394 CCCC033C */  lui        $v1, (0xCCCCCCCD >> 16)
    /* 87398 80097398 CDCC6334 */  ori        $v1, $v1, (0xCCCCCCCD & 0xFFFF)
    /* 8739C 8009739C 19004300 */  multu      $v0, $v1
    /* 873A0 800973A0 1280063C */  lui        $a2, %hi(currlevel)
    /* 873A4 800973A4 0CC1C690 */  lbu        $a2, %lo(currlevel)($a2)
    /* 873A8 800973A8 10380000 */  mfhi       $a3
    /* 873AC 800973AC 82800700 */  srl        $s0, $a3, 2
    /* 873B0 800973B0 80181000 */  sll        $v1, $s0, 2
    /* 873B4 800973B4 21187000 */  addu       $v1, $v1, $s0
    /* 873B8 800973B8 23804300 */  subu       $s0, $v0, $v1
    /* 873BC 800973BC 0C80013C */  lui        $at, %hi(LevPals)
    /* 873C0 800973C0 21082600 */  addu       $at, $at, $a2
    /* 873C4 800973C4 589A2390 */  lbu        $v1, %lo(LevPals)($at)
    /* 873C8 800973C8 80000224 */  addiu      $v0, $zero, 0x80
    /* 873CC 800973CC 02006210 */  beq        $v1, $v0, .L800973D8
    /* 873D0 800973D0 00000000 */   nop
    /* 873D4 800973D4 21806000 */  addu       $s0, $v1, $zero
  .L800973D8:
    /* 873D8 800973D8 1280053C */  lui        $a1, %hi(leveltype)
    /* 873DC 800973DC 0DC1A590 */  lbu        $a1, %lo(leveltype)($a1)
    /* 873E0 800973E0 00000000 */  nop
    /* 873E4 800973E4 80100500 */  sll        $v0, $a1, 2
    /* 873E8 800973E8 21104500 */  addu       $v0, $v0, $a1
    /* 873EC 800973EC 21105000 */  addu       $v0, $v0, $s0
    /* 873F0 800973F0 40100200 */  sll        $v0, $v0, 1
    /* 873F4 800973F4 1180013C */  lui        $at, %hi(D_8011073C)
    /* 873F8 800973F8 21082200 */  addu       $at, $at, $v0
    /* 873FC 800973FC 3C072494 */  lhu        $a0, %lo(D_8011073C)($at)
    /* 87400 80097400 C76E020C */  jal        GLUE_StartBg__Fibi
    /* 87404 80097404 0100A52C */   sltiu     $a1, $a1, 0x1
    /* 87408 80097408 1280023C */  lui        $v0, %hi(currlevel)
    /* 8740C 8009740C 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 87410 80097410 0C80013C */  lui        $at, %hi(LevPals)
    /* 87414 80097414 21082200 */  addu       $at, $at, $v0
    /* 87418 80097418 589A30A0 */  sb         $s0, %lo(LevPals)($at)
    /* 8741C 8009741C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 87420 80097420 1000B08F */  lw         $s0, 0x10($sp)
    /* 87424 80097424 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 87428 80097428 0800E003 */  jr         $ra
    /* 8742C 8009742C 00000000 */   nop
endlabel PostGoBackLevel__Fv
