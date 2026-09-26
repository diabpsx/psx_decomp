.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching play_mdec_stream, 0x9C

glabel play_mdec_stream
    /* 1E5D8 801581D0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1E5DC 801581D4 4C0D898F */  lw         $t1, %gp_rel(mdec_head)($gp)
    /* 1E5E0 801581D8 580D8A8F */  lw         $t2, %gp_rel(mdecs_queued)($gp)
    /* 1E5E4 801581DC 1580033C */  lui        $v1, %hi(mdec_queue)
    /* 1E5E8 801581E0 5C5C6324 */  addiu      $v1, $v1, %lo(mdec_queue)
    /* 1E5EC 801581E4 80100900 */  sll        $v0, $t1, 2
    /* 1E5F0 801581E8 21104900 */  addu       $v0, $v0, $t1
    /* 1E5F4 801581EC 80100200 */  sll        $v0, $v0, 2
    /* 1E5F8 801581F0 21184300 */  addu       $v1, $v0, $v1
    /* 1E5FC 801581F4 10004229 */  slti       $v0, $t2, 0x10
    /* 1E600 801581F8 18004010 */  beqz       $v0, .L8015825C
    /* 1E604 801581FC 1000BFAF */   sw        $ra, 0x10($sp)
    /* 1E608 80158200 01002825 */  addiu      $t0, $t1, 0x1
    /* 1E60C 80158204 5C0D828F */  lw         $v0, %gp_rel(mdecs_waiting)($gp)
    /* 1E610 80158208 000064AC */  sw         $a0, 0x0($v1)
    /* 1E614 8015820C 040065AC */  sw         $a1, 0x4($v1)
    /* 1E618 80158210 080066AC */  sw         $a2, 0x8($v1)
    /* 1E61C 80158214 0C0067AC */  sw         $a3, 0xC($v1)
    /* 1E620 80158218 100060AC */  sw         $zero, 0x10($v1)
    /* 1E624 8015821C 01004325 */  addiu      $v1, $t2, 0x1
    /* 1E628 80158220 580D83AF */  sw         $v1, %gp_rel(mdecs_queued)($gp)
    /* 1E62C 80158224 01004224 */  addiu      $v0, $v0, 0x1
    /* 1E630 80158228 5C0D82AF */  sw         $v0, %gp_rel(mdecs_waiting)($gp)
    /* 1E634 8015822C 02000105 */  bgez       $t0, .L80158238
    /* 1E638 80158230 21580001 */   addu      $t3, $t0, $zero
    /* 1E63C 80158234 10002B25 */  addiu      $t3, $t1, 0x10
  .L80158238:
    /* 1E640 80158238 03110B00 */  sra        $v0, $t3, 4
    /* 1E644 8015823C 00110200 */  sll        $v0, $v0, 4
    /* 1E648 80158240 380D838F */  lw         $v1, %gp_rel(mdec_streaming)($gp)
    /* 1E64C 80158244 23100201 */  subu       $v0, $t0, $v0
    /* 1E650 80158248 4C0D82AF */  sw         $v0, %gp_rel(mdec_head)($gp)
    /* 1E654 8015824C 03006014 */  bnez       $v1, .L8015825C
    /* 1E658 80158250 00000000 */   nop
    /* 1E65C 80158254 905F050C */  jal        dequeue_animation
    /* 1E660 80158258 00000000 */   nop
  .L8015825C:
    /* 1E664 8015825C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1E668 80158260 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1E66C 80158264 0800E003 */  jr         $ra
    /* 1E670 80158268 00000000 */   nop
endlabel play_mdec_stream
