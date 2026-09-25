.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching startIntrVSync, 0xF0

glabel startIntrVSync
    /* 298C 8001298C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2990 80012990 0B80043C */  lui        $a0, %hi(D_800B53EC)
    /* 2994 80012994 EC538424 */  addiu      $a0, $a0, %lo(D_800B53EC)
    /* 2998 80012998 0B80033C */  lui        $v1, %hi(D_800B5410)
    /* 299C 8001299C 1054638C */  lw         $v1, %lo(D_800B5410)($v1)
    /* 29A0 800129A0 07010224 */  addiu      $v0, $zero, 0x107
    /* 29A4 800129A4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 29A8 800129A8 000062AC */  sw         $v0, 0x0($v1)
    /* 29AC 800129AC 0B80013C */  lui        $at, %hi(Vcount)
    /* 29B0 800129B0 0C5420AC */  sw         $zero, %lo(Vcount)($at)
    /* 29B4 800129B4 9F4A000C */  jal        func_80012A7C
    /* 29B8 800129B8 08000524 */   addiu     $a1, $zero, 0x8
    /* 29BC 800129BC 0180053C */  lui        $a1, %hi(D_800129E4)
    /* 29C0 800129C0 E429A524 */  addiu      $a1, $a1, %lo(D_800129E4)
    /* 29C4 800129C4 AB48000C */  jal        InterruptCallback
    /* 29C8 800129C8 21200000 */   addu      $a0, $zero, $zero
    /* 29CC 800129CC 0180023C */  lui        $v0, %hi(D_80012A50)
    /* 29D0 800129D0 502A4224 */  addiu      $v0, $v0, %lo(D_80012A50)
    /* 29D4 800129D4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 29D8 800129D8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 29DC 800129DC 0800E003 */  jr         $ra
    /* 29E0 800129E0 00000000 */   nop
  alabel D_800129E4
    /* 29E4 800129E4 0B80023C */  lui        $v0, %hi(Vcount)
    /* 29E8 800129E8 0C54428C */  lw         $v0, %lo(Vcount)($v0)
    /* 29EC 800129EC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 29F0 800129F0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 29F4 800129F4 21880000 */  addu       $s1, $zero, $zero
    /* 29F8 800129F8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 29FC 800129FC 0B80103C */  lui        $s0, %hi(D_800B53EC)
    /* 2A00 80012A00 EC531026 */  addiu      $s0, $s0, %lo(D_800B53EC)
    /* 2A04 80012A04 1800BFAF */  sw         $ra, 0x18($sp)
    /* 2A08 80012A08 01004224 */  addiu      $v0, $v0, 0x1
    /* 2A0C 80012A0C 0B80013C */  lui        $at, %hi(Vcount)
    /* 2A10 80012A10 0C5422AC */  sw         $v0, %lo(Vcount)($at)
  .L80012A14:
    /* 2A14 80012A14 0000028E */  lw         $v0, 0x0($s0)
    /* 2A18 80012A18 00000000 */  nop
    /* 2A1C 80012A1C 03004010 */  beqz       $v0, .L80012A2C
    /* 2A20 80012A20 00000000 */   nop
    /* 2A24 80012A24 09F84000 */  jalr       $v0
    /* 2A28 80012A28 00000000 */   nop
  .L80012A2C:
    /* 2A2C 80012A2C 01003126 */  addiu      $s1, $s1, 0x1
    /* 2A30 80012A30 0800222A */  slti       $v0, $s1, 0x8
    /* 2A34 80012A34 F7FF4014 */  bnez       $v0, .L80012A14
    /* 2A38 80012A38 04001026 */   addiu     $s0, $s0, 0x4
    /* 2A3C 80012A3C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 2A40 80012A40 1400B18F */  lw         $s1, 0x14($sp)
    /* 2A44 80012A44 1000B08F */  lw         $s0, 0x10($sp)
    /* 2A48 80012A48 0800E003 */  jr         $ra
    /* 2A4C 80012A4C 2000BD27 */   addiu     $sp, $sp, 0x20
  alabel D_80012A50
    /* 2A50 80012A50 0B80023C */  lui        $v0, %hi(D_800B53EC)
    /* 2A54 80012A54 EC534224 */  addiu      $v0, $v0, %lo(D_800B53EC)
    /* 2A58 80012A58 80200400 */  sll        $a0, $a0, 2
    /* 2A5C 80012A5C 21208200 */  addu       $a0, $a0, $v0
    /* 2A60 80012A60 0000828C */  lw         $v0, 0x0($a0)
    /* 2A64 80012A64 00000000 */  nop
    /* 2A68 80012A68 0200A210 */  beq        $a1, $v0, .L80012A74
    /* 2A6C 80012A6C 00000000 */   nop
    /* 2A70 80012A70 000085AC */  sw         $a1, 0x0($a0)
  .L80012A74:
    /* 2A74 80012A74 0800E003 */  jr         $ra
    /* 2A78 80012A78 00000000 */   nop
endlabel startIntrVSync
