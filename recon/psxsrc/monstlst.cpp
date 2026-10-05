/* MONSTLST.CPP � retail monster choices, per-list monster IDs and level links. */
#include "diabpsx_types.h"

struct MonstList {
    unsigned short NumOfMonsters;
    unsigned short TexNum;
    unsigned char *TheList;
    char *ListName;
    unsigned long QuestBits;
};
struct MonstLevel {
    int NumOfLists;
    MonstList *TheLists;
};

static unsigned char NumsLEV1M1A[4] = { 24, 6, 18, 16 }; /* @0x8011A780 */

static unsigned char NumsLEV1M1B[4] = { 24, 17, 7, 16 }; /* @0x8011A784 */

static unsigned char NumsLEV1M1C[5] = { 24, 17, 7, 16, 18 }; /* @0x8011A788 */

static unsigned char NumsLEV2M2A[4] = { 24, 6, 18, 16 }; /* @0x8011A790 */

static unsigned char NumsLEV2M2B[4] = { 24, 6, 18, 1 }; /* @0x8011A794 */

static unsigned char NumsLEV2M2C[3] = { 17, 7, 21 }; /* @0x8011A798 */

static unsigned char NumsLEV2M2D[4] = { 28, 21, 17, 16 }; /* @0x8011A79C */

static unsigned char NumsLEV2M2QA[4] = { 9, 24, 6, 18 }; /* @0x8011A7A0 */

static unsigned char NumsLEV2M2QB[4] = { 12, 11, 6, 7 }; /* @0x8011A7A4 */

static unsigned char NumsLEV3M3A[4] = { 24, 6, 18, 16 }; /* @0x8011A7A8 */

static unsigned char NumsLEV3M3B[4] = { 17, 1, 21, 24 }; /* @0x8011A7AC */

static unsigned char NumsLEV3M3C[4] = { 28, 1, 6, 7 }; /* @0x8011A7B0 */

static unsigned char NumsLEV3M3QA[4] = { 19, 18, 28, 17 }; /* @0x8011A7B4 */

static unsigned char NumsLEV4M4A[4] = { 24, 6, 18, 16 }; /* @0x8011A7B8 */

static unsigned char NumsLEV4M4B[4] = { 11, 16, 21, 24 }; /* @0x8011A7BC */

static unsigned char NumsLEV4M4C[4] = { 1, 17, 7, 21 }; /* @0x8011A7C0 */

static unsigned char NumsLEV4M4D[4] = { 7, 28, 16, 21 }; /* @0x8011A7C4 */

static unsigned char NumsLEV4M4QA[4] = { 12, 6, 18, 16 }; /* @0x8011A7C8 */

static unsigned char NumsLEV4M4QB[5] = { 12, 6, 7, 8, 16 }; /* @0x8011A7CC */

static unsigned char NumsLEV4M4QC[5] = { 12, 6, 7, 8, 16 }; /* @0x8011A7D4 */

static unsigned char NumsLEV5M5A[4] = { 24, 6, 18, 16 }; /* @0x8011A7DC */

static unsigned char NumsLEV5M5B[4] = { 17, 16, 8, 6 }; /* @0x8011A7E0 */

static unsigned char NumsLEV5M5C[4] = { 7, 28, 1, 21 }; /* @0x8011A7E4 */

static unsigned char NumsLEV5M5D[4] = { 12, 1, 18, 16 }; /* @0x8011A7E8 */

static unsigned char NumsLEV5M5E[4] = { 10, 1, 24, 16 }; /* @0x8011A7EC */

static unsigned char NumsLEV5M5F[3] = { 10, 11, 1 }; /* @0x8011A7F0 */

static unsigned char NumsLEV5M5QA[4] = { 27, 12, 6, 1 }; /* @0x8011A7F4 */

static unsigned char NumsLEV6M6A[5] = { 16, 28, 18, 21, 12 }; /* @0x8011A7F8 */

static unsigned char NumsLEV6M6B[3] = { 21, 1, 11 }; /* @0x8011A800 */

static unsigned char NumsLEV6M6C[4] = { 0, 1, 28, 12 }; /* @0x8011A804 */

static unsigned char NumsLEV6M6D[3] = { 8, 0, 28 }; /* @0x8011A808 */

static unsigned char NumsLEV6M6E[3] = { 0, 21, 18 }; /* @0x8011A80C */

