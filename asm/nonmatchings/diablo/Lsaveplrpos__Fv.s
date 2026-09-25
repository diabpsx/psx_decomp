.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Lsaveplrpos__Fv, 0xAC

glabel Lsaveplrpos__Fv
    /* 29174 80039174 1280023C */  lui        $v0, %hi(ViewX)
    /* 29178 80039178 14C1428C */  lw         $v0, %lo(ViewX)($v0)
    /* 2917C 8003917C 1280033C */  lui        $v1, %hi(ViewY)
    /* 29180 80039180 18C1638C */  lw         $v1, %lo(ViewY)($v1)
    /* 29184 80039184 0E80043C */  lui        $a0, %hi(plr + 0x1A18)
    /* 29188 80039188 50BF8494 */  lhu        $a0, %lo(plr + 0x1A18)($a0)
    /* 2918C 8003918C 0E80053C */  lui        $a1, %hi(plr + 0x1A1A)
    /* 29190 80039190 52BFA594 */  lhu        $a1, %lo(plr + 0x1A1A)($a1)
    /* 29194 80039194 0E80063C */  lui        $a2, %hi(plr + 0x30)
    /* 29198 80039198 68A5C694 */  lhu        $a2, %lo(plr + 0x30)($a2)
    /* 2919C 8003919C 0E80073C */  lui        $a3, %hi(plr + 0x32)
    /* 291A0 800391A0 6AA5E794 */  lhu        $a3, %lo(plr + 0x32)($a3)
    /* 291A4 800391A4 0E80083C */  lui        $t0, %hi(plr + 0x1A05)
    /* 291A8 800391A8 3DBF0891 */  lbu        $t0, %lo(plr + 0x1A05)($t0)
    /* 291AC 800391AC 0E80013C */  lui        $at, %hi(plr + 0x1B3E)
    /* 291B0 800391B0 76C022A4 */  sh         $v0, %lo(plr + 0x1B3E)($at)
    /* 291B4 800391B4 0E80013C */  lui        $at, %hi(plr + 0x1B40)
    /* 291B8 800391B8 78C023A4 */  sh         $v1, %lo(plr + 0x1B40)($at)
    /* 291BC 800391BC 0E80013C */  lui        $at, %hi(plr + 0x1B42)
    /* 291C0 800391C0 7AC024A4 */  sh         $a0, %lo(plr + 0x1B42)($at)
    /* 291C4 800391C4 0E80013C */  lui        $at, %hi(plr + 0x1B44)
    /* 291C8 800391C8 7CC025A4 */  sh         $a1, %lo(plr + 0x1B44)($at)
    /* 291CC 800391CC 0E80013C */  lui        $at, %hi(plr + 0x1B46)
    /* 291D0 800391D0 7EC026A4 */  sh         $a2, %lo(plr + 0x1B46)($at)
    /* 291D4 800391D4 0E80013C */  lui        $at, %hi(plr + 0x1B48)
    /* 291D8 800391D8 80C027A4 */  sh         $a3, %lo(plr + 0x1B48)($at)
    /* 291DC 800391DC 05000011 */  beqz       $t0, .L800391F4
    /* 291E0 800391E0 00000000 */   nop
    /* 291E4 800391E4 0E80013C */  lui        $at, %hi(plr + 0x1A1A)
    /* 291E8 800391E8 52BF20A4 */  sh         $zero, %lo(plr + 0x1A1A)($at)
    /* 291EC 800391EC 0E80013C */  lui        $at, %hi(plr + 0x1A18)
    /* 291F0 800391F0 50BF20A4 */  sh         $zero, %lo(plr + 0x1A18)($at)
  .L800391F4:
    /* 291F4 800391F4 0E80023C */  lui        $v0, %hi(plr + 0x1D)
    /* 291F8 800391F8 55A54290 */  lbu        $v0, %lo(plr + 0x1D)($v0)
    /* 291FC 800391FC 00000000 */  nop
    /* 29200 80039200 05004010 */  beqz       $v0, .L80039218
    /* 29204 80039204 00000000 */   nop
    /* 29208 80039208 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 2920C 8003920C 6AA520A4 */  sh         $zero, %lo(plr + 0x32)($at)
    /* 29210 80039210 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 29214 80039214 68A520A4 */  sh         $zero, %lo(plr + 0x30)($at)
  .L80039218:
    /* 29218 80039218 0800E003 */  jr         $ra
    /* 2921C 8003921C 00000000 */   nop
endlabel Lsaveplrpos__Fv
