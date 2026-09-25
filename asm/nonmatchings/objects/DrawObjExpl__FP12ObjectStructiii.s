.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawObjExpl__FP12ObjectStructiii, 0x70

glabel DrawObjExpl__FP12ObjectStructiii
    /* 44930 80054930 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 44934 80054934 2140C000 */  addu       $t0, $a2, $zero
    /* 44938 80054938 2000BFAF */  sw         $ra, 0x20($sp)
    /* 4493C 8005493C 21008380 */  lb         $v1, 0x21($a0)
    /* 44940 80054940 0C008284 */  lh         $v0, 0xC($a0)
    /* 44944 80054944 FFFF6624 */  addiu      $a2, $v1, -0x1
    /* 44948 80054948 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 4494C 8005494C 0A00C210 */  beq        $a2, $v0, .L80054978
    /* 44950 80054950 00020224 */   addiu     $v0, $zero, 0x200
    /* 44954 80054954 2120A000 */  addu       $a0, $a1, $zero
    /* 44958 80054958 21280001 */  addu       $a1, $t0, $zero
    /* 4495C 8005495C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 44960 80054960 1400A0AF */  sw         $zero, 0x14($sp)
    /* 44964 80054964 1800A0AF */  sw         $zero, 0x18($sp)
    /* 44968 80054968 8E51010C */  jal        DrawExpl__Fiiiiiccc
    /* 4496C 8005496C 1C00A0AF */   sw        $zero, 0x1C($sp)
    /* 44970 80054970 64520108 */  j          .L80054990
    /* 44974 80054974 00000000 */   nop
  .L80054978:
    /* 44978 80054978 00008484 */  lh         $a0, 0x0($a0)
    /* 4497C 8005497C 00000000 */  nop
    /* 44980 80054980 03008010 */  beqz       $a0, .L80054990
    /* 44984 80054984 00000000 */   nop
    /* 44988 80054988 D034010C */  jal        AddUnLight__Fi
    /* 4498C 8005498C 00000000 */   nop
  .L80054990:
    /* 44990 80054990 2000BF8F */  lw         $ra, 0x20($sp)
    /* 44994 80054994 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 44998 80054998 0800E003 */  jr         $ra
    /* 4499C 8005499C 00000000 */   nop
endlabel DrawObjExpl__FP12ObjectStructiii
