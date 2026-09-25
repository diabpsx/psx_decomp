.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_GetPrim__FPP7POLY_G4, 0x7C

glabel PRIM_GetPrim__FPP7POLY_G4
    /* 907B4 800A07B4 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 907B8 800A07B8 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 907BC 800A07BC 1280033C */  lui        $v1, %hi(AddrToAvoid)
    /* 907C0 800A07C0 BCAA638C */  lw         $v1, %lo(AddrToAvoid)($v1)
    /* 907C4 800A07C4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 907C8 800A07C8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 907CC 800A07CC 21808000 */  addu       $s0, $a0, $zero
    /* 907D0 800A07D0 68014224 */  addiu      $v0, $v0, 0x168
    /* 907D4 800A07D4 2B104300 */  sltu       $v0, $v0, $v1
    /* 907D8 800A07D8 06004014 */  bnez       $v0, .L800A07F4
    /* 907DC 800A07DC 1400BFAF */   sw        $ra, 0x14($sp)
    /* 907E0 800A07E0 21200000 */  addu       $a0, $zero, $zero
    /* 907E4 800A07E4 1180053C */  lui        $a1, %hi(D_80110C00)
    /* 907E8 800A07E8 000CA524 */  addiu      $a1, $a1, %lo(D_80110C00)
    /* 907EC 800A07EC A583000C */  jal        DBG_Error
    /* 907F0 800A07F0 44000624 */   addiu     $a2, $zero, 0x44
  .L800A07F4:
    /* 907F4 800A07F4 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 907F8 800A07F8 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 907FC 800A07FC 00000000 */  nop
    /* 90800 800A0800 000002AE */  sw         $v0, 0x0($s0)
    /* 90804 800A0804 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 90808 800A0808 B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 9080C 800A080C 00000000 */  nop
    /* 90810 800A0810 24004224 */  addiu      $v0, $v0, 0x24
    /* 90814 800A0814 1280013C */  lui        $at, %hi(ThisPrimAddr)
    /* 90818 800A0818 B8AA22AC */  sw         $v0, %lo(ThisPrimAddr)($at)
    /* 9081C 800A081C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 90820 800A0820 1000B08F */  lw         $s0, 0x10($sp)
    /* 90824 800A0824 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 90828 800A0828 0800E003 */  jr         $ra
    /* 9082C 800A082C 00000000 */   nop
endlabel PRIM_GetPrim__FPP7POLY_G4
