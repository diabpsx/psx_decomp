.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8001578C, 0x48

glabel func_8001578C
    /* 578C 8001578C 0004033C */  lui        $v1, (0x4000002 >> 16)
    /* 5790 80015790 0B80023C */  lui        $v0, %hi(D_800B5584)
    /* 5794 80015794 8455428C */  lw         $v0, %lo(D_800B5584)($v0)
    /* 5798 80015798 02006334 */  ori        $v1, $v1, (0x4000002 & 0xFFFF)
    /* 579C 8001579C 000043AC */  sw         $v1, 0x0($v0)
    /* 57A0 800157A0 0B80023C */  lui        $v0, %hi(D_800B5588)
    /* 57A4 800157A4 8855428C */  lw         $v0, %lo(D_800B5588)($v0)
    /* 57A8 800157A8 00000000 */  nop
    /* 57AC 800157AC 000044AC */  sw         $a0, 0x0($v0)
    /* 57B0 800157B0 0B80023C */  lui        $v0, %hi(D_800B558C)
    /* 57B4 800157B4 8C55428C */  lw         $v0, %lo(D_800B558C)($v0)
    /* 57B8 800157B8 0001033C */  lui        $v1, (0x1000401 >> 16)
    /* 57BC 800157BC 000040AC */  sw         $zero, 0x0($v0)
    /* 57C0 800157C0 0B80023C */  lui        $v0, %hi(D_800B5590)
    /* 57C4 800157C4 9055428C */  lw         $v0, %lo(D_800B5590)($v0)
    /* 57C8 800157C8 01046334 */  ori        $v1, $v1, (0x1000401 & 0xFFFF)
    /* 57CC 800157CC 0800E003 */  jr         $ra
    /* 57D0 800157D0 000043AC */   sw        $v1, 0x0($v0)
endlabel func_8001578C