static unsigned char NumsLEV6M6QA[3] = { 21, 18, 27 }; /* @0x8011A810 */

static unsigned char NumsLEV7M7A[4] = { 12, 21, 1, 8 }; /* @0x8011A814 */

static unsigned char NumsLEV7M7B[4] = { 27, 1, 0, 21 }; /* @0x8011A818 */

static unsigned char NumsLEV7M7C[4] = { 10, 11, 1, 21 }; /* @0x8011A81C */

static unsigned char NumsLEV7M7D[3] = { 10, 0, 21 }; /* @0x8011A820 */

static unsigned char NumsLEV7M7E[3] = { 11, 8, 21 }; /* @0x8011A824 */

static unsigned char NumsLEV8M8A[2] = { 21, 0 }; /* @0x8011A828 */

static unsigned char NumsLEV8M8B[4] = { 0, 11, 15, 1 }; /* @0x8011A82C */

static unsigned char NumsLEV8M8C[3] = { 15, 8, 21 }; /* @0x8011A830 */

static unsigned char NumsLEV8M8D[2] = { 15, 12 }; /* @0x8011A834 */

static unsigned char NumsLEV8M8QA[2] = { 14, 11 }; /* @0x8011A838 */

static unsigned char NumsLEV9M9A[4] = { 21, 12, 27, 0 }; /* @0x8011A83C */

static unsigned char NumsLEV9M9B[3] = { 0, 8, 10 }; /* @0x8011A840 */

static unsigned char NumsLEV9M9C[2] = { 30, 27 }; /* @0x8011A844 */

static unsigned char NumsLEV9M9D[2] = { 30, 15 }; /* @0x8011A848 */

static unsigned char NumsLEV10M10A[3] = { 21, 8, 0 }; /* @0x8011A84C */

static unsigned char NumsLEV10M10B[3] = { 8, 27, 0 }; /* @0x8011A850 */

static unsigned char NumsLEV10M10C[2] = { 30, 15 }; /* @0x8011A854 */

static unsigned char NumsLEV10M10D[2] = { 30, 10 }; /* @0x8011A858 */

static unsigned char NumsLEV10M10QA[3] = { 27, 11, 21 }; /* @0x8011A85C */

static unsigned char NumsLEV11M11A[3] = { 8, 15, 0 }; /* @0x8011A860 */

static unsigned char NumsLEV11M11B[3] = { 27, 0, 20 }; /* @0x8011A864 */

static unsigned char NumsLEV11M11C[3] = { 30, 0, 20 }; /* @0x8011A868 */

static unsigned char NumsLEV11M11D[2] = { 8, 30 }; /* @0x8011A86C */

static unsigned char NumsLEV11M11E[2] = { 10, 30 }; /* @0x8011A870 */

static unsigned char NumsLEV12M12A[3] = { 20, 3, 22 }; /* @0x8011A874 */

static unsigned char NumsLEV12M12B[3] = { 0, 10, 22 }; /* @0x8011A878 */

static unsigned char NumsLEV12M12C[3] = { 8, 20, 0 }; /* @0x8011A87C */

static unsigned char NumsLEV12M12D[3] = { 8, 22, 30 }; /* @0x8011A880 */

static unsigned char NumsLEV13M13A[3] = { 0, 3, 20 }; /* @0x8011A884 */

static unsigned char NumsLEV13M13B[2] = { 0, 3 }; /* @0x8011A888 */

static unsigned char NumsLEV13M13C[2] = { 20, 22 }; /* @0x8011A88C */

static unsigned char NumsLEV13M13D[3] = { 0, 22, 30 }; /* @0x8011A890 */

static unsigned char NumsLEV13M13QB[3] = { 3, 0, 22 }; /* @0x8011A894 */

static unsigned char NumsLEV14M14A[3] = { 20, 3, 0 }; /* @0x8011A898 */

static unsigned char NumsLEV14M14B[3] = { 3, 14, 0 }; /* @0x8011A89C */

static unsigned char NumsLEV14M14C[2] = { 20, 30 }; /* @0x8011A8A0 */

static unsigned char NumsLEV14M14D[2] = { 3, 0 }; /* @0x8011A8A4 */

static unsigned char NumsLEV14M14E[2] = { 22, 14 }; /* @0x8011A8A8 */

