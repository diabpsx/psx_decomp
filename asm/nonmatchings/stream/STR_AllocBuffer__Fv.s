.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching STR_AllocBuffer__Fv, 0x38

glabel STR_AllocBuffer__Fv
    /* 88B3C 80098B3C 1280033C */  lui        $v1, %hi(FileSYS)
    /* 88B40 80098B40 ECAA638C */  lw         $v1, %lo(FileSYS)($v1)
    /* 88B44 80098B44 02000224 */  addiu      $v0, $zero, 0x2
    /* 88B48 80098B48 08006214 */  bne        $v1, $v0, .L80098B6C
    /* 88B4C 80098B4C 00000000 */   nop
    /* 88B50 80098B50 FF470324 */  addiu      $v1, $zero, 0x47FF
    /* 88B54 80098B54 0D80023C */  lui        $v0, %hi(STR_Buffer + 0x11FFC)
    /* 88B58 80098B58 E4BC4224 */  addiu      $v0, $v0, %lo(STR_Buffer + (0x11FFC & 0xFFFF))
  .L80098B5C:
    /* 88B5C 80098B5C 000040AC */  sw         $zero, 0x0($v0)
    /* 88B60 80098B60 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 88B64 80098B64 FDFF6104 */  bgez       $v1, .L80098B5C
    /* 88B68 80098B68 FCFF4224 */   addiu     $v0, $v0, -0x4
  .L80098B6C:
    /* 88B6C 80098B6C 0800E003 */  jr         $ra
    /* 88B70 80098B70 00000000 */   nop
endlabel STR_AllocBuffer__Fv
