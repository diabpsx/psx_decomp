.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _spu_FsetPCR, 0x58

glabel _spu_FsetPCR
    /* 720C 8001720C 0B80053C */  lui        $a1, %hi(D_800B5A5C)
    /* 7210 80017210 5C5AA58C */  lw         $a1, %lo(D_800B5A5C)($a1)
    /* 7214 80017214 F8FF033C */  lui        $v1, (0xFFF8FFFF >> 16)
    /* 7218 80017218 0000A28C */  lw         $v0, 0x0($a1)
    /* 721C 8001721C FFFF6334 */  ori        $v1, $v1, (0xFFF8FFFF & 0xFFFF)
    /* 7220 80017220 24104300 */  and        $v0, $v0, $v1
    /* 7224 80017224 07008010 */  beqz       $a0, .L80017244
    /* 7228 80017228 0000A2AC */   sw        $v0, 0x0($a1)
    /* 722C 8001722C 0B80023C */  lui        $v0, %hi(D_800B5A5C)
    /* 7230 80017230 5C5A428C */  lw         $v0, %lo(D_800B5A5C)($v0)
    /* 7234 80017234 00000000 */  nop
    /* 7238 80017238 0000438C */  lw         $v1, 0x0($v0)
    /* 723C 8001723C 965C0008 */  j          .L80017258
    /* 7240 80017240 0300043C */   lui       $a0, (0x30000 >> 16)
  .L80017244:
    /* 7244 80017244 0B80023C */  lui        $v0, %hi(D_800B5A5C)
    /* 7248 80017248 5C5A428C */  lw         $v0, %lo(D_800B5A5C)($v0)
    /* 724C 8001724C 00000000 */  nop
    /* 7250 80017250 0000438C */  lw         $v1, 0x0($v0)
    /* 7254 80017254 0500043C */  lui        $a0, (0x50000 >> 16)
  .L80017258:
    /* 7258 80017258 25186400 */  or         $v1, $v1, $a0
    /* 725C 8001725C 0800E003 */  jr         $ra
    /* 7260 80017260 000043AC */   sw        $v1, 0x0($v0)
endlabel _spu_FsetPCR
