.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StartAttack__FP12PlayerStructi, 0x144

glabel StartAttack__FP12PlayerStructi
    /* 50F64 80060F64 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 50F68 80060F68 1000B0AF */  sw         $s0, 0x10($sp)
    /* 50F6C 80060F6C 21808000 */  addu       $s0, $a0, $zero
    /* 50F70 80060F70 1800B2AF */  sw         $s2, 0x18($sp)
    /* 50F74 80060F74 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 50F78 80060F78 1400B1AF */  sw         $s1, 0x14($sp)
    /* 50F7C 80060F7C 62010386 */  lh         $v1, 0x162($s0)
    /* 50F80 80060F80 60010486 */  lh         $a0, 0x160($s0)
    /* 50F84 80060F84 C0180300 */  sll        $v1, $v1, 3
    /* 50F88 80060F88 C0100400 */  sll        $v0, $a0, 3
    /* 50F8C 80060F8C 23104400 */  subu       $v0, $v0, $a0
    /* 50F90 80060F90 C0110200 */  sll        $v0, $v0, 7
    /* 50F94 80060F94 21186200 */  addu       $v1, $v1, $v0
    /* 50F98 80060F98 D3000292 */  lbu        $v0, 0xD3($s0)
    /* 50F9C 80060F9C 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 50FA0 80060FA0 21082300 */  addu       $at, $at, $v1
    /* 50FA4 80060FA4 2B7A3180 */  lb         $s1, %lo(dung_map + 0x3)($at)
    /* 50FA8 80060FA8 0D004010 */  beqz       $v0, .L80060FE0
    /* 50FAC 80060FAC 21900000 */   addu      $s2, $zero, $zero
    /* 50FB0 80060FB0 1C01028E */  lw         $v0, 0x11C($s0)
    /* 50FB4 80060FB4 00000000 */  nop
    /* 50FB8 80060FB8 09004014 */  bnez       $v0, .L80060FE0
    /* 50FBC 80060FBC 00000000 */   nop
    /* 50FC0 80060FC0 677F010C */  jal        ismyplr__FP12PlayerStruct
    /* 50FC4 80060FC4 21200002 */   addu      $a0, $s0, $zero
    /* 50FC8 80060FC8 05004010 */  beqz       $v0, .L80060FE0
    /* 50FCC 80060FCC 21200002 */   addu      $a0, $s0, $zero
    /* 50FD0 80060FD0 1587010C */  jal        StartPlrKill__FP12PlayerStructi
    /* 50FD4 80060FD4 FFFF0524 */   addiu     $a1, $zero, -0x1
    /* 50FD8 80060FD8 23840108 */  j          .L8006108C
    /* 50FDC 80060FDC 00000000 */   nop
  .L80060FE0:
    /* 50FE0 80060FE0 0D00201A */  blez       $s1, .L80061018
    /* 50FE4 80060FE4 FFFF3126 */   addiu     $s1, $s1, -0x1
    /* 50FE8 80060FE8 40101100 */  sll        $v0, $s1, 1
    /* 50FEC 80060FEC 21105100 */  addu       $v0, $v0, $s1
    /* 50FF0 80060FF0 80100200 */  sll        $v0, $v0, 2
    /* 50FF4 80060FF4 23105100 */  subu       $v0, $v0, $s1
    /* 50FF8 80060FF8 80100200 */  sll        $v0, $v0, 2
    /* 50FFC 80060FFC 0E80013C */  lui        $at, %hi(object + 0x22)
    /* 51000 80061000 21082200 */  addu       $at, $at, $v0
    /* 51004 80061004 6E8C2380 */  lb         $v1, %lo(object + 0x22)($at)
    /* 51008 80061008 01000224 */  addiu      $v0, $zero, 0x1
    /* 5100C 8006100C 02006214 */  bne        $v1, $v0, .L80061018
    /* 51010 80061010 00000000 */   nop
    /* 51014 80061014 01001224 */  addiu      $s2, $zero, 0x1
  .L80061018:
    /* 51018 80061018 D1000282 */  lb         $v0, 0xD1($s0)
    /* 5101C 8006101C 00000000 */  nop
    /* 51020 80061020 11004010 */  beqz       $v0, .L80061068
    /* 51024 80061024 FF004232 */   andi      $v0, $s2, 0xFF
    /* 51028 80061028 10004014 */  bnez       $v0, .L8006106C
    /* 5102C 8006102C 04000224 */   addiu     $v0, $zero, 0x4
    /* 51030 80061030 60010286 */  lh         $v0, 0x160($s0)
    /* 51034 80061034 00000000 */  nop
    /* 51038 80061038 14004018 */  blez       $v0, .L8006108C
    /* 5103C 8006103C 00000000 */   nop
    /* 51040 80061040 62010286 */  lh         $v0, 0x162($s0)
    /* 51044 80061044 00000000 */  nop
    /* 51048 80061048 10004018 */  blez       $v0, .L8006108C
    /* 5104C 8006104C 05000324 */   addiu     $v1, $zero, 0x5
    /* 51050 80061050 60010296 */  lhu        $v0, 0x160($s0)
    /* 51054 80061054 62010496 */  lhu        $a0, 0x162($s0)
    /* 51058 80061058 000003AE */  sw         $v1, 0x0($s0)
    /* 5105C 8006105C 560102A6 */  sh         $v0, 0x156($s0)
    /* 51060 80061060 1C840108 */  j          .L80061070
    /* 51064 80061064 580104A6 */   sh        $a0, 0x158($s0)
  .L80061068:
    /* 51068 80061068 04000224 */  addiu      $v0, $zero, 0x4
  .L8006106C:
    /* 5106C 8006106C 000002AE */  sw         $v0, 0x0($s0)
  .L80061070:
    /* 51070 80061070 7F83010C */  jal        SetPlayerOld__FP12PlayerStruct
    /* 51074 80061074 21200002 */   addu      $a0, $s0, $zero
    /* 51078 80061078 21200002 */  addu       $a0, $s0, $zero
    /* 5107C 8006107C 02000524 */  addiu      $a1, $zero, 0x2
    /* 51080 80061080 9801868C */  lw         $a2, 0x198($a0)
    /* 51084 80061084 877F010C */  jal        NewPlrAnim__FP12PlayerStructiii
    /* 51088 80061088 21380000 */   addu      $a3, $zero, $zero
  .L8006108C:
    /* 5108C 8006108C 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 51090 80061090 1800B28F */  lw         $s2, 0x18($sp)
    /* 51094 80061094 1400B18F */  lw         $s1, 0x14($sp)
    /* 51098 80061098 1000B08F */  lw         $s0, 0x10($sp)
    /* 5109C 8006109C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 510A0 800610A0 0800E003 */  jr         $ra
    /* 510A4 800610A4 00000000 */   nop
endlabel StartAttack__FP12PlayerStructi
