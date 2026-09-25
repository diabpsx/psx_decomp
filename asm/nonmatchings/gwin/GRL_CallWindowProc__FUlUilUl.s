.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GRL_CallWindowProc__FUlUilUl, 0x28

glabel GRL_CallWindowProc__FUlUilUl
    /* 6B22C 8007B22C 4C21828F */  lw         $v0, %gp_rel(D_8011C8CC)($gp)
    /* 6B230 8007B230 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 6B234 8007B234 03004010 */  beqz       $v0, .L8007B244
    /* 6B238 8007B238 1000BFAF */   sw        $ra, 0x10($sp)
    /* 6B23C 8007B23C 09F84000 */  jalr       $v0
    /* 6B240 8007B240 00000000 */   nop
  .L8007B244:
    /* 6B244 8007B244 1000BF8F */  lw         $ra, 0x10($sp)
    /* 6B248 8007B248 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 6B24C 8007B24C 0800E003 */  jr         $ra
    /* 6B250 8007B250 00000000 */   nop
endlabel GRL_CallWindowProc__FUlUilUl
