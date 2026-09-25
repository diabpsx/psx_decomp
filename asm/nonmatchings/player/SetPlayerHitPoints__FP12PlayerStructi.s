.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPlayerHitPoints__FP12PlayerStructi, 0x44

glabel SetPlayerHitPoints__FP12PlayerStructi
    /* 56168 80066168 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 5616C 8006616C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 56170 80066170 2001828C */  lw         $v0, 0x120($a0)
    /* 56174 80066174 1801838C */  lw         $v1, 0x118($a0)
    /* 56178 80066178 1C0185AC */  sw         $a1, 0x11C($a0)
    /* 5617C 8006617C 23104300 */  subu       $v0, $v0, $v1
    /* 56180 80066180 2328A200 */  subu       $a1, $a1, $v0
    /* 56184 80066184 677F010C */  jal        ismyplr__FP12PlayerStruct
    /* 56188 80066188 140185AC */   sw        $a1, 0x114($a0)
    /* 5618C 8006618C 03004010 */  beqz       $v0, .L8006619C
    /* 56190 80066190 01000224 */   addiu     $v0, $zero, 0x1
    /* 56194 80066194 1280013C */  lui        $at, %hi(drawhpflag)
    /* 56198 80066198 BEB622A0 */  sb         $v0, %lo(drawhpflag)($at)
  .L8006619C:
    /* 5619C 8006619C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 561A0 800661A0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 561A4 800661A4 0800E003 */  jr         $ra
    /* 561A8 800661A8 00000000 */   nop
endlabel SetPlayerHitPoints__FP12PlayerStructi
