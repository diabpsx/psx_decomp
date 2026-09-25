.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching WitchSellOk__Fi, 0x14C

glabel WitchSellOk__Fi
    /* 5CA68 8006CA68 10008004 */  bltz       $a0, .L8006CAAC
    /* 5CA6C 8006CA6C 21280000 */   addu      $a1, $zero, $zero
    /* 5CA70 8006CA70 1280023C */  lui        $v0, %hi(myplr)
    /* 5CA74 8006CA74 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 5CA78 8006CA78 00000000 */  nop
    /* 5CA7C 8006CA7C 40180200 */  sll        $v1, $v0, 1
    /* 5CA80 8006CA80 21186200 */  addu       $v1, $v1, $v0
    /* 5CA84 8006CA84 80180300 */  sll        $v1, $v1, 2
    /* 5CA88 8006CA88 21186200 */  addu       $v1, $v1, $v0
    /* 5CA8C 8006CA8C 00190300 */  sll        $v1, $v1, 4
    /* 5CA90 8006CA90 23186200 */  subu       $v1, $v1, $v0
    /* 5CA94 8006CA94 80180300 */  sll        $v1, $v1, 2
    /* 5CA98 8006CA98 21186200 */  addu       $v1, $v1, $v0
    /* 5CA9C 8006CA9C 0E80023C */  lui        $v0, %hi(plr + 0x4A4)
    /* 5CAA0 8006CAA0 DCA94224 */  addiu      $v0, $v0, %lo(plr + 0x4A4)
    /* 5CAA4 8006CAA4 B9B20108 */  j          .L8006CAE4
    /* 5CAA8 8006CAA8 C0180300 */   sll       $v1, $v1, 3
  .L8006CAAC:
    /* 5CAAC 8006CAAC 1280023C */  lui        $v0, %hi(myplr)
    /* 5CAB0 8006CAB0 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 5CAB4 8006CAB4 27200400 */  nor        $a0, $zero, $a0
    /* 5CAB8 8006CAB8 40180200 */  sll        $v1, $v0, 1
    /* 5CABC 8006CABC 21186200 */  addu       $v1, $v1, $v0
    /* 5CAC0 8006CAC0 80180300 */  sll        $v1, $v1, 2
    /* 5CAC4 8006CAC4 21186200 */  addu       $v1, $v1, $v0
    /* 5CAC8 8006CAC8 00190300 */  sll        $v1, $v1, 4
    /* 5CACC 8006CACC 23186200 */  subu       $v1, $v1, $v0
    /* 5CAD0 8006CAD0 80180300 */  sll        $v1, $v1, 2
    /* 5CAD4 8006CAD4 21186200 */  addu       $v1, $v1, $v0
    /* 5CAD8 8006CAD8 C0180300 */  sll        $v1, $v1, 3
    /* 5CADC 8006CADC 0E80023C */  lui        $v0, %hi(plr + 0x15B0)
    /* 5CAE0 8006CAE0 E8BA4224 */  addiu      $v0, $v0, %lo(plr + 0x15B0)
  .L8006CAE4:
    /* 5CAE4 8006CAE4 21186200 */  addu       $v1, $v1, $v0
    /* 5CAE8 8006CAE8 C0100400 */  sll        $v0, $a0, 3
    /* 5CAEC 8006CAEC 23104400 */  subu       $v0, $v0, $a0
    /* 5CAF0 8006CAF0 80100200 */  sll        $v0, $v0, 2
    /* 5CAF4 8006CAF4 23104400 */  subu       $v0, $v0, $a0
    /* 5CAF8 8006CAF8 80100200 */  sll        $v0, $v0, 2
    /* 5CAFC 8006CAFC 21206200 */  addu       $a0, $v1, $v0
    /* 5CB00 8006CB00 2C008284 */  lh         $v0, 0x2C($a0)
    /* 5CB04 8006CB04 00000000 */  nop
    /* 5CB08 8006CB08 06004014 */  bnez       $v0, .L8006CB24
    /* 5CB0C 8006CB0C 00000000 */   nop
    /* 5CB10 8006CB10 20138283 */  lb         $v0, %gp_rel(WStaffFlag)($gp)
    /* 5CB14 8006CB14 00000000 */  nop
    /* 5CB18 8006CB18 02004014 */  bnez       $v0, .L8006CB24
    /* 5CB1C 8006CB1C 00000000 */   nop
    /* 5CB20 8006CB20 01000524 */  addiu      $a1, $zero, 0x1
  .L8006CB24:
    /* 5CB24 8006CB24 2C008384 */  lh         $v1, 0x2C($a0)
    /* 5CB28 8006CB28 0A000224 */  addiu      $v0, $zero, 0xA
    /* 5CB2C 8006CB2C 06006214 */  bne        $v1, $v0, .L8006CB48
    /* 5CB30 8006CB30 01000224 */   addiu     $v0, $zero, 0x1
    /* 5CB34 8006CB34 20138383 */  lb         $v1, %gp_rel(WStaffFlag)($gp)
    /* 5CB38 8006CB38 00000000 */  nop
    /* 5CB3C 8006CB3C 02006214 */  bne        $v1, $v0, .L8006CB48
    /* 5CB40 8006CB40 00000000 */   nop
    /* 5CB44 8006CB44 01000524 */  addiu      $a1, $zero, 0x1
  .L8006CB48:
    /* 5CB48 8006CB48 51008280 */  lb         $v0, 0x51($a0)
    /* 5CB4C 8006CB4C 00000000 */  nop
    /* 5CB50 8006CB50 0A004010 */  beqz       $v0, .L8006CB7C
    /* 5CB54 8006CB54 00000000 */   nop
    /* 5CB58 8006CB58 69008280 */  lb         $v0, 0x69($a0)
    /* 5CB5C 8006CB5C 00000000 */  nop
    /* 5CB60 8006CB60 06004010 */  beqz       $v0, .L8006CB7C
    /* 5CB64 8006CB64 00000000 */   nop
    /* 5CB68 8006CB68 1800828C */  lw         $v0, 0x18($a0)
    /* 5CB6C 8006CB6C 00000000 */  nop
    /* 5CB70 8006CB70 02004014 */  bnez       $v0, .L8006CB7C
    /* 5CB74 8006CB74 00000000 */   nop
    /* 5CB78 8006CB78 21280000 */  addu       $a1, $zero, $zero
  .L8006CB7C:
    /* 5CB7C 8006CB7C 2E008394 */  lhu        $v1, 0x2E($a0)
    /* 5CB80 8006CB80 00000000 */  nop
    /* 5CB84 8006CB84 FAFF6224 */  addiu      $v0, $v1, -0x6
    /* 5CB88 8006CB88 1100422C */  sltiu      $v0, $v0, 0x11
    /* 5CB8C 8006CB8C 02004010 */  beqz       $v0, .L8006CB98
    /* 5CB90 8006CB90 00140300 */   sll       $v0, $v1, 16
    /* 5CB94 8006CB94 21280000 */  addu       $a1, $zero, $zero
  .L8006CB98:
    /* 5CB98 8006CB98 03140200 */  sra        $v0, $v0, 16
    /* 5CB9C 8006CB9C 21000324 */  addiu      $v1, $zero, 0x21
    /* 5CBA0 8006CBA0 02004314 */  bne        $v0, $v1, .L8006CBAC
    /* 5CBA4 8006CBA4 00000000 */   nop
    /* 5CBA8 8006CBA8 21280000 */  addu       $a1, $zero, $zero
  .L8006CBAC:
    /* 5CBAC 8006CBAC 0800E003 */  jr         $ra
    /* 5CBB0 8006CBB0 2110A000 */   addu      $v0, $a1, $zero
endlabel WitchSellOk__Fi
