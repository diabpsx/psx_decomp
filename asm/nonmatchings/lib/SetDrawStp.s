.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetDrawStp, 0x28

glabel SetDrawStp
    /* 4860 80014860 02000224 */  addiu      $v0, $zero, 0x2
    /* 4864 80014864 0400A010 */  beqz       $a1, .L80014878
    /* 4868 80014868 030082A0 */   sb        $v0, 0x3($a0)
    /* 486C 8001486C 00E6023C */  lui        $v0, (0xE6000001 >> 16)
    /* 4870 80014870 1F520008 */  j          .L8001487C
    /* 4874 80014874 01004234 */   ori       $v0, $v0, (0xE6000001 & 0xFFFF)
  .L80014878:
    /* 4878 80014878 00E6023C */  lui        $v0, (0xE6000000 >> 16)
  .L8001487C:
    /* 487C 8001487C 040082AC */  sw         $v0, 0x4($a0)
    /* 4880 80014880 0800E003 */  jr         $ra
    /* 4884 80014884 080080AC */   sw        $zero, 0x8($a0)
endlabel SetDrawStp
