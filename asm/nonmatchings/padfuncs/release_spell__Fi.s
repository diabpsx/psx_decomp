.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching release_spell__Fi, 0x64

glabel release_spell__Fi
    /* 909FC 800A09FC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 90A00 800A0A00 1000B0AF */  sw         $s0, 0x10($sp)
    /* 90A04 800A0A04 21808000 */  addu       $s0, $a0, $zero
    /* 90A08 800A0A08 1280043C */  lui        $a0, %hi(sel_data)
    /* 90A0C 800A0A0C 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 90A10 800A0A10 1400BFAF */  sw         $ra, 0x14($sp)
    /* 90A14 800A0A14 A4BF020C */  jal        GetSpellTarget__Fi
    /* 90A18 800A0A18 00000000 */   nop
    /* 90A1C 800A0A1C 1280013C */  lui        $at, %hi(myplr)
    /* 90A20 800A0A20 08BA30AC */  sw         $s0, %lo(myplr)($at)
    /* 90A24 800A0A24 10004390 */  lbu        $v1, 0x10($v0)
    /* 90A28 800A0A28 1280013C */  lui        $at, %hi(cursmx)
    /* 90A2C 800A0A2C 50B723AC */  sw         $v1, %lo(cursmx)($at)
    /* 90A30 800A0A30 11004290 */  lbu        $v0, 0x11($v0)
    /* 90A34 800A0A34 1280013C */  lui        $at, %hi(cursmy)
    /* 90A38 800A0A38 54B722AC */  sw         $v0, %lo(cursmy)($at)
    /* 90A3C 800A0A3C 5DE1000C */  jal        TryIconCurs__Fv
    /* 90A40 800A0A40 00000000 */   nop
    /* 90A44 800A0A44 E385020C */  jal        RemoveTargetCursor__Fi
    /* 90A48 800A0A48 21200002 */   addu      $a0, $s0, $zero
    /* 90A4C 800A0A4C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 90A50 800A0A50 1000B08F */  lw         $s0, 0x10($sp)
    /* 90A54 800A0A54 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 90A58 800A0A58 0800E003 */  jr         $ra
    /* 90A5C 800A0A5C 00000000 */   nop
endlabel release_spell__Fi
