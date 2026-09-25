.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddStoreHoldId__FG10ItemStructi, 0xDC

glabel AddStoreHoldId__FG10ItemStructi
    /* 5E748 8006E748 0C00A7AF */  sw         $a3, 0xC($sp)
    /* 5E74C 8006E74C 2138A003 */  addu       $a3, $sp, $zero
    /* 5E750 8006E750 6C00A98F */  lw         $t1, 0x6C($sp)
    /* 5E754 8006E754 2821828F */  lw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5E758 8006E758 6000A827 */  addiu      $t0, $sp, 0x60
    /* 5E75C 8006E75C 0000A4AF */  sw         $a0, 0x0($sp)
    /* 5E760 8006E760 0E80043C */  lui        $a0, %hi(storehold)
    /* 5E764 8006E764 881D8424 */  addiu      $a0, $a0, %lo(storehold)
    /* 5E768 8006E768 0400A5AF */  sw         $a1, 0x4($sp)
    /* 5E76C 8006E76C 0800A6AF */  sw         $a2, 0x8($sp)
    /* 5E770 8006E770 C0180200 */  sll        $v1, $v0, 3
    /* 5E774 8006E774 23186200 */  subu       $v1, $v1, $v0
    /* 5E778 8006E778 80180300 */  sll        $v1, $v1, 2
    /* 5E77C 8006E77C 23186200 */  subu       $v1, $v1, $v0
    /* 5E780 8006E780 80180300 */  sll        $v1, $v1, 2
    /* 5E784 8006E784 21306400 */  addu       $a2, $v1, $a0
  .L8006E788:
    /* 5E788 8006E788 0000E28C */  lw         $v0, 0x0($a3)
    /* 5E78C 8006E78C 0400E38C */  lw         $v1, 0x4($a3)
    /* 5E790 8006E790 0800E48C */  lw         $a0, 0x8($a3)
    /* 5E794 8006E794 0C00E58C */  lw         $a1, 0xC($a3)
    /* 5E798 8006E798 0000C2AC */  sw         $v0, 0x0($a2)
    /* 5E79C 8006E79C 0400C3AC */  sw         $v1, 0x4($a2)
    /* 5E7A0 8006E7A0 0800C4AC */  sw         $a0, 0x8($a2)
    /* 5E7A4 8006E7A4 0C00C5AC */  sw         $a1, 0xC($a2)
    /* 5E7A8 8006E7A8 1000E724 */  addiu      $a3, $a3, 0x10
    /* 5E7AC 8006E7AC F6FFE814 */  bne        $a3, $t0, .L8006E788
    /* 5E7B0 8006E7B0 1000C624 */   addiu     $a2, $a2, 0x10
    /* 5E7B4 8006E7B4 0000E28C */  lw         $v0, 0x0($a3)
    /* 5E7B8 8006E7B8 0400E38C */  lw         $v1, 0x4($a3)
    /* 5E7BC 8006E7BC 0800E48C */  lw         $a0, 0x8($a3)
    /* 5E7C0 8006E7C0 0000C2AC */  sw         $v0, 0x0($a2)
    /* 5E7C4 8006E7C4 0400C3AC */  sw         $v1, 0x4($a2)
    /* 5E7C8 8006E7C8 0800C4AC */  sw         $a0, 0x8($a2)
    /* 5E7CC 8006E7CC 2821848F */  lw         $a0, %gp_rel(D_8011C8A8)($gp)
    /* 5E7D0 8006E7D0 64000324 */  addiu      $v1, $zero, 0x64
    /* 5E7D4 8006E7D4 C0100400 */  sll        $v0, $a0, 3
    /* 5E7D8 8006E7D8 23104400 */  subu       $v0, $v0, $a0
    /* 5E7DC 8006E7DC 80100200 */  sll        $v0, $v0, 2
    /* 5E7E0 8006E7E0 23104400 */  subu       $v0, $v0, $a0
    /* 5E7E4 8006E7E4 80100200 */  sll        $v0, $v0, 2
    /* 5E7E8 8006E7E8 0E80013C */  lui        $at, %hi(storehold + 0x14)
    /* 5E7EC 8006E7EC 21082200 */  addu       $at, $at, $v0
    /* 5E7F0 8006E7F0 9C1D23AC */  sw         $v1, %lo(storehold + 0x14)($at)
    /* 5E7F4 8006E7F4 0E80013C */  lui        $at, %hi(storehold + 0x18)
    /* 5E7F8 8006E7F8 21082200 */  addu       $at, $at, $v0
    /* 5E7FC 8006E7FC A01D23AC */  sw         $v1, %lo(storehold + 0x18)($at)
    /* 5E800 8006E800 0E80013C */  lui        $at, %hi(storehidx)
    /* 5E804 8006E804 21082400 */  addu       $at, $at, $a0
    /* 5E808 8006E808 C83129A0 */  sb         $t1, %lo(storehidx)($at)
    /* 5E80C 8006E80C 2821828F */  lw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5E810 8006E810 00000000 */  nop
    /* 5E814 8006E814 01004224 */  addiu      $v0, $v0, 0x1
    /* 5E818 8006E818 282182AF */  sw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5E81C 8006E81C 0800E003 */  jr         $ra
    /* 5E820 8006E820 00000000 */   nop
endlabel AddStoreHoldId__FG10ItemStructi
