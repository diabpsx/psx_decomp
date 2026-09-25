.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching get_pieces_str__Fi, 0x34

glabel get_pieces_str__Fi
    /* 2751C 8003751C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 27520 80037520 01000224 */  addiu      $v0, $zero, 0x1
    /* 27524 80037524 03008210 */  beq        $a0, $v0, .L80037534
    /* 27528 80037528 1000BFAF */   sw        $ra, 0x10($sp)
    /* 2752C 8003752C 4EDD0008 */  j          .L80037538
    /* 27530 80037530 09030424 */   addiu     $a0, $zero, 0x309
  .L80037534:
    /* 27534 80037534 0A030424 */  addiu      $a0, $zero, 0x30A
  .L80037538:
    /* 27538 80037538 4AED010C */  jal        GetStr__Fi
    /* 2753C 8003753C 00000000 */   nop
    /* 27540 80037540 1000BF8F */  lw         $ra, 0x10($sp)
    /* 27544 80037544 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 27548 80037548 0800E003 */  jr         $ra
    /* 2754C 8003754C 00000000 */   nop
endlabel get_pieces_str__Fi
