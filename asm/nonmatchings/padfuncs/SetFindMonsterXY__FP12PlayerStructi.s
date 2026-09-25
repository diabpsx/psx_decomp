.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetFindMonsterXY__FP12PlayerStructi, 0x90

glabel SetFindMonsterXY__FP12PlayerStructi
    /* 90E5C 800A0E5C 1280023C */  lui        $v0, %hi(leveltype)
    /* 90E60 800A0E60 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 90E64 800A0E64 00000000 */  nop
    /* 90E68 800A0E68 12004010 */  beqz       $v0, .L800A0EB4
    /* 90E6C 800A0E6C 40180500 */   sll       $v1, $a1, 1
    /* 90E70 800A0E70 21186500 */  addu       $v1, $v1, $a1
    /* 90E74 800A0E74 80180300 */  sll        $v1, $v1, 2
    /* 90E78 800A0E78 21186500 */  addu       $v1, $v1, $a1
    /* 90E7C 800A0E7C C0180300 */  sll        $v1, $v1, 3
    /* 90E80 800A0E80 1080023C */  lui        $v0, %hi(monster)
    /* 90E84 800A0E84 94534224 */  addiu      $v0, $v0, %lo(monster)
    /* 90E88 800A0E88 21186200 */  addu       $v1, $v1, $v0
    /* 90E8C 800A0E8C 36006290 */  lbu        $v0, 0x36($v1)
    /* 90E90 800A0E90 00000000 */  nop
    /* 90E94 800A0E94 00160200 */  sll        $v0, $v0, 24
    /* 90E98 800A0E98 03160200 */  sra        $v0, $v0, 24
    /* 90E9C 800A0E9C 600182A4 */  sh         $v0, 0x160($a0)
    /* 90EA0 800A0EA0 37006290 */  lbu        $v0, 0x37($v1)
    /* 90EA4 800A0EA4 00000000 */  nop
    /* 90EA8 800A0EA8 00160200 */  sll        $v0, $v0, 24
    /* 90EAC 800A0EAC B9830208 */  j          .L800A0EE4
    /* 90EB0 800A0EB0 03160200 */   sra       $v0, $v0, 24
  .L800A0EB4:
    /* 90EB4 800A0EB4 40100500 */  sll        $v0, $a1, 1
    /* 90EB8 800A0EB8 21104500 */  addu       $v0, $v0, $a1
    /* 90EBC 800A0EBC 00110200 */  sll        $v0, $v0, 4
    /* 90EC0 800A0EC0 21104500 */  addu       $v0, $v0, $a1
    /* 90EC4 800A0EC4 80100200 */  sll        $v0, $v0, 2
    /* 90EC8 800A0EC8 0D80033C */  lui        $v1, %hi(towner)
    /* 90ECC 800A0ECC 80FE6324 */  addiu      $v1, $v1, %lo(towner)
    /* 90ED0 800A0ED0 21104300 */  addu       $v0, $v0, $v1
    /* 90ED4 800A0ED4 0800438C */  lw         $v1, 0x8($v0)
    /* 90ED8 800A0ED8 00000000 */  nop
    /* 90EDC 800A0EDC 600183A4 */  sh         $v1, 0x160($a0)
    /* 90EE0 800A0EE0 0C00428C */  lw         $v0, 0xC($v0)
  .L800A0EE4:
    /* 90EE4 800A0EE4 0800E003 */  jr         $ra
    /* 90EE8 800A0EE8 620182A4 */   sh        $v0, 0x162($a0)
endlabel SetFindMonsterXY__FP12PlayerStructi
