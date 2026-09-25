.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddLamp__Fiii, 0x40

glabel AddLamp__Fiii
    /* 4F984 8005F984 1280023C */  lui        $v0, %hi(leveltype)
    /* 4F988 8005F988 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 4F98C 8005F98C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 4F990 8005F990 1000BFAF */  sw         $ra, 0x10($sp)
    /* 4F994 8005F994 1280013C */  lui        $at, %hi(level_lamp)
    /* 4F998 8005F998 21082200 */  addu       $at, $at, $v0
    /* 4F99C 8005F99C 0CB92280 */  lb         $v0, %lo(level_lamp)($at)
    /* 4F9A0 8005F9A0 00000000 */  nop
    /* 4F9A4 8005F9A4 03004010 */  beqz       $v0, .L8005F9B4
    /* 4F9A8 8005F9A8 00000000 */   nop
    /* 4F9AC 8005F9AC BA34010C */  jal        AddLight__Fiii
    /* 4F9B0 8005F9B0 00000000 */   nop
  .L8005F9B4:
    /* 4F9B4 8005F9B4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 4F9B8 8005F9B8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 4F9BC 8005F9BC 0800E003 */  jr         $ra
    /* 4F9C0 8005F9C0 00000000 */   nop
endlabel AddLamp__Fiii
