.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_PlaceMiniSet__FPCUciiiiiii, 0x468

glabel DRLG_PlaceMiniSet__FPCUciiiiiii
    /* 29A8 8013C5A0 80FFBD27 */  addiu      $sp, $sp, -0x80
    /* 29AC 8013C5A4 7000B6AF */  sw         $s6, 0x70($sp)
    /* 29B0 8013C5A8 9000B68F */  lw         $s6, 0x90($sp)
    /* 29B4 8013C5AC 7400B7AF */  sw         $s7, 0x74($sp)
    /* 29B8 8013C5B0 9800B78F */  lw         $s7, 0x98($sp)
    /* 29BC 8013C5B4 7800BEAF */  sw         $fp, 0x78($sp)
    /* 29C0 8013C5B8 21F08000 */  addu       $fp, $a0, $zero
    /* 29C4 8013C5BC 6000B2AF */  sw         $s2, 0x60($sp)
    /* 29C8 8013C5C0 0000D293 */  lbu        $s2, 0x0($fp)
    /* 29CC 8013C5C4 6800B4AF */  sw         $s4, 0x68($sp)
    /* 29D0 8013C5C8 0100D493 */  lbu        $s4, 0x1($fp)
    /* 29D4 8013C5CC 6400B3AF */  sw         $s3, 0x64($sp)
    /* 29D8 8013C5D0 2198A000 */  addu       $s3, $a1, $zero
    /* 29DC 8013C5D4 6C00B5AF */  sw         $s5, 0x6C($sp)
    /* 29E0 8013C5D8 21A8E000 */  addu       $s5, $a3, $zero
    /* 29E4 8013C5DC 5800B0AF */  sw         $s0, 0x58($sp)
    /* 29E8 8013C5E0 21800000 */  addu       $s0, $zero, $zero
    /* 29EC 8013C5E4 5C00B1AF */  sw         $s1, 0x5C($sp)
    /* 29F0 8013C5E8 21880000 */  addu       $s1, $zero, $zero
    /* 29F4 8013C5EC 0400D314 */  bne        $a2, $s3, .L8013C600
    /* 29F8 8013C5F0 7C00BFAF */   sw        $ra, 0x7C($sp)
    /* 29FC 8013C5F4 01001924 */  addiu      $t9, $zero, 0x1
    /* 2A00 8013C5F8 84F10408 */  j          .L8013C610
    /* 2A04 8013C5FC 1000B9AF */   sw        $t9, 0x10($sp)
  .L8013C600:
    /* 2A08 8013C600 C9F6000C */  jal        ENG_random__Fl
    /* 2A0C 8013C604 2320D300 */   subu      $a0, $a2, $s3
    /* 2A10 8013C608 21105300 */  addu       $v0, $v0, $s3
    /* 2A14 8013C60C 1000A2AF */  sw         $v0, 0x10($sp)
  .L8013C610:
    /* 2A18 8013C610 1000B98F */  lw         $t9, 0x10($sp)
    /* 2A1C 8013C614 00000000 */  nop
    /* 2A20 8013C618 AC00201B */  blez       $t9, .L8013C8CC
    /* 2A24 8013C61C 21980000 */   addu      $s3, $zero, $zero
    /* 2A28 8013C620 01000E24 */  addiu      $t6, $zero, 0x1
    /* 2A2C 8013C624 0E800F3C */  lui        $t7, %hi(dungeon)
    /* 2A30 8013C628 C440EF25 */  addiu      $t7, $t7, %lo(dungeon)
    /* 2A34 8013C62C 28001824 */  addiu      $t8, $zero, 0x28
    /* 2A38 8013C630 23C81403 */  subu       $t9, $t8, $s4
    /* 2A3C 8013C634 1800B9AF */  sw         $t9, 0x18($sp)
    /* 2A40 8013C638 23201203 */  subu       $a0, $t8, $s2
  .L8013C63C:
    /* 2A44 8013C63C 4800AEAF */  sw         $t6, 0x48($sp)
    /* 2A48 8013C640 4C00AFAF */  sw         $t7, 0x4C($sp)
    /* 2A4C 8013C644 C9F6000C */  jal        ENG_random__Fl
    /* 2A50 8013C648 5000B8AF */   sw        $t8, 0x50($sp)
    /* 2A54 8013C64C 5000B88F */  lw         $t8, 0x50($sp)
    /* 2A58 8013C650 21804000 */  addu       $s0, $v0, $zero
    /* 2A5C 8013C654 C9F6000C */  jal        ENG_random__Fl
    /* 2A60 8013C658 23201403 */   subu      $a0, $t8, $s4
    /* 2A64 8013C65C 21884000 */  addu       $s1, $v0, $zero
    /* 2A68 8013C660 21600000 */  addu       $t4, $zero, $zero
    /* 2A6C 8013C664 12800D3C */  lui        $t5, %hi(mydflags)
    /* 2A70 8013C668 D8C0AD8D */  lw         $t5, %lo(mydflags)($t5)
    /* 2A74 8013C66C 5000B88F */  lw         $t8, 0x50($sp)
    /* 2A78 8013C670 4C00AF8F */  lw         $t7, 0x4C($sp)
    /* 2A7C 8013C674 4800AE8F */  lw         $t6, 0x48($sp)
    /* 2A80 8013C678 FFFF1924 */  addiu      $t9, $zero, -0x1
  .L8013C67C:
    /* 2A84 8013C67C 0A00B912 */  beq        $s5, $t9, .L8013C6A8
    /* 2A88 8013C680 01000824 */   addiu     $t0, $zero, 0x1
    /* 2A8C 8013C684 2310B202 */  subu       $v0, $s5, $s2
    /* 2A90 8013C688 2A100202 */  slt        $v0, $s0, $v0
    /* 2A94 8013C68C 07004014 */  bnez       $v0, .L8013C6AC
    /* 2A98 8013C690 0C00A226 */   addiu     $v0, $s5, 0xC
    /* 2A9C 8013C694 2A105000 */  slt        $v0, $v0, $s0
    /* 2AA0 8013C698 04004014 */  bnez       $v0, .L8013C6AC
    /* 2AA4 8013C69C 00000000 */   nop
    /* 2AA8 8013C6A0 01001026 */  addiu      $s0, $s0, 0x1
    /* 2AAC 8013C6A4 21400000 */  addu       $t0, $zero, $zero
  .L8013C6A8:
    /* 2AB0 8013C6A8 FFFF1924 */  addiu      $t9, $zero, -0x1
  .L8013C6AC:
    /* 2AB4 8013C6AC 0900D912 */  beq        $s6, $t9, .L8013C6D4
    /* 2AB8 8013C6B0 2310D402 */   subu      $v0, $s6, $s4
    /* 2ABC 8013C6B4 2A102202 */  slt        $v0, $s1, $v0
    /* 2AC0 8013C6B8 06004014 */  bnez       $v0, .L8013C6D4
    /* 2AC4 8013C6BC 0C00C226 */   addiu     $v0, $s6, 0xC
    /* 2AC8 8013C6C0 2A105100 */  slt        $v0, $v0, $s1
    /* 2ACC 8013C6C4 03004014 */  bnez       $v0, .L8013C6D4
    /* 2AD0 8013C6C8 00000000 */   nop
    /* 2AD4 8013C6CC 01003126 */  addiu      $s1, $s1, 0x1
    /* 2AD8 8013C6D0 21400000 */  addu       $t0, $zero, $zero
  .L8013C6D4:
    /* 2ADC 8013C6D4 1200EE12 */  beq        $s7, $t6, .L8013C720
    /* 2AE0 8013C6D8 0200E22A */   slti      $v0, $s7, 0x2
    /* 2AE4 8013C6DC 05004010 */  beqz       $v0, .L8013C6F4
    /* 2AE8 8013C6E0 00000000 */   nop
    /* 2AEC 8013C6E4 0A00E012 */  beqz       $s7, .L8013C710
    /* 2AF0 8013C6E8 2A101502 */   slt       $v0, $s0, $s5
    /* 2AF4 8013C6EC D4F10408 */  j          .L8013C750
    /* 2AF8 8013C6F0 02000924 */   addiu     $t1, $zero, 0x2
  .L8013C6F4:
    /* 2AFC 8013C6F4 02000224 */  addiu      $v0, $zero, 0x2
    /* 2B00 8013C6F8 0E00E212 */  beq        $s7, $v0, .L8013C734
    /* 2B04 8013C6FC 03000224 */   addiu     $v0, $zero, 0x3
    /* 2B08 8013C700 0D00E212 */  beq        $s7, $v0, .L8013C738
    /* 2B0C 8013C704 2A10B002 */   slt       $v0, $s5, $s0
    /* 2B10 8013C708 D4F10408 */  j          .L8013C750
    /* 2B14 8013C70C 02000924 */   addiu     $t1, $zero, 0x2
  .L8013C710:
    /* 2B18 8013C710 0E004010 */  beqz       $v0, .L8013C74C
    /* 2B1C 8013C714 2A103602 */   slt       $v0, $s1, $s6
    /* 2B20 8013C718 D0F10408 */  j          .L8013C740
    /* 2B24 8013C71C 00000000 */   nop
  .L8013C720:
    /* 2B28 8013C720 2A10B002 */  slt        $v0, $s5, $s0
    /* 2B2C 8013C724 09004010 */  beqz       $v0, .L8013C74C
    /* 2B30 8013C728 2A103602 */   slt       $v0, $s1, $s6
    /* 2B34 8013C72C D0F10408 */  j          .L8013C740
    /* 2B38 8013C730 00000000 */   nop
  .L8013C734:
    /* 2B3C 8013C734 2A101502 */  slt        $v0, $s0, $s5
  .L8013C738:
    /* 2B40 8013C738 04004010 */  beqz       $v0, .L8013C74C
    /* 2B44 8013C73C 2A10D102 */   slt       $v0, $s6, $s1
  .L8013C740:
    /* 2B48 8013C740 03004010 */  beqz       $v0, .L8013C750
    /* 2B4C 8013C744 02000924 */   addiu     $t1, $zero, 0x2
    /* 2B50 8013C748 21400000 */  addu       $t0, $zero, $zero
  .L8013C74C:
    /* 2B54 8013C74C 02000924 */  addiu      $t1, $zero, 0x2
  .L8013C750:
    /* 2B58 8013C750 2C008012 */  beqz       $s4, .L8013C804
    /* 2B5C 8013C754 21380000 */   addu      $a3, $zero, $zero
  .L8013C758:
    /* 2B60 8013C758 2A000E15 */  bne        $t0, $t6, .L8013C804
    /* 2B64 8013C75C 00000000 */   nop
    /* 2B68 8013C760 24004012 */  beqz       $s2, .L8013C7F4
    /* 2B6C 8013C764 21280000 */   addu      $a1, $zero, $zero
    /* 2B70 8013C768 21182702 */  addu       $v1, $s1, $a3
    /* 2B74 8013C76C 40580300 */  sll        $t3, $v1, 1
    /* 2B78 8013C770 80100300 */  sll        $v0, $v1, 2
    /* 2B7C 8013C774 21104300 */  addu       $v0, $v0, $v1
    /* 2B80 8013C778 C0500200 */  sll        $t2, $v0, 3
    /* 2B84 8013C77C 21200002 */  addu       $a0, $s0, $zero
    /* 2B88 8013C780 21303E01 */  addu       $a2, $t1, $fp
  .L8013C784:
    /* 2B8C 8013C784 1B000E15 */  bne        $t0, $t6, .L8013C7F4
    /* 2B90 8013C788 00000000 */   nop
    /* 2B94 8013C78C 0000C390 */  lbu        $v1, 0x0($a2)
    /* 2B98 8013C790 00000000 */  nop
    /* 2B9C 8013C794 0A006010 */  beqz       $v1, .L8013C7C0
    /* 2BA0 8013C798 40100400 */   sll       $v0, $a0, 1
    /* 2BA4 8013C79C 21104400 */  addu       $v0, $v0, $a0
    /* 2BA8 8013C7A0 40110200 */  sll        $v0, $v0, 5
    /* 2BAC 8013C7A4 21104F00 */  addu       $v0, $v0, $t7
    /* 2BB0 8013C7A8 21106201 */  addu       $v0, $t3, $v0
    /* 2BB4 8013C7AC 00004294 */  lhu        $v0, 0x0($v0)
    /* 2BB8 8013C7B0 00000000 */  nop
    /* 2BBC 8013C7B4 03004310 */  beq        $v0, $v1, .L8013C7C4
    /* 2BC0 8013C7B8 21104401 */   addu      $v0, $t2, $a0
    /* 2BC4 8013C7BC 21400000 */  addu       $t0, $zero, $zero
  .L8013C7C0:
    /* 2BC8 8013C7C0 21104401 */  addu       $v0, $t2, $a0
  .L8013C7C4:
    /* 2BCC 8013C7C4 2110A201 */  addu       $v0, $t5, $v0
    /* 2BD0 8013C7C8 00004290 */  lbu        $v0, 0x0($v0)
    /* 2BD4 8013C7CC 00000000 */  nop
    /* 2BD8 8013C7D0 02004010 */  beqz       $v0, .L8013C7DC
    /* 2BDC 8013C7D4 00000000 */   nop
    /* 2BE0 8013C7D8 21400000 */  addu       $t0, $zero, $zero
  .L8013C7DC:
    /* 2BE4 8013C7DC 0100C624 */  addiu      $a2, $a2, 0x1
    /* 2BE8 8013C7E0 01002925 */  addiu      $t1, $t1, 0x1
    /* 2BEC 8013C7E4 0100A524 */  addiu      $a1, $a1, 0x1
    /* 2BF0 8013C7E8 2A10B200 */  slt        $v0, $a1, $s2
    /* 2BF4 8013C7EC E5FF4014 */  bnez       $v0, .L8013C784
    /* 2BF8 8013C7F0 01008424 */   addiu     $a0, $a0, 0x1
  .L8013C7F4:
    /* 2BFC 8013C7F4 0100E724 */  addiu      $a3, $a3, 0x1
    /* 2C00 8013C7F8 2A10F400 */  slt        $v0, $a3, $s4
    /* 2C04 8013C7FC D6FF4014 */  bnez       $v0, .L8013C758
    /* 2C08 8013C800 00000000 */   nop
  .L8013C804:
    /* 2C0C 8013C804 0F000015 */  bnez       $t0, .L8013C844
    /* 2C10 8013C808 23101203 */   subu      $v0, $t8, $s2
    /* 2C14 8013C80C 01001026 */  addiu      $s0, $s0, 0x1
    /* 2C18 8013C810 06000216 */  bne        $s0, $v0, .L8013C82C
    /* 2C1C 8013C814 00000000 */   nop
    /* 2C20 8013C818 1800B98F */  lw         $t9, 0x18($sp)
    /* 2C24 8013C81C 01003126 */  addiu      $s1, $s1, 0x1
    /* 2C28 8013C820 02003916 */  bne        $s1, $t9, .L8013C82C
    /* 2C2C 8013C824 21800000 */   addu      $s0, $zero, $zero
    /* 2C30 8013C828 21880000 */  addu       $s1, $zero, $zero
  .L8013C82C:
    /* 2C34 8013C82C 01008C25 */  addiu      $t4, $t4, 0x1
    /* 2C38 8013C830 A10F8229 */  slti       $v0, $t4, 0xFA1
    /* 2C3C 8013C834 5F004010 */  beqz       $v0, .L8013C9B4
    /* 2C40 8013C838 00000000 */   nop
    /* 2C44 8013C83C 8FFF0011 */  beqz       $t0, .L8013C67C
    /* 2C48 8013C840 FFFF1924 */   addiu     $t9, $zero, -0x1
  .L8013C844:
    /* 2C4C 8013C844 18009202 */  mult       $s4, $s2
    /* 2C50 8013C848 21380000 */  addu       $a3, $zero, $zero
    /* 2C54 8013C84C 12C80000 */  mflo       $t9
    /* 2C58 8013C850 19008012 */  beqz       $s4, .L8013C8B8
    /* 2C5C 8013C854 02002927 */   addiu     $t1, $t9, 0x2
  .L8013C858:
    /* 2C60 8013C858 13004012 */  beqz       $s2, .L8013C8A8
    /* 2C64 8013C85C 21280000 */   addu      $a1, $zero, $zero
    /* 2C68 8013C860 21102702 */  addu       $v0, $s1, $a3
    /* 2C6C 8013C864 40400200 */  sll        $t0, $v0, 1
    /* 2C70 8013C868 21303E01 */  addu       $a2, $t1, $fp
  .L8013C86C:
    /* 2C74 8013C86C 0000C490 */  lbu        $a0, 0x0($a2)
    /* 2C78 8013C870 00000000 */  nop
    /* 2C7C 8013C874 07008010 */  beqz       $a0, .L8013C894
    /* 2C80 8013C878 21180502 */   addu      $v1, $s0, $a1
    /* 2C84 8013C87C 40100300 */  sll        $v0, $v1, 1
    /* 2C88 8013C880 21104300 */  addu       $v0, $v0, $v1
    /* 2C8C 8013C884 40110200 */  sll        $v0, $v0, 5
    /* 2C90 8013C888 21104F00 */  addu       $v0, $v0, $t7
    /* 2C94 8013C88C 21100201 */  addu       $v0, $t0, $v0
    /* 2C98 8013C890 000044A4 */  sh         $a0, 0x0($v0)
  .L8013C894:
    /* 2C9C 8013C894 0100C624 */  addiu      $a2, $a2, 0x1
    /* 2CA0 8013C898 0100A524 */  addiu      $a1, $a1, 0x1
    /* 2CA4 8013C89C 2A10B200 */  slt        $v0, $a1, $s2
    /* 2CA8 8013C8A0 F2FF4014 */  bnez       $v0, .L8013C86C
    /* 2CAC 8013C8A4 01002925 */   addiu     $t1, $t1, 0x1
  .L8013C8A8:
    /* 2CB0 8013C8A8 0100E724 */  addiu      $a3, $a3, 0x1
    /* 2CB4 8013C8AC 2A10F400 */  slt        $v0, $a3, $s4
    /* 2CB8 8013C8B0 E9FF4014 */  bnez       $v0, .L8013C858
    /* 2CBC 8013C8B4 00000000 */   nop
  .L8013C8B8:
    /* 2CC0 8013C8B8 1000B98F */  lw         $t9, 0x10($sp)
    /* 2CC4 8013C8BC 01007326 */  addiu      $s3, $s3, 0x1
    /* 2CC8 8013C8C0 2A107902 */  slt        $v0, $s3, $t9
    /* 2CCC 8013C8C4 5DFF4014 */  bnez       $v0, .L8013C63C
    /* 2CD0 8013C8C8 23201203 */   subu      $a0, $t8, $s2
  .L8013C8CC:
    /* 2CD4 8013C8CC 1480023C */  lui        $v0, %hi(PWATERIN)
    /* 2CD8 8013C8D0 64A34224 */  addiu      $v0, $v0, %lo(PWATERIN)
    /* 2CDC 8013C8D4 1300C217 */  bne        $fp, $v0, .L8013C924
    /* 2CE0 8013C8D8 21200002 */   addu      $a0, $s0, $zero
    /* 2CE4 8013C8DC 02002526 */  addiu      $a1, $s1, 0x2
    /* 2CE8 8013C8E0 05000626 */  addiu      $a2, $s0, 0x5
    /* 2CEC 8013C8E4 1280133C */  lui        $s3, %hi(TransVal)
    /* 2CF0 8013C8E8 48C17382 */  lb         $s3, %lo(TransVal)($s3)
    /* 2CF4 8013C8EC 1280013C */  lui        $at, %hi(TransVal)
    /* 2CF8 8013C8F0 48C120A0 */  sb         $zero, %lo(TransVal)($at)
    /* 2CFC 8013C8F4 375E010C */  jal        DRLG_MRectTrans__Fiiii
    /* 2D00 8013C8F8 04002726 */   addiu     $a3, $s1, 0x4
    /* 2D04 8013C8FC 40101000 */  sll        $v0, $s0, 1
    /* 2D08 8013C900 15004224 */  addiu      $v0, $v0, 0x15
    /* 2D0C 8013C904 0E80013C */  lui        $at, %hi(quests + 0x108)
    /* 2D10 8013C908 48DB22AC */  sw         $v0, %lo(quests + 0x108)($at)
    /* 2D14 8013C90C 40101100 */  sll        $v0, $s1, 1
    /* 2D18 8013C910 16004224 */  addiu      $v0, $v0, 0x16
    /* 2D1C 8013C914 0E80013C */  lui        $at, %hi(quests + 0x10C)
    /* 2D20 8013C918 4CDB22AC */  sw         $v0, %lo(quests + 0x10C)($at)
    /* 2D24 8013C91C 1280013C */  lui        $at, %hi(TransVal)
    /* 2D28 8013C920 48C133A0 */  sb         $s3, %lo(TransVal)($at)
  .L8013C924:
    /* 2D2C 8013C924 9400B98F */  lw         $t9, 0x94($sp)
    /* 2D30 8013C928 01000224 */  addiu      $v0, $zero, 0x1
    /* 2D34 8013C92C 08002217 */  bne        $t9, $v0, .L8013C950
    /* 2D38 8013C930 40101000 */   sll       $v0, $s0, 1
    /* 2D3C 8013C934 13004224 */  addiu      $v0, $v0, 0x13
    /* 2D40 8013C938 1280013C */  lui        $at, %hi(ViewX)
    /* 2D44 8013C93C 14C122AC */  sw         $v0, %lo(ViewX)($at)
    /* 2D48 8013C940 40101100 */  sll        $v0, $s1, 1
    /* 2D4C 8013C944 14004224 */  addiu      $v0, $v0, 0x14
    /* 2D50 8013C948 1280013C */  lui        $at, %hi(ViewY)
    /* 2D54 8013C94C 18C122AC */  sw         $v0, %lo(ViewY)($at)
  .L8013C950:
    /* 2D58 8013C950 9C00B98F */  lw         $t9, 0x9C($sp)
    /* 2D5C 8013C954 00000000 */  nop
    /* 2D60 8013C958 0A002017 */  bnez       $t9, .L8013C984
    /* 2D64 8013C95C 2A101502 */   slt       $v0, $s0, $s5
    /* 2D68 8013C960 40101000 */  sll        $v0, $s0, 1
    /* 2D6C 8013C964 13004224 */  addiu      $v0, $v0, 0x13
    /* 2D70 8013C968 1280013C */  lui        $at, %hi(LvlViewX)
    /* 2D74 8013C96C 2CC122AC */  sw         $v0, %lo(LvlViewX)($at)
    /* 2D78 8013C970 40101100 */  sll        $v0, $s1, 1
    /* 2D7C 8013C974 14004224 */  addiu      $v0, $v0, 0x14
    /* 2D80 8013C978 1280013C */  lui        $at, %hi(LvlViewY)
    /* 2D84 8013C97C 30C122AC */  sw         $v0, %lo(LvlViewY)($at)
    /* 2D88 8013C980 2A101502 */  slt        $v0, $s0, $s5
  .L8013C984:
    /* 2D8C 8013C984 03004010 */  beqz       $v0, .L8013C994
    /* 2D90 8013C988 2A103602 */   slt       $v0, $s1, $s6
    /* 2D94 8013C98C 11004014 */  bnez       $v0, .L8013C9D4
    /* 2D98 8013C990 21100000 */   addu      $v0, $zero, $zero
  .L8013C994:
    /* 2D9C 8013C994 2A10B002 */  slt        $v0, $s5, $s0
    /* 2DA0 8013C998 08004010 */  beqz       $v0, .L8013C9BC
    /* 2DA4 8013C99C 2A181502 */   slt       $v1, $s0, $s5
    /* 2DA8 8013C9A0 2A103602 */  slt        $v0, $s1, $s6
    /* 2DAC 8013C9A4 05004010 */  beqz       $v0, .L8013C9BC
    /* 2DB0 8013C9A8 00000000 */   nop
    /* 2DB4 8013C9AC 75F20408 */  j          .L8013C9D4
    /* 2DB8 8013C9B0 01000224 */   addiu     $v0, $zero, 0x1
  .L8013C9B4:
    /* 2DBC 8013C9B4 75F20408 */  j          .L8013C9D4
    /* 2DC0 8013C9B8 FFFF0224 */   addiu     $v0, $zero, -0x1
  .L8013C9BC:
    /* 2DC4 8013C9BC 05006010 */  beqz       $v1, .L8013C9D4
    /* 2DC8 8013C9C0 03000224 */   addiu     $v0, $zero, 0x3
    /* 2DCC 8013C9C4 2A18D102 */  slt        $v1, $s6, $s1
    /* 2DD0 8013C9C8 02006010 */  beqz       $v1, .L8013C9D4
    /* 2DD4 8013C9CC 00000000 */   nop
    /* 2DD8 8013C9D0 02000224 */  addiu      $v0, $zero, 0x2
  .L8013C9D4:
    /* 2DDC 8013C9D4 7C00BF8F */  lw         $ra, 0x7C($sp)
    /* 2DE0 8013C9D8 7800BE8F */  lw         $fp, 0x78($sp)
    /* 2DE4 8013C9DC 7400B78F */  lw         $s7, 0x74($sp)
    /* 2DE8 8013C9E0 7000B68F */  lw         $s6, 0x70($sp)
    /* 2DEC 8013C9E4 6C00B58F */  lw         $s5, 0x6C($sp)
    /* 2DF0 8013C9E8 6800B48F */  lw         $s4, 0x68($sp)
    /* 2DF4 8013C9EC 6400B38F */  lw         $s3, 0x64($sp)
    /* 2DF8 8013C9F0 6000B28F */  lw         $s2, 0x60($sp)
    /* 2DFC 8013C9F4 5C00B18F */  lw         $s1, 0x5C($sp)
    /* 2E00 8013C9F8 5800B08F */  lw         $s0, 0x58($sp)
    /* 2E04 8013C9FC 8000BD27 */  addiu      $sp, $sp, 0x80
    /* 2E08 8013CA00 0800E003 */  jr         $ra
    /* 2E0C 8013CA04 00000000 */   nop
endlabel DRLG_PlaceMiniSet__FPCUciiiiiii
