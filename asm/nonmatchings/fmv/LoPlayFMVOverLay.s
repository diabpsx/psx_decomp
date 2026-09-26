.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoPlayFMVOverLay, 0x460

glabel LoPlayFMVOverLay
    /* 1E7E8 801583E0 A8FFBD27 */  addiu      $sp, $sp, -0x58
    /* 1E7EC 801583E4 3400B1AF */  sw         $s1, 0x34($sp)
    /* 1E7F0 801583E8 D81F918F */  lw         $s1, %gp_rel(D_8011C758)($gp)
    /* 1E7F4 801583EC 3800B2AF */  sw         $s2, 0x38($sp)
    /* 1E7F8 801583F0 DC1F928F */  lw         $s2, %gp_rel(D_8011C75C)($gp)
    /* 1E7FC 801583F4 4800B6AF */  sw         $s6, 0x48($sp)
    /* 1E800 801583F8 E01F968F */  lw         $s6, %gp_rel(D_8011C760)($gp)
    /* 1E804 801583FC 4C00B7AF */  sw         $s7, 0x4C($sp)
    /* 1E808 80158400 FFFF1724 */  addiu      $s7, $zero, -0x1
    /* 1E80C 80158404 5000BEAF */  sw         $fp, 0x50($sp)
    /* 1E810 80158408 FFFF1E24 */  addiu      $fp, $zero, -0x1
    /* 1E814 8015840C 4000B4AF */  sw         $s4, 0x40($sp)
    /* 1E818 80158410 FFFF1424 */  addiu      $s4, $zero, -0x1
    /* 1E81C 80158414 3C00B3AF */  sw         $s3, 0x3C($sp)
    /* 1E820 80158418 80001324 */  addiu      $s3, $zero, 0x80
    /* 1E824 8015841C 4400B5AF */  sw         $s5, 0x44($sp)
    /* 1E828 80158420 21A80000 */  addu       $s5, $zero, $zero
    /* 1E82C 80158424 5400BFAF */  sw         $ra, 0x54($sp)
    /* 1E830 80158428 3E10020C */  jal        VID_GetTick__Fv
    /* 1E834 8015842C 3000B0AF */   sw        $s0, 0x30($sp)
    /* 1E838 80158430 21800000 */  addu       $s0, $zero, $zero
    /* 1E83C 80158434 640E82AF */  sw         $v0, %gp_rel(time_in_frames)($gp)
  .L80158438:
    /* 1E840 80158438 53BE000C */  jal        systemtask
    /* 1E844 8015843C 21200000 */   addu      $a0, $zero, $zero
    /* 1E848 80158440 01001026 */  addiu      $s0, $s0, 0x1
    /* 1E84C 80158444 6400022A */  slti       $v0, $s0, 0x64
    /* 1E850 80158448 FBFF4014 */  bnez       $v0, .L80158438
    /* 1E854 8015844C 00000000 */   nop
    /* 1E858 80158450 680D80A3 */  sb         $zero, %gp_rel(D_8011B4E8)($gp)
    /* 1E85C 80158454 1480043C */  lui        $a0, %hi(D_8013B8D4)
    /* 1E860 80158458 D4B88424 */  addiu      $a0, $a0, %lo(D_8013B8D4)
    /* 1E864 8015845C 7F67000C */  jal        strcmp
    /* 1E868 80158460 21282002 */   addu      $a1, $s1, $zero
    /* 1E86C 80158464 3C004014 */  bnez       $v0, .L80158558
    /* 1E870 80158468 00000000 */   nop
    /* 1E874 8015846C D2EC010C */  jal        LANG_GetLang__Fv
    /* 1E878 80158470 00000000 */   nop
    /* 1E87C 80158474 21184000 */  addu       $v1, $v0, $zero
    /* 1E880 80158478 0600622C */  sltiu      $v0, $v1, 0x6
    /* 1E884 8015847C 3A004010 */  beqz       $v0, .L80158568
    /* 1E888 80158480 80100300 */   sll       $v0, $v1, 2
    /* 1E88C 80158484 1680013C */  lui        $at, %hi(jtbl_8015849C)
    /* 1E890 80158488 21082200 */  addu       $at, $at, $v0
    /* 1E894 8015848C 9C84228C */  lw         $v0, %lo(jtbl_8015849C)($at)
    /* 1E898 80158490 00000000 */  nop
    /* 1E89C 80158494 08004000 */  jr         $v0
    /* 1E8A0 80158498 00000000 */   nop
  jtbl_8015849C:
    /* 1E8A4 8015849C B4841580 */  lb         $s5, -0x7B4C($zero)
    /* 1E8A8 801584A0 BC841580 */  lb         $s5, -0x7B44($zero)
    /* 1E8AC 801584A4 E4841580 */  lb         $s5, -0x7B1C($zero)
    /* 1E8B0 801584A8 EC841580 */  lb         $s5, -0x7B14($zero)
    /* 1E8B4 801584AC 14851580 */  lb         $s5, -0x7AEC($zero)
    /* 1E8B8 801584B0 3C851580 */  lb         $s5, -0x7AC4($zero)
    /* 1E8BC 801584B4 30610508 */  j          .L801584C0
    /* 1E8C0 801584B8 01000224 */   addiu     $v0, $zero, 0x1
    /* 1E8C4 801584BC 02000224 */  addiu      $v0, $zero, 0x2
  .L801584C0:
    /* 1E8C8 801584C0 680D82A3 */  sb         $v0, %gp_rel(D_8011B4E8)($gp)
    /* 1E8CC 801584C4 1280043C */  lui        $a0, %hi(D_80121CE8)
    /* 1E8D0 801584C8 E81C8424 */  addiu      $a0, $a0, %lo(D_80121CE8)
    /* 1E8D4 801584CC 1480053C */  lui        $a1, %hi(D_8013B8E0)
    /* 1E8D8 801584D0 E0B8A524 */  addiu      $a1, $a1, %lo(D_8013B8E0)
    /* 1E8DC 801584D4 9767000C */  jal        sprintf
    /* 1E8E0 801584D8 00000000 */   nop
    /* 1E8E4 801584DC 5A610508 */  j          .L80158568
    /* 1E8E8 801584E0 00000000 */   nop
    /* 1E8EC 801584E4 3C610508 */  j          .L801584F0
    /* 1E8F0 801584E8 01000224 */   addiu     $v0, $zero, 0x1
    /* 1E8F4 801584EC 02000224 */  addiu      $v0, $zero, 0x2
  .L801584F0:
    /* 1E8F8 801584F0 680D82A3 */  sb         $v0, %gp_rel(D_8011B4E8)($gp)
    /* 1E8FC 801584F4 1280043C */  lui        $a0, %hi(D_80121CE8)
    /* 1E900 801584F8 E81C8424 */  addiu      $a0, $a0, %lo(D_80121CE8)
    /* 1E904 801584FC 1480053C */  lui        $a1, %hi(D_8013B8F0)
    /* 1E908 80158500 F0B8A524 */  addiu      $a1, $a1, %lo(D_8013B8F0)
    /* 1E90C 80158504 9767000C */  jal        sprintf
    /* 1E910 80158508 00000000 */   nop
    /* 1E914 8015850C 5A610508 */  j          .L80158568
    /* 1E918 80158510 00000000 */   nop
    /* 1E91C 80158514 01000224 */  addiu      $v0, $zero, 0x1
    /* 1E920 80158518 680D82A3 */  sb         $v0, %gp_rel(D_8011B4E8)($gp)
    /* 1E924 8015851C 1280043C */  lui        $a0, %hi(D_80121CE8)
    /* 1E928 80158520 E81C8424 */  addiu      $a0, $a0, %lo(D_80121CE8)
    /* 1E92C 80158524 1480053C */  lui        $a1, %hi(D_8013B900)
    /* 1E930 80158528 00B9A524 */  addiu      $a1, $a1, %lo(D_8013B900)
    /* 1E934 8015852C 9767000C */  jal        sprintf
    /* 1E938 80158530 00000000 */   nop
    /* 1E93C 80158534 5A610508 */  j          .L80158568
    /* 1E940 80158538 00000000 */   nop
    /* 1E944 8015853C 21200000 */  addu       $a0, $zero, $zero
    /* 1E948 80158540 1480053C */  lui        $a1, %hi(D_8013B8C4)
    /* 1E94C 80158544 C4B8A524 */  addiu      $a1, $a1, %lo(D_8013B8C4)
    /* 1E950 80158548 A583000C */  jal        DBG_Error
    /* 1E954 8015854C FE060624 */   addiu     $a2, $zero, 0x6FE
    /* 1E958 80158550 5A610508 */  j          .L80158568
    /* 1E95C 80158554 00000000 */   nop
  .L80158558:
    /* 1E960 80158558 1280043C */  lui        $a0, %hi(D_80121CE8)
    /* 1E964 8015855C E81C8424 */  addiu      $a0, $a0, %lo(D_80121CE8)
    /* 1E968 80158560 F240000C */  jal        strcpy
    /* 1E96C 80158564 21282002 */   addu      $a1, $s1, $zero
  .L80158568:
    /* 1E970 80158568 640D80AF */  sw         $zero, %gp_rel(user_start)($gp)
    /* 1E974 8015856C 900E80AF */  sw         $zero, %gp_rel(streampos)($gp)
    /* 1E978 80158570 CF62020C */  jal        STR_AllocBuffer__Fv
    /* 1E97C 80158574 00000000 */   nop
    /* 1E980 80158578 0100043C */  lui        $a0, (0x1D4C0 >> 16)
    /* 1E984 8015857C AA20020C */  jal        Tmalloc__Fi
    /* 1E988 80158580 C0D48434 */   ori       $a0, $a0, (0x1D4C0 & 0xFFFF)
    /* 1E98C 80158584 0200043C */  lui        $a0, (0x22600 >> 16)
    /* 1E990 80158588 000D82AF */  sw         $v0, %gp_rel(vlc_buf)($gp)
    /* 1E994 8015858C AA20020C */  jal        Tmalloc__Fi
    /* 1E998 80158590 00268434 */   ori       $a0, $a0, (0x22600 & 0xFFFF)
    /* 1E99C 80158594 040D82AF */  sw         $v0, %gp_rel(img_buf)($gp)
    /* 1E9A0 80158598 3E10020C */  jal        VID_GetTick__Fv
    /* 1E9A4 8015859C 00000000 */   nop
    /* 1E9A8 801585A0 000D848F */  lw         $a0, %gp_rel(vlc_buf)($gp)
    /* 1E9AC 801585A4 FC0C858F */  lw         $a1, %gp_rel(vlc_tab)($gp)
    /* 1E9B0 801585A8 640E82AF */  sw         $v0, %gp_rel(time_in_frames)($gp)
    /* 1E9B4 801585AC 585A050C */  jal        init_mdec
    /* 1E9B8 801585B0 00000000 */   nop
    /* 1E9BC 801585B4 A0000424 */  addiu      $a0, $zero, 0xA0
    /* 1E9C0 801585B8 78000524 */  addiu      $a1, $zero, 0x78
    /* 1E9C4 801585BC 21304002 */  addu       $a2, $s2, $zero
    /* 1E9C8 801585C0 2138C002 */  addu       $a3, $s6, $zero
    /* 1E9CC 801585C4 00010224 */  addiu      $v0, $zero, 0x100
    /* 1E9D0 801585C8 40010324 */  addiu      $v1, $zero, 0x140
    /* 1E9D4 801585CC 1400A2AF */  sw         $v0, 0x14($sp)
    /* 1E9D8 801585D0 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 1E9DC 801585D4 80000224 */  addiu      $v0, $zero, 0x80
    /* 1E9E0 801585D8 1000A0AF */  sw         $zero, 0x10($sp)
    /* 1E9E4 801585DC 1800A3AF */  sw         $v1, 0x18($sp)
    /* 1E9E8 801585E0 D35C050C */  jal        init_mdec_polys
    /* 1E9EC 801585E4 2000A2AF */   sw        $v0, 0x20($sp)
    /* 1E9F0 801585E8 040D848F */  lw         $a0, %gp_rel(img_buf)($gp)
    /* 1E9F4 801585EC C859050C */  jal        set_mdec_img_buffer
    /* 1E9F8 801585F0 00000000 */   nop
    /* 1E9FC 801585F4 E55D050C */  jal        init_mdec_audio
    /* 1EA00 801585F8 01000424 */   addiu     $a0, $zero, 0x1
    /* 1EA04 801585FC 1480043C */  lui        $a0, %hi(map_buf)
    /* 1EA08 80158600 10B98424 */  addiu      $a0, $a0, %lo(map_buf)
    /* 1EA0C 80158604 0A000524 */  addiu      $a1, $zero, 0xA
    /* 1EA10 80158608 D15D050C */  jal        init_mdec_stream
    /* 1EA14 8015860C 05000624 */   addiu     $a2, $zero, 0x5
    /* 1EA18 80158610 A660050C */  jal        StrClearVRAM
    /* 1EA1C 80158614 00000000 */   nop
    /* 1EA20 80158618 584B000C */  jal        GetVideoMode
    /* 1EA24 8015861C 00000000 */   nop
    /* 1EA28 80158620 21184000 */  addu       $v1, $v0, $zero
    /* 1EA2C 80158624 05006010 */  beqz       $v1, .L8015863C
    /* 1EA30 80158628 01000224 */   addiu     $v0, $zero, 0x1
    /* 1EA34 8015862C 07006210 */  beq        $v1, $v0, .L8015864C
    /* 1EA38 80158630 33130524 */   addiu     $a1, $zero, 0x1333
    /* 1EA3C 80158634 98610508 */  j          .L80158660
    /* 1EA40 80158638 00000000 */   nop
  .L8015863C:
    /* 1EA44 8015863C 1280043C */  lui        $a0, %hi(D_80121CE8)
    /* 1EA48 80158640 E81C8424 */  addiu      $a0, $a0, %lo(D_80121CE8)
    /* 1EA4C 80158644 95610508 */  j          .L80158654
    /* 1EA50 80158648 00100524 */   addiu     $a1, $zero, 0x1000
  .L8015864C:
    /* 1EA54 8015864C 1280043C */  lui        $a0, %hi(D_80121CE8)
    /* 1EA58 80158650 E81C8424 */  addiu      $a0, $a0, %lo(D_80121CE8)
  .L80158654:
    /* 1EA5C 80158654 2130E002 */  addu       $a2, $s7, $zero
    /* 1EA60 80158658 7460050C */  jal        play_mdec_stream
    /* 1EA64 8015865C 2138C003 */   addu      $a3, $fp, $zero
  .L80158660:
    /* 1EA68 80158660 784E000C */  jal        SetDispMask
    /* 1EA6C 80158664 01000424 */   addiu     $a0, $zero, 0x1
    /* 1EA70 80158668 3E10020C */  jal        VID_GetTick__Fv
    /* 1EA74 8015866C 00000000 */   nop
  .L80158670:
    /* 1EA78 80158670 3E10020C */  jal        VID_GetTick__Fv
    /* 1EA7C 80158674 00000000 */   nop
    /* 1EA80 80158678 640E82AF */  sw         $v0, %gp_rel(time_in_frames)($gp)
    /* 1EA84 8015867C 2A108202 */  slt        $v0, $s4, $v0
    /* 1EA88 80158680 0F004010 */  beqz       $v0, .L801586C0
    /* 1EA8C 80158684 00000000 */   nop
    /* 1EA90 80158688 0B83000C */  jal        TICK_Update
    /* 1EA94 8015868C 00000000 */   nop
    /* 1EA98 80158690 7E25020C */  jal        PAD_Handler__Fv
    /* 1EA9C 80158694 00000000 */   nop
    /* 1EAA0 80158698 ED5B050C */  jal        draw_mdec_polys
    /* 1EAA4 8015869C 21206002 */   addu      $a0, $s3, $zero
    /* 1EAA8 801586A0 0500A012 */  beqz       $s5, .L801586B8
    /* 1EAAC 801586A4 00000000 */   nop
    /* 1EAB0 801586A8 F8FF7326 */  addiu      $s3, $s3, -0x8
    /* 1EAB4 801586AC C0251300 */  sll        $a0, $s3, 23
    /* 1EAB8 801586B0 0D5F050C */  jal        set_mdec_audio_volume
    /* 1EABC 801586B4 03240400 */   sra       $a0, $a0, 16
  .L801586B8:
    /* 1EAC0 801586B8 0C10020C */  jal        VID_AfterDisplay__Fv
    /* 1EAC4 801586BC 00000000 */   nop
  .L801586C0:
    /* 1EAC8 801586C0 FC5F050C */  jal        decode_mdec_stream
    /* 1EACC 801586C4 01000424 */   addiu     $a0, $zero, 0x1
    /* 1EAD0 801586C8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 1EAD4 801586CC 06008216 */  bne        $s4, $v0, .L801586E8
    /* 1EAD8 801586D0 00000000 */   nop
    /* 1EADC 801586D4 440E828F */  lw         $v0, %gp_rel(mdec_last_frame)($gp)
    /* 1EAE0 801586D8 00000000 */  nop
    /* 1EAE4 801586DC 03005410 */  beq        $v0, $s4, .L801586EC
    /* 1EAE8 801586E0 21200000 */   addu      $a0, $zero, $zero
    /* 1EAEC 801586E4 640E948F */  lw         $s4, %gp_rel(time_in_frames)($gp)
  .L801586E8:
    /* 1EAF0 801586E8 21200000 */  addu       $a0, $zero, $zero
  .L801586EC:
    /* 1EAF4 801586EC FD25020C */  jal        PAD_GetPad__FiUc
    /* 1EAF8 801586F0 01000524 */   addiu     $a1, $zero, 0x1
    /* 1EAFC 801586F4 21200000 */  addu       $a0, $zero, $zero
    /* 1EB00 801586F8 02000524 */  addiu      $a1, $zero, 0x2
    /* 1EB04 801586FC FD25020C */  jal        PAD_GetPad__FiUc
    /* 1EB08 80158700 21884000 */   addu      $s1, $v0, $zero
    /* 1EB0C 80158704 21800000 */  addu       $s0, $zero, $zero
    /* 1EB10 80158708 21202002 */  addu       $a0, $s1, $zero
    /* 1EB14 8015870C 1062050C */  jal        GetDown__C4CPad_80158840
    /* 1EB18 80158710 21904000 */   addu      $s2, $v0, $zero
    /* 1EB1C 80158714 10004230 */  andi       $v0, $v0, 0x10
    /* 1EB20 80158718 06004014 */  bnez       $v0, .L80158734
    /* 1EB24 8015871C 00000000 */   nop
    /* 1EB28 80158720 1062050C */  jal        GetDown__C4CPad_80158840
    /* 1EB2C 80158724 21204002 */   addu      $a0, $s2, $zero
    /* 1EB30 80158728 10004230 */  andi       $v0, $v0, 0x10
    /* 1EB34 8015872C 02004010 */  beqz       $v0, .L80158738
    /* 1EB38 80158730 00000000 */   nop
  .L80158734:
    /* 1EB3C 80158734 01001024 */  addiu      $s0, $zero, 0x1
  .L80158738:
    /* 1EB40 80158738 03000012 */  beqz       $s0, .L80158748
    /* 1EB44 8015873C 01000224 */   addiu     $v0, $zero, 0x1
    /* 1EB48 80158740 01001524 */  addiu      $s5, $zero, 0x1
    /* 1EB4C 80158744 640D82AF */  sw         $v0, %gp_rel(user_start)($gp)
  .L80158748:
    /* 1EB50 80158748 21800000 */  addu       $s0, $zero, $zero
    /* 1EB54 8015874C 1062050C */  jal        GetDown__C4CPad_80158840
    /* 1EB58 80158750 21202002 */   addu      $a0, $s1, $zero
    /* 1EB5C 80158754 40004230 */  andi       $v0, $v0, 0x40
    /* 1EB60 80158758 06004014 */  bnez       $v0, .L80158774
    /* 1EB64 8015875C 00000000 */   nop
    /* 1EB68 80158760 1062050C */  jal        GetDown__C4CPad_80158840
    /* 1EB6C 80158764 21204002 */   addu      $a0, $s2, $zero
    /* 1EB70 80158768 40004230 */  andi       $v0, $v0, 0x40
    /* 1EB74 8015876C 02004010 */  beqz       $v0, .L80158778
    /* 1EB78 80158770 00000000 */   nop
  .L80158774:
    /* 1EB7C 80158774 01001024 */  addiu      $s0, $zero, 0x1
  .L80158778:
    /* 1EB80 80158778 02000012 */  beqz       $s0, .L80158784
    /* 1EB84 8015877C 00000000 */   nop
    /* 1EB88 80158780 01001524 */  addiu      $s5, $zero, 0x1
  .L80158784:
    /* 1EB8C 80158784 380D828F */  lw         $v0, %gp_rel(mdec_streaming)($gp)
    /* 1EB90 80158788 00000000 */  nop
    /* 1EB94 8015878C 03004010 */  beqz       $v0, .L8015879C
    /* 1EB98 80158790 00000000 */   nop
    /* 1EB9C 80158794 B6FF6106 */  bgez       $s3, .L80158670
    /* 1EBA0 80158798 00000000 */   nop
  .L8015879C:
    /* 1EBA4 8015879C 445F050C */  jal        stop_mdec_stream
    /* 1EBA8 801587A0 00000000 */   nop
    /* 1EBAC 801587A4 5059050C */  jal        wait_cdstream
    /* 1EBB0 801587A8 00000000 */   nop
    /* 1EBB4 801587AC 2B5E050C */  jal        kill_mdec_audio
    /* 1EBB8 801587B0 00000000 */   nop
    /* 1EBBC 801587B4 6410020C */  jal        VID_SetDBuffer__Fb
    /* 1EBC0 801587B8 21200000 */   addu      $a0, $zero, $zero
    /* 1EBC4 801587BC 1748000C */  jal        VSync
    /* 1EBC8 801587C0 21200000 */   addu      $a0, $zero, $zero
    /* 1EBCC 801587C4 000D848F */  lw         $a0, %gp_rel(vlc_buf)($gp)
    /* 1EBD0 801587C8 E720020C */  jal        Tfree__FPv
    /* 1EBD4 801587CC 00000000 */   nop
    /* 1EBD8 801587D0 040D848F */  lw         $a0, %gp_rel(img_buf)($gp)
    /* 1EBDC 801587D4 E720020C */  jal        Tfree__FPv
    /* 1EBE0 801587D8 00000000 */   nop
    /* 1EBE4 801587DC A660050C */  jal        StrClearVRAM
    /* 1EBE8 801587E0 00000000 */   nop
    /* 1EBEC 801587E4 EE80000C */  jal        TSK_Sleep
    /* 1EBF0 801587E8 01000424 */   addiu     $a0, $zero, 0x1
    /* 1EBF4 801587EC A660050C */  jal        StrClearVRAM
    /* 1EBF8 801587F0 00000000 */   nop
    /* 1EBFC 801587F4 EE80000C */  jal        TSK_Sleep
    /* 1EC00 801587F8 03000424 */   addiu     $a0, $zero, 0x3
    /* 1EC04 801587FC 1280043C */  lui        $a0, %hi(D_80121D08)
    /* 1EC08 80158800 081D8424 */  addiu      $a0, $a0, %lo(D_80121D08)
    /* 1EC0C 80158804 CD40000C */  jal        longjmp
    /* 1EC10 80158808 01000524 */   addiu     $a1, $zero, 0x1
    /* 1EC14 8015880C 5400BF8F */  lw         $ra, 0x54($sp)
    /* 1EC18 80158810 5000BE8F */  lw         $fp, 0x50($sp)
    /* 1EC1C 80158814 4C00B78F */  lw         $s7, 0x4C($sp)
    /* 1EC20 80158818 4800B68F */  lw         $s6, 0x48($sp)
    /* 1EC24 8015881C 4400B58F */  lw         $s5, 0x44($sp)
    /* 1EC28 80158820 4000B48F */  lw         $s4, 0x40($sp)
    /* 1EC2C 80158824 3C00B38F */  lw         $s3, 0x3C($sp)
    /* 1EC30 80158828 3800B28F */  lw         $s2, 0x38($sp)
    /* 1EC34 8015882C 3400B18F */  lw         $s1, 0x34($sp)
    /* 1EC38 80158830 3000B08F */  lw         $s0, 0x30($sp)
    /* 1EC3C 80158834 5800BD27 */  addiu      $sp, $sp, 0x58
    /* 1EC40 80158838 0800E003 */  jr         $ra
    /* 1EC44 8015883C 00000000 */   nop
endlabel LoPlayFMVOverLay
