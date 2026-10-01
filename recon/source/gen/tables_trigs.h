/* Shared trigger lists from refs/diablo-hellfire/src/TRIGS.CPP.
 * PSX uses short entries, not the PC's int entries. Every value, extent,
 * and -1 terminator was checked against the retail PSX table. PSX-only
 * warp/block lists below are reconstructed from retail typed table data. */
short TownDownList[11] = {716, 715, 719, 720, 721, 723, 724, 725, 726, 727, -1};
short TownWarp1List[13] = {1171, 1172, 1173, 1174, 1175, 1176, 1177, 1178, 1179, 1181, 1183, 1185, -1};
short TownWarp2List[23] = {1199, 1200, 1201, 1202, 1203, 1204, 1205, 1206, 1207, 1208, 1209, 1210, 1211, 1212, 1213, 1214, 1215, 1216, 1217, 1218, 1219, 1220, -1};
short TownWarp3List[17] = {1240, 1241, 1242, 1243, 1244, 1245, 1246, 1247, 1248, 1249, 1250, 1251, 1252, 1253, 1254, 1255, -1};
short L1UpList[12] = {127, 129, 130, 131, 132, 133, 135, 137, 138, 139, 140, -1};
short L1DownList[10] = {106, 107, 108, 109, 110, 112, 114, 115, 118, -1};
short L2UpList[3] = {266, 267, -1};
short L2DownList[5] = {269, 270, 271, 272, -1};
short L2TWarpUpList[3] = {558, 559, -1};
short L3UpList[15] = {170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, -1};
short L3DownList[9] = {162, 163, 164, 165, 166, 167, 168, 169, -1};
short L3TWarpUpList[14] = {548, 549, 550, 551, 552, 553, 554, 555, 556, 557, 558, 559, 560, -1};
short L4UpList[4] = {82, 83, 90, -1};
short L4DownList[6] = {120, 130, 131, 132, 133, -1};
short L4TWarpUpList[4] = {421, 422, 429, -1};
short L4PentaList[33] = {353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379, 380, 381, 382, 383, 384, -1};
short L1BlockList[41] = {43, 44, 45, 46, 50, 51, 54, 55, 56, 61, 67, 68, 69, 70, 72, 212, 214, 270, 354, 355, 370, 392, 393, 394, 395, 396, 397, 398, 399, 400, 401, 403, 404, 406, 407, 408, 409, 410, 411, 412, -1};
short L2BlockList[9] = {13, 17, 150, 151, 538, 540, 541, 542, -1};
short L3BlockList[5] = {531, 534, 538, 541, -1};
short L4BlockList[2] = {370, -1};
TriggerStruct trigs[5] = {{0}};
short TrigList[4][64] = {{0}};
BLOCK BlockList[160] = {{0}};
