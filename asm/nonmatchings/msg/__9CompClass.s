.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __9CompClass, 0x14

glabel __9CompClass
    /* 42A90 80052A90 21108000 */  addu       $v0, $a0, $zero
    /* 42A94 80052A94 1180033C */  lui        $v1, %hi(D_80116850)
    /* 42A98 80052A98 50686324 */  addiu      $v1, $v1, %lo(D_80116850)
    /* 42A9C 80052A9C 0800E003 */  jr         $ra
    /* 42AA0 80052AA0 000043AC */   sw        $v1, 0x0($v0)
endlabel __9CompClass