static unsigned char NumsLEV14M14QB[3] = { 20, 3, 22 }; /* @0x8011A8AC */

static unsigned char NumsLEV15M15A[2] = { 20, 22 }; /* @0x8011A8B0 */

static unsigned char NumsLEV15M15B[3] = { 20, 22, 3 }; /* @0x8011A8B4 */

static unsigned char NumsLEV15M15C[2] = { 22, 14 }; /* @0x8011A8B8 */

static unsigned char NumsLEV15M15QA[2] = { 14, 22 }; /* @0x8011A8BC */

static unsigned char NumsLEV16M16D[3] = { 29, 17, 14 }; /* @0x8011A8C0 */

static MonstList ChoiceListLEV1[3] = { /* @0x800B7088 */
    { 4, 295, NumsLEV1M1A, "M1A", 0 },
    { 4, 296, NumsLEV1M1B, "M1B", 0 },
    { 5, 297, NumsLEV1M1C, "M1C", 0 },
};

static MonstList ChoiceListLEV2[6] = { /* @0x800B70B8 */
    { 4, 298, NumsLEV2M2A, "M2A", 0 },
    { 4, 299, NumsLEV2M2B, "M2B", 0 },
    { 3, 300, NumsLEV2M2C, "M2C", 0 },
    { 4, 301, NumsLEV2M2D, "M2D", 0 },
    { 4, 302, NumsLEV2M2QA, "M2QA", 1 },
    { 4, 303, NumsLEV2M2QB, "M2QB", 2048 },
};

static MonstList ChoiceListLEV3[4] = { /* @0x800B7118 */
    { 4, 304, NumsLEV3M3A, "M3A", 0 },
    { 4, 305, NumsLEV3M3B, "M3B", 0 },
    { 4, 306, NumsLEV3M3C, "M3C", 0 },
    { 4, 307, NumsLEV3M3QA, "M3QA", 64 },
};

static MonstList ChoiceListLEV4[7] = { /* @0x800B7158 */
    { 4, 308, NumsLEV4M4A, "M4A", 0 },
    { 4, 309, NumsLEV4M4B, "M4B", 0 },
    { 4, 310, NumsLEV4M4C, "M4C", 0 },
    { 4, 311, NumsLEV4M4D, "M4D", 0 },
    { 4, 312, NumsLEV4M4QA, "M4QA", 2 },
    { 5, 313, NumsLEV4M4QB, "M4QB", 10 },
    { 5, 314, NumsLEV4M4QC, "M4QC", 8 },
};

static MonstList ChoiceListLEV5[7] = { /* @0x800B71C8 */
    { 4, 315, NumsLEV5M5A, "M5A", 0 },
    { 4, 316, NumsLEV5M5B, "M5B", 0 },
    { 4, 317, NumsLEV5M5C, "M5C", 0 },
    { 4, 318, NumsLEV5M5D, "M5D", 0 },
    { 4, 319, NumsLEV5M5E, "M5E", 0 },
    { 3, 320, NumsLEV5M5F, "M5F", 0 },
    { 4, 321, NumsLEV5M5QA, "M5QA", 4096 },
};

static MonstList ChoiceListLEV6[6] = { /* @0x800B7238 */
    { 5, 322, NumsLEV6M6A, "M6A", 0 },
    { 3, 323, NumsLEV6M6B, "M6B", 0 },
    { 4, 324, NumsLEV6M6C, "M6C", 0 },
    { 3, 325, NumsLEV6M6D, "M6D", 0 },
    { 3, 326, NumsLEV6M6E, "M6E", 0 },
    { 3, 327, NumsLEV6M6QA, "M6QA", 512 },
};

static MonstList ChoiceListLEV7[5] = { /* @0x800B7298 */
    { 4, 328, NumsLEV7M7A, "M7A", 0 },
    { 4, 329, NumsLEV7M7B, "M7B", 0 },
    { 4, 330, NumsLEV7M7C, "M7C", 0 },
    { 3, 331, NumsLEV7M7D, "M7D", 0 },
    { 3, 332, NumsLEV7M7E, "M7E", 0 },
};

