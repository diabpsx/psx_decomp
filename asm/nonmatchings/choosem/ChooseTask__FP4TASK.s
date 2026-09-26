.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ChooseTask__FP4TASK, 0xD0

glabel ChooseTask__FP4TASK
    /* 1BF94 80155B8C A8FFBD27 */  addiu      $sp, $sp, -0x58
    /* 1BF98 80155B90 4800B0AF */  sw         $s0, 0x48($sp)
    /* 1BF9C 80155B94 21808000 */  addu       $s0, $a0, $zero
    /* 1BFA0 80155B98 5400BFAF */  sw         $ra, 0x54($sp)
    /* 1BFA4 80155B9C 5000B2AF */  sw         $s2, 0x50($sp)
    /* 1BFA8 80155BA0 896E020C */  jal        GLUE_SuspendGame__Fv
    /* 1BFAC 80155BA4 4C00B1AF */   sw        $s1, 0x4C($sp)
    /* 1BFB0 80155BA8 1C00028E */  lw         $v0, 0x1C($s0)
    /* 1BFB4 80155BAC 00000000 */  nop
    /* 1BFB8 80155BB0 0000508C */  lw         $s0, 0x0($v0)
    /* 1BFBC 80155BB4 0400528C */  lw         $s2, 0x4($v0)
    /* 1BFC0 80155BB8 0800518C */  lw         $s1, 0x8($v0)
    /* 1BFC4 80155BBC FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 1BFC8 80155BC0 07000006 */  bltz       $s0, .L80155BE0
    /* 1BFCC 80155BC4 21200000 */   addu      $a0, $zero, $zero
    /* 1BFD0 80155BC8 1280023C */  lui        $v0, %hi(NumOfMonsterListLevels)
    /* 1BFD4 80155BCC 94AA428C */  lw         $v0, %lo(NumOfMonsterListLevels)($v0)
    /* 1BFD8 80155BD0 00000000 */  nop
    /* 1BFDC 80155BD4 2A100202 */  slt        $v0, $s0, $v0
    /* 1BFE0 80155BD8 05004014 */  bnez       $v0, .L80155BF0
    /* 1BFE4 80155BDC 00000000 */   nop
  .L80155BE0:
    /* 1BFE8 80155BE0 1280053C */  lui        $a1, %hi(D_80119740)
    /* 1BFEC 80155BE4 4097A524 */  addiu      $a1, $a1, %lo(D_80119740)
    /* 1BFF0 80155BE8 A583000C */  jal        DBG_Error
    /* 1BFF4 80155BEC 44010624 */   addiu     $a2, $zero, 0x144
  .L80155BF0:
    /* 1BFF8 80155BF0 21200002 */  addu       $a0, $s0, $zero
    /* 1BFFC 80155BF4 21282002 */  addu       $a1, $s1, $zero
    /* 1C000 80155BF8 A357050C */  jal        GetListsAvailable__FiUlPUc
    /* 1C004 80155BFC 1000A627 */   addiu     $a2, $sp, 0x10
    /* 1C008 80155C00 21804000 */  addu       $s0, $v0, $zero
    /* 1C00C 80155C04 C9F6000C */  jal        ENG_random__Fl
    /* 1C010 80155C08 21200002 */   addu      $a0, $s0, $zero
    /* 1C014 80155C0C 1280033C */  lui        $v1, %hi(demo_pad_time)
    /* 1C018 80155C10 B4AB638C */  lw         $v1, %lo(demo_pad_time)($v1)
    /* 1C01C 80155C14 00000000 */  nop
    /* 1C020 80155C18 02006010 */  beqz       $v1, .L80155C24
    /* 1C024 80155C1C 00000000 */   nop
    /* 1C028 80155C20 21100000 */  addu       $v0, $zero, $zero
  .L80155C24:
    /* 1C02C 80155C24 03005014 */  bne        $v0, $s0, .L80155C34
    /* 1C030 80155C28 2110A203 */   addu      $v0, $sp, $v0
    /* 1C034 80155C2C 21100000 */  addu       $v0, $zero, $zero
    /* 1C038 80155C30 2110A203 */  addu       $v0, $sp, $v0
  .L80155C34:
    /* 1C03C 80155C34 10004290 */  lbu        $v0, 0x10($v0)
    /* 1C040 80155C38 9E6E020C */  jal        GLUE_ResumeGame__Fv
    /* 1C044 80155C3C 000042AE */   sw        $v0, 0x0($s2)
    /* 1C048 80155C40 5400BF8F */  lw         $ra, 0x54($sp)
    /* 1C04C 80155C44 5000B28F */  lw         $s2, 0x50($sp)
    /* 1C050 80155C48 4C00B18F */  lw         $s1, 0x4C($sp)
    /* 1C054 80155C4C 4800B08F */  lw         $s0, 0x48($sp)
    /* 1C058 80155C50 5800BD27 */  addiu      $sp, $sp, 0x58
    /* 1C05C 80155C54 0800E003 */  jr         $ra
    /* 1C060 80155C58 00000000 */   nop
endlabel ChooseTask__FP4TASK
