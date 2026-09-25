.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BIRD_StartScatter__FP10BIRDSTRUCT, 0xA0

glabel BIRD_StartScatter__FP10BIRDSTRUCT
    /* 9C0F0 800AC0F0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 9C0F4 800AC0F4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9C0F8 800AC0F8 21808000 */  addu       $s0, $a0, $zero
    /* 9C0FC 800AC0FC 64000424 */  addiu      $a0, $zero, 0x64
    /* 9C100 800AC100 02000224 */  addiu      $v0, $zero, 0x2
    /* 9C104 800AC104 1400BFAF */  sw         $ra, 0x14($sp)
    /* 9C108 800AC108 C9F6000C */  jal        ENG_random__Fl
    /* 9C10C 800AC10C 120002A2 */   sb        $v0, 0x12($s0)
    /* 9C110 800AC110 32000424 */  addiu      $a0, $zero, 0x32
    /* 9C114 800AC114 32004224 */  addiu      $v0, $v0, 0x32
    /* 9C118 800AC118 C9F6000C */  jal        ENG_random__Fl
    /* 9C11C 800AC11C 0F0002A2 */   sb        $v0, 0xF($s0)
    /* 9C120 800AC120 14000392 */  lbu        $v1, 0x14($s0)
    /* 9C124 800AC124 05004224 */  addiu      $v0, $v0, 0x5
    /* 9C128 800AC128 05006010 */  beqz       $v1, .L800AC140
    /* 9C12C 800AC12C 100002A2 */   sb        $v0, 0x10($s0)
    /* 9C130 800AC130 C9F6000C */  jal        ENG_random__Fl
    /* 9C134 800AC134 08000424 */   addiu     $a0, $zero, 0x8
    /* 9C138 800AC138 5DB00208 */  j          .L800AC174
    /* 9C13C 800AC13C 0D0002A2 */   sb        $v0, 0xD($s0)
  .L800AC140:
    /* 9C140 800AC140 08000482 */  lb         $a0, 0x8($s0)
    /* 9C144 800AC144 0000028E */  lw         $v0, 0x0($s0)
    /* 9C148 800AC148 09000582 */  lb         $a1, 0x9($s0)
    /* 9C14C 800AC14C 08004680 */  lb         $a2, 0x8($v0)
    /* 9C150 800AC150 09004780 */  lb         $a3, 0x9($v0)
    /* 9C154 800AC154 8AF6000C */  jal        GetDirection__Fiiii
    /* 9C158 800AC158 00000000 */   nop
    /* 9C15C 800AC15C FCFF4324 */  addiu      $v1, $v0, -0x4
    /* 9C160 800AC160 0D0003A2 */  sb         $v1, 0xD($s0)
    /* 9C164 800AC164 001E0300 */  sll        $v1, $v1, 24
    /* 9C168 800AC168 02006104 */  bgez       $v1, .L800AC174
    /* 9C16C 800AC16C 00000000 */   nop
    /* 9C170 800AC170 0D0002A2 */  sb         $v0, 0xD($s0)
  .L800AC174:
    /* 9C174 800AC174 F8AF020C */  jal        CheckDirOk__FP10BIRDSTRUCT
    /* 9C178 800AC178 21200002 */   addu      $a0, $s0, $zero
    /* 9C17C 800AC17C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 9C180 800AC180 1000B08F */  lw         $s0, 0x10($sp)
    /* 9C184 800AC184 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 9C188 800AC188 0800E003 */  jr         $ra
    /* 9C18C 800AC18C 00000000 */   nop
endlabel BIRD_StartScatter__FP10BIRDSTRUCT
