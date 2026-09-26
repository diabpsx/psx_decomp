.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CredCountNL__Fi, 0x6C

glabel CredCountNL__Fi
    /* 3FF0 8013DBE8 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 3FF4 8013DBEC 2000B0AF */  sw         $s0, 0x20($sp)
    /* 3FF8 8013DBF0 2400BFAF */  sw         $ra, 0x24($sp)
    /* 3FFC 8013DBF4 4AED010C */  jal        GetStr__Fi
    /* 4000 8013DBF8 21800000 */   addu      $s0, $zero, $zero
    /* 4004 8013DBFC 21204000 */  addu       $a0, $v0, $zero
    /* 4008 8013DC00 00008280 */  lb         $v0, 0x0($a0)
    /* 400C 8013DC04 00008390 */  lbu        $v1, 0x0($a0)
    /* 4010 8013DC08 0D004010 */  beqz       $v0, .L8013DC40
    /* 4014 8013DC0C 21100002 */   addu      $v0, $s0, $zero
    /* 4018 8013DC10 7C000524 */  addiu      $a1, $zero, 0x7C
    /* 401C 8013DC14 00160300 */  sll        $v0, $v1, 24
  .L8013DC18:
    /* 4020 8013DC18 03160200 */  sra        $v0, $v0, 24
    /* 4024 8013DC1C 02004514 */  bne        $v0, $a1, .L8013DC28
    /* 4028 8013DC20 00000000 */   nop
    /* 402C 8013DC24 01001026 */  addiu      $s0, $s0, 0x1
  .L8013DC28:
    /* 4030 8013DC28 01008424 */  addiu      $a0, $a0, 0x1
    /* 4034 8013DC2C 00008280 */  lb         $v0, 0x0($a0)
    /* 4038 8013DC30 00008390 */  lbu        $v1, 0x0($a0)
    /* 403C 8013DC34 F8FF4014 */  bnez       $v0, .L8013DC18
    /* 4040 8013DC38 00160300 */   sll       $v0, $v1, 24
    /* 4044 8013DC3C 21100002 */  addu       $v0, $s0, $zero
  .L8013DC40:
    /* 4048 8013DC40 2400BF8F */  lw         $ra, 0x24($sp)
    /* 404C 8013DC44 2000B08F */  lw         $s0, 0x20($sp)
    /* 4050 8013DC48 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 4054 8013DC4C 0800E003 */  jr         $ra
    /* 4058 8013DC50 00000000 */   nop
endlabel CredCountNL__Fi
