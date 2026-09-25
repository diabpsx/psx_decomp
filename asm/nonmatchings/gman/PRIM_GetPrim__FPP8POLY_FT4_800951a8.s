.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_GetPrim__FPP8POLY_FT4_800951a8, 0x7C

glabel PRIM_GetPrim__FPP8POLY_FT4_800951a8
    /* 851A8 800951A8 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 851AC 800951AC B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 851B0 800951B0 1280033C */  lui        $v1, %hi(AddrToAvoid)
    /* 851B4 800951B4 BCAA638C */  lw         $v1, %lo(AddrToAvoid)($v1)
    /* 851B8 800951B8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 851BC 800951BC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 851C0 800951C0 21808000 */  addu       $s0, $a0, $zero
    /* 851C4 800951C4 90014224 */  addiu      $v0, $v0, 0x190
    /* 851C8 800951C8 2B104300 */  sltu       $v0, $v0, $v1
    /* 851CC 800951CC 06004014 */  bnez       $v0, .L800951E8
    /* 851D0 800951D0 1400BFAF */   sw        $ra, 0x14($sp)
    /* 851D4 800951D4 21200000 */  addu       $a0, $zero, $zero
    /* 851D8 800951D8 1180053C */  lui        $a1, %hi(D_801105A8)
    /* 851DC 800951DC A805A524 */  addiu      $a1, $a1, %lo(D_801105A8)
    /* 851E0 800951E0 A583000C */  jal        DBG_Error
    /* 851E4 800951E4 44000624 */   addiu     $a2, $zero, 0x44
  .L800951E8:
    /* 851E8 800951E8 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 851EC 800951EC B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 851F0 800951F0 00000000 */  nop
    /* 851F4 800951F4 000002AE */  sw         $v0, 0x0($s0)
    /* 851F8 800951F8 1280023C */  lui        $v0, %hi(ThisPrimAddr)
    /* 851FC 800951FC B8AA428C */  lw         $v0, %lo(ThisPrimAddr)($v0)
    /* 85200 80095200 00000000 */  nop
    /* 85204 80095204 28004224 */  addiu      $v0, $v0, 0x28
    /* 85208 80095208 1280013C */  lui        $at, %hi(ThisPrimAddr)
    /* 8520C 8009520C B8AA22AC */  sw         $v0, %lo(ThisPrimAddr)($at)
    /* 85210 80095210 1400BF8F */  lw         $ra, 0x14($sp)
    /* 85214 80095214 1000B08F */  lw         $s0, 0x10($sp)
    /* 85218 80095218 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8521C 8009521C 0800E003 */  jr         $ra
    /* 85220 80095220 00000000 */   nop
endlabel PRIM_GetPrim__FPP8POLY_FT4_800951a8
