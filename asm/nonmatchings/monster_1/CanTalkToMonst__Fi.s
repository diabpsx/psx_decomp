.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CanTalkToMonst__Fi, 0x40

glabel CanTalkToMonst__Fi
    /* 1CD54 8015694C 40100400 */  sll        $v0, $a0, 1
    /* 1CD58 80156950 21104400 */  addu       $v0, $v0, $a0
    /* 1CD5C 80156954 80100200 */  sll        $v0, $v0, 2
    /* 1CD60 80156958 21104400 */  addu       $v0, $v0, $a0
    /* 1CD64 8015695C C0100200 */  sll        $v0, $v0, 3
    /* 1CD68 80156960 1080013C */  lui        $at, %hi(monster + 0x49)
    /* 1CD6C 80156964 21082200 */  addu       $at, $at, $v0
    /* 1CD70 80156968 DD532390 */  lbu        $v1, %lo(monster + 0x49)($at)
    /* 1CD74 8015696C 06000224 */  addiu      $v0, $zero, 0x6
    /* 1CD78 80156970 03006214 */  bne        $v1, $v0, .L80156980
    /* 1CD7C 80156974 07006238 */   xori      $v0, $v1, 0x7
    /* 1CD80 80156978 615A0508 */  j          .L80156984
    /* 1CD84 8015697C 01000224 */   addiu     $v0, $zero, 0x1
  .L80156980:
    /* 1CD88 80156980 0100422C */  sltiu      $v0, $v0, 0x1
  .L80156984:
    /* 1CD8C 80156984 0800E003 */  jr         $ra
    /* 1CD90 80156988 00000000 */   nop
endlabel CanTalkToMonst__Fi
