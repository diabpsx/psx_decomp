.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetHall__FPiN40, 0x98

glabel GetHall__FPiN40
    /* AECC 80144AC4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* AED0 80144AC8 4817828F */  lw         $v0, %gp_rel(pHallList)($gp)
    /* AED4 80144ACC 2800A88F */  lw         $t0, 0x28($sp)
    /* AED8 80144AD0 1400BFAF */  sw         $ra, 0x14($sp)
    /* AEDC 80144AD4 1000B0AF */  sw         $s0, 0x10($sp)
    /* AEE0 80144AD8 0000438C */  lw         $v1, 0x0($v0)
    /* AEE4 80144ADC 1400508C */  lw         $s0, 0x14($v0)
    /* AEE8 80144AE0 000083AC */  sw         $v1, 0x0($a0)
    /* AEEC 80144AE4 4817828F */  lw         $v0, %gp_rel(pHallList)($gp)
    /* AEF0 80144AE8 00000000 */  nop
    /* AEF4 80144AEC 0400428C */  lw         $v0, 0x4($v0)
    /* AEF8 80144AF0 00000000 */  nop
    /* AEFC 80144AF4 0000A2AC */  sw         $v0, 0x0($a1)
    /* AF00 80144AF8 4817828F */  lw         $v0, %gp_rel(pHallList)($gp)
    /* AF04 80144AFC 00000000 */  nop
    /* AF08 80144B00 0800428C */  lw         $v0, 0x8($v0)
    /* AF0C 80144B04 00000000 */  nop
    /* AF10 80144B08 0000C2AC */  sw         $v0, 0x0($a2)
    /* AF14 80144B0C 4817828F */  lw         $v0, %gp_rel(pHallList)($gp)
    /* AF18 80144B10 00000000 */  nop
    /* AF1C 80144B14 0C00428C */  lw         $v0, 0xC($v0)
    /* AF20 80144B18 00000000 */  nop
    /* AF24 80144B1C 0000E2AC */  sw         $v0, 0x0($a3)
    /* AF28 80144B20 4817828F */  lw         $v0, %gp_rel(pHallList)($gp)
    /* AF2C 80144B24 00000000 */  nop
    /* AF30 80144B28 1000428C */  lw         $v0, 0x10($v0)
    /* AF34 80144B2C 00000000 */  nop
    /* AF38 80144B30 000002AD */  sw         $v0, 0x0($t0)
    /* AF3C 80144B34 4817848F */  lw         $a0, %gp_rel(pHallList)($gp)
    /* AF40 80144B38 481780AF */  sw         $zero, %gp_rel(pHallList)($gp)
    /* AF44 80144B3C F7F6000C */  jal        mem_free_dbg__FPv
    /* AF48 80144B40 00000000 */   nop
    /* AF4C 80144B44 481790AF */  sw         $s0, %gp_rel(pHallList)($gp)
    /* AF50 80144B48 1400BF8F */  lw         $ra, 0x14($sp)
    /* AF54 80144B4C 1000B08F */  lw         $s0, 0x10($sp)
    /* AF58 80144B50 1800BD27 */  addiu      $sp, $sp, 0x18
    /* AF5C 80144B54 0800E003 */  jr         $ra
    /* AF60 80144B58 00000000 */   nop
endlabel GetHall__FPiN40
