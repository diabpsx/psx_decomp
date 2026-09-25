.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RGBFC, 0x4

glabel RGBFC
    /* 230 80010230 50000000 */  .word      0x00000050                    # mfhi       $zero # 00000040 <InstrIdType: CPU_SPECIAL>
endlabel RGBFC
