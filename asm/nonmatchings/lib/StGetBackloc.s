.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StGetBackloc, 0x58

glabel StGetBackloc
    /* DE08 8001DE08 1380023C */  lui        $v0, %hi(StMode)
    /* DE0C 8001DE0C D851428C */  lw         $v0, %lo(StMode)($v0)
    /* DE10 8001DE10 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* DE14 8001DE14 1000B0AF */  sw         $s0, 0x10($sp)
    /* DE18 8001DE18 21808000 */  addu       $s0, $a0, $zero
    /* DE1C 8001DE1C 0B004014 */  bnez       $v0, .L8001DE4C
    /* DE20 8001DE20 1400BFAF */   sw        $ra, 0x14($sp)
    /* DE24 8001DE24 1380043C */  lui        $a0, %hi(D_80132570)
    /* DE28 8001DE28 EF6C000C */  jal        CdPosToInt
    /* DE2C 8001DE2C 70258424 */   addiu     $a0, $a0, %lo(D_80132570)
    /* DE30 8001DE30 01004424 */  addiu      $a0, $v0, 0x1
    /* DE34 8001DE34 AE6C000C */  jal        CdIntToPos
    /* DE38 8001DE38 21280002 */   addu      $a1, $s0, $zero
    /* DE3C 8001DE3C 1380023C */  lui        $v0, %hi(D_80132574)
    /* DE40 8001DE40 7425428C */  lw         $v0, %lo(D_80132574)($v0)
    /* DE44 8001DE44 94770008 */  j          .L8001DE50
    /* DE48 8001DE48 00000000 */   nop
  .L8001DE4C:
    /* DE4C 8001DE4C FFFF0224 */  addiu      $v0, $zero, -0x1
  .L8001DE50:
    /* DE50 8001DE50 1400BF8F */  lw         $ra, 0x14($sp)
    /* DE54 8001DE54 1000B08F */  lw         $s0, 0x10($sp)
    /* DE58 8001DE58 0800E003 */  jr         $ra
    /* DE5C 8001DE5C 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel StGetBackloc
    /* DE60 8001DE60 00000000 */  nop
    /* DE64 8001DE64 00000000 */  nop
    /* DE68 8001DE68 00000000 */  nop
