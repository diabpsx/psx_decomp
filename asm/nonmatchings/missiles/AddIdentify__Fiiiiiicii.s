.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddIdentify__Fiiiiiicii, 0xA4

glabel AddIdentify__Fiiiiiicii
    /* 75BC 801411B4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 75C0 801411B8 80100400 */  sll        $v0, $a0, 2
    /* 75C4 801411BC 21104400 */  addu       $v0, $v0, $a0
    /* 75C8 801411C0 80100200 */  sll        $v0, $v0, 2
    /* 75CC 801411C4 23104400 */  subu       $v0, $v0, $a0
    /* 75D0 801411C8 80100200 */  sll        $v0, $v0, 2
    /* 75D4 801411CC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 75D8 801411D0 01001024 */  addiu      $s0, $zero, 0x1
    /* 75DC 801411D4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 75E0 801411D8 3C00B18F */  lw         $s1, 0x3C($sp)
    /* 75E4 801411DC 05000524 */  addiu      $a1, $zero, 0x5
    /* 75E8 801411E0 1800BFAF */  sw         $ra, 0x18($sp)
    /* 75EC 801411E4 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 75F0 801411E8 21082200 */  addu       $at, $at, $v0
    /* 75F4 801411EC 902C30A0 */  sb         $s0, %lo(missile + 0x38)($at)
    /* 75F8 801411F0 C2DC010C */  jal        UseMana__Fii
    /* 75FC 801411F4 21202002 */   addu      $a0, $s1, $zero
    /* 7600 801411F8 1280023C */  lui        $v0, %hi(sbookflag)
    /* 7604 801411FC C6B64290 */  lbu        $v0, %lo(sbookflag)($v0)
    /* 7608 80141200 00000000 */  nop
    /* 760C 80141204 03004010 */  beqz       $v0, .L80141214
    /* 7610 80141208 00000000 */   nop
    /* 7614 8014120C 1280013C */  lui        $at, %hi(sbookflag)
    /* 7618 80141210 C6B620A0 */  sb         $zero, %lo(sbookflag)($at)
  .L80141214:
    /* 761C 80141214 1280023C */  lui        $v0, %hi(invflag)
    /* 7620 80141218 2CC34290 */  lbu        $v0, %lo(invflag)($v0)
    /* 7624 8014121C 00000000 */  nop
    /* 7628 80141220 03004014 */  bnez       $v0, .L80141230
    /* 762C 80141224 00000000 */   nop
    /* 7630 80141228 1280013C */  lui        $at, %hi(invflag)
    /* 7634 8014122C 2CC330A0 */  sb         $s0, %lo(invflag)($at)
  .L80141230:
    /* 7638 80141230 1280013C */  lui        $at, %hi(options_pad)
    /* 763C 80141234 50B231AC */  sw         $s1, %lo(options_pad)($at)
    /* 7640 80141238 01DE000C */  jal        NewCursor__Fi
    /* 7644 8014123C 02000424 */   addiu     $a0, $zero, 0x2
    /* 7648 80141240 1800BF8F */  lw         $ra, 0x18($sp)
    /* 764C 80141244 1400B18F */  lw         $s1, 0x14($sp)
    /* 7650 80141248 1000B08F */  lw         $s0, 0x10($sp)
    /* 7654 8014124C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 7658 80141250 0800E003 */  jr         $ra
    /* 765C 80141254 00000000 */   nop
endlabel AddIdentify__Fiiiiiicii
