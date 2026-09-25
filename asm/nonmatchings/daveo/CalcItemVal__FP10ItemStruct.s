.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CalcItemVal__FP10ItemStruct, 0x5C

glabel CalcItemVal__FP10ItemStruct
    /* 74CF8 80084CF8 2C008384 */  lh         $v1, 0x2C($a0)
    /* 74CFC 80084CFC 0B000224 */  addiu      $v0, $zero, 0xB
    /* 74D00 80084D00 12006210 */  beq        $v1, $v0, .L80084D4C
    /* 74D04 80084D04 21100000 */   addu      $v0, $zero, $zero
    /* 74D08 80084D08 51008280 */  lb         $v0, 0x51($a0)
    /* 74D0C 80084D0C 00000000 */  nop
    /* 74D10 80084D10 08004010 */  beqz       $v0, .L80084D34
    /* 74D14 80084D14 00000000 */   nop
    /* 74D18 80084D18 69008280 */  lb         $v0, 0x69($a0)
    /* 74D1C 80084D1C 00000000 */  nop
    /* 74D20 80084D20 04004010 */  beqz       $v0, .L80084D34
    /* 74D24 80084D24 00000000 */   nop
    /* 74D28 80084D28 1800828C */  lw         $v0, 0x18($a0)
    /* 74D2C 80084D2C 50130208 */  j          .L80084D40
    /* 74D30 80084D30 83100200 */   sra       $v0, $v0, 2
  .L80084D34:
    /* 74D34 80084D34 1400828C */  lw         $v0, 0x14($a0)
    /* 74D38 80084D38 00000000 */  nop
    /* 74D3C 80084D3C 83100200 */  sra        $v0, $v0, 2
  .L80084D40:
    /* 74D40 80084D40 0200401C */  bgtz       $v0, .L80084D4C
    /* 74D44 80084D44 00000000 */   nop
    /* 74D48 80084D48 01000224 */  addiu      $v0, $zero, 0x1
  .L80084D4C:
    /* 74D4C 80084D4C 0800E003 */  jr         $ra
    /* 74D50 80084D50 00000000 */   nop
endlabel CalcItemVal__FP10ItemStruct
