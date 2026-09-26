.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CreateL4Dungeon__FUii, 0xE0

glabel CreateL4Dungeon__FUii
    /* 1B600 801551F8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1B604 801551FC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1B608 80155200 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1B60C 80155204 B3F6000C */  jal        SetRndSeed__Fl
    /* 1B610 80155208 2180A000 */   addu      $s0, $a1, $zero
    /* 1B614 8015520C 60000224 */  addiu      $v0, $zero, 0x60
    /* 1B618 80155210 1280013C */  lui        $at, %hi(dmaxx)
    /* 1B61C 80155214 00C122AC */  sw         $v0, %lo(dmaxx)($at)
    /* 1B620 80155218 1280013C */  lui        $at, %hi(dmaxy)
    /* 1B624 8015521C 04C122AC */  sw         $v0, %lo(dmaxy)($at)
    /* 1B628 80155220 28000224 */  addiu      $v0, $zero, 0x28
    /* 1B62C 80155224 1280013C */  lui        $at, %hi(dminx)
    /* 1B630 80155228 F8C020AC */  sw         $zero, %lo(dminx)($at)
    /* 1B634 8015522C 1280013C */  lui        $at, %hi(dminy)
    /* 1B638 80155230 FCC020AC */  sw         $zero, %lo(dminy)($at)
    /* 1B63C 80155234 1280013C */  lui        $at, %hi(ViewX)
    /* 1B640 80155238 14C122AC */  sw         $v0, %lo(ViewX)($at)
    /* 1B644 8015523C 1280013C */  lui        $at, %hi(ViewY)
    /* 1B648 80155240 18C122AC */  sw         $v0, %lo(ViewY)($at)
    /* 1B64C 80155244 682180AF */  sw         $zero, %gp_rel(D_8011C8E8)($gp)
    /* 1B650 80155248 6C2180AF */  sw         $zero, %gp_rel(D_8011C8EC)($gp)
    /* 1B654 8015524C 702180AF */  sw         $zero, %gp_rel(D_8011C8F0)($gp)
    /* 1B658 80155250 742180AF */  sw         $zero, %gp_rel(D_8011C8F4)($gp)
    /* 1B65C 80155254 A968050C */  jal        DRLG_InitSetPC__Fv
    /* 1B660 80155258 00000000 */   nop
    /* 1B664 8015525C 883D050C */  jal        DRLG_LoadL4SP__Fv
    /* 1B668 80155260 00000000 */   nop
    /* 1B66C 80155264 B851050C */  jal        DRLG_L4__Fi
    /* 1B670 80155268 21200002 */   addu      $a0, $s0, $zero
    /* 1B674 8015526C F853050C */  jal        DRLG_L4Pass3__Fv
    /* 1B678 80155270 00000000 */   nop
    /* 1B67C 80155274 B13D050C */  jal        DRLG_FreeL4SP__Fv
    /* 1B680 80155278 00000000 */   nop
    /* 1B684 8015527C AF68050C */  jal        DRLG_SetPC__Fv
    /* 1B688 80155280 00000000 */   nop
    /* 1B68C 80155284 6821848F */  lw         $a0, %gp_rel(D_8011C8E8)($gp)
    /* 1B690 80155288 682180AF */  sw         $zero, %gp_rel(D_8011C8E8)($gp)
    /* 1B694 8015528C F7F6000C */  jal        mem_free_dbg__FPv
    /* 1B698 80155290 00000000 */   nop
    /* 1B69C 80155294 6C21848F */  lw         $a0, %gp_rel(D_8011C8EC)($gp)
    /* 1B6A0 80155298 6C2180AF */  sw         $zero, %gp_rel(D_8011C8EC)($gp)
    /* 1B6A4 8015529C F7F6000C */  jal        mem_free_dbg__FPv
    /* 1B6A8 801552A0 00000000 */   nop
    /* 1B6AC 801552A4 7021848F */  lw         $a0, %gp_rel(D_8011C8F0)($gp)
    /* 1B6B0 801552A8 702180AF */  sw         $zero, %gp_rel(D_8011C8F0)($gp)
    /* 1B6B4 801552AC F7F6000C */  jal        mem_free_dbg__FPv
    /* 1B6B8 801552B0 00000000 */   nop
    /* 1B6BC 801552B4 7421848F */  lw         $a0, %gp_rel(D_8011C8F4)($gp)
    /* 1B6C0 801552B8 742180AF */  sw         $zero, %gp_rel(D_8011C8F4)($gp)
    /* 1B6C4 801552BC F7F6000C */  jal        mem_free_dbg__FPv
    /* 1B6C8 801552C0 00000000 */   nop
    /* 1B6CC 801552C4 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1B6D0 801552C8 1000B08F */  lw         $s0, 0x10($sp)
    /* 1B6D4 801552CC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1B6D8 801552D0 0800E003 */  jr         $ra
    /* 1B6DC 801552D4 00000000 */   nop
endlabel CreateL4Dungeon__FUii
