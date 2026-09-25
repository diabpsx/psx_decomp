.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintGameOver__Fv, 0x140

glabel PrintGameOver__Fv
    /* 72450 80082450 B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 72454 80082454 2800A427 */  addiu      $a0, $sp, 0x28
    /* 72458 80082458 4C00BFAF */  sw         $ra, 0x4C($sp)
    /* 7245C 8008245C 4800B2AF */  sw         $s2, 0x48($sp)
    /* 72460 80082460 4400B1AF */  sw         $s1, 0x44($sp)
    /* 72464 80082464 8409020C */  jal        __6Dialog_80082610
    /* 72468 80082468 4000B0AF */   sw        $s0, 0x40($sp)
    /* 7246C 8008246C A609020C */  jal        GetMaxOtPos__7CBlocks_80082698
    /* 72470 80082470 00000000 */   nop
    /* 72474 80082474 2800A427 */  addiu      $a0, $sp, 0x28
    /* 72478 80082478 21804000 */  addu       $s0, $v0, $zero
    /* 7247C 8008247C 8A34020C */  jal        SetOTpos__6Dialogi
    /* 72480 80082480 FDFF0526 */   addiu     $a1, $s0, -0x3
    /* 72484 80082484 0C80113C */  lui        $s1, %hi(MediumFont)
    /* 72488 80082488 D8823126 */  addiu      $s1, $s1, %lo(MediumFont)
    /* 7248C 8008248C 21202002 */  addu       $a0, $s1, $zero
    /* 72490 80082490 FEFF0526 */  addiu      $a1, $s0, -0x2
    /* 72494 80082494 E82A020C */  jal        SetOTpos__5CFonti
    /* 72498 80082498 21904000 */   addu      $s2, $v0, $zero
    /* 7249C 8008249C 2800A427 */  addiu      $a0, $sp, 0x28
    /* 724A0 800824A0 1280053C */  lui        $a1, %hi(BORDERR)
    /* 724A4 800824A4 F7ABA590 */  lbu        $a1, %lo(BORDERR)($a1)
    /* 724A8 800824A8 1280063C */  lui        $a2, %hi(BORDERG)
    /* 724AC 800824AC F8ABC690 */  lbu        $a2, %lo(BORDERG)($a2)
    /* 724B0 800824B0 1280073C */  lui        $a3, %hi(BORDERB)
    /* 724B4 800824B4 F9ABE790 */  lbu        $a3, %lo(BORDERB)($a3)
    /* 724B8 800824B8 6E09020C */  jal        SetRGB__6DialogUcUcUc_800825b8
    /* 724BC 800824BC 21804000 */   addu      $s0, $v0, $zero
    /* 724C0 800824C0 2800A427 */  addiu      $a0, $sp, 0x28
    /* 724C4 800824C4 7609020C */  jal        SetBack__6Dialogi_800825d8
    /* 724C8 800824C8 94000524 */   addiu     $a1, $zero, 0x94
    /* 724CC 800824CC 2800A427 */  addiu      $a0, $sp, 0x28
    /* 724D0 800824D0 7809020C */  jal        SetBorder__6Dialogi_800825e0
    /* 724D4 800824D4 12000524 */   addiu     $a1, $zero, 0x12
    /* 724D8 800824D8 2800A427 */  addiu      $a0, $sp, 0x28
    /* 724DC 800824DC 50000524 */  addiu      $a1, $zero, 0x50
    /* 724E0 800824E0 70000624 */  addiu      $a2, $zero, 0x70
    /* 724E4 800824E4 A0000724 */  addiu      $a3, $zero, 0xA0
    /* 724E8 800824E8 10000224 */  addiu      $v0, $zero, 0x10
    /* 724EC 800824EC B82F020C */  jal        Back__6Dialogiiii
    /* 724F0 800824F0 1000A2AF */   sw        $v0, 0x10($sp)
    /* 724F4 800824F4 77010424 */  addiu      $a0, $zero, 0x177
    /* 724F8 800824F8 50000224 */  addiu      $v0, $zero, 0x50
    /* 724FC 800824FC 3800A2A7 */  sh         $v0, 0x38($sp)
    /* 72500 80082500 70000224 */  addiu      $v0, $zero, 0x70
    /* 72504 80082504 3A00A2A7 */  sh         $v0, 0x3A($sp)
    /* 72508 80082508 A0000224 */  addiu      $v0, $zero, 0xA0
    /* 7250C 8008250C 3C00A2A7 */  sh         $v0, 0x3C($sp)
    /* 72510 80082510 10000224 */  addiu      $v0, $zero, 0x10
    /* 72514 80082514 4AED010C */  jal        GetStr__Fi
    /* 72518 80082518 3E00A2A7 */   sh        $v0, 0x3E($sp)
    /* 7251C 8008251C 21202002 */  addu       $a0, $s1, $zero
    /* 72520 80082520 21280000 */  addu       $a1, $zero, $zero
    /* 72524 80082524 0C000624 */  addiu      $a2, $zero, 0xC
    /* 72528 80082528 21384000 */  addu       $a3, $v0, $zero
    /* 7252C 8008252C 01000224 */  addiu      $v0, $zero, 0x1
    /* 72530 80082530 1000A2AF */  sw         $v0, 0x10($sp)
    /* 72534 80082534 3800A227 */  addiu      $v0, $sp, 0x38
    /* 72538 80082538 1400A2AF */  sw         $v0, 0x14($sp)
    /* 7253C 8008253C FF000224 */  addiu      $v0, $zero, 0xFF
    /* 72540 80082540 1800A2AF */  sw         $v0, 0x18($sp)
    /* 72544 80082544 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 72548 80082548 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 7254C 8008254C 2000A2AF */   sw        $v0, 0x20($sp)
    /* 72550 80082550 21202002 */  addu       $a0, $s1, $zero
    /* 72554 80082554 E82A020C */  jal        SetOTpos__5CFonti
    /* 72558 80082558 21280002 */   addu      $a1, $s0, $zero
    /* 7255C 8008255C 2800A427 */  addiu      $a0, $sp, 0x28
    /* 72560 80082560 8A34020C */  jal        SetOTpos__6Dialogi
    /* 72564 80082564 21284002 */   addu      $a1, $s2, $zero
    /* 72568 80082568 2800A427 */  addiu      $a0, $sp, 0x28
    /* 7256C 8008256C 7A09020C */  jal        ___6Dialog_800825e8
    /* 72570 80082570 02000524 */   addiu     $a1, $zero, 0x2
    /* 72574 80082574 4C00BF8F */  lw         $ra, 0x4C($sp)
    /* 72578 80082578 4800B28F */  lw         $s2, 0x48($sp)
    /* 7257C 8008257C 4400B18F */  lw         $s1, 0x44($sp)
    /* 72580 80082580 4000B08F */  lw         $s0, 0x40($sp)
    /* 72584 80082584 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 72588 80082588 0800E003 */  jr         $ra
    /* 7258C 8008258C 00000000 */   nop
endlabel PrintGameOver__Fv
