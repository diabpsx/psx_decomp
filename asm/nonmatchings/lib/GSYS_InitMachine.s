.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GSYS_InitMachine, 0x54

glabel GSYS_InitMachine
    /* 111E0 800211E0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 111E4 800211E4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 111E8 800211E8 9F48000C */  jal        ResetCallback
    /* 111EC 800211EC 00000000 */   nop
    /* 111F0 800211F0 01000234 */  ori        $v0, $zero, 0x1
    /* 111F4 800211F4 1280043C */  lui        $a0, %hi(GSYS_MemEnd)
    /* 111F8 800211F8 D0AA848C */  lw         $a0, %lo(GSYS_MemEnd)($a0)
    /* 111FC 800211FC 0B80053C */  lui        $a1, %hi(_stacksize)
    /* 11200 80021200 B442A58C */  lw         $a1, %lo(_stacksize)($a1)
    /* 11204 80021204 1680033C */  lui        $v1, %hi(D_80163E20)
    /* 11208 80021208 203E6324 */  addiu      $v1, $v1, %lo(D_80163E20)
    /* 1120C 8002120C 0B80013C */  lui        $at, %hi(WorkMemInfo)
    /* 11210 80021210 946323AC */  sw         $v1, %lo(WorkMemInfo)($at)
    /* 11214 80021214 23208300 */  subu       $a0, $a0, $v1
    /* 11218 80021218 23208500 */  subu       $a0, $a0, $a1
    /* 1121C 8002121C 0B80013C */  lui        $at, %hi(WorkMemInfo + 0x4)
    /* 11220 80021220 986324AC */  sw         $a0, %lo(WorkMemInfo + 0x4)($at)
    /* 11224 80021224 1000BF8F */  lw         $ra, 0x10($sp)
    /* 11228 80021228 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1122C 8002122C 0800E003 */  jr         $ra
    /* 11230 80021230 00000000 */   nop
endlabel GSYS_InitMachine
