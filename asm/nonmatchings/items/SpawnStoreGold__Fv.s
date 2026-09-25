.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SpawnStoreGold__Fv, 0xD0

glabel SpawnStoreGold__Fv
    /* 38788 80048788 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 3878C 8004878C 21200000 */  addu       $a0, $zero, $zero
    /* 38790 80048790 21280000 */  addu       $a1, $zero, $zero
    /* 38794 80048794 1000BFAF */  sw         $ra, 0x10($sp)
    /* 38798 80048798 A704010C */  jal        GetItemAttrs__Fiii
    /* 3879C 8004879C 01000624 */   addiu     $a2, $zero, 0x1
    /* 387A0 800487A0 0D80073C */  lui        $a3, %hi(item)
    /* 387A4 800487A4 541DE724 */  addiu      $a3, $a3, %lo(item)
    /* 387A8 800487A8 6000E824 */  addiu      $t0, $a3, 0x60
    /* 387AC 800487AC 1280023C */  lui        $v0, %hi(StorePlrNo)
    /* 387B0 800487B0 B4BA428C */  lw         $v0, %lo(StorePlrNo)($v0)
    /* 387B4 800487B4 0E80043C */  lui        $a0, %hi(_golditem)
    /* 387B8 800487B8 B01C8424 */  addiu      $a0, $a0, %lo(_golditem)
    /* 387BC 800487BC C0180200 */  sll        $v1, $v0, 3
    /* 387C0 800487C0 23186200 */  subu       $v1, $v1, $v0
    /* 387C4 800487C4 80180300 */  sll        $v1, $v1, 2
    /* 387C8 800487C8 23186200 */  subu       $v1, $v1, $v0
    /* 387CC 800487CC 80180300 */  sll        $v1, $v1, 2
    /* 387D0 800487D0 21306400 */  addu       $a2, $v1, $a0
  .L800487D4:
    /* 387D4 800487D4 0000E28C */  lw         $v0, 0x0($a3)
    /* 387D8 800487D8 0400E38C */  lw         $v1, 0x4($a3)
    /* 387DC 800487DC 0800E48C */  lw         $a0, 0x8($a3)
    /* 387E0 800487E0 0C00E58C */  lw         $a1, 0xC($a3)
    /* 387E4 800487E4 0000C2AC */  sw         $v0, 0x0($a2)
    /* 387E8 800487E8 0400C3AC */  sw         $v1, 0x4($a2)
    /* 387EC 800487EC 0800C4AC */  sw         $a0, 0x8($a2)
    /* 387F0 800487F0 0C00C5AC */  sw         $a1, 0xC($a2)
    /* 387F4 800487F4 1000E724 */  addiu      $a3, $a3, 0x10
    /* 387F8 800487F8 F6FFE814 */  bne        $a3, $t0, .L800487D4
    /* 387FC 800487FC 1000C624 */   addiu     $a2, $a2, 0x10
    /* 38800 80048800 0000E28C */  lw         $v0, 0x0($a3)
    /* 38804 80048804 0400E38C */  lw         $v1, 0x4($a3)
    /* 38808 80048808 0800E48C */  lw         $a0, 0x8($a3)
    /* 3880C 8004880C 0000C2AC */  sw         $v0, 0x0($a2)
    /* 38810 80048810 0400C3AC */  sw         $v1, 0x4($a2)
    /* 38814 80048814 0800C4AC */  sw         $a0, 0x8($a2)
    /* 38818 80048818 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 3881C 8004881C B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 38820 80048820 00000000 */  nop
    /* 38824 80048824 C0100300 */  sll        $v0, $v1, 3
    /* 38828 80048828 23104300 */  subu       $v0, $v0, $v1
    /* 3882C 8004882C 80100200 */  sll        $v0, $v0, 2
    /* 38830 80048830 23104300 */  subu       $v0, $v0, $v1
    /* 38834 80048834 80100200 */  sll        $v0, $v0, 2
    /* 38838 80048838 01000324 */  addiu      $v1, $zero, 0x1
    /* 3883C 8004883C 0E80013C */  lui        $at, %hi(_golditem + 0x66)
    /* 38840 80048840 21082200 */  addu       $at, $at, $v0
    /* 38844 80048844 161D23A0 */  sb         $v1, %lo(_golditem + 0x66)($at)
    /* 38848 80048848 1000BF8F */  lw         $ra, 0x10($sp)
    /* 3884C 8004884C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 38850 80048850 0800E003 */  jr         $ra
    /* 38854 80048854 00000000 */   nop
endlabel SpawnStoreGold__Fv
