#include "common.h"

INCLUDE_ASM("asm/nonmatchings/memcard_1", endian_swap__FPUci);

INCLUDE_ASM("asm/nonmatchings/memcard_1", sjis_endian_swap__FPUci);

INCLUDE_ASM("asm/nonmatchings/memcard_1", to_sjis__Fc);

INCLUDE_ASM("asm/nonmatchings/memcard_1", to_ascii__FUs);

INCLUDE_ASM("asm/nonmatchings/memcard_1", ascii_to_sjis__FPUcPUs);

INCLUDE_ASM("asm/nonmatchings/memcard_1", is_sjis__FPUc);

INCLUDE_ASM("asm/nonmatchings/memcard_1", sjis_to_ascii__FPUsPc);

INCLUDE_ASM("asm/nonmatchings/memcard_1", read_card_directory__Fi);

INCLUDE_ASM("asm/nonmatchings/memcard_1", test_card_format__Fi);

INCLUDE_ASM("asm/nonmatchings/memcard_1", checksum_data__FPci);

INCLUDE_ASM("asm/nonmatchings/memcard_1", delete_card_file__Fii);

INCLUDE_ASM("asm/nonmatchings/memcard_1", read_card_file__FiiiPc);

INCLUDE_ASM("asm/nonmatchings/memcard_1", format_card__Fi);

INCLUDE_ASM("asm/nonmatchings/memcard_1", write_card_file__FiiPcT2PUcPUsiT4);

INCLUDE_ASM("asm/nonmatchings/memcard_1", new_card__Fi);

INCLUDE_ASM("asm/nonmatchings/memcard_1", service_card__Fi);
