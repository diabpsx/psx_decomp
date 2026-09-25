.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DropHalfPlayersGold__FP12PlayerStruct, 0x110

glabel DropHalfPlayersGold__FP12PlayerStruct
    /* 51B44 80061B44 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 51B48 80061B48 1400B1AF */  sw         $s1, 0x14($sp)
    /* 51B4C 80061B4C 21888000 */  addu       $s1, $a0, $zero
    /* 51B50 80061B50 2800BFAF */  sw         $ra, 0x28($sp)
    /* 51B54 80061B54 2400B5AF */  sw         $s5, 0x24($sp)
    /* 51B58 80061B58 2000B4AF */  sw         $s4, 0x20($sp)
    /* 51B5C 80061B5C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 51B60 80061B60 1800B2AF */  sw         $s2, 0x18($sp)
    /* 51B64 80061B64 1000B0AF */  sw         $s0, 0x10($sp)
    /* 51B68 80061B68 5001358E */  lw         $s5, 0x150($s1)
    /* 51B6C 80061B6C 00000000 */  nop
    /* 51B70 80061B70 2B00A01A */  blez       $s5, .L80061C20
    /* 51B74 80061B74 21A00000 */   addu      $s4, $zero, $zero
    /* 51B78 80061B78 10193326 */  addiu      $s3, $s1, 0x1910
    /* 51B7C 80061B7C 21902002 */  addu       $s2, $s1, $zero
  .L80061B80:
    /* 51B80 80061B80 8415228E */  lw         $v0, 0x1584($s1)
    /* 51B84 80061B84 00000000 */  nop
    /* 51B88 80061B88 2A108202 */  slt        $v0, $s4, $v0
    /* 51B8C 80061B8C 24004010 */  beqz       $v0, .L80061C20
    /* 51B90 80061B90 00000000 */   nop
    /* 51B94 80061B94 2200A01A */  blez       $s5, .L80061C20
    /* 51B98 80061B98 0B000224 */   addiu     $v0, $zero, 0xB
    /* 51B9C 80061B9C D0044386 */  lh         $v1, 0x4D0($s2)
    /* 51BA0 80061BA0 00000000 */  nop
    /* 51BA4 80061BA4 1B006214 */  bne        $v1, $v0, .L80061C14
    /* 51BA8 80061BA8 00000000 */   nop
    /* 51BAC 80061BAC B804508E */  lw         $s0, 0x4B8($s2)
    /* 51BB0 80061BB0 00000000 */  nop
    /* 51BB4 80061BB4 23A8B002 */  subu       $s5, $s5, $s0
    /* 51BB8 80061BB8 43801000 */  sra        $s0, $s0, 1
    /* 51BBC 80061BBC 13000012 */  beqz       $s0, .L80061C0C
    /* 51BC0 80061BC0 21202002 */   addu      $a0, $s1, $zero
    /* 51BC4 80061BC4 489A010C */  jal        SetGoldCurs__FP12PlayerStructi
    /* 51BC8 80061BC8 21288002 */   addu      $a1, $s4, $zero
    /* 51BCC 80061BCC 21206002 */  addu       $a0, $s3, $zero
    /* 51BD0 80061BD0 F2FE000C */  jal        SetPlrHandItem__FP10ItemStructi
    /* 51BD4 80061BD4 21280000 */   addu      $a1, $zero, $zero
    /* 51BD8 80061BD8 21202002 */  addu       $a0, $s1, $zero
    /* 51BDC 80061BDC E19C010C */  jal        GetGoldSeed__FP12PlayerStructP10ItemStruct
    /* 51BE0 80061BE0 21286002 */   addu      $a1, $s3, $zero
    /* 51BE4 80061BE4 9FFF000C */  jal        SetPlrHandGoldCurs__FP10ItemStruct
    /* 51BE8 80061BE8 21206002 */   addu      $a0, $s3, $zero
    /* 51BEC 80061BEC 241930AE */  sw         $s0, 0x1924($s1)
    /* 51BF0 80061BF0 21202002 */  addu       $a0, $s1, $zero
    /* 51BF4 80061BF4 21286002 */  addu       $a1, $s3, $zero
    /* 51BF8 80061BF8 21300000 */  addu       $a2, $zero, $zero
    /* 51BFC 80061BFC 7785010C */  jal        PlrDeadItem__FP12PlayerStructP10ItemStructii
    /* 51C00 80061C00 21380000 */   addu      $a3, $zero, $zero
    /* 51C04 80061C04 05870108 */  j          .L80061C14
    /* 51C08 80061C08 B80450AE */   sw        $s0, 0x4B8($s2)
  .L80061C0C:
    /* 51C0C 80061C0C 01001024 */  addiu      $s0, $zero, 0x1
    /* 51C10 80061C10 B80450AE */  sw         $s0, 0x4B8($s2)
  .L80061C14:
    /* 51C14 80061C14 6C005226 */  addiu      $s2, $s2, 0x6C
    /* 51C18 80061C18 E0860108 */  j          .L80061B80
    /* 51C1C 80061C1C 01009426 */   addiu     $s4, $s4, 0x1
  .L80061C20:
    /* 51C20 80061C20 699A010C */  jal        CalculateGold__FP12PlayerStruct
    /* 51C24 80061C24 21202002 */   addu      $a0, $s1, $zero
    /* 51C28 80061C28 500122AE */  sw         $v0, 0x150($s1)
    /* 51C2C 80061C2C 2800BF8F */  lw         $ra, 0x28($sp)
    /* 51C30 80061C30 2400B58F */  lw         $s5, 0x24($sp)
    /* 51C34 80061C34 2000B48F */  lw         $s4, 0x20($sp)
    /* 51C38 80061C38 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 51C3C 80061C3C 1800B28F */  lw         $s2, 0x18($sp)
    /* 51C40 80061C40 1400B18F */  lw         $s1, 0x14($sp)
    /* 51C44 80061C44 1000B08F */  lw         $s0, 0x10($sp)
    /* 51C48 80061C48 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 51C4C 80061C4C 0800E003 */  jr         $ra
    /* 51C50 80061C50 00000000 */   nop
endlabel DropHalfPlayersGold__FP12PlayerStruct
