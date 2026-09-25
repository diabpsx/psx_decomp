.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StSetStream, 0x84

glabel StSetStream
    /* DEFC 8001DEFC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* DF00 8001DF00 1000B0AF */  sw         $s0, 0x10($sp)
    /* DF04 8001DF04 21808000 */  addu       $s0, $a0, $zero
    /* DF08 8001DF08 1400B1AF */  sw         $s1, 0x14($sp)
    /* DF0C 8001DF0C 2188E000 */  addu       $s1, $a3, $zero
    /* DF10 8001DF10 1800B2AF */  sw         $s2, 0x18($sp)
    /* DF14 8001DF14 3000B28F */  lw         $s2, 0x30($sp)
    /* DF18 8001DF18 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* DF1C 8001DF1C F377000C */  jal        StSetMask
    /* DF20 8001DF20 01000424 */   addiu     $a0, $zero, 0x1
    /* DF24 8001DF24 01001032 */  andi       $s0, $s0, 0x1
    /* DF28 8001DF28 1480013C */  lui        $at, %hi(StEmu_Addr)
    /* DF2C 8001DF2C C89B20AC */  sw         $zero, %lo(StEmu_Addr)($at)
    /* DF30 8001DF30 1380013C */  lui        $at, %hi(StFunc1)
    /* DF34 8001DF34 DC5131AC */  sw         $s1, %lo(StFunc1)($at)
    /* DF38 8001DF38 1380013C */  lui        $at, %hi(StRgb24)
    /* DF3C 8001DF3C D45130AC */  sw         $s0, %lo(StRgb24)($at)
    /* DF40 8001DF40 1380013C */  lui        $at, %hi(CChannel)
    /* DF44 8001DF44 1C5220AC */  sw         $zero, %lo(CChannel)($at)
    /* DF48 8001DF48 1380013C */  lui        $at, %hi(StCHANNEL)
    /* DF4C 8001DF4C 145220AC */  sw         $zero, %lo(StCHANNEL)($at)
    /* DF50 8001DF50 1380013C */  lui        $at, %hi(Stsector_offset)
    /* DF54 8001DF54 D05120A4 */  sh         $zero, %lo(Stsector_offset)($at)
    /* DF58 8001DF58 1380013C */  lui        $at, %hi(Stframe_no)
    /* DF5C 8001DF5C 405020AC */  sw         $zero, %lo(Stframe_no)($at)
    /* DF60 8001DF60 1380013C */  lui        $at, %hi(StFunc2)
    /* DF64 8001DF64 E05132AC */  sw         $s2, %lo(StFunc2)($at)
    /* DF68 8001DF68 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* DF6C 8001DF6C 1800B28F */  lw         $s2, 0x18($sp)
    /* DF70 8001DF70 1400B18F */  lw         $s1, 0x14($sp)
    /* DF74 8001DF74 1000B08F */  lw         $s0, 0x10($sp)
    /* DF78 8001DF78 0800E003 */  jr         $ra
    /* DF7C 8001DF7C 2000BD27 */   addiu     $sp, $sp, 0x20
endlabel StSetStream
    /* DF80 8001DF80 00000000 */  nop
    /* DF84 8001DF84 00000000 */  nop
    /* DF88 8001DF88 00000000 */  nop
