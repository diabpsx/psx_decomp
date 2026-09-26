.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching UseStaffCharge__FP12PlayerStruct, 0x64

glabel UseStaffCharge__FP12PlayerStruct
    /* 26650 80160248 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 26654 8016024C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 26658 80160250 8C038384 */  lh         $v1, 0x38C($a0)
    /* 2665C 80160254 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 26660 80160258 10006210 */  beq        $v1, $v0, .L8016029C
    /* 26664 8016025C 17000224 */   addiu     $v0, $zero, 0x17
    /* 26668 80160260 AD038390 */  lbu        $v1, 0x3AD($a0)
    /* 2666C 80160264 00000000 */  nop
    /* 26670 80160268 0C006214 */  bne        $v1, $v0, .L8016029C
    /* 26674 8016026C 00000000 */   nop
    /* 26678 80160270 9D038380 */  lb         $v1, 0x39D($a0)
    /* 2667C 80160274 6400828C */  lw         $v0, 0x64($a0)
    /* 26680 80160278 00000000 */  nop
    /* 26684 8016027C 07006214 */  bne        $v1, $v0, .L8016029C
    /* 26688 80160280 00000000 */   nop
    /* 2668C 80160284 A9038290 */  lbu        $v0, 0x3A9($a0)
    /* 26690 80160288 00000000 */  nop
    /* 26694 8016028C 03004010 */  beqz       $v0, .L8016029C
    /* 26698 80160290 FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 2669C 80160294 2CFD000C */  jal        CalcPlrStaff__FP12PlayerStruct
    /* 266A0 80160298 A90382A0 */   sb        $v0, 0x3A9($a0)
  .L8016029C:
    /* 266A4 8016029C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 266A8 801602A0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 266AC 801602A4 0800E003 */  jr         $ra
    /* 266B0 801602A8 00000000 */   nop
endlabel UseStaffCharge__FP12PlayerStruct
