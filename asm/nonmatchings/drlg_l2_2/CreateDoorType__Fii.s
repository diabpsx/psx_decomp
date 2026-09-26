.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CreateDoorType__Fii, 0xE4

glabel CreateDoorType__Fii
    /* A668 80144260 1480083C */  lui        $t0, %hi(RoomList + 0x62C)
    /* A66C 80144264 A02D0825 */  addiu      $t0, $t0, %lo(RoomList + 0x62C)
    /* A670 80144268 80100400 */  sll        $v0, $a0, 2
    /* A674 8014426C 21104400 */  addu       $v0, $v0, $a0
    /* A678 80144270 C0180200 */  sll        $v1, $v0, 3
    /* A67C 80144274 21106800 */  addu       $v0, $v1, $t0
    /* A680 80144278 21104500 */  addu       $v0, $v0, $a1
    /* A684 8014427C 00004280 */  lb         $v0, 0x0($v0)
    /* A688 80144280 00000000 */  nop
    /* A68C 80144284 44004238 */  xori       $v0, $v0, 0x44
    /* A690 80144288 0100422C */  sltiu      $v0, $v0, 0x1
    /* A694 8014428C 21304000 */  addu       $a2, $v0, $zero
    /* A698 80144290 50000225 */  addiu      $v0, $t0, 0x50
    /* A69C 80144294 21106200 */  addu       $v0, $v1, $v0
    /* A6A0 80144298 21104500 */  addu       $v0, $v0, $a1
    /* A6A4 8014429C 00004280 */  lb         $v0, 0x0($v0)
    /* A6A8 801442A0 44000724 */  addiu      $a3, $zero, 0x44
    /* A6AC 801442A4 02004714 */  bne        $v0, $a3, .L801442B0
    /* A6B0 801442A8 28000225 */   addiu     $v0, $t0, 0x28
    /* A6B4 801442AC 01000624 */  addiu      $a2, $zero, 0x1
  .L801442B0:
    /* A6B8 801442B0 21106200 */  addu       $v0, $v1, $v0
    /* A6BC 801442B4 21184500 */  addu       $v1, $v0, $a1
    /* A6C0 801442B8 FFFF6280 */  lb         $v0, -0x1($v1)
    /* A6C4 801442BC 00000000 */  nop
    /* A6C8 801442C0 02004714 */  bne        $v0, $a3, .L801442CC
    /* A6CC 801442C4 00000000 */   nop
    /* A6D0 801442C8 01000624 */  addiu      $a2, $zero, 0x1
  .L801442CC:
    /* A6D4 801442CC 01006280 */  lb         $v0, 0x1($v1)
    /* A6D8 801442D0 00000000 */  nop
    /* A6DC 801442D4 02004714 */  bne        $v0, $a3, .L801442E0
    /* A6E0 801442D8 00000000 */   nop
    /* A6E4 801442DC 01000624 */  addiu      $a2, $zero, 0x1
  .L801442E0:
    /* A6E8 801442E0 00006390 */  lbu        $v1, 0x0($v1)
    /* A6EC 801442E4 00000000 */  nop
    /* A6F0 801442E8 BEFF6224 */  addiu      $v0, $v1, -0x42
    /* A6F4 801442EC 0200422C */  sltiu      $v0, $v0, 0x2
    /* A6F8 801442F0 06004014 */  bnez       $v0, .L8014430C
    /* A6FC 801442F4 FF006330 */   andi      $v1, $v1, 0xFF
    /* A700 801442F8 41000224 */  addiu      $v0, $zero, 0x41
    /* A704 801442FC 03006210 */  beq        $v1, $v0, .L8014430C
    /* A708 80144300 45000224 */   addiu     $v0, $zero, 0x45
    /* A70C 80144304 03006214 */  bne        $v1, $v0, .L80144314
    /* A710 80144308 FF00C230 */   andi      $v0, $a2, 0xFF
  .L8014430C:
    /* A714 8014430C 01000624 */  addiu      $a2, $zero, 0x1
    /* A718 80144310 FF00C230 */  andi       $v0, $a2, 0xFF
  .L80144314:
    /* A71C 80144314 09004014 */  bnez       $v0, .L8014433C
    /* A720 80144318 80180400 */   sll       $v1, $a0, 2
    /* A724 8014431C 1480023C */  lui        $v0, %hi(predungeon)
    /* A728 80144320 C82D4224 */  addiu      $v0, $v0, %lo(predungeon)
    /* A72C 80144324 21186400 */  addu       $v1, $v1, $a0
    /* A730 80144328 C0180300 */  sll        $v1, $v1, 3
    /* A734 8014432C 21186200 */  addu       $v1, $v1, $v0
    /* A738 80144330 21186500 */  addu       $v1, $v1, $a1
    /* A73C 80144334 44000224 */  addiu      $v0, $zero, 0x44
    /* A740 80144338 000062A0 */  sb         $v0, 0x0($v1)
  .L8014433C:
    /* A744 8014433C 0800E003 */  jr         $ra
    /* A748 80144340 00000000 */   nop
endlabel CreateDoorType__Fii
