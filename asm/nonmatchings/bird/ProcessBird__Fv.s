.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ProcessBird__Fv, 0x144

glabel ProcessBird__Fv
    /* 9C838 800AC838 1280023C */  lui        $v0, %hi(PauseMode)
    /* 9C83C 800AC83C A4B74290 */  lbu        $v0, %lo(PauseMode)($v0)
    /* 9C840 800AC840 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 9C844 800AC844 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9C848 800AC848 0D80103C */  lui        $s0, %hi(BirdList)
    /* 9C84C 800AC84C 74D31026 */  addiu      $s0, $s0, %lo(BirdList)
    /* 9C850 800AC850 2000BFAF */  sw         $ra, 0x20($sp)
    /* 9C854 800AC854 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 9C858 800AC858 1800B2AF */  sw         $s2, 0x18($sp)
    /* 9C85C 800AC85C 3F004014 */  bnez       $v0, .L800AC95C
    /* 9C860 800AC860 1400B1AF */   sw        $s1, 0x14($sp)
    /* 9C864 800AC864 1280023C */  lui        $v0, %hi(stextflag)
    /* 9C868 800AC868 E0BA4280 */  lb         $v0, %lo(stextflag)($v0)
    /* 9C86C 800AC86C 00000000 */  nop
    /* 9C870 800AC870 3A004014 */  bnez       $v0, .L800AC95C
    /* 9C874 800AC874 00000000 */   nop
    /* 9C878 800AC878 1280023C */  lui        $v0, %hi(qtextflag)
    /* 9C87C 800AC87C 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 9C880 800AC880 00000000 */  nop
    /* 9C884 800AC884 35004014 */  bnez       $v0, .L800AC95C
    /* 9C888 800AC888 21900000 */   addu      $s2, $zero, $zero
    /* 9C88C 800AC88C 1180133C */  lui        $s3, %hi(jtbl_80110DF8)
    /* 9C890 800AC890 F80D7326 */  addiu      $s3, $s3, %lo(jtbl_80110DF8)
    /* 9C894 800AC894 11001126 */  addiu      $s1, $s0, 0x11
  .L800AC898:
    /* 9C898 800AC898 01002382 */  lb         $v1, 0x1($s1)
    /* 9C89C 800AC89C 00000000 */  nop
    /* 9C8A0 800AC8A0 0500622C */  sltiu      $v0, $v1, 0x5
    /* 9C8A4 800AC8A4 18004010 */  beqz       $v0, .L800AC908
    /* 9C8A8 800AC8A8 80100300 */   sll       $v0, $v1, 2
    /* 9C8AC 800AC8AC 21105300 */  addu       $v0, $v0, $s3
    /* 9C8B0 800AC8B0 0000428C */  lw         $v0, 0x0($v0)
    /* 9C8B4 800AC8B4 00000000 */  nop
    /* 9C8B8 800AC8B8 08004000 */  jr         $v0
    /* 9C8BC 800AC8BC 00000000 */   nop
  jlabel .L800AC8C0
    /* 9C8C0 800AC8C0 53AF020C */  jal        BIRD_DoHop__FP10BIRDSTRUCT
    /* 9C8C4 800AC8C4 21200002 */   addu      $a0, $s0, $zero
    /* 9C8C8 800AC8C8 42B20208 */  j          .L800AC908
    /* 9C8CC 800AC8CC 00000000 */   nop
  jlabel .L800AC8D0
    /* 9C8D0 800AC8D0 AEAF020C */  jal        BIRD_DoPerch__FP10BIRDSTRUCT
    /* 9C8D4 800AC8D4 21200002 */   addu      $a0, $s0, $zero
    /* 9C8D8 800AC8D8 42B20208 */  j          .L800AC908
    /* 9C8DC 800AC8DC 00000000 */   nop
  jlabel .L800AC8E0
    /* 9C8E0 800AC8E0 87B0020C */  jal        BIRD_DoFly__FP10BIRDSTRUCT
    /* 9C8E4 800AC8E4 21200002 */   addu      $a0, $s0, $zero
    /* 9C8E8 800AC8E8 42B20208 */  j          .L800AC908
    /* 9C8EC 800AC8EC 00000000 */   nop
  jlabel .L800AC8F0
    /* 9C8F0 800AC8F0 CFAF020C */  jal        BIRD_DoScatter__FP10BIRDSTRUCT
    /* 9C8F4 800AC8F4 21200002 */   addu      $a0, $s0, $zero
    /* 9C8F8 800AC8F8 42B20208 */  j          .L800AC908
    /* 9C8FC 800AC8FC 00000000 */   nop
  jlabel .L800AC900
    /* 9C900 800AC900 48B1020C */  jal        BIRD_DoLanding__FP10BIRDSTRUCT
    /* 9C904 800AC904 21200002 */   addu      $a0, $s0, $zero
  .L800AC908:
    /* 9C908 800AC908 03002292 */  lbu        $v0, 0x3($s1)
    /* 9C90C 800AC90C 00000000 */  nop
    /* 9C910 800AC910 03004014 */  bnez       $v0, .L800AC920
    /* 9C914 800AC914 00000000 */   nop
    /* 9C918 800AC918 9DB1020C */  jal        ProcessFlock__FP10BIRDSTRUCT
    /* 9C91C 800AC91C 21200002 */   addu      $a0, $s0, $zero
  .L800AC920:
    /* 9C920 800AC920 00002292 */  lbu        $v0, 0x0($s1)
    /* 9C924 800AC924 00000000 */  nop
    /* 9C928 800AC928 01004224 */  addiu      $v0, $v0, 0x1
    /* 9C92C 800AC92C 000022A2 */  sb         $v0, 0x0($s1)
    /* 9C930 800AC930 00160200 */  sll        $v0, $v0, 24
    /* 9C934 800AC934 03160200 */  sra        $v0, $v0, 24
    /* 9C938 800AC938 10004228 */  slti       $v0, $v0, 0x10
    /* 9C93C 800AC93C 02004014 */  bnez       $v0, .L800AC948
    /* 9C940 800AC940 00000000 */   nop
    /* 9C944 800AC944 000020A2 */  sb         $zero, 0x0($s1)
  .L800AC948:
    /* 9C948 800AC948 18003126 */  addiu      $s1, $s1, 0x18
    /* 9C94C 800AC94C 01005226 */  addiu      $s2, $s2, 0x1
    /* 9C950 800AC950 1000422A */  slti       $v0, $s2, 0x10
    /* 9C954 800AC954 D0FF4014 */  bnez       $v0, .L800AC898
    /* 9C958 800AC958 18001026 */   addiu     $s0, $s0, 0x18
  .L800AC95C:
    /* 9C95C 800AC95C 2000BF8F */  lw         $ra, 0x20($sp)
    /* 9C960 800AC960 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 9C964 800AC964 1800B28F */  lw         $s2, 0x18($sp)
    /* 9C968 800AC968 1400B18F */  lw         $s1, 0x14($sp)
    /* 9C96C 800AC96C 1000B08F */  lw         $s0, 0x10($sp)
    /* 9C970 800AC970 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 9C974 800AC974 0800E003 */  jr         $ra
    /* 9C978 800AC978 00000000 */   nop
endlabel ProcessBird__Fv
