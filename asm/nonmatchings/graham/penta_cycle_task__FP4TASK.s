.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching penta_cycle_task__FP4TASK, 0x180

glabel penta_cycle_task__FP4TASK
    /* 8E070 8009E070 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 8E074 8009E074 4400BFAF */  sw         $ra, 0x44($sp)
    /* 8E078 8009E078 4000B2AF */  sw         $s2, 0x40($sp)
    /* 8E07C 8009E07C 3C00B1AF */  sw         $s1, 0x3C($sp)
    /* 8E080 8009E080 3800B0AF */  sw         $s0, 0x38($sp)
    /* 8E084 8009E084 260980A7 */  sh         $zero, %gp_rel(penta_clut)($gp)
    /* 8E088 8009E088 300980AF */  sw         $zero, %gp_rel(penta_cycle)($gp)
  .L8009E08C:
    /* 8E08C 8009E08C C16E020C */  jal        GLUE_Finished__Fv
    /* 8E090 8009E090 00000000 */   nop
    /* 8E094 8009E094 4F004014 */  bnez       $v0, .L8009E1D4
    /* 8E098 8009E098 00000000 */   nop
    /* 8E09C 8009E09C EE80000C */  jal        TSK_Sleep
    /* 8E0A0 8009E0A0 01000424 */   addiu     $a0, $zero, 0x1
    /* 8E0A4 8009E0A4 26098297 */  lhu        $v0, %gp_rel(penta_clut)($gp)
    /* 8E0A8 8009E0A8 00000000 */  nop
    /* 8E0AC 8009E0AC F7FF4010 */  beqz       $v0, .L8009E08C
    /* 8E0B0 8009E0B0 01001124 */   addiu     $s1, $zero, 0x1
    /* 8E0B4 8009E0B4 02001024 */  addiu      $s0, $zero, 0x2
  .L8009E0B8:
    /* 8E0B8 8009E0B8 1280023C */  lui        $v0, %hi(gbMaxPlayers)
    /* 8E0BC 8009E0BC A2B94290 */  lbu        $v0, %lo(gbMaxPlayers)($v0)
    /* 8E0C0 8009E0C0 00000000 */  nop
    /* 8E0C4 8009E0C4 0E005114 */  bne        $v0, $s1, .L8009E100
    /* 8E0C8 8009E0C8 00000000 */   nop
    /* 8E0CC 8009E0CC 0E80023C */  lui        $v0, %hi(quests + 0x66)
    /* 8E0D0 8009E0D0 A6DA4290 */  lbu        $v0, %lo(quests + 0x66)($v0)
    /* 8E0D4 8009E0D4 00000000 */  nop
    /* 8E0D8 8009E0D8 09005010 */  beq        $v0, $s0, .L8009E100
    /* 8E0DC 8009E0DC 00000000 */   nop
    /* 8E0E0 8009E0E0 C16E020C */  jal        GLUE_Finished__Fv
    /* 8E0E4 8009E0E4 00000000 */   nop
    /* 8E0E8 8009E0E8 3A004014 */  bnez       $v0, .L8009E1D4
    /* 8E0EC 8009E0EC 00000000 */   nop
    /* 8E0F0 8009E0F0 EE80000C */  jal        TSK_Sleep
    /* 8E0F4 8009E0F4 01000424 */   addiu     $a0, $zero, 0x1
    /* 8E0F8 8009E0F8 2E780208 */  j          .L8009E0B8
    /* 8E0FC 8009E0FC 00000000 */   nop
  .L8009E100:
    /* 8E100 8009E100 21800000 */  addu       $s0, $zero, $zero
    /* 8E104 8009E104 1000B127 */  addiu      $s1, $sp, 0x10
    /* 8E108 8009E108 00801224 */  addiu      $s2, $zero, -0x8000
    /* 8E10C 8009E10C 26098397 */  lhu        $v1, %gp_rel(penta_clut)($gp)
    /* 8E110 8009E110 10000224 */  addiu      $v0, $zero, 0x10
    /* 8E114 8009E114 1400A2A7 */  sh         $v0, 0x14($sp)
    /* 8E118 8009E118 01000224 */  addiu      $v0, $zero, 0x1
    /* 8E11C 8009E11C 1600A2A7 */  sh         $v0, 0x16($sp)
    /* 8E120 8009E120 3F006230 */  andi       $v0, $v1, 0x3F
    /* 8E124 8009E124 00110200 */  sll        $v0, $v0, 4
    /* 8E128 8009E128 82190300 */  srl        $v1, $v1, 6
    /* 8E12C 8009E12C 1000A2A7 */  sh         $v0, 0x10($sp)
    /* 8E130 8009E130 1200A3A7 */  sh         $v1, 0x12($sp)
  .L8009E134:
    /* 8E134 8009E134 C16E020C */  jal        GLUE_Finished__Fv
    /* 8E138 8009E138 00000000 */   nop
    /* 8E13C 8009E13C 01004238 */  xori       $v0, $v0, 0x1
    /* 8E140 8009E140 24004010 */  beqz       $v0, .L8009E1D4
    /* 8E144 8009E144 00000000 */   nop
    /* 8E148 8009E148 26098297 */  lhu        $v0, %gp_rel(penta_clut)($gp)
    /* 8E14C 8009E14C 00000000 */  nop
    /* 8E150 8009E150 1C004010 */  beqz       $v0, .L8009E1C4
    /* 8E154 8009E154 00000000 */   nop
    /* 8E158 8009E158 1280023C */  lui        $v0, %hi(DoDrawBg)
    /* 8E15C 8009E15C 04B0428C */  lw         $v0, %lo(DoDrawBg)($v0)
    /* 8E160 8009E160 00000000 */  nop
    /* 8E164 8009E164 17004010 */  beqz       $v0, .L8009E1C4
    /* 8E168 8009E168 00000000 */   nop
    /* 8E16C 8009E16C 1280023C */  lui        $v0, %hi(PauseMode)
    /* 8E170 8009E170 A4B74290 */  lbu        $v0, %lo(PauseMode)($v0)
    /* 8E174 8009E174 00000000 */  nop
    /* 8E178 8009E178 12004014 */  bnez       $v0, .L8009E1C4
    /* 8E17C 8009E17C 20000232 */   andi      $v0, $s0, 0x20
    /* 8E180 8009E180 02004010 */  beqz       $v0, .L8009E18C
    /* 8E184 8009E184 21180002 */   addu      $v1, $s0, $zero
    /* 8E188 8009E188 1F00033A */  xori       $v1, $s0, 0x1F
  .L8009E18C:
    /* 8E18C 8009E18C 01000424 */  addiu      $a0, $zero, 0x1
    /* 8E190 8009E190 1F006230 */  andi       $v0, $v1, 0x1F
    /* 8E194 8009E194 25285200 */  or         $a1, $v0, $s2
    /* 8E198 8009E198 02002326 */  addiu      $v1, $s1, 0x2
  .L8009E19C:
    /* 8E19C 8009E19C 080065A4 */  sh         $a1, 0x8($v1)
    /* 8E1A0 8009E1A0 01008424 */  addiu      $a0, $a0, 0x1
    /* 8E1A4 8009E1A4 10008228 */  slti       $v0, $a0, 0x10
    /* 8E1A8 8009E1A8 FCFF4014 */  bnez       $v0, .L8009E19C
    /* 8E1AC 8009E1AC 02006324 */   addiu     $v1, $v1, 0x2
    /* 8E1B0 8009E1B0 1800A0A7 */  sh         $zero, 0x18($sp)
    /* 8E1B4 8009E1B4 1000A427 */  addiu      $a0, $sp, 0x10
    /* 8E1B8 8009E1B8 494F000C */  jal        LoadImage
    /* 8E1BC 8009E1BC 1800A527 */   addiu     $a1, $sp, 0x18
    /* 8E1C0 8009E1C0 01001026 */  addiu      $s0, $s0, 0x1
  .L8009E1C4:
    /* 8E1C4 8009E1C4 EE80000C */  jal        TSK_Sleep
    /* 8E1C8 8009E1C8 01000424 */   addiu     $a0, $zero, 0x1
    /* 8E1CC 8009E1CC 4D780208 */  j          .L8009E134
    /* 8E1D0 8009E1D0 00000000 */   nop
  .L8009E1D4:
    /* 8E1D4 8009E1D4 4400BF8F */  lw         $ra, 0x44($sp)
    /* 8E1D8 8009E1D8 4000B28F */  lw         $s2, 0x40($sp)
    /* 8E1DC 8009E1DC 3C00B18F */  lw         $s1, 0x3C($sp)
    /* 8E1E0 8009E1E0 3800B08F */  lw         $s0, 0x38($sp)
    /* 8E1E4 8009E1E4 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 8E1E8 8009E1E8 0800E003 */  jr         $ra
    /* 8E1EC 8009E1EC 00000000 */   nop
endlabel penta_cycle_task__FP4TASK
