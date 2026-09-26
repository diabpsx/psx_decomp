.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawInvCursor__Fv, 0x5CC

glabel DrawInvCursor__Fv
    /* 1EA3C 80158634 1280033C */  lui        $v1, %hi(myplr)
    /* 1EA40 80158638 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 1EA44 8015863C B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 1EA48 80158640 4C00BFAF */  sw         $ra, 0x4C($sp)
    /* 1EA4C 80158644 4800B2AF */  sw         $s2, 0x48($sp)
    /* 1EA50 80158648 4400B1AF */  sw         $s1, 0x44($sp)
    /* 1EA54 8015864C 4000B0AF */  sw         $s0, 0x40($sp)
    /* 1EA58 80158650 80100300 */  sll        $v0, $v1, 2
    /* 1EA5C 80158654 1280013C */  lui        $at, %hi(_pcurs)
    /* 1EA60 80158658 21082200 */  addu       $at, $at, $v0
    /* 1EA64 8015865C 30B7228C */  lw         $v0, %lo(_pcurs)($at)
    /* 1EA68 80158660 01001024 */  addiu      $s0, $zero, 0x1
    /* 1EA6C 80158664 CC1B90AF */  sw         $s0, %gp_rel(ItemH)($gp)
    /* 1EA70 80158668 C81B90AF */  sw         $s0, %gp_rel(ItemW)($gp)
    /* 1EA74 8015866C 0C004228 */  slti       $v0, $v0, 0xC
    /* 1EA78 80158670 AD004014 */  bnez       $v0, .L80158928
    /* 1EA7C 80158674 40100300 */   sll       $v0, $v1, 1
    /* 1EA80 80158678 21104300 */  addu       $v0, $v0, $v1
    /* 1EA84 8015867C 80100200 */  sll        $v0, $v0, 2
    /* 1EA88 80158680 21104300 */  addu       $v0, $v0, $v1
    /* 1EA8C 80158684 00110200 */  sll        $v0, $v0, 4
    /* 1EA90 80158688 23104300 */  subu       $v0, $v0, $v1
    /* 1EA94 8015868C 80100200 */  sll        $v0, $v0, 2
    /* 1EA98 80158690 21104300 */  addu       $v0, $v0, $v1
    /* 1EA9C 80158694 C0200200 */  sll        $a0, $v0, 3
    /* 1EAA0 80158698 0E80013C */  lui        $at, %hi(plr + 0x193C)
    /* 1EAA4 8015869C 21082400 */  addu       $at, $at, $a0
    /* 1EAA8 801586A0 74BE2384 */  lh         $v1, %lo(plr + 0x193C)($at)
    /* 1EAAC 801586A4 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 1EAB0 801586A8 2A016210 */  beq        $v1, $v0, .L80158B54
    /* 1EAB4 801586AC 0B000224 */   addiu     $v0, $zero, 0xB
    /* 1EAB8 801586B0 10006214 */  bne        $v1, $v0, .L801586F4
    /* 1EABC 801586B4 00000000 */   nop
    /* 1EAC0 801586B8 0E80013C */  lui        $at, %hi(plr + 0x1924)
    /* 1EAC4 801586BC 21082400 */  addu       $at, $at, $a0
    /* 1EAC8 801586C0 5CBE238C */  lw         $v1, %lo(plr + 0x1924)($at)
    /* 1EACC 801586C4 00000000 */  nop
    /* 1EAD0 801586C8 C4096228 */  slti       $v0, $v1, 0x9C4
    /* 1EAD4 801586CC 03004014 */  bnez       $v0, .L801586DC
    /* 1EAD8 801586D0 E9036228 */   slti      $v0, $v1, 0x3E9
    /* 1EADC 801586D4 BA610508 */  j          .L801586E8
    /* 1EAE0 801586D8 06000224 */   addiu     $v0, $zero, 0x6
  .L801586DC:
    /* 1EAE4 801586DC 02004014 */  bnez       $v0, .L801586E8
    /* 1EAE8 801586E0 04000224 */   addiu     $v0, $zero, 0x4
    /* 1EAEC 801586E4 05000224 */  addiu      $v0, $zero, 0x5
  .L801586E8:
    /* 1EAF0 801586E8 0E80013C */  lui        $at, %hi(plr + 0x195C)
    /* 1EAF4 801586EC 21082400 */  addu       $at, $at, $a0
    /* 1EAF8 801586F0 94BE22A0 */  sb         $v0, %lo(plr + 0x195C)($at)
  .L801586F4:
    /* 1EAFC 801586F4 1280033C */  lui        $v1, %hi(myplr)
    /* 1EB00 801586F8 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 1EB04 801586FC 00000000 */  nop
    /* 1EB08 80158700 40100300 */  sll        $v0, $v1, 1
    /* 1EB0C 80158704 21104300 */  addu       $v0, $v0, $v1
    /* 1EB10 80158708 80100200 */  sll        $v0, $v0, 2
    /* 1EB14 8015870C 21104300 */  addu       $v0, $v0, $v1
    /* 1EB18 80158710 00110200 */  sll        $v0, $v0, 4
    /* 1EB1C 80158714 23104300 */  subu       $v0, $v0, $v1
    /* 1EB20 80158718 80100200 */  sll        $v0, $v0, 2
    /* 1EB24 8015871C 21104300 */  addu       $v0, $v0, $v1
    /* 1EB28 80158720 C0100200 */  sll        $v0, $v0, 3
    /* 1EB2C 80158724 B41B838F */  lw         $v1, %gp_rel(InvCursPos)($gp)
    /* 1EB30 80158728 0E80013C */  lui        $at, %hi(plr + 0x195C)
    /* 1EB34 8015872C 21082200 */  addu       $at, $at, $v0
    /* 1EB38 80158730 94BE2490 */  lbu        $a0, %lo(plr + 0x195C)($at)
    /* 1EB3C 80158734 C0180300 */  sll        $v1, $v1, 3
    /* 1EB40 80158738 D01B84AF */  sw         $a0, %gp_rel(ItemNo)($gp)
    /* 1EB44 8015873C 1180013C */  lui        $at, %hi(InvItemWidth + 0xC)
    /* 1EB48 80158740 21082400 */  addu       $at, $at, $a0
    /* 1EB4C 80158744 24D52290 */  lbu        $v0, %lo(InvItemWidth + 0xC)($at)
    /* 1EB50 80158748 1180013C */  lui        $at, %hi(InvRect)
    /* 1EB54 8015874C 21082300 */  addu       $at, $at, $v1
    /* 1EB58 80158750 30D0318C */  lw         $s1, %lo(InvRect)($at)
    /* 1EB5C 80158754 1180013C */  lui        $at, %hi(InvRect + 0x4)
    /* 1EB60 80158758 21082300 */  addu       $at, $at, $v1
    /* 1EB64 8015875C 34D0308C */  lw         $s0, %lo(InvRect + 0x4)($at)
    /* 1EB68 80158760 02110200 */  srl        $v0, $v0, 4
    /* 1EB6C 80158764 C81B82AF */  sw         $v0, %gp_rel(ItemW)($gp)
    /* 1EB70 80158768 1180013C */  lui        $at, %hi(InvItemHeight + 0xC)
    /* 1EB74 8015876C 21082400 */  addu       $at, $at, $a0
    /* 1EB78 80158770 D8D52290 */  lbu        $v0, %lo(InvItemHeight + 0xC)($at)
    /* 1EB7C 80158774 32008428 */  slti       $a0, $a0, 0x32
    /* 1EB80 80158778 02110200 */  srl        $v0, $v0, 4
    /* 1EB84 8015877C CC1B82AF */  sw         $v0, %gp_rel(ItemH)($gp)
    /* 1EB88 80158780 04008010 */  beqz       $a0, .L80158794
    /* 1EB8C 80158784 00000000 */   nop
    /* 1EB90 80158788 881B928F */  lw         $s2, %gp_rel(InvPanelTData)($gp)
    /* 1EB94 8015878C E6610508 */  j          .L80158798
    /* 1EB98 80158790 00000000 */   nop
  .L80158794:
    /* 1EB9C 80158794 8C1B928F */  lw         $s2, %gp_rel(InvGfxTData)($gp)
  .L80158798:
    /* 1EBA0 80158798 B41B838F */  lw         $v1, %gp_rel(InvCursPos)($gp)
    /* 1EBA4 8015879C 07000224 */  addiu      $v0, $zero, 0x7
    /* 1EBA8 801587A0 05006210 */  beq        $v1, $v0, .L801587B8
    /* 1EBAC 801587A4 13000224 */   addiu     $v0, $zero, 0x13
    /* 1EBB0 801587A8 03006210 */  beq        $v1, $v0, .L801587B8
    /* 1EBB4 801587AC 0D000224 */   addiu     $v0, $zero, 0xD
    /* 1EBB8 801587B0 0E006214 */  bne        $v1, $v0, .L801587EC
    /* 1EBBC 801587B4 21204002 */   addu      $a0, $s2, $zero
  .L801587B8:
    /* 1EBC0 801587B8 C81B828F */  lw         $v0, %gp_rel(ItemW)($gp)
    /* 1EBC4 801587BC 01000424 */  addiu      $a0, $zero, 0x1
    /* 1EBC8 801587C0 02004414 */  bne        $v0, $a0, .L801587CC
    /* 1EBCC 801587C4 00000000 */   nop
    /* 1EBD0 801587C8 08003126 */  addiu      $s1, $s1, 0x8
  .L801587CC:
    /* 1EBD4 801587CC CC1B838F */  lw         $v1, %gp_rel(ItemH)($gp)
    /* 1EBD8 801587D0 00000000 */  nop
    /* 1EBDC 801587D4 02006414 */  bne        $v1, $a0, .L801587E0
    /* 1EBE0 801587D8 02000224 */   addiu     $v0, $zero, 0x2
    /* 1EBE4 801587DC 10001026 */  addiu      $s0, $s0, 0x10
  .L801587E0:
    /* 1EBE8 801587E0 02006214 */  bne        $v1, $v0, .L801587EC
    /* 1EBEC 801587E4 21204002 */   addu      $a0, $s2, $zero
    /* 1EBF0 801587E8 08001026 */  addiu      $s0, $s0, 0x8
  .L801587EC:
    /* 1EBF4 801587EC 841B828F */  lw         $v0, %gp_rel(D_8011C304)($gp)
    /* 1EBF8 801587F0 D01B838F */  lw         $v1, %gp_rel(ItemNo)($gp)
    /* 1EBFC 801587F4 B01B878F */  lw         $a3, %gp_rel(InvBackY)($gp)
    /* 1EC00 801587F8 7A002626 */  addiu      $a2, $s1, 0x7A
    /* 1EC04 801587FC 1000A0AF */  sw         $zero, 0x10($sp)
    /* 1EC08 80158800 1800A0AF */  sw         $zero, 0x18($sp)
    /* 1EC0C 80158804 01004224 */  addiu      $v0, $v0, 0x1
    /* 1EC10 80158808 80180300 */  sll        $v1, $v1, 2
    /* 1EC14 8015880C 23380702 */  subu       $a3, $s0, $a3
    /* 1EC18 80158810 1400A2AF */  sw         $v0, 0x14($sp)
    /* 1EC1C 80158814 1180013C */  lui        $at, %hi(InvGfxTable)
    /* 1EC20 80158818 21082300 */  addu       $at, $at, $v1
    /* 1EC24 8015881C 78D2258C */  lw         $a1, %lo(InvGfxTable)($at)
    /* 1EC28 80158820 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 1EC2C 80158824 1A00E724 */   addiu     $a3, $a3, 0x1A
    /* 1EC30 80158828 21204000 */  addu       $a0, $v0, $zero
    /* 1EC34 8015882C 07008290 */  lbu        $v0, 0x7($a0)
    /* 1EC38 80158830 00000000 */  nop
    /* 1EC3C 80158834 FC004230 */  andi       $v0, $v0, 0xFC
    /* 1EC40 80158838 070082A0 */  sb         $v0, 0x7($a0)
    /* 1EC44 8015883C 1280033C */  lui        $v1, %hi(myplr)
    /* 1EC48 80158840 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 1EC4C 80158844 00000000 */  nop
    /* 1EC50 80158848 40100300 */  sll        $v0, $v1, 1
    /* 1EC54 8015884C 21104300 */  addu       $v0, $v0, $v1
    /* 1EC58 80158850 80100200 */  sll        $v0, $v0, 2
    /* 1EC5C 80158854 21104300 */  addu       $v0, $v0, $v1
    /* 1EC60 80158858 00110200 */  sll        $v0, $v0, 4
    /* 1EC64 8015885C 23104300 */  subu       $v0, $v0, $v1
    /* 1EC68 80158860 80100200 */  sll        $v0, $v0, 2
    /* 1EC6C 80158864 21104300 */  addu       $v0, $v0, $v1
    /* 1EC70 80158868 C0100200 */  sll        $v0, $v0, 3
    /* 1EC74 8015886C 0E80013C */  lui        $at, %hi(plr + 0x1976)
    /* 1EC78 80158870 21082200 */  addu       $at, $at, $v0
    /* 1EC7C 80158874 AEBE2280 */  lb         $v0, %lo(plr + 0x1976)($at)
    /* 1EC80 80158878 00000000 */  nop
    /* 1EC84 8015887C 05004010 */  beqz       $v0, .L80158894
    /* 1EC88 80158880 80000224 */   addiu     $v0, $zero, 0x80
    /* 1EC8C 80158884 040082A0 */  sb         $v0, 0x4($a0)
    /* 1EC90 80158888 050082A0 */  sb         $v0, 0x5($a0)
    /* 1EC94 8015888C 28620508 */  j          .L801588A0
    /* 1EC98 80158890 060082A0 */   sb        $v0, 0x6($a0)
  .L80158894:
    /* 1EC9C 80158894 040082A0 */  sb         $v0, 0x4($a0)
    /* 1ECA0 80158898 050080A0 */  sb         $zero, 0x5($a0)
    /* 1ECA4 8015889C 060080A0 */  sb         $zero, 0x6($a0)
  .L801588A0:
    /* 1ECA8 801588A0 21204002 */  addu       $a0, $s2, $zero
    /* 1ECAC 801588A4 841B828F */  lw         $v0, %gp_rel(D_8011C304)($gp)
    /* 1ECB0 801588A8 D01B838F */  lw         $v1, %gp_rel(ItemNo)($gp)
    /* 1ECB4 801588AC B01B878F */  lw         $a3, %gp_rel(InvBackY)($gp)
    /* 1ECB8 801588B0 82002626 */  addiu      $a2, $s1, 0x82
    /* 1ECBC 801588B4 1000A0AF */  sw         $zero, 0x10($sp)
    /* 1ECC0 801588B8 1800A0AF */  sw         $zero, 0x18($sp)
    /* 1ECC4 801588BC 01004224 */  addiu      $v0, $v0, 0x1
    /* 1ECC8 801588C0 80180300 */  sll        $v1, $v1, 2
    /* 1ECCC 801588C4 23380702 */  subu       $a3, $s0, $a3
    /* 1ECD0 801588C8 1400A2AF */  sw         $v0, 0x14($sp)
    /* 1ECD4 801588CC 1180013C */  lui        $at, %hi(InvGfxTable)
    /* 1ECD8 801588D0 21082300 */  addu       $at, $at, $v1
    /* 1ECDC 801588D4 78D2258C */  lw         $a1, %lo(InvGfxTable)($at)
    /* 1ECE0 801588D8 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 1ECE4 801588DC 2200E724 */   addiu     $a3, $a3, 0x22
    /* 1ECE8 801588E0 21204000 */  addu       $a0, $v0, $zero
    /* 1ECEC 801588E4 07008390 */  lbu        $v1, 0x7($a0)
    /* 1ECF0 801588E8 10000224 */  addiu      $v0, $zero, 0x10
    /* 1ECF4 801588EC 040082A0 */  sb         $v0, 0x4($a0)
    /* 1ECF8 801588F0 050082A0 */  sb         $v0, 0x5($a0)
    /* 1ECFC 801588F4 060082A0 */  sb         $v0, 0x6($a0)
    /* 1ED00 801588F8 02006334 */  ori        $v1, $v1, 0x2
    /* 1ED04 801588FC FE006330 */  andi       $v1, $v1, 0xFE
    /* 1ED08 80158900 070083A0 */  sb         $v1, 0x7($a0)
    /* 1ED0C 80158904 B41B838F */  lw         $v1, %gp_rel(InvCursPos)($gp)
    /* 1ED10 80158908 1180023C */  lui        $v0, %hi(InvSlotTable)
    /* 1ED14 8015890C 80D64224 */  addiu      $v0, $v0, %lo(InvSlotTable)
    /* 1ED18 80158910 21186200 */  addu       $v1, $v1, $v0
    /* 1ED1C 80158914 00006290 */  lbu        $v0, 0x0($v1)
    /* 1ED20 80158918 00000000 */  nop
    /* 1ED24 8015891C 02004234 */  ori        $v0, $v0, 0x2
    /* 1ED28 80158920 D5620508 */  j          .L80158B54
    /* 1ED2C 80158924 000062A0 */   sb        $v0, 0x0($v1)
  .L80158928:
    /* 1ED30 80158928 21104300 */  addu       $v0, $v0, $v1
    /* 1ED34 8015892C 80100200 */  sll        $v0, $v0, 2
    /* 1ED38 80158930 21104300 */  addu       $v0, $v0, $v1
    /* 1ED3C 80158934 00110200 */  sll        $v0, $v0, 4
    /* 1ED40 80158938 23104300 */  subu       $v0, $v0, $v1
    /* 1ED44 8015893C 80100200 */  sll        $v0, $v0, 2
    /* 1ED48 80158940 21104300 */  addu       $v0, $v0, $v1
    /* 1ED4C 80158944 B41B838F */  lw         $v1, %gp_rel(InvCursPos)($gp)
    /* 1ED50 80158948 C0100200 */  sll        $v0, $v0, 3
    /* 1ED54 8015894C 21104300 */  addu       $v0, $v0, $v1
    /* 1ED58 80158950 0E80013C */  lui        $at, %hi(plr + 0x156F)
    /* 1ED5C 80158954 21082200 */  addu       $at, $at, $v0
    /* 1ED60 80158958 A7BA2280 */  lb         $v0, %lo(plr + 0x156F)($at)
    /* 1ED64 8015895C 00000000 */  nop
    /* 1ED68 80158960 06004010 */  beqz       $v0, .L8015897C
    /* 1ED6C 80158964 00000000 */   nop
    /* 1ED70 80158968 D784050C */  jal        InvSetItemCurs__Fv
    /* 1ED74 8015896C 00000000 */   nop
    /* 1ED78 80158970 B41B848F */  lw         $a0, %gp_rel(InvCursPos)($gp)
    /* 1ED7C 80158974 2C84050C */  jal        InvGetItemWH__Fi
    /* 1ED80 80158978 E7FF8424 */   addiu     $a0, $a0, -0x19
  .L8015897C:
    /* 1ED84 8015897C B41B828F */  lw         $v0, %gp_rel(InvCursPos)($gp)
    /* 1ED88 80158980 00000000 */  nop
    /* 1ED8C 80158984 41004228 */  slti       $v0, $v0, 0x41
    /* 1ED90 80158988 03004014 */  bnez       $v0, .L80158998
    /* 1ED94 8015898C 00000000 */   nop
    /* 1ED98 80158990 CC1B90AF */  sw         $s0, %gp_rel(ItemH)($gp)
    /* 1ED9C 80158994 C81B90AF */  sw         $s0, %gp_rel(ItemW)($gp)
  .L80158998:
    /* 1EDA0 80158998 CC1B828F */  lw         $v0, %gp_rel(ItemH)($gp)
    /* 1EDA4 8015899C 00000000 */  nop
    /* 1EDA8 801589A0 1A004018 */  blez       $v0, .L80158A0C
    /* 1EDAC 801589A4 21280000 */   addu      $a1, $zero, $zero
    /* 1EDB0 801589A8 1180083C */  lui        $t0, %hi(InvSlotTable)
    /* 1EDB4 801589AC 80D60825 */  addiu      $t0, $t0, %lo(InvSlotTable)
    /* 1EDB8 801589B0 02000724 */  addiu      $a3, $zero, 0x2
    /* 1EDBC 801589B4 21300000 */  addu       $a2, $zero, $zero
  .L801589B8:
    /* 1EDC0 801589B8 C81B828F */  lw         $v0, %gp_rel(ItemW)($gp)
    /* 1EDC4 801589BC 00000000 */  nop
    /* 1EDC8 801589C0 0D004018 */  blez       $v0, .L801589F8
    /* 1EDCC 801589C4 21200000 */   addu      $a0, $zero, $zero
    /* 1EDD0 801589C8 2118C000 */  addu       $v1, $a2, $zero
  .L801589CC:
    /* 1EDD4 801589CC B41B828F */  lw         $v0, %gp_rel(InvCursPos)($gp)
    /* 1EDD8 801589D0 00000000 */  nop
    /* 1EDDC 801589D4 21104400 */  addu       $v0, $v0, $a0
    /* 1EDE0 801589D8 21106200 */  addu       $v0, $v1, $v0
    /* 1EDE4 801589DC 21104800 */  addu       $v0, $v0, $t0
    /* 1EDE8 801589E0 000047A0 */  sb         $a3, 0x0($v0)
    /* 1EDEC 801589E4 C81B828F */  lw         $v0, %gp_rel(ItemW)($gp)
    /* 1EDF0 801589E8 01008424 */  addiu      $a0, $a0, 0x1
    /* 1EDF4 801589EC 2A108200 */  slt        $v0, $a0, $v0
    /* 1EDF8 801589F0 F6FF4014 */  bnez       $v0, .L801589CC
    /* 1EDFC 801589F4 00000000 */   nop
  .L801589F8:
    /* 1EE00 801589F8 CC1B828F */  lw         $v0, %gp_rel(ItemH)($gp)
    /* 1EE04 801589FC 0100A524 */  addiu      $a1, $a1, 0x1
    /* 1EE08 80158A00 2A10A200 */  slt        $v0, $a1, $v0
    /* 1EE0C 80158A04 ECFF4014 */  bnez       $v0, .L801589B8
    /* 1EE10 80158A08 0A00C624 */   addiu     $a2, $a2, 0xA
  .L80158A0C:
    /* 1EE14 80158A0C 1280023C */  lui        $v0, %hi(myplr)
    /* 1EE18 80158A10 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 1EE1C 80158A14 00000000 */  nop
    /* 1EE20 80158A18 80100200 */  sll        $v0, $v0, 2
    /* 1EE24 80158A1C 1280013C */  lui        $at, %hi(_pcurs)
    /* 1EE28 80158A20 21082200 */  addu       $at, $at, $v0
    /* 1EE2C 80158A24 30B7238C */  lw         $v1, %lo(_pcurs)($at)
    /* 1EE30 80158A28 00000000 */  nop
    /* 1EE34 80158A2C FEFF6224 */  addiu      $v0, $v1, -0x2
    /* 1EE38 80158A30 0200422C */  sltiu      $v0, $v0, 0x2
    /* 1EE3C 80158A34 03004014 */  bnez       $v0, .L80158A44
    /* 1EE40 80158A38 04000224 */   addiu     $v0, $zero, 0x4
    /* 1EE44 80158A3C 45006214 */  bne        $v1, $v0, .L80158B54
    /* 1EE48 80158A40 00000000 */   nop
  .L80158A44:
    /* 1EE4C 80158A44 B41B838F */  lw         $v1, %gp_rel(InvCursPos)($gp)
    /* 1EE50 80158A48 00000000 */  nop
    /* 1EE54 80158A4C 1400622C */  sltiu      $v0, $v1, 0x14
    /* 1EE58 80158A50 14004010 */  beqz       $v0, .L80158AA4
    /* 1EE5C 80158A54 80100300 */   sll       $v0, $v1, 2
    /* 1EE60 80158A58 1280013C */  lui        $at, %hi(jtbl_8011A428)
    /* 1EE64 80158A5C 21082200 */  addu       $at, $at, $v0
    /* 1EE68 80158A60 28A4228C */  lw         $v0, %lo(jtbl_8011A428)($at)
    /* 1EE6C 80158A64 00000000 */  nop
    /* 1EE70 80158A68 08004000 */  jr         $v0
    /* 1EE74 80158A6C 00000000 */   nop
    /* 1EE78 80158A70 9F620508 */  j          .L80158A7C
    /* 1EE7C 80158A74 02000224 */   addiu     $v0, $zero, 0x2
    /* 1EE80 80158A78 01000224 */  addiu      $v0, $zero, 0x1
  .L80158A7C:
    /* 1EE84 80158A7C C81B82AF */  sw         $v0, %gp_rel(ItemW)($gp)
    /* 1EE88 80158A80 CC1B82AF */  sw         $v0, %gp_rel(ItemH)($gp)
    /* 1EE8C 80158A84 AF620508 */  j          .L80158ABC
    /* 1EE90 80158A88 00000000 */   nop
    /* 1EE94 80158A8C 02000224 */  addiu      $v0, $zero, 0x2
    /* 1EE98 80158A90 C81B82AF */  sw         $v0, %gp_rel(ItemW)($gp)
    /* 1EE9C 80158A94 03000224 */  addiu      $v0, $zero, 0x3
    /* 1EEA0 80158A98 CC1B82AF */  sw         $v0, %gp_rel(ItemH)($gp)
    /* 1EEA4 80158A9C AF620508 */  j          .L80158ABC
    /* 1EEA8 80158AA0 00000000 */   nop
  .L80158AA4:
    /* 1EEAC 80158AA4 B41B848F */  lw         $a0, %gp_rel(InvCursPos)($gp)
    /* 1EEB0 80158AA8 01000224 */  addiu      $v0, $zero, 0x1
    /* 1EEB4 80158AAC C81B82AF */  sw         $v0, %gp_rel(ItemW)($gp)
    /* 1EEB8 80158AB0 CC1B82AF */  sw         $v0, %gp_rel(ItemH)($gp)
    /* 1EEBC 80158AB4 2C84050C */  jal        InvGetItemWH__Fi
    /* 1EEC0 80158AB8 E7FF8424 */   addiu     $a0, $a0, -0x19
  .L80158ABC:
    /* 1EEC4 80158ABC B41B828F */  lw         $v0, %gp_rel(InvCursPos)($gp)
    /* 1EEC8 80158AC0 02000524 */  addiu      $a1, $zero, 0x2
    /* 1EECC 80158AC4 C0100200 */  sll        $v0, $v0, 3
    /* 1EED0 80158AC8 1180013C */  lui        $at, %hi(InvRect)
    /* 1EED4 80158ACC 21082200 */  addu       $at, $at, $v0
    /* 1EED8 80158AD0 30D0238C */  lw         $v1, %lo(InvRect)($at)
    /* 1EEDC 80158AD4 1180013C */  lui        $at, %hi(InvRect + 0x4)
    /* 1EEE0 80158AD8 21082200 */  addu       $at, $at, $v0
    /* 1EEE4 80158ADC 34D0248C */  lw         $a0, %lo(InvRect + 0x4)($at)
    /* 1EEE8 80158AE0 C81B828F */  lw         $v0, %gp_rel(ItemW)($gp)
    /* 1EEEC 80158AE4 08007124 */  addiu      $s1, $v1, 0x8
    /* 1EEF0 80158AE8 02004514 */  bne        $v0, $a1, .L80158AF4
    /* 1EEF4 80158AEC 08009024 */   addiu     $s0, $a0, 0x8
    /* 1EEF8 80158AF0 10007124 */  addiu      $s1, $v1, 0x10
  .L80158AF4:
    /* 1EEFC 80158AF4 CC1B838F */  lw         $v1, %gp_rel(ItemH)($gp)
    /* 1EF00 80158AF8 00000000 */  nop
    /* 1EF04 80158AFC 02006514 */  bne        $v1, $a1, .L80158B08
    /* 1EF08 80158B00 03000224 */   addiu     $v0, $zero, 0x3
    /* 1EF0C 80158B04 10009024 */  addiu      $s0, $a0, 0x10
  .L80158B08:
    /* 1EF10 80158B08 02006214 */  bne        $v1, $v0, .L80158B14
    /* 1EF14 80158B0C 80002626 */   addiu     $a2, $s1, 0x80
    /* 1EF18 80158B10 10001026 */  addiu      $s0, $s0, 0x10
  .L80158B14:
    /* 1EF1C 80158B14 8C1B848F */  lw         $a0, %gp_rel(InvGfxTData)($gp)
    /* 1EF20 80158B18 1280023C */  lui        $v0, %hi(myplr)
    /* 1EF24 80158B1C 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 1EF28 80158B20 B01B878F */  lw         $a3, %gp_rel(InvBackY)($gp)
    /* 1EF2C 80158B24 80100200 */  sll        $v0, $v0, 2
    /* 1EF30 80158B28 23380702 */  subu       $a3, $s0, $a3
    /* 1EF34 80158B2C 2000E724 */  addiu      $a3, $a3, 0x20
    /* 1EF38 80158B30 1280013C */  lui        $at, %hi(_pcurs)
    /* 1EF3C 80158B34 21082200 */  addu       $at, $at, $v0
    /* 1EF40 80158B38 30B7258C */  lw         $a1, %lo(_pcurs)($at)
    /* 1EF44 80158B3C 00010224 */  addiu      $v0, $zero, 0x100
    /* 1EF48 80158B40 1000A0AF */  sw         $zero, 0x10($sp)
    /* 1EF4C 80158B44 1400A2AF */  sw         $v0, 0x14($sp)
    /* 1EF50 80158B48 1800A0AF */  sw         $zero, 0x18($sp)
    /* 1EF54 80158B4C 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 1EF58 80158B50 FEFFA524 */   addiu     $a1, $a1, -0x2
  .L80158B54:
    /* 1EF5C 80158B54 B41B828F */  lw         $v0, %gp_rel(InvCursPos)($gp)
    /* 1EF60 80158B58 00000000 */  nop
    /* 1EF64 80158B5C 19004228 */  slti       $v0, $v0, 0x19
    /* 1EF68 80158B60 20004014 */  bnez       $v0, .L80158BE4
    /* 1EF6C 80158B64 00000000 */   nop
    /* 1EF70 80158B68 CC1B828F */  lw         $v0, %gp_rel(ItemH)($gp)
    /* 1EF74 80158B6C 00000000 */  nop
    /* 1EF78 80158B70 1C004018 */  blez       $v0, .L80158BE4
    /* 1EF7C 80158B74 21280000 */   addu      $a1, $zero, $zero
    /* 1EF80 80158B78 1180083C */  lui        $t0, %hi(InvSlotTable)
    /* 1EF84 80158B7C 80D60825 */  addiu      $t0, $t0, %lo(InvSlotTable)
    /* 1EF88 80158B80 21380000 */  addu       $a3, $zero, $zero
  .L80158B84:
    /* 1EF8C 80158B84 C81B828F */  lw         $v0, %gp_rel(ItemW)($gp)
    /* 1EF90 80158B88 00000000 */  nop
    /* 1EF94 80158B8C 10004018 */  blez       $v0, .L80158BD0
    /* 1EF98 80158B90 21200000 */   addu      $a0, $zero, $zero
    /* 1EF9C 80158B94 2130E000 */  addu       $a2, $a3, $zero
  .L80158B98:
    /* 1EFA0 80158B98 B41B828F */  lw         $v0, %gp_rel(InvCursPos)($gp)
    /* 1EFA4 80158B9C 00000000 */  nop
    /* 1EFA8 80158BA0 21104400 */  addu       $v0, $v0, $a0
    /* 1EFAC 80158BA4 2110C200 */  addu       $v0, $a2, $v0
    /* 1EFB0 80158BA8 21104800 */  addu       $v0, $v0, $t0
    /* 1EFB4 80158BAC 00004390 */  lbu        $v1, 0x0($v0)
    /* 1EFB8 80158BB0 00000000 */  nop
    /* 1EFBC 80158BB4 02006334 */  ori        $v1, $v1, 0x2
    /* 1EFC0 80158BB8 000043A0 */  sb         $v1, 0x0($v0)
    /* 1EFC4 80158BBC C81B828F */  lw         $v0, %gp_rel(ItemW)($gp)
    /* 1EFC8 80158BC0 01008424 */  addiu      $a0, $a0, 0x1
    /* 1EFCC 80158BC4 2A108200 */  slt        $v0, $a0, $v0
    /* 1EFD0 80158BC8 F3FF4014 */  bnez       $v0, .L80158B98
    /* 1EFD4 80158BCC 00000000 */   nop
  .L80158BD0:
    /* 1EFD8 80158BD0 CC1B828F */  lw         $v0, %gp_rel(ItemH)($gp)
    /* 1EFDC 80158BD4 0100A524 */  addiu      $a1, $a1, 0x1
    /* 1EFE0 80158BD8 2A10A200 */  slt        $v0, $a1, $v0
    /* 1EFE4 80158BDC E9FF4014 */  bnez       $v0, .L80158B84
    /* 1EFE8 80158BE0 0A00E724 */   addiu     $a3, $a3, 0xA
  .L80158BE4:
    /* 1EFEC 80158BE4 4C00BF8F */  lw         $ra, 0x4C($sp)
    /* 1EFF0 80158BE8 4800B28F */  lw         $s2, 0x48($sp)
    /* 1EFF4 80158BEC 4400B18F */  lw         $s1, 0x44($sp)
    /* 1EFF8 80158BF0 4000B08F */  lw         $s0, 0x40($sp)
    /* 1EFFC 80158BF4 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 1F000 80158BF8 0800E003 */  jr         $ra
    /* 1F004 80158BFC 00000000 */   nop
endlabel DrawInvCursor__Fv
