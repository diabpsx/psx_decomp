.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8001D498, 0x68

glabel func_8001D498
    /* D498 8001D498 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* D49C 8001D49C 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* D4A0 8001D4A0 21888000 */  addu       $s1, $a0, $zero
    /* D4A4 8001D4A4 2120A000 */  addu       $a0, $a1, $zero
    /* D4A8 8001D4A8 1000A527 */  addiu      $a1, $sp, 0x10
    /* D4AC 8001D4AC 1800B0AF */  sw         $s0, 0x18($sp)
    /* D4B0 8001D4B0 2000BFAF */  sw         $ra, 0x20($sp)
    /* D4B4 8001D4B4 AE6C000C */  jal        CdIntToPos
    /* D4B8 8001D4B8 2180C000 */   addu      $s0, $a2, $zero
    /* D4BC 8001D4BC 02000424 */  addiu      $a0, $zero, 0x2
    /* D4C0 8001D4C0 1000A527 */  addiu      $a1, $sp, 0x10
    /* D4C4 8001D4C4 966B000C */  jal        CdControl
    /* D4C8 8001D4C8 21300000 */   addu      $a2, $zero, $zero
    /* D4CC 8001D4CC 21202002 */  addu       $a0, $s1, $zero
    /* D4D0 8001D4D0 21280002 */  addu       $a1, $s0, $zero
    /* D4D4 8001D4D4 B376000C */  jal        CdRead
    /* D4D8 8001D4D8 80000624 */   addiu     $a2, $zero, 0x80
    /* D4DC 8001D4DC 21200000 */  addu       $a0, $zero, $zero
    /* D4E0 8001D4E0 F376000C */  jal        CdReadSync
    /* D4E4 8001D4E4 21280000 */   addu      $a1, $zero, $zero
    /* D4E8 8001D4E8 0100422C */  sltiu      $v0, $v0, 0x1
    /* D4EC 8001D4EC 2000BF8F */  lw         $ra, 0x20($sp)
    /* D4F0 8001D4F0 1C00B18F */  lw         $s1, 0x1C($sp)
    /* D4F4 8001D4F4 1800B08F */  lw         $s0, 0x18($sp)
    /* D4F8 8001D4F8 0800E003 */  jr         $ra
    /* D4FC 8001D4FC 2800BD27 */   addiu     $sp, $sp, 0x28
endlabel func_8001D498
    /* D500 8001D500 00000000 */  nop
    /* D504 8001D504 00000000 */  nop
    /* D508 8001D508 00000000 */  nop
