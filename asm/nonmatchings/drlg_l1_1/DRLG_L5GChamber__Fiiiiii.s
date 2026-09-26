.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L5GChamber__Fiiiiii, 0x2C0

glabel DRLG_L5GChamber__Fiiiiii
    /* 4ABC 8013E6B4 21488000 */  addu       $t1, $a0, $zero
    /* 4AC0 8013E6B8 2150A000 */  addu       $t2, $a1, $zero
    /* 4AC4 8013E6BC 01000B24 */  addiu      $t3, $zero, 0x1
    /* 4AC8 8013E6C0 1000AC8F */  lw         $t4, 0x10($sp)
    /* 4ACC 8013E6C4 1400AD8F */  lw         $t5, 0x14($sp)
    /* 4AD0 8013E6C8 2200CB14 */  bne        $a2, $t3, .L8013E754
    /* 4AD4 8013E6CC 2140E000 */   addu      $t0, $a3, $zero
    /* 4AD8 8013E6D0 0E80063C */  lui        $a2, %hi(dungeon + 0xC0)
    /* 4ADC 8013E6D4 8441C624 */  addiu      $a2, $a2, %lo(dungeon + 0xC0)
    /* 4AE0 8013E6D8 40200900 */  sll        $a0, $t1, 1
    /* 4AE4 8013E6DC 21208900 */  addu       $a0, $a0, $t1
    /* 4AE8 8013E6E0 40210400 */  sll        $a0, $a0, 5
    /* 4AEC 8013E6E4 21108600 */  addu       $v0, $a0, $a2
    /* 4AF0 8013E6E8 40280A00 */  sll        $a1, $t2, 1
    /* 4AF4 8013E6EC 2110A200 */  addu       $v0, $a1, $v0
    /* 4AF8 8013E6F0 0C000724 */  addiu      $a3, $zero, 0xC
    /* 4AFC 8013E6F4 000047A4 */  sh         $a3, 0x0($v0)
    /* 4B00 8013E6F8 6000C224 */  addiu      $v0, $a2, 0x60
    /* 4B04 8013E6FC 21108200 */  addu       $v0, $a0, $v0
    /* 4B08 8013E700 2110A200 */  addu       $v0, $a1, $v0
    /* 4B0C 8013E704 000047A4 */  sh         $a3, 0x0($v0)
    /* 4B10 8013E708 C000C224 */  addiu      $v0, $a2, 0xC0
    /* 4B14 8013E70C 21108200 */  addu       $v0, $a0, $v0
    /* 4B18 8013E710 2110A200 */  addu       $v0, $a1, $v0
    /* 4B1C 8013E714 03000324 */  addiu      $v1, $zero, 0x3
    /* 4B20 8013E718 000043A4 */  sh         $v1, 0x0($v0)
    /* 4B24 8013E71C E001C224 */  addiu      $v0, $a2, 0x1E0
    /* 4B28 8013E720 21108200 */  addu       $v0, $a0, $v0
    /* 4B2C 8013E724 2110A200 */  addu       $v0, $a1, $v0
    /* 4B30 8013E728 09000324 */  addiu      $v1, $zero, 0x9
    /* 4B34 8013E72C 000043A4 */  sh         $v1, 0x0($v0)
    /* 4B38 8013E730 4002C224 */  addiu      $v0, $a2, 0x240
    /* 4B3C 8013E734 21108200 */  addu       $v0, $a0, $v0
    /* 4B40 8013E738 2110A200 */  addu       $v0, $a1, $v0
    /* 4B44 8013E73C A002C624 */  addiu      $a2, $a2, 0x2A0
    /* 4B48 8013E740 21208600 */  addu       $a0, $a0, $a2
    /* 4B4C 8013E744 2128A400 */  addu       $a1, $a1, $a0
    /* 4B50 8013E748 000047A4 */  sh         $a3, 0x0($v0)
    /* 4B54 8013E74C 02000224 */  addiu      $v0, $zero, 0x2
    /* 4B58 8013E750 0000A2A4 */  sh         $v0, 0x0($a1)
  .L8013E754:
    /* 4B5C 8013E754 29000B15 */  bne        $t0, $t3, .L8013E7FC
    /* 4B60 8013E758 01000524 */   addiu     $a1, $zero, 0x1
    /* 4B64 8013E75C 0B004A25 */  addiu      $t2, $t2, 0xB
    /* 4B68 8013E760 0E80053C */  lui        $a1, %hi(dungeon + 0xC0)
    /* 4B6C 8013E764 8441A524 */  addiu      $a1, $a1, %lo(dungeon + 0xC0)
    /* 4B70 8013E768 40200900 */  sll        $a0, $t1, 1
    /* 4B74 8013E76C 21208900 */  addu       $a0, $a0, $t1
    /* 4B78 8013E770 40210400 */  sll        $a0, $a0, 5
    /* 4B7C 8013E774 21108500 */  addu       $v0, $a0, $a1
    /* 4B80 8013E778 40300A00 */  sll        $a2, $t2, 1
    /* 4B84 8013E77C 2110C200 */  addu       $v0, $a2, $v0
    /* 4B88 8013E780 0A000324 */  addiu      $v1, $zero, 0xA
    /* 4B8C 8013E784 000043A4 */  sh         $v1, 0x0($v0)
    /* 4B90 8013E788 6000A224 */  addiu      $v0, $a1, 0x60
    /* 4B94 8013E78C 21108200 */  addu       $v0, $a0, $v0
    /* 4B98 8013E790 2110C200 */  addu       $v0, $a2, $v0
    /* 4B9C 8013E794 0C000724 */  addiu      $a3, $zero, 0xC
    /* 4BA0 8013E798 000047A4 */  sh         $a3, 0x0($v0)
    /* 4BA4 8013E79C C000A224 */  addiu      $v0, $a1, 0xC0
    /* 4BA8 8013E7A0 21108200 */  addu       $v0, $a0, $v0
    /* 4BAC 8013E7A4 2110C200 */  addu       $v0, $a2, $v0
    /* 4BB0 8013E7A8 08000324 */  addiu      $v1, $zero, 0x8
    /* 4BB4 8013E7AC 000043A4 */  sh         $v1, 0x0($v0)
    /* 4BB8 8013E7B0 E001A224 */  addiu      $v0, $a1, 0x1E0
    /* 4BBC 8013E7B4 21108200 */  addu       $v0, $a0, $v0
    /* 4BC0 8013E7B8 2110C200 */  addu       $v0, $a2, $v0
    /* 4BC4 8013E7BC 05000324 */  addiu      $v1, $zero, 0x5
    /* 4BC8 8013E7C0 000043A4 */  sh         $v1, 0x0($v0)
    /* 4BCC 8013E7C4 4002A224 */  addiu      $v0, $a1, 0x240
    /* 4BD0 8013E7C8 21108200 */  addu       $v0, $a0, $v0
    /* 4BD4 8013E7CC 2110C200 */  addu       $v0, $a2, $v0
    /* 4BD8 8013E7D0 A002A524 */  addiu      $a1, $a1, 0x2A0
    /* 4BDC 8013E7D4 21208500 */  addu       $a0, $a0, $a1
    /* 4BE0 8013E7D8 2130C400 */  addu       $a2, $a2, $a0
    /* 4BE4 8013E7DC 000047A4 */  sh         $a3, 0x0($v0)
    /* 4BE8 8013E7E0 0000C394 */  lhu        $v1, 0x0($a2)
    /* 4BEC 8013E7E4 04000224 */  addiu      $v0, $zero, 0x4
    /* 4BF0 8013E7E8 02006210 */  beq        $v1, $v0, .L8013E7F4
    /* 4BF4 8013E7EC 15000224 */   addiu     $v0, $zero, 0x15
    /* 4BF8 8013E7F0 0000C2A4 */  sh         $v0, 0x0($a2)
  .L8013E7F4:
    /* 4BFC 8013E7F4 F5FF4A25 */  addiu      $t2, $t2, -0xB
    /* 4C00 8013E7F8 01000524 */  addiu      $a1, $zero, 0x1
  .L8013E7FC:
    /* 4C04 8013E7FC 12008515 */  bne        $t4, $a1, .L8013E848
    /* 4C08 8013E800 40100900 */   sll       $v0, $t1, 1
    /* 4C0C 8013E804 0E80033C */  lui        $v1, %hi(dungeon)
    /* 4C10 8013E808 C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 4C14 8013E80C 21104900 */  addu       $v0, $v0, $t1
    /* 4C18 8013E810 40110200 */  sll        $v0, $v0, 5
    /* 4C1C 8013E814 21104300 */  addu       $v0, $v0, $v1
    /* 4C20 8013E818 40180A00 */  sll        $v1, $t2, 1
    /* 4C24 8013E81C 21186200 */  addu       $v1, $v1, $v0
    /* 4C28 8013E820 0B000424 */  addiu      $a0, $zero, 0xB
    /* 4C2C 8013E824 03000224 */  addiu      $v0, $zero, 0x3
    /* 4C30 8013E828 080062A4 */  sh         $v0, 0x8($v1)
    /* 4C34 8013E82C 08000224 */  addiu      $v0, $zero, 0x8
    /* 4C38 8013E830 0E0062A4 */  sh         $v0, 0xE($v1)
    /* 4C3C 8013E834 01000224 */  addiu      $v0, $zero, 0x1
    /* 4C40 8013E838 040064A4 */  sh         $a0, 0x4($v1)
    /* 4C44 8013E83C 060064A4 */  sh         $a0, 0x6($v1)
    /* 4C48 8013E840 100064A4 */  sh         $a0, 0x10($v1)
    /* 4C4C 8013E844 120062A4 */  sh         $v0, 0x12($v1)
  .L8013E848:
    /* 4C50 8013E848 1A00A515 */  bne        $t5, $a1, .L8013E8B4
    /* 4C54 8013E84C 01000624 */   addiu     $a2, $zero, 0x1
    /* 4C58 8013E850 0B002925 */  addiu      $t1, $t1, 0xB
    /* 4C5C 8013E854 0E80033C */  lui        $v1, %hi(dungeon)
    /* 4C60 8013E858 C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 4C64 8013E85C 40100900 */  sll        $v0, $t1, 1
    /* 4C68 8013E860 21104900 */  addu       $v0, $v0, $t1
    /* 4C6C 8013E864 40110200 */  sll        $v0, $v0, 5
    /* 4C70 8013E868 21104300 */  addu       $v0, $v0, $v1
    /* 4C74 8013E86C 40180A00 */  sll        $v1, $t2, 1
    /* 4C78 8013E870 21206200 */  addu       $a0, $v1, $v0
    /* 4C7C 8013E874 0B000324 */  addiu      $v1, $zero, 0xB
    /* 4C80 8013E878 060083A4 */  sh         $v1, 0x6($a0)
    /* 4C84 8013E87C 100083A4 */  sh         $v1, 0x10($a0)
    /* 4C88 8013E880 12008394 */  lhu        $v1, 0x12($a0)
    /* 4C8C 8013E884 0E000224 */  addiu      $v0, $zero, 0xE
    /* 4C90 8013E888 040082A4 */  sh         $v0, 0x4($a0)
    /* 4C94 8013E88C 09000224 */  addiu      $v0, $zero, 0x9
    /* 4C98 8013E890 080082A4 */  sh         $v0, 0x8($a0)
    /* 4C9C 8013E894 05000224 */  addiu      $v0, $zero, 0x5
    /* 4CA0 8013E898 0E0082A4 */  sh         $v0, 0xE($a0)
    /* 4CA4 8013E89C 04000224 */  addiu      $v0, $zero, 0x4
    /* 4CA8 8013E8A0 02006210 */  beq        $v1, $v0, .L8013E8AC
    /* 4CAC 8013E8A4 15000224 */   addiu     $v0, $zero, 0x15
    /* 4CB0 8013E8A8 120082A4 */  sh         $v0, 0x12($a0)
  .L8013E8AC:
    /* 4CB4 8013E8AC F5FF2925 */  addiu      $t1, $t1, -0xB
    /* 4CB8 8013E8B0 01000624 */  addiu      $a2, $zero, 0x1
  .L8013E8B4:
    /* 4CBC 8013E8B4 0E800C3C */  lui        $t4, %hi(dungeon)
    /* 4CC0 8013E8B8 C4408C25 */  addiu      $t4, $t4, %lo(dungeon)
    /* 4CC4 8013E8BC 0D000B24 */  addiu      $t3, $zero, 0xD
    /* 4CC8 8013E8C0 01000524 */  addiu      $a1, $zero, 0x1
  .L8013E8C4:
    /* 4CCC 8013E8C4 21184601 */  addu       $v1, $t2, $a2
    /* 4CD0 8013E8C8 40400300 */  sll        $t0, $v1, 1
    /* 4CD4 8013E8CC 80100300 */  sll        $v0, $v1, 2
    /* 4CD8 8013E8D0 21104300 */  addu       $v0, $v0, $v1
    /* 4CDC 8013E8D4 C0380200 */  sll        $a3, $v0, 3
  .L8013E8D8:
    /* 4CE0 8013E8D8 21182501 */  addu       $v1, $t1, $a1
    /* 4CE4 8013E8DC 40100300 */  sll        $v0, $v1, 1
    /* 4CE8 8013E8E0 21104300 */  addu       $v0, $v0, $v1
    /* 4CEC 8013E8E4 40110200 */  sll        $v0, $v0, 5
    /* 4CF0 8013E8E8 21104C00 */  addu       $v0, $v0, $t4
    /* 4CF4 8013E8EC 21100201 */  addu       $v0, $t0, $v0
    /* 4CF8 8013E8F0 1280043C */  lui        $a0, %hi(mydflags)
    /* 4CFC 8013E8F4 D8C0848C */  lw         $a0, %lo(mydflags)($a0)
    /* 4D00 8013E8F8 2118E300 */  addu       $v1, $a3, $v1
    /* 4D04 8013E8FC 00004BA4 */  sh         $t3, 0x0($v0)
    /* 4D08 8013E900 21208300 */  addu       $a0, $a0, $v1
    /* 4D0C 8013E904 00008290 */  lbu        $v0, 0x0($a0)
    /* 4D10 8013E908 0100A524 */  addiu      $a1, $a1, 0x1
    /* 4D14 8013E90C 40004234 */  ori        $v0, $v0, 0x40
    /* 4D18 8013E910 000082A0 */  sb         $v0, 0x0($a0)
    /* 4D1C 8013E914 0B00A228 */  slti       $v0, $a1, 0xB
    /* 4D20 8013E918 EFFF4014 */  bnez       $v0, .L8013E8D8
    /* 4D24 8013E91C 00000000 */   nop
    /* 4D28 8013E920 0100C624 */  addiu      $a2, $a2, 0x1
    /* 4D2C 8013E924 0B00C228 */  slti       $v0, $a2, 0xB
    /* 4D30 8013E928 E6FF4014 */  bnez       $v0, .L8013E8C4
    /* 4D34 8013E92C 01000524 */   addiu     $a1, $zero, 0x1
    /* 4D38 8013E930 0E80063C */  lui        $a2, %hi(dungeon + 0x180)
    /* 4D3C 8013E934 4442C624 */  addiu      $a2, $a2, %lo(dungeon + 0x180)
    /* 4D40 8013E938 40100900 */  sll        $v0, $t1, 1
    /* 4D44 8013E93C 21104900 */  addu       $v0, $v0, $t1
    /* 4D48 8013E940 40110200 */  sll        $v0, $v0, 5
    /* 4D4C 8013E944 21284600 */  addu       $a1, $v0, $a2
    /* 4D50 8013E948 40200A00 */  sll        $a0, $t2, 1
    /* 4D54 8013E94C 21288500 */  addu       $a1, $a0, $a1
    /* 4D58 8013E950 0F000324 */  addiu      $v1, $zero, 0xF
    /* 4D5C 8013E954 2001C624 */  addiu      $a2, $a2, 0x120
    /* 4D60 8013E958 21104600 */  addu       $v0, $v0, $a2
    /* 4D64 8013E95C 21208200 */  addu       $a0, $a0, $v0
    /* 4D68 8013E960 0800A3A4 */  sh         $v1, 0x8($a1)
    /* 4D6C 8013E964 080083A4 */  sh         $v1, 0x8($a0)
    /* 4D70 8013E968 0E00A3A4 */  sh         $v1, 0xE($a1)
    /* 4D74 8013E96C 0800E003 */  jr         $ra
    /* 4D78 8013E970 0E0083A4 */   sh        $v1, 0xE($a0)
endlabel DRLG_L5GChamber__Fiiiiii
