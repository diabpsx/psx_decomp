.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching delasyncstruct, 0xDC

glabel delasyncstruct
    /* 139A8 800239A8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 139AC 800239AC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 139B0 800239B0 1380103C */  lui        $s0, %hi(D_8013504C)
    /* 139B4 800239B4 4C501026 */  addiu      $s0, $s0, %lo(D_8013504C)
    /* 139B8 800239B8 1400BFAF */  sw         $ra, 0x14($sp)
    /* 139BC 800239BC 0000028E */  lw         $v0, 0x0($s0)
    /* 139C0 800239C0 00000000 */  nop
    /* 139C4 800239C4 0E004014 */  bnez       $v0, .L80023A00
    /* 139C8 800239C8 00000000 */   nop
    /* 139CC 800239CC 1180043C */  lui        $a0, %hi(D_8010E980)
    /* 139D0 800239D0 80E98424 */  addiu      $a0, $a0, %lo(D_8010E980)
    /* 139D4 800239D4 1180023C */  lui        $v0, %hi(D_8010E950)
    /* 139D8 800239D8 50E94224 */  addiu      $v0, $v0, %lo(D_8010E950)
    /* 139DC 800239DC 1280013C */  lui        $at, %hi(abortfile)
    /* 139E0 800239E0 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 139E4 800239E4 50020224 */  addiu      $v0, $zero, 0x250
    /* 139E8 800239E8 1280013C */  lui        $at, %hi(abortline)
    /* 139EC 800239EC BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 139F0 800239F0 0F95000C */  jal        abortmessage
    /* 139F4 800239F4 00000000 */   nop
    /* 139F8 800239F8 9C8E0008 */  j          .L80023A70
    /* 139FC 800239FC 00000000 */   nop
  .L80023A00:
    /* 13A00 80023A00 1380043C */  lui        $a0, %hi(D_80135184)
    /* 13A04 80023A04 8451848C */  lw         $a0, %lo(D_80135184)($a0)
    /* 13A08 80023A08 00000000 */  nop
    /* 13A0C 80023A0C 03008004 */  bltz       $a0, .L80023A1C
    /* 13A10 80023A10 00000000 */   nop
    /* 13A14 80023A14 5E99000C */  jal        closeblockhandle
    /* 13A18 80023A18 00000000 */   nop
  .L80023A1C:
    /* 13A1C 80023A1C 21200000 */  addu       $a0, $zero, $zero
    /* 13A20 80023A20 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 13A24 80023A24 1380013C */  lui        $at, %hi(D_80135064)
    /* 13A28 80023A28 645020A0 */  sb         $zero, %lo(D_80135064)($at)
    /* 13A2C 80023A2C 1380013C */  lui        $at, %hi(D_801350F3)
    /* 13A30 80023A30 F35020A0 */  sb         $zero, %lo(D_801350F3)($at)
    /* 13A34 80023A34 1380013C */  lui        $at, %hi(D_80135184)
    /* 13A38 80023A38 845122AC */  sw         $v0, %lo(D_80135184)($at)
    /* 13A3C 80023A3C 000000AE */  sw         $zero, 0x0($s0)
    /* 13A40 80023A40 1380013C */  lui        $at, %hi(D_80135054)
    /* 13A44 80023A44 545022AC */  sw         $v0, %lo(D_80135054)($at)
    /* 13A48 80023A48 1380013C */  lui        $at, %hi(D_80135060)
    /* 13A4C 80023A4C 605022AC */  sw         $v0, %lo(D_80135060)($at)
    /* 13A50 80023A50 1380013C */  lui        $at, %hi(D_8013505C)
    /* 13A54 80023A54 5C5022AC */  sw         $v0, %lo(D_8013505C)($at)
    /* 13A58 80023A58 1380013C */  lui        $at, %hi(D_80135058)
    /* 13A5C 80023A5C 585022AC */  sw         $v0, %lo(D_80135058)($at)
    /* 13A60 80023A60 1380013C */  lui        $at, %hi(D_80135050)
    /* 13A64 80023A64 505022AC */  sw         $v0, %lo(D_80135050)($at)
    /* 13A68 80023A68 41A5000C */  jal        setasynciofuncs
    /* 13A6C 80023A6C 21280000 */   addu      $a1, $zero, $zero
  .L80023A70:
    /* 13A70 80023A70 1400BF8F */  lw         $ra, 0x14($sp)
    /* 13A74 80023A74 1000B08F */  lw         $s0, 0x10($sp)
    /* 13A78 80023A78 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 13A7C 80023A7C 0800E003 */  jr         $ra
    /* 13A80 80023A80 00000000 */   nop
endlabel delasyncstruct
