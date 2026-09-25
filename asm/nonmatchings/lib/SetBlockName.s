.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetBlockName, 0x48

glabel SetBlockName
    /* 13034 80023034 F8FFBD27 */  addiu      $sp, $sp, -0x8
    /* 13038 80023038 0B00A010 */  beqz       $a1, .L80023068
    /* 1303C 8002303C 21300000 */   addu      $a2, $zero, $zero
    /* 13040 80023040 03000734 */  ori        $a3, $zero, 0x3
  .L80023044:
    /* 13044 80023044 0000A280 */  lb         $v0, 0x0($a1)
    /* 13048 80023048 00000000 */  nop
    /* 1304C 8002304C 06004010 */  beqz       $v0, .L80023068
    /* 13050 80023050 21184000 */   addu      $v1, $v0, $zero
    /* 13054 80023054 21108600 */  addu       $v0, $a0, $a2
    /* 13058 80023058 180043A0 */  sb         $v1, 0x18($v0)
    /* 1305C 8002305C 0100C624 */  addiu      $a2, $a2, 0x1
    /* 13060 80023060 F8FFC714 */  bne        $a2, $a3, .L80023044
    /* 13064 80023064 0100A524 */   addiu     $a1, $a1, 0x1
  .L80023068:
    /* 13068 80023068 21108600 */  addu       $v0, $a0, $a2
    /* 1306C 8002306C 180040A0 */  sb         $zero, 0x18($v0)
    /* 13070 80023070 0800BD27 */  addiu      $sp, $sp, 0x8
    /* 13074 80023074 0800E003 */  jr         $ra
    /* 13078 80023078 00000000 */   nop
endlabel SetBlockName
