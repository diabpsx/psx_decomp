.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching delta_close_portal__Fi, 0x40

glabel delta_close_portal__Fi
    /* 3FF2C 8004FF2C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 3FF30 8004FF30 80100400 */  sll        $v0, $a0, 2
    /* 3FF34 8004FF34 21104400 */  addu       $v0, $v0, $a0
    /* 3FF38 8004FF38 1380043C */  lui        $a0, %hi(D_8012EDD8)
    /* 3FF3C 8004FF3C D8ED8424 */  addiu      $a0, $a0, %lo(D_8012EDD8)
    /* 3FF40 8004FF40 21204400 */  addu       $a0, $v0, $a0
    /* 3FF44 8004FF44 FF000524 */  addiu      $a1, $zero, 0xFF
    /* 3FF48 8004FF48 1000BFAF */  sw         $ra, 0x10($sp)
    /* 3FF4C 8004FF4C E940000C */  jal        memset
    /* 3FF50 8004FF50 05000624 */   addiu     $a2, $zero, 0x5
    /* 3FF54 8004FF54 01000224 */  addiu      $v0, $zero, 0x1
    /* 3FF58 8004FF58 B52082A3 */  sb         $v0, %gp_rel(D_8011C835)($gp)
    /* 3FF5C 8004FF5C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 3FF60 8004FF60 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 3FF64 8004FF64 0800E003 */  jr         $ra
    /* 3FF68 8004FF68 00000000 */   nop
endlabel delta_close_portal__Fi
