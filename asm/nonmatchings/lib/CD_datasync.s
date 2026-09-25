.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CD_datasync, 0x168

glabel CD_datasync
    /* C764 8001C764 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* C768 8001C768 2000B2AF */  sw         $s2, 0x20($sp)
    /* C76C 8001C76C 21908000 */  addu       $s2, $a0, $zero
    /* C770 8001C770 FFFF0424 */  addiu      $a0, $zero, -0x1
    /* C774 8001C774 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* C778 8001C778 2800B4AF */  sw         $s4, 0x28($sp)
    /* C77C 8001C77C 2400B3AF */  sw         $s3, 0x24($sp)
    /* C780 8001C780 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* C784 8001C784 1748000C */  jal        VSync
    /* C788 8001C788 1800B0AF */   sw        $s0, 0x18($sp)
    /* C78C 8001C78C 3C00143C */  lui        $s4, (0x3C0000 >> 16)
    /* C790 8001C790 0B80133C */  lui        $s3, %hi(CD_comstr)
    /* C794 8001C794 1C5F7326 */  addiu      $s3, $s3, %lo(CD_comstr)
    /* C798 8001C798 0B80113C */  lui        $s1, %hi(D_800B61D4)
    /* C79C 8001C79C D4613126 */  addiu      $s1, $s1, %lo(D_800B61D4)
    /* C7A0 8001C7A0 0B80103C */  lui        $s0, %hi(CD_intstr)
    /* C7A4 8001C7A4 9C5F1026 */  addiu      $s0, $s0, %lo(CD_intstr)
    /* C7A8 8001C7A8 C0034224 */  addiu      $v0, $v0, 0x3C0
    /* C7AC 8001C7AC 1380013C */  lui        $at, %hi(D_80130158)
    /* C7B0 8001C7B0 580122AC */  sw         $v0, %lo(D_80130158)($at)
    /* C7B4 8001C7B4 1180023C */  lui        $v0, %hi(D_8010E4BC)
    /* C7B8 8001C7B8 BCE44224 */  addiu      $v0, $v0, %lo(D_8010E4BC)
    /* C7BC 8001C7BC 1380013C */  lui        $at, %hi(D_8013015C)
    /* C7C0 8001C7C0 5C0120AC */  sw         $zero, %lo(D_8013015C)($at)
    /* C7C4 8001C7C4 1380013C */  lui        $at, %hi(D_80130160)
    /* C7C8 8001C7C8 600122AC */  sw         $v0, %lo(D_80130160)($at)
  .L8001C7CC:
    /* C7CC 8001C7CC 1748000C */  jal        VSync
    /* C7D0 8001C7D0 FFFF0424 */   addiu     $a0, $zero, -0x1
    /* C7D4 8001C7D4 1380033C */  lui        $v1, %hi(D_80130158)
    /* C7D8 8001C7D8 5801638C */  lw         $v1, %lo(D_80130158)($v1)
    /* C7DC 8001C7DC 00000000 */  nop
    /* C7E0 8001C7E0 2A186200 */  slt        $v1, $v1, $v0
    /* C7E4 8001C7E4 0A006014 */  bnez       $v1, .L8001C810
    /* C7E8 8001C7E8 00000000 */   nop
    /* C7EC 8001C7EC 1380023C */  lui        $v0, %hi(D_8013015C)
    /* C7F0 8001C7F0 5C01428C */  lw         $v0, %lo(D_8013015C)($v0)
    /* C7F4 8001C7F4 00000000 */  nop
    /* C7F8 8001C7F8 21184000 */  addu       $v1, $v0, $zero
    /* C7FC 8001C7FC 01004224 */  addiu      $v0, $v0, 0x1
    /* C800 8001C800 2A188302 */  slt        $v1, $s4, $v1
    /* C804 8001C804 1380013C */  lui        $at, %hi(D_8013015C)
    /* C808 8001C808 1B006010 */  beqz       $v1, .L8001C878
    /* C80C 8001C80C 5C0122AC */   sw        $v0, %lo(D_8013015C)($at)
  .L8001C810:
    /* C810 8001C810 1180043C */  lui        $a0, %hi(D_8010E3B4)
    /* C814 8001C814 7567000C */  jal        puts
    /* C818 8001C818 B4E38424 */   addiu     $a0, $a0, %lo(D_8010E3B4)
    /* C81C 8001C81C 00002492 */  lbu        $a0, 0x0($s1)
    /* C820 8001C820 01002292 */  lbu        $v0, 0x1($s1)
    /* C824 8001C824 1380053C */  lui        $a1, %hi(D_80130160)
    /* C828 8001C828 6001A58C */  lw         $a1, %lo(D_80130160)($a1)
    /* C82C 8001C82C 80100200 */  sll        $v0, $v0, 2
    /* C830 8001C830 21105000 */  addu       $v0, $v0, $s0
    /* C834 8001C834 80200400 */  sll        $a0, $a0, 2
    /* C838 8001C838 0000438C */  lw         $v1, 0x0($v0)
    /* C83C 8001C83C 0B80023C */  lui        $v0, %hi(CD_com)
    /* C840 8001C840 155F4290 */  lbu        $v0, %lo(CD_com)($v0)
    /* C844 8001C844 21209000 */  addu       $a0, $a0, $s0
    /* C848 8001C848 80100200 */  sll        $v0, $v0, 2
    /* C84C 8001C84C 21105300 */  addu       $v0, $v0, $s3
    /* C850 8001C850 1000A3AF */  sw         $v1, 0x10($sp)
    /* C854 8001C854 0000468C */  lw         $a2, 0x0($v0)
    /* C858 8001C858 0000878C */  lw         $a3, 0x0($a0)
    /* C85C 8001C85C 1180043C */  lui        $a0, %hi(D_8010E3C4)
    /* C860 8001C860 9367000C */  jal        printf
    /* C864 8001C864 C4E38424 */   addiu     $a0, $a0, %lo(D_8010E3C4)
    /* C868 8001C868 DD70000C */  jal        CD_flush
    /* C86C 8001C86C 00000000 */   nop
    /* C870 8001C870 1F720008 */  j          .L8001C87C
    /* C874 8001C874 FFFF0224 */   addiu     $v0, $zero, -0x1
  .L8001C878:
    /* C878 8001C878 21100000 */  addu       $v0, $zero, $zero
  .L8001C87C:
    /* C87C 8001C87C 0B004014 */  bnez       $v0, .L8001C8AC
    /* C880 8001C880 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* C884 8001C884 0B80023C */  lui        $v0, %hi(D_800B6200)
    /* C888 8001C888 0062428C */  lw         $v0, %lo(D_800B6200)($v0)
    /* C88C 8001C88C 00000000 */  nop
    /* C890 8001C890 0000428C */  lw         $v0, 0x0($v0)
    /* C894 8001C894 0001033C */  lui        $v1, (0x1000000 >> 16)
    /* C898 8001C898 24104300 */  and        $v0, $v0, $v1
    /* C89C 8001C89C 03004010 */  beqz       $v0, .L8001C8AC
    /* C8A0 8001C8A0 21100000 */   addu      $v0, $zero, $zero
    /* C8A4 8001C8A4 C9FF4012 */  beqz       $s2, .L8001C7CC
    /* C8A8 8001C8A8 01000224 */   addiu     $v0, $zero, 0x1
  .L8001C8AC:
    /* C8AC 8001C8AC 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* C8B0 8001C8B0 2800B48F */  lw         $s4, 0x28($sp)
    /* C8B4 8001C8B4 2400B38F */  lw         $s3, 0x24($sp)
    /* C8B8 8001C8B8 2000B28F */  lw         $s2, 0x20($sp)
    /* C8BC 8001C8BC 1C00B18F */  lw         $s1, 0x1C($sp)
    /* C8C0 8001C8C0 1800B08F */  lw         $s0, 0x18($sp)
    /* C8C4 8001C8C4 0800E003 */  jr         $ra
    /* C8C8 8001C8C8 3000BD27 */   addiu     $sp, $sp, 0x30
endlabel CD_datasync
