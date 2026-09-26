#include "common.h"

INCLUDE_ASM("asm/nonmatchings/fmv_1", _cd_seek);

INCLUDE_ASM("asm/nonmatchings/fmv_1", init_cdstream);

INCLUDE_ASM("asm/nonmatchings/fmv_1", flush_cdstream);

INCLUDE_ASM("asm/nonmatchings/fmv_1", reset_cdstream);

INCLUDE_ASM("asm/nonmatchings/fmv_1", kill_stream_handlers);

INCLUDE_ASM("asm/nonmatchings/fmv_1", stream_cdready_handler);

INCLUDE_ASM("asm/nonmatchings/fmv_1", install_stream_handlers);

INCLUDE_ASM("asm/nonmatchings/fmv_1", cdstream_service);

INCLUDE_ASM("asm/nonmatchings/fmv_1", cdstream_get_chunk);

INCLUDE_ASM("asm/nonmatchings/fmv_1", cdstream_is_last_chunk);

INCLUDE_ASM("asm/nonmatchings/fmv_1", cdstream_discard_chunk);

INCLUDE_ASM("asm/nonmatchings/fmv_1", close_cdstream);

INCLUDE_ASM("asm/nonmatchings/fmv_1", wait_cdstream);

INCLUDE_ASM("asm/nonmatchings/fmv_1", open_cdstream);

INCLUDE_ASM("asm/nonmatchings/fmv_1", set_mdec_img_buffer);

INCLUDE_ASM("asm/nonmatchings/fmv_1", start_mdec_decode);

INCLUDE_ASM("asm/nonmatchings/fmv_1", DCT_out_handler);

INCLUDE_ASM("asm/nonmatchings/fmv_1", init_mdec);

INCLUDE_ASM("asm/nonmatchings/fmv_1", init_mdec_buffer);

INCLUDE_ASM("asm/nonmatchings/fmv_1", split_poly_area);

INCLUDE_ASM("asm/nonmatchings/fmv_1", rebuild_mdec_polys);

INCLUDE_ASM("asm/nonmatchings/fmv_1", clear_mdec_frame);

INCLUDE_ASM("asm/nonmatchings/fmv_1", draw_mdec_polys);

INCLUDE_ASM("asm/nonmatchings/fmv_1", invalidate_mdec_frame);

INCLUDE_ASM("asm/nonmatchings/fmv_1", is_frame_decoded);

INCLUDE_ASM("asm/nonmatchings/fmv_1", init_mdec_polys);

INCLUDE_ASM("asm/nonmatchings/fmv_1", set_mdec_poly_bright);

INCLUDE_ASM("asm/nonmatchings/fmv_1", init_mdec_stream);

INCLUDE_ASM("asm/nonmatchings/fmv_1", init_mdec_audio);

INCLUDE_ASM("asm/nonmatchings/fmv_1", kill_mdec_audio);

INCLUDE_ASM("asm/nonmatchings/fmv_1", stop_mdec_audio);

INCLUDE_ASM("asm/nonmatchings/fmv_1", play_mdec_audio);

INCLUDE_ASM("asm/nonmatchings/fmv_1", set_mdec_audio_volume);

INCLUDE_ASM("asm/nonmatchings/fmv_1", resync_audio);

INCLUDE_ASM("asm/nonmatchings/fmv_1", stop_mdec_stream);

INCLUDE_ASM("asm/nonmatchings/fmv_1", dequeue_stream);

INCLUDE_ASM("asm/nonmatchings/fmv_1", dequeue_animation);

INCLUDE_ASM("asm/nonmatchings/fmv_1", decode_mdec_stream);

INCLUDE_ASM("asm/nonmatchings/fmv_1", play_mdec_stream);

INCLUDE_ASM("asm/nonmatchings/fmv_1", clear_mdec_queue);

INCLUDE_ASM("asm/nonmatchings/fmv_1", StrClearVRAM);

INCLUDE_ASM("asm/nonmatchings/fmv_1", PlayFMVOverLay);

INCLUDE_ASM("asm/nonmatchings/fmv_1", LoPlayFMVOverLay);

INCLUDE_ASM("asm/nonmatchings/fmv_1", GetDown__C4CPad_80158840);
