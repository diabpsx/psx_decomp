.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_Stone__Fi, 0x1DC

glabel MI_Stone__Fi
    /* DCE4 801478DC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* DCE8 801478E0 1000B0AF */  sw         $s0, 0x10($sp)
    /* DCEC 801478E4 21808000 */  addu       $s0, $a0, $zero
    /* DCF0 801478E8 80101000 */  sll        $v0, $s0, 2
    /* DCF4 801478EC 21105000 */  addu       $v0, $v0, $s0
    /* DCF8 801478F0 80100200 */  sll        $v0, $v0, 2
    /* DCFC 801478F4 23105000 */  subu       $v0, $v0, $s0
    /* DD00 801478F8 80280200 */  sll        $a1, $v0, 2
    /* DD04 801478FC 1400BFAF */  sw         $ra, 0x14($sp)
    /* DD08 80147900 1080013C */  lui        $at, %hi(missile + 0x18)
    /* DD0C 80147904 21082500 */  addu       $at, $at, $a1
    /* DD10 80147908 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* DD14 8014790C 1080013C */  lui        $at, %hi(missile + 0x20)
    /* DD18 80147910 21082500 */  addu       $at, $at, $a1
    /* DD1C 80147914 782C2484 */  lh         $a0, %lo(missile + 0x20)($at)
    /* DD20 80147918 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* DD24 8014791C 1080013C */  lui        $at, %hi(missile + 0x18)
    /* DD28 80147920 21082500 */  addu       $at, $at, $a1
    /* DD2C 80147924 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* DD30 80147928 40100400 */  sll        $v0, $a0, 1
    /* DD34 8014792C 21104400 */  addu       $v0, $v0, $a0
    /* DD38 80147930 80100200 */  sll        $v0, $v0, 2
    /* DD3C 80147934 21104400 */  addu       $v0, $v0, $a0
    /* DD40 80147938 C0100200 */  sll        $v0, $v0, 3
    /* DD44 8014793C 1080013C */  lui        $at, %hi(monster + 0x10)
    /* DD48 80147940 21082200 */  addu       $at, $at, $v0
    /* DD4C 80147944 A453228C */  lw         $v0, %lo(monster + 0x10)($at)
    /* DD50 80147948 00000000 */  nop
    /* DD54 8014794C 0B004014 */  bnez       $v0, .L8014797C
    /* DD58 80147950 40100400 */   sll       $v0, $a0, 1
    /* DD5C 80147954 1080013C */  lui        $at, %hi(missile + 0x37)
    /* DD60 80147958 21082500 */  addu       $at, $at, $a1
    /* DD64 8014795C 8F2C2390 */  lbu        $v1, %lo(missile + 0x37)($at)
    /* DD68 80147960 12000224 */  addiu      $v0, $zero, 0x12
    /* DD6C 80147964 04006210 */  beq        $v1, $v0, .L80147978
    /* DD70 80147968 0B000224 */   addiu     $v0, $zero, 0xB
    /* DD74 8014796C 1080013C */  lui        $at, %hi(missile + 0x18)
    /* DD78 80147970 21082500 */  addu       $at, $at, $a1
    /* DD7C 80147974 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
  .L80147978:
    /* DD80 80147978 40100400 */  sll        $v0, $a0, 1
  .L8014797C:
    /* DD84 8014797C 21104400 */  addu       $v0, $v0, $a0
    /* DD88 80147980 80100200 */  sll        $v0, $v0, 2
    /* DD8C 80147984 21104400 */  addu       $v0, $v0, $a0
    /* DD90 80147988 C0380200 */  sll        $a3, $v0, 3
    /* DD94 8014798C 1080013C */  lui        $at, %hi(monster + 0x33)
    /* DD98 80147990 21082700 */  addu       $at, $at, $a3
    /* DD9C 80147994 C7532380 */  lb         $v1, %lo(monster + 0x33)($at)
    /* DDA0 80147998 0F000224 */  addiu      $v0, $zero, 0xF
    /* DDA4 8014799C 0B006210 */  beq        $v1, $v0, .L801479CC
    /* DDA8 801479A0 80101000 */   sll       $v0, $s0, 2
    /* DDAC 801479A4 21105000 */  addu       $v0, $v0, $s0
    /* DDB0 801479A8 80100200 */  sll        $v0, $v0, 2
    /* DDB4 801479AC 23105000 */  subu       $v0, $v0, $s0
    /* DDB8 801479B0 80100200 */  sll        $v0, $v0, 2
    /* DDBC 801479B4 01000324 */  addiu      $v1, $zero, 0x1
    /* DDC0 801479B8 1080013C */  lui        $at, %hi(missile + 0x38)
    /* DDC4 801479BC 21082200 */  addu       $at, $at, $v0
    /* DDC8 801479C0 902C23A0 */  sb         $v1, %lo(missile + 0x38)($at)
    /* DDCC 801479C4 A91E0508 */  j          .L80147AA4
    /* DDD0 801479C8 00000000 */   nop
  .L801479CC:
    /* DDD4 801479CC 21105000 */  addu       $v0, $v0, $s0
    /* DDD8 801479D0 80100200 */  sll        $v0, $v0, 2
    /* DDDC 801479D4 23105000 */  subu       $v0, $v0, $s0
    /* DDE0 801479D8 80180200 */  sll        $v1, $v0, 2
    /* DDE4 801479DC 1080013C */  lui        $at, %hi(missile + 0x18)
    /* DDE8 801479E0 21082300 */  addu       $at, $at, $v1
    /* DDEC 801479E4 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* DDF0 801479E8 00000000 */  nop
    /* DDF4 801479EC 21004014 */  bnez       $v0, .L80147A74
    /* DDF8 801479F0 80101000 */   sll       $v0, $s0, 2
    /* DDFC 801479F4 01000224 */  addiu      $v0, $zero, 0x1
    /* DE00 801479F8 1080013C */  lui        $at, %hi(missile + 0x38)
    /* DE04 801479FC 21082300 */  addu       $at, $at, $v1
    /* DE08 80147A00 902C22A0 */  sb         $v0, %lo(missile + 0x38)($at)
    /* DE0C 80147A04 1080013C */  lui        $at, %hi(monster + 0x10)
    /* DE10 80147A08 21082700 */  addu       $at, $at, $a3
    /* DE14 80147A0C A453228C */  lw         $v0, %lo(monster + 0x10)($at)
    /* DE18 80147A10 00000000 */  nop
    /* DE1C 80147A14 09004018 */  blez       $v0, .L80147A3C
    /* DE20 80147A18 00000000 */   nop
    /* DE24 80147A1C 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* DE28 80147A20 21082300 */  addu       $at, $at, $v1
    /* DE2C 80147A24 762C2294 */  lhu        $v0, %lo(missile + 0x1E)($at)
    /* DE30 80147A28 1080013C */  lui        $at, %hi(monster + 0x33)
    /* DE34 80147A2C 21082700 */  addu       $at, $at, $a3
    /* DE38 80147A30 C75322A0 */  sb         $v0, %lo(monster + 0x33)($at)
    /* DE3C 80147A34 9D1E0508 */  j          .L80147A74
    /* DE40 80147A38 80101000 */   sll       $v0, $s0, 2
  .L80147A3C:
    /* DE44 80147A3C 1080013C */  lui        $at, %hi(monster + 0x34)
    /* DE48 80147A40 21082700 */  addu       $at, $at, $a3
    /* DE4C 80147A44 C8532480 */  lb         $a0, %lo(monster + 0x34)($at)
    /* DE50 80147A48 1080013C */  lui        $at, %hi(monster + 0x35)
    /* DE54 80147A4C 21082700 */  addu       $at, $at, $a3
    /* DE58 80147A50 C9532580 */  lb         $a1, %lo(monster + 0x35)($at)
    /* DE5C 80147A54 1280063C */  lui        $a2, %hi(stonendx)
    /* DE60 80147A58 74B7C680 */  lb         $a2, %lo(stonendx)($a2)
    /* DE64 80147A5C 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* DE68 80147A60 21082700 */  addu       $at, $at, $a3
    /* DE6C 80147A64 D0532780 */  lb         $a3, %lo(monster + 0x3C)($at)
    /* DE70 80147A68 E3DF000C */  jal        AddDead__Fiici
    /* DE74 80147A6C 00000000 */   nop
    /* DE78 80147A70 80101000 */  sll        $v0, $s0, 2
  .L80147A74:
    /* DE7C 80147A74 21105000 */  addu       $v0, $v0, $s0
    /* DE80 80147A78 80100200 */  sll        $v0, $v0, 2
    /* DE84 80147A7C 23105000 */  subu       $v0, $v0, $s0
    /* DE88 80147A80 80100200 */  sll        $v0, $v0, 2
    /* DE8C 80147A84 1080013C */  lui        $at, %hi(missile + 0x37)
    /* DE90 80147A88 21082200 */  addu       $at, $at, $v0
    /* DE94 80147A8C 8F2C2390 */  lbu        $v1, %lo(missile + 0x37)($at)
    /* DE98 80147A90 12000224 */  addiu      $v0, $zero, 0x12
    /* DE9C 80147A94 03006214 */  bne        $v1, $v0, .L80147AA4
    /* DEA0 80147A98 00000000 */   nop
    /* DEA4 80147A9C D1EA040C */  jal        PutMissile__Fi
    /* DEA8 80147AA0 21200002 */   addu      $a0, $s0, $zero
  .L80147AA4:
    /* DEAC 80147AA4 1400BF8F */  lw         $ra, 0x14($sp)
    /* DEB0 80147AA8 1000B08F */  lw         $s0, 0x10($sp)
    /* DEB4 80147AAC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* DEB8 80147AB0 0800E003 */  jr         $ra
    /* DEBC 80147AB4 00000000 */   nop
endlabel MI_Stone__Fi
