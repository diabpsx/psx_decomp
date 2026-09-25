.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitTowners__Fv, 0x8C

glabel InitTowners__Fv
    /* 2AFD8 8003AFD8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2AFDC 8003AFDC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 2AFE0 8003AFE0 9C1080AF */  sw         $zero, %gp_rel(numtowners)($gp)
    /* 2AFE4 8003AFE4 A11080A3 */  sb         $zero, %gp_rel(boyloadflag)($gp)
    /* 2AFE8 8003AFE8 99E8000C */  jal        InitSmith__Fv
    /* 2AFEC 8003AFEC 00000000 */   nop
    /* 2AFF0 8003AFF0 69EA000C */  jal        InitHealer__Fv
    /* 2AFF4 8003AFF4 00000000 */   nop
    /* 2AFF8 8003AFF8 0E80033C */  lui        $v1, %hi(quests + 0x7A)
    /* 2AFFC 8003AFFC BADA6390 */  lbu        $v1, %lo(quests + 0x7A)($v1)
    /* 2B000 8003B000 00000000 */  nop
    /* 2B004 8003B004 05006010 */  beqz       $v1, .L8003B01C
    /* 2B008 8003B008 03000224 */   addiu     $v0, $zero, 0x3
    /* 2B00C 8003B00C 03006210 */  beq        $v1, $v0, .L8003B01C
    /* 2B010 8003B010 00000000 */   nop
    /* 2B014 8003B014 33E9000C */  jal        InitTownDead__Fv
    /* 2B018 8003B018 00000000 */   nop
  .L8003B01C:
    /* 2B01C 8003B01C E5E8000C */  jal        InitBarOwner__Fv
    /* 2B020 8003B020 00000000 */   nop
    /* 2B024 8003B024 B6EA000C */  jal        InitTeller__Fv
    /* 2B028 8003B028 00000000 */   nop
    /* 2B02C 8003B02C 03EB000C */  jal        InitDrunk__Fv
    /* 2B030 8003B030 00000000 */   nop
    /* 2B034 8003B034 80E9000C */  jal        InitWitch__Fv
    /* 2B038 8003B038 00000000 */   nop
    /* 2B03C 8003B03C CDE9000C */  jal        InitBarmaid__Fv
    /* 2B040 8003B040 00000000 */   nop
    /* 2B044 8003B044 1AEA000C */  jal        InitBoy__Fv
    /* 2B048 8003B048 00000000 */   nop
    /* 2B04C 8003B04C 50EB000C */  jal        InitCows__Fv
    /* 2B050 8003B050 00000000 */   nop
    /* 2B054 8003B054 1000BF8F */  lw         $ra, 0x10($sp)
    /* 2B058 8003B058 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2B05C 8003B05C 0800E003 */  jr         $ra
    /* 2B060 8003B060 00000000 */   nop
endlabel InitTowners__Fv
