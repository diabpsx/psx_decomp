.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_StartFadeout__FiiUc, 0x150

glabel M_StartFadeout__FiiUc
    /* 12B54 8014C74C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 12B58 8014C750 1000B0AF */  sw         $s0, 0x10($sp)
    /* 12B5C 8014C754 21808000 */  addu       $s0, $a0, $zero
    /* 12B60 8014C758 1800B2AF */  sw         $s2, 0x18($sp)
    /* 12B64 8014C75C 2190A000 */  addu       $s2, $a1, $zero
    /* 12B68 8014C760 40101000 */  sll        $v0, $s0, 1
    /* 12B6C 8014C764 21105000 */  addu       $v0, $v0, $s0
    /* 12B70 8014C768 80100200 */  sll        $v0, $v0, 2
    /* 12B74 8014C76C 21105000 */  addu       $v0, $v0, $s0
    /* 12B78 8014C770 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 12B7C 8014C774 C0980200 */  sll        $s3, $v0, 3
    /* 12B80 8014C778 1400B1AF */  sw         $s1, 0x14($sp)
    /* 12B84 8014C77C 2188C000 */  addu       $s1, $a2, $zero
    /* 12B88 8014C780 21304002 */  addu       $a2, $s2, $zero
    /* 12B8C 8014C784 2000BFAF */  sw         $ra, 0x20($sp)
    /* 12B90 8014C788 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 12B94 8014C78C 21083300 */  addu       $at, $at, $s3
    /* 12B98 8014C790 F453258C */  lw         $a1, %lo(monster + 0x60)($at)
    /* 12B9C 8014C794 05000724 */  addiu      $a3, $zero, 0x5
    /* 12BA0 8014C798 3FFD010C */  jal        NewMonsterAnim__FiR10AnimStructii
    /* 12BA4 8014C79C 0E00A524 */   addiu     $a1, $a1, 0xE
    /* 12BA8 8014C7A0 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 12BAC 8014C7A4 21083300 */  addu       $at, $at, $s3
    /* 12BB0 8014C7A8 C8532390 */  lbu        $v1, %lo(monster + 0x34)($at)
    /* 12BB4 8014C7AC 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 12BB8 8014C7B0 21083300 */  addu       $at, $at, $s3
    /* 12BBC 8014C7B4 C9532590 */  lbu        $a1, %lo(monster + 0x35)($at)
    /* 12BC0 8014C7B8 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 12BC4 8014C7BC 21083300 */  addu       $at, $at, $s3
    /* 12BC8 8014C7C0 C8532690 */  lbu        $a2, %lo(monster + 0x34)($at)
    /* 12BCC 8014C7C4 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 12BD0 8014C7C8 21083300 */  addu       $at, $at, $s3
    /* 12BD4 8014C7CC C9532790 */  lbu        $a3, %lo(monster + 0x35)($at)
    /* 12BD8 8014C7D0 09000224 */  addiu      $v0, $zero, 0x9
    /* 12BDC 8014C7D4 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 12BE0 8014C7D8 21083300 */  addu       $at, $at, $s3
    /* 12BE4 8014C7DC C75322A0 */  sb         $v0, %lo(monster + 0x33)($at)
    /* 12BE8 8014C7E0 1080013C */  lui        $at, %hi(monster + 0x3A)
    /* 12BEC 8014C7E4 21083300 */  addu       $at, $at, $s3
    /* 12BF0 8014C7E8 CE5320A0 */  sb         $zero, %lo(monster + 0x3A)($at)
    /* 12BF4 8014C7EC 1080013C */  lui        $at, %hi(monster + 0x3B)
    /* 12BF8 8014C7F0 21083300 */  addu       $at, $at, $s3
    /* 12BFC 8014C7F4 CF5320A0 */  sb         $zero, %lo(monster + 0x3B)($at)
    /* 12C00 8014C7F8 1080013C */  lui        $at, %hi(monster + 0x36)
    /* 12C04 8014C7FC 21083300 */  addu       $at, $at, $s3
    /* 12C08 8014C800 CA5323A0 */  sb         $v1, %lo(monster + 0x36)($at)
    /* 12C0C 8014C804 1080013C */  lui        $at, %hi(monster + 0x37)
    /* 12C10 8014C808 21083300 */  addu       $at, $at, $s3
    /* 12C14 8014C80C CB5325A0 */  sb         $a1, %lo(monster + 0x37)($at)
    /* 12C18 8014C810 1080013C */  lui        $at, %hi(monster + 0x38)
    /* 12C1C 8014C814 21083300 */  addu       $at, $at, $s3
    /* 12C20 8014C818 CC5326A0 */  sb         $a2, %lo(monster + 0x38)($at)
    /* 12C24 8014C81C 1080013C */  lui        $at, %hi(monster + 0x39)
    /* 12C28 8014C820 21083300 */  addu       $at, $at, $s3
    /* 12C2C 8014C824 CD5327A0 */  sb         $a3, %lo(monster + 0x39)($at)
    /* 12C30 8014C828 D5FC010C */  jal        M_CheckEFlag__Fi
    /* 12C34 8014C82C 21200002 */   addu      $a0, $s0, $zero
    /* 12C38 8014C830 FF003132 */  andi       $s1, $s1, 0xFF
    /* 12C3C 8014C834 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 12C40 8014C838 21083300 */  addu       $at, $at, $s3
    /* 12C44 8014C83C D05332A0 */  sb         $s2, %lo(monster + 0x3C)($at)
    /* 12C48 8014C840 0E002012 */  beqz       $s1, .L8014C87C
    /* 12C4C 8014C844 00000000 */   nop
    /* 12C50 8014C848 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 12C54 8014C84C 21083300 */  addu       $at, $at, $s3
    /* 12C58 8014C850 C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 12C5C 8014C854 1080013C */  lui        $at, %hi(monster + 0x40)
    /* 12C60 8014C858 21083300 */  addu       $at, $at, $s3
    /* 12C64 8014C85C D4532390 */  lbu        $v1, %lo(monster + 0x40)($at)
    /* 12C68 8014C860 02004234 */  ori        $v0, $v0, 0x2
    /* 12C6C 8014C864 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 12C70 8014C868 21083300 */  addu       $at, $at, $s3
    /* 12C74 8014C86C C05322A4 */  sh         $v0, %lo(monster + 0x2C)($at)
    /* 12C78 8014C870 1080013C */  lui        $at, %hi(monster + 0x41)
    /* 12C7C 8014C874 21083300 */  addu       $at, $at, $s3
    /* 12C80 8014C878 D55323A0 */  sb         $v1, %lo(monster + 0x41)($at)
  .L8014C87C:
    /* 12C84 8014C87C 2000BF8F */  lw         $ra, 0x20($sp)
    /* 12C88 8014C880 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 12C8C 8014C884 1800B28F */  lw         $s2, 0x18($sp)
    /* 12C90 8014C888 1400B18F */  lw         $s1, 0x14($sp)
    /* 12C94 8014C88C 1000B08F */  lw         $s0, 0x10($sp)
    /* 12C98 8014C890 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 12C9C 8014C894 0800E003 */  jr         $ra
    /* 12CA0 8014C898 00000000 */   nop
endlabel M_StartFadeout__FiiUc
