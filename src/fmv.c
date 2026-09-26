#include "common.h"

INCLUDE_ASM("asm/nonmatchings/fmv", _cd_seek);

INCLUDE_ASM("asm/nonmatchings/fmv", init_cdstream);

INCLUDE_ASM("asm/nonmatchings/fmv", flush_cdstream);

INCLUDE_ASM("asm/nonmatchings/fmv", reset_cdstream);

INCLUDE_ASM("asm/nonmatchings/fmv", kill_stream_handlers);

INCLUDE_ASM("asm/nonmatchings/fmv", stream_cdready_handler);

INCLUDE_ASM("asm/nonmatchings/fmv", install_stream_handlers);

INCLUDE_ASM("asm/nonmatchings/fmv", cdstream_service);

INCLUDE_ASM("asm/nonmatchings/fmv", cdstream_get_chunk);

INCLUDE_ASM("asm/nonmatchings/fmv", cdstream_is_last_chunk);

INCLUDE_ASM("asm/nonmatchings/fmv", cdstream_discard_chunk);

INCLUDE_ASM("asm/nonmatchings/fmv", close_cdstream);

INCLUDE_ASM("asm/nonmatchings/fmv", wait_cdstream);

INCLUDE_ASM("asm/nonmatchings/fmv", open_cdstream);

INCLUDE_ASM("asm/nonmatchings/fmv", set_mdec_img_buffer);

INCLUDE_ASM("asm/nonmatchings/fmv", start_mdec_decode);

INCLUDE_ASM("asm/nonmatchings/fmv", DCT_out_handler);

INCLUDE_ASM("asm/nonmatchings/fmv", init_mdec);

INCLUDE_ASM("asm/nonmatchings/fmv", init_mdec_buffer);

INCLUDE_ASM("asm/nonmatchings/fmv", split_poly_area);

INCLUDE_ASM("asm/nonmatchings/fmv", rebuild_mdec_polys);

INCLUDE_ASM("asm/nonmatchings/fmv", clear_mdec_frame);

INCLUDE_ASM("asm/nonmatchings/fmv", draw_mdec_polys);

INCLUDE_ASM("asm/nonmatchings/fmv", invalidate_mdec_frame);

INCLUDE_ASM("asm/nonmatchings/fmv", is_frame_decoded);

INCLUDE_ASM("asm/nonmatchings/fmv", init_mdec_polys);

INCLUDE_ASM("asm/nonmatchings/fmv", set_mdec_poly_bright);
