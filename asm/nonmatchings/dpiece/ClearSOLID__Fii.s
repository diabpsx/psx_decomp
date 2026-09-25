.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClearSOLID__Fii, 0x8C

glabel ClearSOLID__Fii
    /* 72C54 80082C54 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 72C58 80082C58 1000B0AF */  sw         $s0, 0x10($sp)
    /* 72C5C 80082C5C 21808000 */  addu       $s0, $a0, $zero
    /* 72C60 80082C60 1400B1AF */  sw         $s1, 0x14($sp)
    /* 72C64 80082C64 2188A000 */  addu       $s1, $a1, $zero
    /* 72C68 80082C68 7100022E */  sltiu      $v0, $s0, 0x71
    /* 72C6C 80082C6C 04004010 */  beqz       $v0, .L80082C80
    /* 72C70 80082C70 1800BFAF */   sw        $ra, 0x18($sp)
    /* 72C74 80082C74 7100222E */  sltiu      $v0, $s1, 0x71
    /* 72C78 80082C78 07004014 */  bnez       $v0, .L80082C98
    /* 72C7C 80082C7C C0101100 */   sll       $v0, $s1, 3
  .L80082C80:
    /* 72C80 80082C80 21200000 */  addu       $a0, $zero, $zero
    /* 72C84 80082C84 1280053C */  lui        $a1, %hi(D_801194E8)
    /* 72C88 80082C88 E894A524 */  addiu      $a1, $a1, %lo(D_801194E8)
    /* 72C8C 80082C8C A583000C */  jal        DBG_Error
    /* 72C90 80082C90 BD000624 */   addiu     $a2, $zero, 0xBD
    /* 72C94 80082C94 C0101100 */  sll        $v0, $s1, 3
  .L80082C98:
    /* 72C98 80082C98 C0181000 */  sll        $v1, $s0, 3
    /* 72C9C 80082C9C 23187000 */  subu       $v1, $v1, $s0
    /* 72CA0 80082CA0 C0190300 */  sll        $v1, $v1, 7
    /* 72CA4 80082CA4 21104300 */  addu       $v0, $v0, $v1
    /* 72CA8 80082CA8 0E80013C */  lui        $at, %hi(dung_map + 0x2)
    /* 72CAC 80082CAC 21082200 */  addu       $at, $at, $v0
    /* 72CB0 80082CB0 2A7A2390 */  lbu        $v1, %lo(dung_map + 0x2)($at)
    /* 72CB4 80082CB4 00000000 */  nop
    /* 72CB8 80082CB8 FE006330 */  andi       $v1, $v1, 0xFE
    /* 72CBC 80082CBC 0E80013C */  lui        $at, %hi(dung_map + 0x2)
    /* 72CC0 80082CC0 21082200 */  addu       $at, $at, $v0
    /* 72CC4 80082CC4 2A7A23A0 */  sb         $v1, %lo(dung_map + 0x2)($at)
    /* 72CC8 80082CC8 1800BF8F */  lw         $ra, 0x18($sp)
    /* 72CCC 80082CCC 1400B18F */  lw         $s1, 0x14($sp)
    /* 72CD0 80082CD0 1000B08F */  lw         $s0, 0x10($sp)
    /* 72CD4 80082CD4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 72CD8 80082CD8 0800E003 */  jr         $ra
    /* 72CDC 80082CDC 00000000 */   nop
endlabel ClearSOLID__Fii
