.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_800157D4, 0x54

glabel func_800157D4
    /* 57D4 800157D4 0010023C */  lui        $v0, (0x10000000 >> 16)
    /* 57D8 800157D8 0B80033C */  lui        $v1, %hi(D_800B5584)
    /* 57DC 800157DC 8455638C */  lw         $v1, %lo(D_800B5584)($v1)
    /* 57E0 800157E0 25208200 */  or         $a0, $a0, $v0
    /* 57E4 800157E4 000064AC */  sw         $a0, 0x0($v1)
    /* 57E8 800157E8 0B80023C */  lui        $v0, %hi(D_800B5580)
    /* 57EC 800157EC 8055428C */  lw         $v0, %lo(D_800B5580)($v0)
    /* 57F0 800157F0 FF00033C */  lui        $v1, (0xFFFFFF >> 16)
    /* 57F4 800157F4 0000428C */  lw         $v0, 0x0($v0)
    /* 57F8 800157F8 FFFF6334 */  ori        $v1, $v1, (0xFFFFFF & 0xFFFF)
    /* 57FC 800157FC 0800E003 */  jr         $ra
    /* 5800 80015800 24104300 */   and       $v0, $v0, $v1
    /* 5804 80015804 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 5808 80015808 1000BFAF */  sw         $ra, 0x10($sp)
    /* 580C 8001580C 2138C000 */  addu       $a3, $a2, $zero
    /* 5810 80015810 0A56000C */  jal        func_80015828
    /* 5814 80015814 21300000 */   addu      $a2, $zero, $zero
    /* 5818 80015818 1000BF8F */  lw         $ra, 0x10($sp)
    /* 581C 8001581C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 5820 80015820 0800E003 */  jr         $ra
    /* 5824 80015824 00000000 */   nop
endlabel func_800157D4
