.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _spu_init, 0x280

glabel _spu_init
    /* 67DC 800167DC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 67E0 800167E0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 67E4 800167E4 21808000 */  addu       $s0, $a0, $zero
    /* 67E8 800167E8 0B80043C */  lui        $a0, %hi(D_800B5A5C)
    /* 67EC 800167EC 5C5A848C */  lw         $a0, %lo(D_800B5A5C)($a0)
    /* 67F0 800167F0 1800BFAF */  sw         $ra, 0x18($sp)
    /* 67F4 800167F4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 67F8 800167F8 0000828C */  lw         $v0, 0x0($a0)
    /* 67FC 800167FC 0B00033C */  lui        $v1, (0xB0000 >> 16)
    /* 6800 80016800 25104300 */  or         $v0, $v0, $v1
    /* 6804 80016804 000082AC */  sw         $v0, 0x0($a0)
    /* 6808 80016808 0B80023C */  lui        $v0, %hi(_spu_RXX)
    /* 680C 8001680C 4C5A428C */  lw         $v0, %lo(_spu_RXX)($v0)
    /* 6810 80016810 0B80013C */  lui        $at, %hi(_spu_transMode)
    /* 6814 80016814 685A20AC */  sw         $zero, %lo(_spu_transMode)($at)
    /* 6818 80016818 0B80013C */  lui        $at, %hi(_spu_addrMode)
    /* 681C 8001681C 6C5A20AC */  sw         $zero, %lo(_spu_addrMode)($at)
    /* 6820 80016820 0B80013C */  lui        $at, %hi(_spu_tsa)
    /* 6824 80016824 645A20A4 */  sh         $zero, %lo(_spu_tsa)($at)
    /* 6828 80016828 800140A4 */  sh         $zero, 0x180($v0)
    /* 682C 8001682C 820140A4 */  sh         $zero, 0x182($v0)
    /* 6830 80016830 AD5C000C */  jal        _spu_Fw1ts
    /* 6834 80016834 AA0140A4 */   sh        $zero, 0x1AA($v0)
    /* 6838 80016838 0B80023C */  lui        $v0, %hi(_spu_RXX)
    /* 683C 8001683C 4C5A428C */  lw         $v0, %lo(_spu_RXX)($v0)
    /* 6840 80016840 00000000 */  nop
    /* 6844 80016844 800140A4 */  sh         $zero, 0x180($v0)
    /* 6848 80016848 820140A4 */  sh         $zero, 0x182($v0)
    /* 684C 8001684C AE014294 */  lhu        $v0, 0x1AE($v0)
    /* 6850 80016850 00000000 */  nop
    /* 6854 80016854 FF074230 */  andi       $v0, $v0, 0x7FF
    /* 6858 80016858 14004010 */  beqz       $v0, .L800168AC
    /* 685C 8001685C 21180000 */   addu      $v1, $zero, $zero
    /* 6860 80016860 01006324 */  addiu      $v1, $v1, 0x1
  .L80016864:
    /* 6864 80016864 010F622C */  sltiu      $v0, $v1, 0xF01
    /* 6868 80016868 08004014 */  bnez       $v0, .L8001688C
    /* 686C 8001686C 00000000 */   nop
    /* 6870 80016870 1180043C */  lui        $a0, %hi(D_8010E098)
    /* 6874 80016874 98E08424 */  addiu      $a0, $a0, %lo(D_8010E098)
    /* 6878 80016878 1180053C */  lui        $a1, %hi(D_8010E0A8)
    /* 687C 8001687C 9367000C */  jal        printf
    /* 6880 80016880 A8E0A524 */   addiu     $a1, $a1, %lo(D_8010E0A8)
    /* 6884 80016884 2C5A0008 */  j          .L800168B0
    /* 6888 80016888 21200000 */   addu      $a0, $zero, $zero
  .L8001688C:
    /* 688C 8001688C 0B80023C */  lui        $v0, %hi(_spu_RXX)
    /* 6890 80016890 4C5A428C */  lw         $v0, %lo(_spu_RXX)($v0)
    /* 6894 80016894 00000000 */  nop
    /* 6898 80016898 AE014294 */  lhu        $v0, 0x1AE($v0)
    /* 689C 8001689C 00000000 */  nop
    /* 68A0 800168A0 FF074230 */  andi       $v0, $v0, 0x7FF
    /* 68A4 800168A4 EFFF4014 */  bnez       $v0, .L80016864
    /* 68A8 800168A8 01006324 */   addiu     $v1, $v1, 0x1
  .L800168AC:
    /* 68AC 800168AC 21200000 */  addu       $a0, $zero, $zero
  .L800168B0:
    /* 68B0 800168B0 1380053C */  lui        $a1, %hi(_spu_RQ)
    /* 68B4 800168B4 0052A524 */  addiu      $a1, $a1, %lo(_spu_RQ)
    /* 68B8 800168B8 02000224 */  addiu      $v0, $zero, 0x2
    /* 68BC 800168BC 0B80013C */  lui        $at, %hi(_spu_mem_mode)
    /* 68C0 800168C0 705A22AC */  sw         $v0, %lo(_spu_mem_mode)($at)
    /* 68C4 800168C4 03000224 */  addiu      $v0, $zero, 0x3
    /* 68C8 800168C8 0B80013C */  lui        $at, %hi(_spu_mem_mode_plus)
    /* 68CC 800168CC 745A22AC */  sw         $v0, %lo(_spu_mem_mode_plus)($at)
    /* 68D0 800168D0 08000224 */  addiu      $v0, $zero, 0x8
    /* 68D4 800168D4 0B80013C */  lui        $at, %hi(_spu_mem_mode_unit)
    /* 68D8 800168D8 785A22AC */  sw         $v0, %lo(_spu_mem_mode_unit)($at)
    /* 68DC 800168DC 07000224 */  addiu      $v0, $zero, 0x7
    /* 68E0 800168E0 0B80013C */  lui        $at, %hi(_spu_mem_mode_unitM)
    /* 68E4 800168E4 7C5A22AC */  sw         $v0, %lo(_spu_mem_mode_unitM)($at)
    /* 68E8 800168E8 0B80023C */  lui        $v0, %hi(_spu_RXX)
    /* 68EC 800168EC 4C5A428C */  lw         $v0, %lo(_spu_RXX)($v0)
    /* 68F0 800168F0 04000324 */  addiu      $v1, $zero, 0x4
    /* 68F4 800168F4 AC0143A4 */  sh         $v1, 0x1AC($v0)
    /* 68F8 800168F8 FFFF0334 */  ori        $v1, $zero, 0xFFFF
    /* 68FC 800168FC 840140A4 */  sh         $zero, 0x184($v0)
    /* 6900 80016900 860140A4 */  sh         $zero, 0x186($v0)
    /* 6904 80016904 8C0143A4 */  sh         $v1, 0x18C($v0)
    /* 6908 80016908 8E0143A4 */  sh         $v1, 0x18E($v0)
    /* 690C 8001690C 980140A4 */  sh         $zero, 0x198($v0)
    /* 6910 80016910 9A0140A4 */  sh         $zero, 0x19A($v0)
  .L80016914:
    /* 6914 80016914 0000A0A4 */  sh         $zero, 0x0($a1)
    /* 6918 80016918 01008424 */  addiu      $a0, $a0, 0x1
    /* 691C 8001691C 0A008228 */  slti       $v0, $a0, 0xA
    /* 6920 80016920 FCFF4014 */  bnez       $v0, .L80016914
    /* 6924 80016924 0200A524 */   addiu     $a1, $a1, 0x2
    /* 6928 80016928 3C000016 */  bnez       $s0, .L80016A1C
    /* 692C 8001692C 21100000 */   addu      $v0, $zero, $zero
    /* 6930 80016930 0B80043C */  lui        $a0, %hi(D_800B5A8C)
    /* 6934 80016934 8C5A8424 */  addiu      $a0, $a0, %lo(D_800B5A8C)
    /* 6938 80016938 0B80023C */  lui        $v0, %hi(_spu_RXX)
    /* 693C 8001693C 4C5A428C */  lw         $v0, %lo(_spu_RXX)($v0)
    /* 6940 80016940 00020324 */  addiu      $v1, $zero, 0x200
    /* 6944 80016944 0B80013C */  lui        $at, %hi(_spu_tsa)
    /* 6948 80016948 645A23A4 */  sh         $v1, %lo(_spu_tsa)($at)
    /* 694C 8001694C 900140A4 */  sh         $zero, 0x190($v0)
    /* 6950 80016950 920140A4 */  sh         $zero, 0x192($v0)
    /* 6954 80016954 940140A4 */  sh         $zero, 0x194($v0)
    /* 6958 80016958 960140A4 */  sh         $zero, 0x196($v0)
    /* 695C 8001695C B00140A4 */  sh         $zero, 0x1B0($v0)
    /* 6960 80016960 B20140A4 */  sh         $zero, 0x1B2($v0)
    /* 6964 80016964 B40140A4 */  sh         $zero, 0x1B4($v0)
    /* 6968 80016968 B60140A4 */  sh         $zero, 0x1B6($v0)
    /* 696C 8001696C 975A000C */  jal        func_80016A5C
    /* 6970 80016970 10000524 */   addiu     $a1, $zero, 0x10
    /* 6974 80016974 21200000 */  addu       $a0, $zero, $zero
    /* 6978 80016978 FF3F0624 */  addiu      $a2, $zero, 0x3FFF
    /* 697C 8001697C 00020524 */  addiu      $a1, $zero, 0x200
    /* 6980 80016980 0B80033C */  lui        $v1, %hi(_spu_RXX)
    /* 6984 80016984 4C5A638C */  lw         $v1, %lo(_spu_RXX)($v1)
    /* 6988 80016988 00000000 */  nop
  .L8001698C:
    /* 698C 8001698C 000060A4 */  sh         $zero, 0x0($v1)
    /* 6990 80016990 020060A4 */  sh         $zero, 0x2($v1)
    /* 6994 80016994 040066A4 */  sh         $a2, 0x4($v1)
    /* 6998 80016998 060065A4 */  sh         $a1, 0x6($v1)
    /* 699C 8001699C 080060A4 */  sh         $zero, 0x8($v1)
    /* 69A0 800169A0 0A0060A4 */  sh         $zero, 0xA($v1)
    /* 69A4 800169A4 01008424 */  addiu      $a0, $a0, 0x1
    /* 69A8 800169A8 18008228 */  slti       $v0, $a0, 0x18
    /* 69AC 800169AC F7FF4014 */  bnez       $v0, .L8001698C
    /* 69B0 800169B0 10006324 */   addiu     $v1, $v1, 0x10
    /* 69B4 800169B4 FFFF1134 */  ori        $s1, $zero, 0xFFFF
    /* 69B8 800169B8 0B80023C */  lui        $v0, %hi(_spu_RXX)
    /* 69BC 800169BC 4C5A428C */  lw         $v0, %lo(_spu_RXX)($v0)
    /* 69C0 800169C0 FF001024 */  addiu      $s0, $zero, 0xFF
    /* 69C4 800169C4 880151A4 */  sh         $s1, 0x188($v0)
    /* 69C8 800169C8 AD5C000C */  jal        _spu_Fw1ts
    /* 69CC 800169CC 8A0150A4 */   sh        $s0, 0x18A($v0)
    /* 69D0 800169D0 AD5C000C */  jal        _spu_Fw1ts
    /* 69D4 800169D4 00000000 */   nop
    /* 69D8 800169D8 AD5C000C */  jal        _spu_Fw1ts
    /* 69DC 800169DC 00000000 */   nop
    /* 69E0 800169E0 AD5C000C */  jal        _spu_Fw1ts
    /* 69E4 800169E4 00000000 */   nop
    /* 69E8 800169E8 0B80023C */  lui        $v0, %hi(_spu_RXX)
    /* 69EC 800169EC 4C5A428C */  lw         $v0, %lo(_spu_RXX)($v0)
    /* 69F0 800169F0 00000000 */  nop
    /* 69F4 800169F4 8C0151A4 */  sh         $s1, 0x18C($v0)
    /* 69F8 800169F8 AD5C000C */  jal        _spu_Fw1ts
    /* 69FC 800169FC 8E0150A4 */   sh        $s0, 0x18E($v0)
    /* 6A00 80016A00 AD5C000C */  jal        _spu_Fw1ts
    /* 6A04 80016A04 00000000 */   nop
    /* 6A08 80016A08 AD5C000C */  jal        _spu_Fw1ts
    /* 6A0C 80016A0C 00000000 */   nop
    /* 6A10 80016A10 AD5C000C */  jal        _spu_Fw1ts
    /* 6A14 80016A14 00000000 */   nop
    /* 6A18 80016A18 21100000 */  addu       $v0, $zero, $zero
  .L80016A1C:
    /* 6A1C 80016A1C 0B80043C */  lui        $a0, %hi(_spu_RXX)
    /* 6A20 80016A20 4C5A848C */  lw         $a0, %lo(_spu_RXX)($a0)
    /* 6A24 80016A24 01000324 */  addiu      $v1, $zero, 0x1
    /* 6A28 80016A28 0B80013C */  lui        $at, %hi(_spu_inTransfer)
    /* 6A2C 80016A2C 805A23AC */  sw         $v1, %lo(_spu_inTransfer)($at)
    /* 6A30 80016A30 00C00334 */  ori        $v1, $zero, 0xC000
    /* 6A34 80016A34 AA0183A4 */  sh         $v1, 0x1AA($a0)
    /* 6A38 80016A38 0B80013C */  lui        $at, %hi(_spu_transferCallback)
    /* 6A3C 80016A3C 845A20AC */  sw         $zero, %lo(_spu_transferCallback)($at)
    /* 6A40 80016A40 0B80013C */  lui        $at, %hi(_spu_IRQCallback)
    /* 6A44 80016A44 885A20AC */  sw         $zero, %lo(_spu_IRQCallback)($at)
    /* 6A48 80016A48 1800BF8F */  lw         $ra, 0x18($sp)
    /* 6A4C 80016A4C 1400B18F */  lw         $s1, 0x14($sp)
    /* 6A50 80016A50 1000B08F */  lw         $s0, 0x10($sp)
    /* 6A54 80016A54 0800E003 */  jr         $ra
    /* 6A58 80016A58 2000BD27 */   addiu     $sp, $sp, 0x20
endlabel _spu_init
