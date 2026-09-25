.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetDispEnv, 0x34

glabel GetDispEnv
    /* 46DC 800146DC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 46E0 800146E0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 46E4 800146E4 21808000 */  addu       $s0, $a0, $zero
    /* 46E8 800146E8 0B80053C */  lui        $a1, %hi(D_800B5518)
    /* 46EC 800146EC 1855A524 */  addiu      $a1, $a1, %lo(D_800B5518)
    /* 46F0 800146F0 1400BFAF */  sw         $ra, 0x14($sp)
    /* 46F4 800146F4 8B67000C */  jal        memcpy
    /* 46F8 800146F8 14000624 */   addiu     $a2, $zero, 0x14
    /* 46FC 800146FC 21100002 */  addu       $v0, $s0, $zero
    /* 4700 80014700 1400BF8F */  lw         $ra, 0x14($sp)
    /* 4704 80014704 1000B08F */  lw         $s0, 0x10($sp)
    /* 4708 80014708 0800E003 */  jr         $ra
    /* 470C 8001470C 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel GetDispEnv
