.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FuncBOOM__FP13MissileStructiii, 0x60

glabel FuncBOOM__FP13MissileStructiii
    /* 6D0A4 8007D0A4 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 6D0A8 8007D0A8 2000BFAF */  sw         $ra, 0x20($sp)
    /* 6D0AC 8007D0AC 28008884 */  lh         $t0, 0x28($a0)
    /* 6D0B0 8007D0B0 2A008984 */  lh         $t1, 0x2A($a0)
    /* 6D0B4 8007D0B4 47008390 */  lbu        $v1, 0x47($a0)
    /* 6D0B8 8007D0B8 00020224 */  addiu      $v0, $zero, 0x200
    /* 6D0BC 8007D0BC 1000A2AF */  sw         $v0, 0x10($sp)
    /* 6D0C0 8007D0C0 20000224 */  addiu      $v0, $zero, 0x20
    /* 6D0C4 8007D0C4 1800A2AF */  sw         $v0, 0x18($sp)
    /* 6D0C8 8007D0C8 60000224 */  addiu      $v0, $zero, 0x60
    /* 6D0CC 8007D0CC 1400A0AF */  sw         $zero, 0x14($sp)
    /* 6D0D0 8007D0D0 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 6D0D4 8007D0D4 001E0300 */  sll        $v1, $v1, 24
    /* 6D0D8 8007D0D8 03160300 */  sra        $v0, $v1, 24
    /* 6D0DC 8007D0DC C21F0300 */  srl        $v1, $v1, 31
    /* 6D0E0 8007D0E0 21104300 */  addu       $v0, $v0, $v1
    /* 6D0E4 8007D0E4 2120A800 */  addu       $a0, $a1, $t0
    /* 6D0E8 8007D0E8 2128C900 */  addu       $a1, $a2, $t1
    /* 6D0EC 8007D0EC 8E51010C */  jal        DrawExpl__Fiiiiiccc
    /* 6D0F0 8007D0F0 43300200 */   sra       $a2, $v0, 1
    /* 6D0F4 8007D0F4 2000BF8F */  lw         $ra, 0x20($sp)
    /* 6D0F8 8007D0F8 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 6D0FC 8007D0FC 0800E003 */  jr         $ra
    /* 6D100 8007D100 00000000 */   nop
endlabel FuncBOOM__FP13MissileStructiii