static MonstList ChoiceListLEV8[5] = { /* @0x800B72E8 */
    { 2, 333, NumsLEV8M8A, "M8A", 0 },
    { 4, 334, NumsLEV8M8B, "M8B", 0 },
    { 3, 335, NumsLEV8M8C, "M8C", 0 },
    { 2, 336, NumsLEV8M8D, "M8D", 0 },
    { 2, 337, NumsLEV8M8QA, "M8QA", 4 },
};

static MonstList ChoiceListLEV9[4] = { /* @0x800B7338 */
    { 4, 338, NumsLEV9M9A, "M9A", 0 },
    { 3, 339, NumsLEV9M9B, "M9B", 0 },
    { 2, 340, NumsLEV9M9C, "M9C", 0 },
    { 2, 341, NumsLEV9M9D, "M9D", 0 },
};

static MonstList ChoiceListLEV10[5] = { /* @0x800B7378 */
    { 3, 342, NumsLEV10M10A, "M10A", 0 },
    { 3, 343, NumsLEV10M10B, "M10B", 0 },
    { 2, 344, NumsLEV10M10C, "M10C", 0 },
    { 2, 345, NumsLEV10M10D, "M10D", 0 },
    { 3, 346, NumsLEV10M10QA, "M10QA", 1024 },
};

static MonstList ChoiceListLEV11[5] = { /* @0x800B73C8 */
    { 3, 347, NumsLEV11M11A, "M11A", 0 },
    { 3, 348, NumsLEV11M11B, "M11B", 0 },
    { 3, 349, NumsLEV11M11C, "M11C", 0 },
    { 2, 350, NumsLEV11M11D, "M11D", 0 },
    { 2, 351, NumsLEV11M11E, "M11E", 0 },
};

static MonstList ChoiceListLEV12[4] = { /* @0x800B7418 */
    { 3, 352, NumsLEV12M12A, "M12A", 0 },
    { 3, 353, NumsLEV12M12B, "M12B", 0 },
    { 3, 354, NumsLEV12M12C, "M12C", 0 },
    { 3, 355, NumsLEV12M12D, "M12D", 0 },
};

static MonstList ChoiceListLEV13[5] = { /* @0x800B7458 */
    { 3, 356, NumsLEV13M13A, "M13A", 0 },
    { 2, 357, NumsLEV13M13B, "M13B", 0 },
    { 2, 358, NumsLEV13M13C, "M13C", 0 },
    { 3, 359, NumsLEV13M13D, "M13D", 0 },
    { 3, 360, NumsLEV13M13QB, "M13QB", 32 },
};

static MonstList ChoiceListLEV14[6] = { /* @0x800B74A8 */
    { 3, 361, NumsLEV14M14A, "M14A", 0 },
    { 3, 362, NumsLEV14M14B, "M14B", 0 },
    { 2, 363, NumsLEV14M14C, "M14C", 0 },
    { 2, 364, NumsLEV14M14D, "M14D", 0 },
    { 2, 365, NumsLEV14M14E, "M14E", 0 },
    { 3, 366, NumsLEV14M14QB, "M14QB", 16 },
};

static MonstList ChoiceListLEV15[4] = { /* @0x800B7508 */
    { 2, 367, NumsLEV15M15A, "M15A", 0 },
    { 3, 368, NumsLEV15M15B, "M15B", 0 },
    { 2, 369, NumsLEV15M15C, "M15C", 0 },
    { 2, 370, NumsLEV15M15QA, "M15QA", 256 },
};

static MonstList ChoiceListLEV16[1] = { /* @0x800B7548 */
    { 3, 371, NumsLEV16M16D, "M16D", 0 },
};

MonstLevel AllLevels[16] = { /* @0x800B7558 */
    { 3, ChoiceListLEV1 },
    { 6, ChoiceListLEV2 },
    { 4, ChoiceListLEV3 },
    { 7, ChoiceListLEV4 },
    { 7, ChoiceListLEV5 },
    { 6, ChoiceListLEV6 },
    { 5, ChoiceListLEV7 },
    { 5, ChoiceListLEV8 },
    { 4, ChoiceListLEV9 },
    { 5, ChoiceListLEV10 },
    { 5, ChoiceListLEV11 },
    { 4, ChoiceListLEV12 },
    { 5, ChoiceListLEV13 },
    { 6, ChoiceListLEV14 },
    { 4, ChoiceListLEV15 },
    { 1, ChoiceListLEV16 },
};

int NumOfMonsterListLevels = 16; /* @0x8011AA94 */
