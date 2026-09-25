.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching checkcacheinclassblock, 0x128

glabel checkcacheinclassblock
    /* 1A144 8002A144 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1A148 8002A148 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1A14C 8002A14C 21908000 */  addu       $s2, $a0, $zero
    /* 1A150 8002A150 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1A154 8002A154 2188A000 */  addu       $s1, $a1, $zero
    /* 1A158 8002A158 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 1A15C 8002A15C 41A7000C */  jal        findnamedpurgeableblockinclass
    /* 1A160 8002A160 1000B0AF */   sw        $s0, 0x10($sp)
    /* 1A164 8002A164 21804000 */  addu       $s0, $v0, $zero
    /* 1A168 8002A168 19000012 */  beqz       $s0, .L8002A1D0
    /* 1A16C 8002A16C F7FF0324 */   addiu     $v1, $zero, -0x9
    /* 1A170 8002A170 1800028E */  lw         $v0, 0x18($s0)
    /* 1A174 8002A174 00000000 */  nop
    /* 1A178 8002A178 24304300 */  and        $a2, $v0, $v1
    /* 1A17C 8002A17C 10004230 */  andi       $v0, $v0, 0x10
    /* 1A180 8002A180 08004014 */  bnez       $v0, .L8002A1A4
    /* 1A184 8002A184 180006AE */   sw        $a2, 0x18($s0)
    /* 1A188 8002A188 1400058E */  lw         $a1, 0x14($s0)
    /* 1A18C 8002A18C 21204002 */  addu       $a0, $s2, $zero
    /* 1A190 8002A190 BAA9000C */  jal        reservememblockai
    /* 1A194 8002A194 21380000 */   addu      $a3, $zero, $zero
    /* 1A198 8002A198 21884000 */  addu       $s1, $v0, $zero
    /* 1A19C 8002A19C 03002016 */  bnez       $s1, .L8002A1AC
    /* 1A1A0 8002A1A0 00000000 */   nop
  .L8002A1A4:
    /* 1A1A4 8002A1A4 94A80008 */  j          .L8002A250
    /* 1A1A8 8002A1A8 21100002 */   addu      $v0, $s0, $zero
  .L8002A1AC:
    /* 1A1AC 8002A1AC 0000048E */  lw         $a0, 0x0($s0)
    /* 1A1B0 8002A1B0 0000258E */  lw         $a1, 0x0($s1)
    /* 1A1B4 8002A1B4 1400068E */  lw         $a2, 0x14($s0)
    /* 1A1B8 8002A1B8 F1B1000C */  jal        blockmove
    /* 1A1BC 8002A1BC 00000000 */   nop
    /* 1A1C0 8002A1C0 C3AB000C */  jal        purgememblock
    /* 1A1C4 8002A1C4 21200002 */   addu      $a0, $s0, $zero
    /* 1A1C8 8002A1C8 94A80008 */  j          .L8002A250
    /* 1A1CC 8002A1CC 21102002 */   addu      $v0, $s1, $zero
  .L8002A1D0:
    /* 1A1D0 8002A1D0 000F2332 */  andi       $v1, $s1, 0xF00
    /* 1A1D4 8002A1D4 031A0300 */  sra        $v1, $v1, 8
    /* 1A1D8 8002A1D8 40100300 */  sll        $v0, $v1, 1
    /* 1A1DC 8002A1DC 21104300 */  addu       $v0, $v0, $v1
    /* 1A1E0 8002A1E0 C0100200 */  sll        $v0, $v0, 3
    /* 1A1E4 8002A1E4 1380013C */  lui        $at, %hi(D_80137A40)
    /* 1A1E8 8002A1E8 21082200 */  addu       $at, $at, $v0
    /* 1A1EC 8002A1EC 407A258C */  lw         $a1, %lo(D_80137A40)($at)
    /* 1A1F0 8002A1F0 00000000 */  nop
    /* 1A1F4 8002A1F4 1600A010 */  beqz       $a1, .L8002A250
    /* 1A1F8 8002A1F8 21100000 */   addu      $v0, $zero, $zero
    /* 1A1FC 8002A1FC 41A7000C */  jal        findnamedpurgeableblockinclass
    /* 1A200 8002A200 21204002 */   addu      $a0, $s2, $zero
    /* 1A204 8002A204 21804000 */  addu       $s0, $v0, $zero
    /* 1A208 8002A208 03000016 */  bnez       $s0, .L8002A218
    /* 1A20C 8002A20C 21204002 */   addu      $a0, $s2, $zero
    /* 1A210 8002A210 94A80008 */  j          .L8002A250
    /* 1A214 8002A214 21100000 */   addu      $v0, $zero, $zero
  .L8002A218:
    /* 1A218 8002A218 1800068E */  lw         $a2, 0x18($s0)
    /* 1A21C 8002A21C 1400058E */  lw         $a1, 0x14($s0)
    /* 1A220 8002A220 21380000 */  addu       $a3, $zero, $zero
    /* 1A224 8002A224 F7FF0224 */  addiu      $v0, $zero, -0x9
    /* 1A228 8002A228 2430C200 */  and        $a2, $a2, $v0
    /* 1A22C 8002A22C BAA9000C */  jal        reservememblockai
    /* 1A230 8002A230 180006AE */   sw        $a2, 0x18($s0)
    /* 1A234 8002A234 21884000 */  addu       $s1, $v0, $zero
    /* 1A238 8002A238 0000048E */  lw         $a0, 0x0($s0)
    /* 1A23C 8002A23C 0000258E */  lw         $a1, 0x0($s1)
    /* 1A240 8002A240 1400068E */  lw         $a2, 0x14($s0)
    /* 1A244 8002A244 F1B1000C */  jal        blockmove
    /* 1A248 8002A248 00000000 */   nop
    /* 1A24C 8002A24C 21102002 */  addu       $v0, $s1, $zero
  .L8002A250:
    /* 1A250 8002A250 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 1A254 8002A254 1800B28F */  lw         $s2, 0x18($sp)
    /* 1A258 8002A258 1400B18F */  lw         $s1, 0x14($sp)
    /* 1A25C 8002A25C 1000B08F */  lw         $s0, 0x10($sp)
    /* 1A260 8002A260 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1A264 8002A264 0800E003 */  jr         $ra
    /* 1A268 8002A268 00000000 */   nop
endlabel checkcacheinclassblock
