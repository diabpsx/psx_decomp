.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddStone__Fiiiiiicii, 0x330

glabel AddStone__Fiiiiiicii
    /* 69DC 801405D4 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 69E0 801405D8 4000AF8F */  lw         $t7, 0x40($sp)
    /* 69E4 801405DC 4C00AE8F */  lw         $t6, 0x4C($sp)
    /* 69E8 801405E0 21688000 */  addu       $t5, $a0, $zero
    /* 69EC 801405E4 2800BFAF */  sw         $ra, 0x28($sp)
    /* 69F0 801405E8 1280053C */  lui        $a1, %hi(D_8011A030)
    /* 69F4 801405EC 30A0A524 */  addiu      $a1, $a1, %lo(D_8011A030)
    /* 69F8 801405F0 0000A28C */  lw         $v0, 0x0($a1)
    /* 69FC 801405F4 0400A38C */  lw         $v1, 0x4($a1)
    /* 6A00 801405F8 0800A48C */  lw         $a0, 0x8($a1)
    /* 6A04 801405FC 1000A2AF */  sw         $v0, 0x10($sp)
    /* 6A08 80140600 1400A3AF */  sw         $v1, 0x14($sp)
    /* 6A0C 80140604 1800A4AF */  sw         $a0, 0x18($sp)
    /* 6A10 80140608 0C00A28C */  lw         $v0, 0xC($a1)
    /* 6A14 8014060C 1000A38C */  lw         $v1, 0x10($a1)
    /* 6A18 80140610 1400A48C */  lw         $a0, 0x14($a1)
    /* 6A1C 80140614 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 6A20 80140618 2000A3AF */  sw         $v1, 0x20($sp)
    /* 6A24 8014061C 2400A4AF */  sw         $a0, 0x24($sp)
    /* 6A28 80140620 21480000 */  addu       $t1, $zero, $zero
    /* 6A2C 80140624 21580000 */  addu       $t3, $zero, $zero
    /* 6A30 80140628 21500000 */  addu       $t2, $zero, $zero
    /* 6A34 8014062C 80100D00 */  sll        $v0, $t5, 2
    /* 6A38 80140630 21104D00 */  addu       $v0, $v0, $t5
    /* 6A3C 80140634 80100200 */  sll        $v0, $v0, 2
    /* 6A40 80140638 23104D00 */  subu       $v0, $v0, $t5
    /* 6A44 8014063C 80100200 */  sll        $v0, $v0, 2
    /* 6A48 80140640 21604000 */  addu       $t4, $v0, $zero
    /* 6A4C 80140644 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* 6A50 80140648 21082C00 */  addu       $at, $at, $t4
    /* 6A54 8014064C 862C2EA4 */  sh         $t6, %lo(missile + 0x2E)($at)
    /* 6A58 80140650 80100A00 */  sll        $v0, $t2, 2
  .L80140654:
    /* 6A5C 80140654 2110A203 */  addu       $v0, $sp, $v0
    /* 6A60 80140658 1000428C */  lw         $v0, 0x10($v0)
    /* 6A64 8014065C 0D80013C */  lui        $at, %hi(CrawlTable)
    /* 6A68 80140660 21082200 */  addu       $at, $at, $v0
    /* 6A6C 80140664 54552690 */  lbu        $a2, %lo(CrawlTable)($at)
    /* 6A70 80140668 00000000 */  nop
    /* 6A74 8014066C 4C00C018 */  blez       $a2, .L801407A0
    /* 6A78 80140670 01004824 */   addiu     $t0, $v0, 0x1
  .L80140674:
    /* 6A7C 80140674 0D80013C */  lui        $at, %hi(CrawlTable)
    /* 6A80 80140678 21082800 */  addu       $at, $at, $t0
    /* 6A84 8014067C 54552280 */  lb         $v0, %lo(CrawlTable)($at)
    /* 6A88 80140680 0D80013C */  lui        $at, %hi(CrawlTable + 0x1)
    /* 6A8C 80140684 21082800 */  addu       $at, $at, $t0
    /* 6A90 80140688 55552380 */  lb         $v1, %lo(CrawlTable + 0x1)($at)
    /* 6A94 8014068C 2148E200 */  addu       $t1, $a3, $v0
    /* 6A98 80140690 FFFF2225 */  addiu      $v0, $t1, -0x1
    /* 6A9C 80140694 6F00422C */  sltiu      $v0, $v0, 0x6F
    /* 6AA0 80140698 3E004010 */  beqz       $v0, .L80140794
    /* 6AA4 8014069C 2158E301 */   addu      $t3, $t7, $v1
    /* 6AA8 801406A0 FFFF6225 */  addiu      $v0, $t3, -0x1
    /* 6AAC 801406A4 6F00422C */  sltiu      $v0, $v0, 0x6F
    /* 6AB0 801406A8 3A004010 */  beqz       $v0, .L80140794
    /* 6AB4 801406AC C0180B00 */   sll       $v1, $t3, 3
    /* 6AB8 801406B0 C0100900 */  sll        $v0, $t1, 3
    /* 6ABC 801406B4 23104900 */  subu       $v0, $v0, $t1
    /* 6AC0 801406B8 C0110200 */  sll        $v0, $v0, 7
    /* 6AC4 801406BC 21186200 */  addu       $v1, $v1, $v0
    /* 6AC8 801406C0 0E80013C */  lui        $at, %hi(dung_map)
    /* 6ACC 801406C4 21082300 */  addu       $at, $at, $v1
    /* 6AD0 801406C8 287A2484 */  lh         $a0, %lo(dung_map)($at)
    /* 6AD4 801406CC 00000000 */  nop
    /* 6AD8 801406D0 03008018 */  blez       $a0, .L801406E0
    /* 6ADC 801406D4 00000000 */   nop
    /* 6AE0 801406D8 B9010508 */  j          .L801406E4
    /* 6AE4 801406DC FFFF8424 */   addiu     $a0, $a0, -0x1
  .L801406E0:
    /* 6AE8 801406E0 27200400 */  nor        $a0, $zero, $a0
  .L801406E4:
    /* 6AEC 801406E4 04008228 */  slti       $v0, $a0, 0x4
    /* 6AF0 801406E8 2A004014 */  bnez       $v0, .L80140794
    /* 6AF4 801406EC 40100400 */   sll       $v0, $a0, 1
    /* 6AF8 801406F0 21104400 */  addu       $v0, $v0, $a0
    /* 6AFC 801406F4 80100200 */  sll        $v0, $v0, 2
    /* 6B00 801406F8 21104400 */  addu       $v0, $v0, $a0
    /* 6B04 801406FC C0280200 */  sll        $a1, $v0, 3
    /* 6B08 80140700 1080013C */  lui        $at, %hi(monster + 0x4C)
    /* 6B0C 80140704 21082500 */  addu       $at, $at, $a1
    /* 6B10 80140708 E0532390 */  lbu        $v1, %lo(monster + 0x4C)($at)
    /* 6B14 8014070C 1B000224 */  addiu      $v0, $zero, 0x1B
    /* 6B18 80140710 20006210 */  beq        $v1, $v0, .L80140794
    /* 6B1C 80140714 00000000 */   nop
    /* 6B20 80140718 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 6B24 8014071C 21082500 */  addu       $at, $at, $a1
    /* 6B28 80140720 C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 6B2C 80140724 00000000 */  nop
    /* 6B30 80140728 01004230 */  andi       $v0, $v0, 0x1
    /* 6B34 8014072C 19004014 */  bnez       $v0, .L80140794
    /* 6B38 80140730 00000000 */   nop
    /* 6B3C 80140734 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 6B40 80140738 21082500 */  addu       $at, $at, $a1
    /* 6B44 8014073C C7532390 */  lbu        $v1, %lo(monster + 0x33)($at)
    /* 6B48 80140740 00000000 */  nop
    /* 6B4C 80140744 F8FF6224 */  addiu      $v0, $v1, -0x8
    /* 6B50 80140748 0200422C */  sltiu      $v0, $v0, 0x2
    /* 6B54 8014074C 11004014 */  bnez       $v0, .L80140794
    /* 6B58 80140750 00160300 */   sll       $v0, $v1, 24
    /* 6B5C 80140754 031E0200 */  sra        $v1, $v0, 24
    /* 6B60 80140758 0E000224 */  addiu      $v0, $zero, 0xE
    /* 6B64 8014075C 0D006210 */  beq        $v1, $v0, .L80140794
    /* 6B68 80140760 0F000224 */   addiu     $v0, $zero, 0xF
    /* 6B6C 80140764 9DFF0624 */  addiu      $a2, $zero, -0x63
    /* 6B70 80140768 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 6B74 8014076C 21082C00 */  addu       $at, $at, $t4
    /* 6B78 80140770 762C23A4 */  sh         $v1, %lo(missile + 0x1E)($at)
    /* 6B7C 80140774 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 6B80 80140778 21082C00 */  addu       $at, $at, $t4
    /* 6B84 8014077C 782C24A4 */  sh         $a0, %lo(missile + 0x20)($at)
    /* 6B88 80140780 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 6B8C 80140784 21082500 */  addu       $at, $at, $a1
    /* 6B90 80140788 C75322A0 */  sb         $v0, %lo(monster + 0x33)($at)
    /* 6B94 8014078C E8010508 */  j          .L801407A0
    /* 6B98 80140790 06000A24 */   addiu     $t2, $zero, 0x6
  .L80140794:
    /* 6B9C 80140794 FFFFC624 */  addiu      $a2, $a2, -0x1
    /* 6BA0 80140798 B6FFC01C */  bgtz       $a2, .L80140674
    /* 6BA4 8014079C 02000825 */   addiu     $t0, $t0, 0x2
  .L801407A0:
    /* 6BA8 801407A0 01004A25 */  addiu      $t2, $t2, 0x1
    /* 6BAC 801407A4 06004229 */  slti       $v0, $t2, 0x6
    /* 6BB0 801407A8 AAFF4014 */  bnez       $v0, .L80140654
    /* 6BB4 801407AC 80100A00 */   sll       $v0, $t2, 2
    /* 6BB8 801407B0 9DFF0224 */  addiu      $v0, $zero, -0x63
    /* 6BBC 801407B4 0B00C210 */  beq        $a2, $v0, .L801407E4
    /* 6BC0 801407B8 80100D00 */   sll       $v0, $t5, 2
    /* 6BC4 801407BC 21104D00 */  addu       $v0, $v0, $t5
    /* 6BC8 801407C0 80100200 */  sll        $v0, $v0, 2
    /* 6BCC 801407C4 23104D00 */  subu       $v0, $v0, $t5
    /* 6BD0 801407C8 80100200 */  sll        $v0, $v0, 2
    /* 6BD4 801407CC 01000324 */  addiu      $v1, $zero, 0x1
    /* 6BD8 801407D0 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 6BDC 801407D4 21082200 */  addu       $at, $at, $v0
    /* 6BE0 801407D8 902C23A0 */  sb         $v1, %lo(missile + 0x38)($at)
    /* 6BE4 801407DC 3D020508 */  j          .L801408F4
    /* 6BE8 801407E0 00000000 */   nop
  .L801407E4:
    /* 6BEC 801407E4 21104D00 */  addu       $v0, $v0, $t5
    /* 6BF0 801407E8 80100200 */  sll        $v0, $v0, 2
    /* 6BF4 801407EC 23104D00 */  subu       $v0, $v0, $t5
    /* 6BF8 801407F0 80280200 */  sll        $a1, $v0, 2
    /* 6BFC 801407F4 1080013C */  lui        $at, %hi(missile + 0x40)
    /* 6C00 801407F8 21082500 */  addu       $at, $at, $a1
    /* 6C04 801407FC 982C2390 */  lbu        $v1, %lo(missile + 0x40)($at)
    /* 6C08 80140800 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 6C0C 80140804 21082500 */  addu       $at, $at, $a1
    /* 6C10 80140808 892C29A0 */  sb         $t1, %lo(missile + 0x31)($at)
    /* 6C14 8014080C 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 6C18 80140810 21082500 */  addu       $at, $at, $a1
    /* 6C1C 80140814 892C2290 */  lbu        $v0, %lo(missile + 0x31)($at)
    /* 6C20 80140818 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 6C24 8014081C 21082500 */  addu       $at, $at, $a1
    /* 6C28 80140820 8A2C2BA0 */  sb         $t3, %lo(missile + 0x32)($at)
    /* 6C2C 80140824 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 6C30 80140828 21082500 */  addu       $at, $at, $a1
    /* 6C34 8014082C 8A2C2490 */  lbu        $a0, %lo(missile + 0x32)($at)
    /* 6C38 80140830 001E0300 */  sll        $v1, $v1, 24
    /* 6C3C 80140834 031E0300 */  sra        $v1, $v1, 24
    /* 6C40 80140838 06006324 */  addiu      $v1, $v1, 0x6
    /* 6C44 8014083C 1080013C */  lui        $at, %hi(missile + 0x35)
    /* 6C48 80140840 21082500 */  addu       $at, $at, $a1
    /* 6C4C 80140844 8D2C22A0 */  sb         $v0, %lo(missile + 0x35)($at)
    /* 6C50 80140848 40100E00 */  sll        $v0, $t6, 1
    /* 6C54 8014084C 21104E00 */  addu       $v0, $v0, $t6
    /* 6C58 80140850 80100200 */  sll        $v0, $v0, 2
    /* 6C5C 80140854 21104E00 */  addu       $v0, $v0, $t6
    /* 6C60 80140858 00110200 */  sll        $v0, $v0, 4
    /* 6C64 8014085C 23104E00 */  subu       $v0, $v0, $t6
    /* 6C68 80140860 80100200 */  sll        $v0, $v0, 2
    /* 6C6C 80140864 21104E00 */  addu       $v0, $v0, $t6
    /* 6C70 80140868 C0100200 */  sll        $v0, $v0, 3
    /* 6C74 8014086C 1080013C */  lui        $at, %hi(missile + 0x36)
    /* 6C78 80140870 21082500 */  addu       $at, $at, $a1
    /* 6C7C 80140874 8E2C24A0 */  sb         $a0, %lo(missile + 0x36)($at)
    /* 6C80 80140878 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 6C84 8014087C 21082500 */  addu       $at, $at, $a1
    /* 6C88 80140880 702C23A4 */  sh         $v1, %lo(missile + 0x18)($at)
    /* 6C8C 80140884 0E80013C */  lui        $at, %hi(plr + 0x19C4)
    /* 6C90 80140888 21082200 */  addu       $at, $at, $v0
    /* 6C94 8014088C FCBE248C */  lw         $a0, %lo(plr + 0x19C4)($at)
    /* 6C98 80140890 FFFF6230 */  andi       $v0, $v1, 0xFFFF
    /* 6C9C 80140894 18008200 */  mult       $a0, $v0
    /* 6CA0 80140898 12C00000 */  mflo       $t8
    /* 6CA4 8014089C C3111800 */  sra        $v0, $t8, 7
    /* 6CA8 801408A0 21186200 */  addu       $v1, $v1, $v0
    /* 6CAC 801408A4 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 6CB0 801408A8 21082500 */  addu       $at, $at, $a1
    /* 6CB4 801408AC 702C23A4 */  sh         $v1, %lo(missile + 0x18)($at)
    /* 6CB8 801408B0 FFFF6330 */  andi       $v1, $v1, 0xFFFF
    /* 6CBC 801408B4 1000632C */  sltiu      $v1, $v1, 0x10
    /* 6CC0 801408B8 04006014 */  bnez       $v1, .L801408CC
    /* 6CC4 801408BC 0F000224 */   addiu     $v0, $zero, 0xF
    /* 6CC8 801408C0 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 6CCC 801408C4 21082500 */  addu       $at, $at, $a1
    /* 6CD0 801408C8 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
  .L801408CC:
    /* 6CD4 801408CC 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 6CD8 801408D0 21082500 */  addu       $at, $at, $a1
    /* 6CDC 801408D4 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* 6CE0 801408D8 2120C001 */  addu       $a0, $t6, $zero
    /* 6CE4 801408DC 00110200 */  sll        $v0, $v0, 4
    /* 6CE8 801408E0 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 6CEC 801408E4 21082500 */  addu       $at, $at, $a1
    /* 6CF0 801408E8 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* 6CF4 801408EC C2DC010C */  jal        UseMana__Fii
    /* 6CF8 801408F0 08000524 */   addiu     $a1, $zero, 0x8
  .L801408F4:
    /* 6CFC 801408F4 2800BF8F */  lw         $ra, 0x28($sp)
    /* 6D00 801408F8 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 6D04 801408FC 0800E003 */  jr         $ra
    /* 6D08 80140900 00000000 */   nop
endlabel AddStone__Fiiiiiicii
