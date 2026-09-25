.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching blockfill, 0x140

glabel blockfill
    /* 1C684 8002C684 0400A128 */  slti       $at, $a1, 0x4
    /* 1C688 8002C688 46002014 */  bnez       $at, .L8002C7A4
    /* 1C68C 8002C68C FF00C630 */   andi      $a2, $a2, 0xFF
    /* 1C690 8002C690 00520600 */  sll        $t2, $a2, 8
    /* 1C694 8002C694 2530CA00 */  or         $a2, $a2, $t2
    /* 1C698 8002C698 00540600 */  sll        $t2, $a2, 16
    /* 1C69C 8002C69C 2530CA00 */  or         $a2, $a2, $t2
    /* 1C6A0 8002C6A0 000086B8 */  swr        $a2, 0x0($a0)
    /* 1C6A4 8002C6A4 04000824 */  addiu      $t0, $zero, 0x4
    /* 1C6A8 8002C6A8 03008930 */  andi       $t1, $a0, 0x3
    /* 1C6AC 8002C6AC 23400901 */  subu       $t0, $t0, $t1
    /* 1C6B0 8002C6B0 21208800 */  addu       $a0, $a0, $t0
    /* 1C6B4 8002C6B4 2328A800 */  subu       $a1, $a1, $t0
    /* 1C6B8 8002C6B8 80FFA524 */  addiu      $a1, $a1, -0x80
    /* 1C6BC 8002C6BC 2400A004 */  bltz       $a1, .L8002C750
    /* 1C6C0 8002C6C0 00000000 */   nop
  .L8002C6C4:
    /* 1C6C4 8002C6C4 000086AC */  sw         $a2, 0x0($a0)
    /* 1C6C8 8002C6C8 040086AC */  sw         $a2, 0x4($a0)
    /* 1C6CC 8002C6CC 080086AC */  sw         $a2, 0x8($a0)
    /* 1C6D0 8002C6D0 0C0086AC */  sw         $a2, 0xC($a0)
    /* 1C6D4 8002C6D4 100086AC */  sw         $a2, 0x10($a0)
    /* 1C6D8 8002C6D8 140086AC */  sw         $a2, 0x14($a0)
    /* 1C6DC 8002C6DC 180086AC */  sw         $a2, 0x18($a0)
    /* 1C6E0 8002C6E0 1C0086AC */  sw         $a2, 0x1C($a0)
    /* 1C6E4 8002C6E4 200086AC */  sw         $a2, 0x20($a0)
    /* 1C6E8 8002C6E8 240086AC */  sw         $a2, 0x24($a0)
    /* 1C6EC 8002C6EC 280086AC */  sw         $a2, 0x28($a0)
    /* 1C6F0 8002C6F0 2C0086AC */  sw         $a2, 0x2C($a0)
    /* 1C6F4 8002C6F4 300086AC */  sw         $a2, 0x30($a0)
    /* 1C6F8 8002C6F8 340086AC */  sw         $a2, 0x34($a0)
    /* 1C6FC 8002C6FC 380086AC */  sw         $a2, 0x38($a0)
    /* 1C700 8002C700 3C0086AC */  sw         $a2, 0x3C($a0)
    /* 1C704 8002C704 400086AC */  sw         $a2, 0x40($a0)
    /* 1C708 8002C708 440086AC */  sw         $a2, 0x44($a0)
    /* 1C70C 8002C70C 480086AC */  sw         $a2, 0x48($a0)
    /* 1C710 8002C710 4C0086AC */  sw         $a2, 0x4C($a0)
    /* 1C714 8002C714 500086AC */  sw         $a2, 0x50($a0)
    /* 1C718 8002C718 540086AC */  sw         $a2, 0x54($a0)
    /* 1C71C 8002C71C 580086AC */  sw         $a2, 0x58($a0)
    /* 1C720 8002C720 5C0086AC */  sw         $a2, 0x5C($a0)
    /* 1C724 8002C724 600086AC */  sw         $a2, 0x60($a0)
    /* 1C728 8002C728 640086AC */  sw         $a2, 0x64($a0)
    /* 1C72C 8002C72C 680086AC */  sw         $a2, 0x68($a0)
    /* 1C730 8002C730 6C0086AC */  sw         $a2, 0x6C($a0)
    /* 1C734 8002C734 700086AC */  sw         $a2, 0x70($a0)
    /* 1C738 8002C738 740086AC */  sw         $a2, 0x74($a0)
    /* 1C73C 8002C73C 780086AC */  sw         $a2, 0x78($a0)
    /* 1C740 8002C740 7C0086AC */  sw         $a2, 0x7C($a0)
    /* 1C744 8002C744 80FFA524 */  addiu      $a1, $a1, -0x80
    /* 1C748 8002C748 DEFFA104 */  bgez       $a1, .L8002C6C4
    /* 1C74C 8002C74C 80008424 */   addiu     $a0, $a0, 0x80
  .L8002C750:
    /* 1C750 8002C750 7000A524 */  addiu      $a1, $a1, 0x70
    /* 1C754 8002C754 0800A004 */  bltz       $a1, .L8002C778
    /* 1C758 8002C758 00000000 */   nop
  .L8002C75C:
    /* 1C75C 8002C75C 000086AC */  sw         $a2, 0x0($a0)
    /* 1C760 8002C760 040086AC */  sw         $a2, 0x4($a0)
    /* 1C764 8002C764 080086AC */  sw         $a2, 0x8($a0)
    /* 1C768 8002C768 0C0086AC */  sw         $a2, 0xC($a0)
    /* 1C76C 8002C76C F0FFA524 */  addiu      $a1, $a1, -0x10
    /* 1C770 8002C770 FAFFA104 */  bgez       $a1, .L8002C75C
    /* 1C774 8002C774 10008424 */   addiu     $a0, $a0, 0x10
  .L8002C778:
    /* 1C778 8002C778 0C00A524 */  addiu      $a1, $a1, 0xC
    /* 1C77C 8002C77C 0500A004 */  bltz       $a1, .L8002C794
    /* 1C780 8002C780 00000000 */   nop
  .L8002C784:
    /* 1C784 8002C784 000086AC */  sw         $a2, 0x0($a0)
    /* 1C788 8002C788 FCFFA524 */  addiu      $a1, $a1, -0x4
    /* 1C78C 8002C78C FDFFA104 */  bgez       $a1, .L8002C784
    /* 1C790 8002C790 04008424 */   addiu     $a0, $a0, 0x4
  .L8002C794:
    /* 1C794 8002C794 21208500 */  addu       $a0, $a0, $a1
    /* 1C798 8002C798 030086A8 */  swl        $a2, 0x3($a0)
    /* 1C79C 8002C79C 0800E003 */  jr         $ra
    /* 1C7A0 8002C7A0 00000000 */   nop
  .L8002C7A4:
    /* 1C7A4 8002C7A4 FFFFA524 */  addiu      $a1, $a1, -0x1
    /* 1C7A8 8002C7A8 0400A004 */  bltz       $a1, .L8002C7BC
  .L8002C7AC:
    /* 1C7AC 8002C7AC 000086A0 */   sb        $a2, 0x0($a0)
    /* 1C7B0 8002C7B0 FFFFA524 */  addiu      $a1, $a1, -0x1
    /* 1C7B4 8002C7B4 FDFFA104 */  bgez       $a1, .L8002C7AC
    /* 1C7B8 8002C7B8 01008424 */   addiu     $a0, $a0, 0x1
  .L8002C7BC:
    /* 1C7BC 8002C7BC 0800E003 */  jr         $ra
    /* 1C7C0 8002C7C0 00000000 */   nop
endlabel blockfill
