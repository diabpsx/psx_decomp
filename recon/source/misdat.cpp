/* MISDAT.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/diablo-hellfire/src/MISDAT.CPP.
 * The two empty handlers of the missile tables: nullmissile (add function) and FuncNULL (the PSX
 * per-missile draw hook). */
#include "psxsrc/textdat_header.h"

struct MissileStruct {   /* sizeof 76 */
    long _mixvel;   /* +0x0 */
    long _miyvel;   /* +0x4 */
    long _mitxoff;   /* +0x8 */
    long _mityoff;   /* +0xC */
    int _midam;   /* +0x10 */
    int _mirnd;   /* +0x14 */
    unsigned short _mirange;   /* +0x18 */
    unsigned short _micaster;   /* +0x1A */
    short _midist;   /* +0x1C */
    short _miVar1;   /* +0x1E */
    short _miVar2;   /* +0x20 */
    short _miVar3;   /* +0x22 */
    short _miVar4;   /* +0x24 */
    short _miVar5;   /* +0x26 */
    short _miVar6;   /* +0x28 */
    short _miVar7;   /* +0x2A */
    short _miVar8;   /* +0x2C */
    short _misource;   /* +0x2E */
    char _mitype;   /* +0x30 */
    char _mix;   /* +0x31 */
    char _miy;   /* +0x32 */
    char _mixoff;   /* +0x33 */
    char _miyoff;   /* +0x34 */
    char _misx;   /* +0x35 */
    char _misy;   /* +0x36 */
    unsigned char _miAnimType;   /* +0x37 */
    unsigned char _miDelFlag;   /* +0x38 */
    unsigned char _miAnimFlags;   /* +0x39 */
    unsigned char _miDrawFlag;   /* +0x3A */
    unsigned char _miLightFlag;   /* +0x3B */
    unsigned char _miPreFlag;   /* +0x3C */
    unsigned char _miHitFlag;   /* +0x3D */
    char _mlid;   /* +0x3E */
    char _mimfnum;   /* +0x3F */
    char _mispllvl;   /* +0x40 */
    char _miAnimDelay;   /* +0x41 */
    char _miAnimLen;   /* +0x42 */
    char _miAnimWidth;   /* +0x43 */
    char _miAnimWidth2;   /* +0x44 */
    char _miAnimCnt;   /* +0x45 */
    char _miAnimAdd;   /* +0x46 */
    char _miAnimFrame;   /* +0x47 */
    void (*PrintPtr)();   /* +0x48 */
};

struct MissileData {   /* sizeof 24 */
    unsigned char mName;   /* +0x0 */
    void (*mAddProc)();   /* +0x4 */
    void (*mProc)();   /* +0x8 */
    unsigned char mDraw;   /* +0xC */
    unsigned char mType;   /* +0xD */
    unsigned char mResist;   /* +0xE */
    unsigned char mFileNum;   /* +0xF */
    int mlSFX;   /* +0x10 */
    int miSFX;   /* +0x14 */
};

struct MisFileData {   /* sizeof 5 */
    unsigned char mAnimName;   /* +0x0 */
    unsigned char mAnimFAmt;   /* +0x1 */
    unsigned char mFlags;   /* +0x2 */
    unsigned char mAnimDelay;   /* +0x3 */
    unsigned char mAnimLen;   /* +0x4 */
};

void AddAcid(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddAcidpud(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddApoca(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddArrow(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddBoneSpirit(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddBoom(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddCbolt(int mi, int sx, int sy, int dx, int dy, int midir, char micaster, int id, int dam);
void AddChain(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddDiabApoca(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddDisarm(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddElement(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddFireball(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddFirebolt(int mi, int sx, int sy, int dx, int dy, int midir, char micaster, int id, int dam);
void AddFiremove(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddFirewall(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddFirewallC(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddFlame(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int seqno);
void AddFlamec(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddFlare(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddFlash(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddFlash2(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddGolem(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddGuardian(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddHbolt(int mi, int sx, int sy, int dx, int dy, int midir, char micaster, int id, int dam);
void AddHeal(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddHealOther(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddIdentify(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddInfra(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddLArrow(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddLightball(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddLightctrl(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddLightning(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddMagmaball(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddManashield(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddMisexp(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddNova(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddRecharge(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddRepair(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddResurrect(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddResurrectBeam(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddRhino(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddRndTeleport(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddRportal(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddStone(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddTelekinesis(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddTeleport(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddTown(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddWave(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void AddWeapexp(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);
void FuncACID(MissileStruct *Ms, int ScrX, int ScrY, int OtPos);
void FuncACIDPUD(MissileStruct *Ms, int ScrX, int ScrY, int OtPos);
void FuncACIDSPLAT(MissileStruct *Ms, int ScrX, int ScrY, int OtPos);
void FuncARROW(MissileStruct *Ms, int ScrX, int ScrY, int OtPos);
void FuncBONESPIRIT(MissileStruct *Ms, int ScrX, int ScrY, int OtPos);
void FuncBOOM(MissileStruct *Ms, int ScrX, int ScrY, int OtPos);
void FuncCBOLT(MissileStruct *Ms, int ScrX, int ScrY, int OtPos);
void FuncELEMENT(MissileStruct *Ms, int ScrX, int ScrY, int OtPos);
void FuncFARROW(MissileStruct *Ms, int ScrX, int ScrY, int OtPos);
void FuncFIREBOLT(MissileStruct *Ms, int ScrX, int ScrY, int OtPos);
void FuncFIREMOVE(MissileStruct *Ms, int ScrX, int ScrY, int OtPos);
void FuncFIREWALL(MissileStruct *Ms, int ScrX, int ScrY, int OtPos);
void FuncFLAME(MissileStruct *Ms, int ScrX, int ScrY, int OtPos);
void FuncFLARE(MissileStruct *Ms, int ScrX, int ScrY, int OtPos);
void FuncFLAREXP(MissileStruct *Ms, int ScrX, int ScrY, int OtPos);
void FuncFLASH(MissileStruct *Ms, int ScrX, int ScrY, int OtPos);
void FuncFLASH2(MissileStruct *Ms, int ScrX, int ScrY, int OtPos);
void FuncGUARDIAN(MissileStruct *Ms, int ScrX, int ScrY, int OtPos);
void FuncHBOLT(MissileStruct *Ms, int ScrX, int ScrY, int OtPos);
void FuncLARROW(MissileStruct *Ms, int ScrX, int ScrY, int OtPos);
void FuncLIGHTNING(MissileStruct *Ms, int ScrX, int ScrY, int OtPos);
void FuncMAGMABALL(MissileStruct *Ms, int ScrX, int ScrY, int OtPos);
void FuncMANASHIELD(MissileStruct *Ms, int ScrX, int ScrY, int OtPos);
void FuncMISEXP(MissileStruct *Ms, int ScrX, int ScrY, int OtPos);
void FuncNULL(struct MissileStruct *Ms, int ScrX, int ScrY, int OtPos);
void FuncRESURRECTBEAM(MissileStruct *Ms, int ScrX, int ScrY, int OtPos);
void FuncRHINO(MissileStruct *Ms, int ScrX, int ScrY, int OtPos);
void FuncRPORTAL(MissileStruct *Ms, int ScrX, int ScrY, int OtPos);
void FuncTOWN(MissileStruct *Ms, int ScrX, int ScrY, int OtPos);
void FuncWEAPEXP(MissileStruct *Ms, int ScrX, int ScrY, int OtPos);
void MI_Acidpud(int i);
void MI_Acidsplat(int i);
void MI_Apoca(int i);
void MI_Arrow(int i);
void MI_Bonespirit(int i);
void MI_Boom(int i);
void MI_Cbolt(int i);
void MI_Chain(int i);
void MI_Dummy(int i);
void MI_Element(int i);
void MI_Fireball(int i);
void MI_Firebolt(int i);
void MI_Firemove(int i);
void MI_Firewall(int i);
void MI_FirewallC(int i);
void MI_Flame(int i);
void MI_Flamec(int i);
void MI_Flash(int i);
void MI_Flash2(int i);
void MI_Golem(int i);
void MI_Guardian(int i);
void MI_Hbolt(int i);
void MI_Infra(int i);
void MI_LArrow(int i);
void MI_Lightball(int i);
void MI_Lightctrl(int i);
void MI_Lightning(int i);
void MI_Misexp(int i);
void MI_Nova(int i);
void MI_ResurrectBeam(int i);
void MI_Rhino(int i);
void MI_Rportal(int i);
void MI_SetManashield(int i);
void MI_Stone(int i);
void MI_Teleport(int i);
void MI_Town(int i);
void MI_Wave(int i);
void MI_Weapexp(int i);
void nullmissile(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam);

MissileData missiledata[68] = { /* @0x800D67F0 */
    { 0, (void (*)())AddArrow, (void (*)())MI_Arrow, 1, 0, 0, 0, -1, -1 },
    { 1, (void (*)())AddFirebolt, (void (*)())MI_Firebolt, 1, 1, 1, 1, 84, 87 },
    { 2, (void (*)())AddGuardian, (void (*)())MI_Guardian, 1, 1, 0, 2, 94, 95 },
    { 3, (void (*)())AddRndTeleport, (void (*)())MI_Teleport, 0, 1, 0, 255, 117, -1 },
    { 4, (void (*)())AddLightball, (void (*)())MI_Lightball, 1, 1, 2, 3, -1, -1 },
    { 5, (void (*)())AddFirewall, (void (*)())MI_Firewall, 1, 1, 1, 4, 119, 87 },
    { 6, (void (*)())AddFireball, (void (*)())MI_Fireball, 1, 1, 1, 1, 84, 87 },
    { 7, (void (*)())AddLightctrl, (void (*)())MI_Lightctrl, 0, 1, 2, 3, -1, -1 },
    { 8, (void (*)())AddLightning, (void (*)())MI_Lightning, 1, 1, 2, 3, 101, 80 },
    { 9, (void (*)())AddMisexp, (void (*)())MI_Misexp, 1, 2, 0, 5, -1, -1 },
    { 10, (void (*)())AddTown, (void (*)())MI_Town, 1, 1, 3, 6, 110, 81 },
    { 11, (void (*)())AddFlash, (void (*)())MI_Flash, 1, 1, 3, 7, 104, 80 },
    { 12, (void (*)())AddFlash2, (void (*)())MI_Flash2, 1, 1, 3, 8, -1, -1 },
    { 13, (void (*)())AddManashield, (void (*)())MI_SetManashield, 1, 1, 3, 9, 103, -1 },
    { 14, (void (*)())AddFiremove, (void (*)())MI_Firemove, 1, 1, 1, 4, -1, -1 },
    { 15, (void (*)())AddChain, (void (*)())MI_Chain, 1, 1, 2, 3, 101, 80 },
    { 16, (void (*)())nullmissile, (void (*)())MI_Dummy, 1, 1, 2, 3, -1, -1 },
    { 17, (void (*)())nullmissile, (void (*)())MI_Dummy, 1, 2, 0, 10, 72, 73 },
    { 18, (void (*)())nullmissile, (void (*)())MI_Dummy, 1, 2, 0, 11, -1, -1 },
    { 19, (void (*)())nullmissile, (void (*)())MI_Dummy, 1, 2, 0, 12, -1, -1 },
    { 20, (void (*)())AddRhino, (void (*)())MI_Rhino, 1, 2, 0, 255, -1, -1 },
    { 21, (void (*)())AddMagmaball, (void (*)())MI_Firebolt, 1, 1, 1, 24, -1, -1 },
    { 22, (void (*)())AddLightctrl, (void (*)())MI_Lightctrl, 0, 1, 2, 21, -1, -1 },
    { 23, (void (*)())AddLightning, (void (*)())MI_Lightning, 1, 1, 2, 21, -1, -1 },
    { 24, (void (*)())AddFlare, (void (*)())MI_Firebolt, 1, 1, 3, 22, -1, -1 },
    { 25, (void (*)())AddMisexp, (void (*)())MI_Misexp, 1, 2, 3, 23, -1, -1 },
    { 26, (void (*)())AddTeleport, (void (*)())MI_Teleport, 0, 1, 0, 255, 81, -1 },
    { 27, (void (*)())AddLArrow, (void (*)())MI_LArrow, 1, 0, 1, 13, -1, -1 },
    { 28, (void (*)())nullmissile, (void (*)())MI_Dummy, 0, 1, 3, 14, 79, -1 },
    { 29, (void (*)())nullmissile, (void (*)())MI_Dummy, 1, 2, 1, 4, -1, -1 },
    { 30, (void (*)())AddStone, (void (*)())MI_Stone, 0, 1, 3, 255, 109, -1 },
    { 31, (void (*)())nullmissile, (void (*)())MI_Dummy, 1, 1, 0, 255, -1, -1 },
    { 32, (void (*)())nullmissile, (void (*)())MI_Dummy, 0, 1, 0, 255, 99, -1 },
    { 33, (void (*)())AddGolem, (void (*)())MI_Golem, 0, 1, 0, 255, 91, -1 },
    { 34, (void (*)())nullmissile, (void (*)())MI_Dummy, 1, 1, 0, 34, 82, -1 },
    { 35, (void (*)())nullmissile, (void (*)())MI_Dummy, 1, 2, 0, 16, -1, -1 },
    { 36, (void (*)())AddBoom, (void (*)())MI_Boom, 1, 2, 0, 17, -1, -1 },
    { 37, (void (*)())AddHeal, (void (*)())MI_Dummy, 0, 1, 0, 255, -1, -1 },
    { 38, (void (*)())AddFirewallC, (void (*)())MI_FirewallC, 0, 1, 1, 4, -1, -1 },
    { 39, (void (*)())AddInfra, (void (*)())MI_Infra, 0, 1, 0, 255, 98, -1 },
    { 40, (void (*)())AddIdentify, (void (*)())MI_Dummy, 0, 1, 0, 255, -1, -1 },
    { 41, (void (*)())AddWave, (void (*)())MI_Wave, 1, 1, 1, 4, 88, -1 },
    { 42, (void (*)())AddNova, (void (*)())MI_Nova, 1, 1, 2, 3, 104, -1 },
    { 43, (void (*)())nullmissile, (void (*)())MI_Dummy, 1, 1, 0, 255, -1, 71 },
    { 44, (void (*)())AddApoca, (void (*)())MI_Apoca, 1, 1, 3, 17, 69, -1 },
    { 45, (void (*)())AddRepair, (void (*)())MI_Dummy, 0, 2, 0, 255, -1, -1 },
    { 46, (void (*)())AddRecharge, (void (*)())MI_Dummy, 0, 2, 0, 255, -1, -1 },
    { 47, (void (*)())AddDisarm, (void (*)())MI_Dummy, 0, 2, 0, 255, 116, -1 },
    { 48, (void (*)())AddFlame, (void (*)())MI_Flame, 1, 1, 1, 20, 114, -1 },
    { 49, (void (*)())AddFlamec, (void (*)())MI_Flamec, 0, 1, 1, 255, -1, -1 },
    { 50, (void (*)())nullmissile, (void (*)())MI_Dummy, 1, 2, 0, 255, -1, -1 },
    { 51, (void (*)())nullmissile, (void (*)())MI_Dummy, 1, 0, 1, 25, -1, -1 },
    { 52, (void (*)())AddCbolt, (void (*)())MI_Cbolt, 1, 1, 2, 26, 77, -1 },
    { 53, (void (*)())AddHbolt, (void (*)())MI_Hbolt, 1, 1, 0, 27, 96, 80 },
    { 54, (void (*)())AddResurrect, (void (*)())MI_Dummy, 0, 1, 3, 255, -1, 107 },
    { 55, (void (*)())AddTelekinesis, (void (*)())MI_Dummy, 0, 1, 0, 255, 82, -1 },
    { 56, (void (*)())AddLArrow, (void (*)())MI_LArrow, 1, 0, 2, 29, -1, -1 },
    { 57, (void (*)())AddAcid, (void (*)())MI_Firebolt, 1, 1, 4, 31, 67, -1 },
    { 58, (void (*)())AddMisexp, (void (*)())MI_Acidsplat, 1, 2, 4, 32, -1, -1 },
    { 59, (void (*)())AddAcidpud, (void (*)())MI_Acidpud, 1, 2, 4, 33, -1, -1 },
    { 60, (void (*)())AddHealOther, (void (*)())MI_Dummy, 0, 1, 0, 255, -1, -1 },
    { 61, (void (*)())AddElement, (void (*)())MI_Element, 1, 1, 1, 35, 81, -1 },
    { 62, (void (*)())AddResurrectBeam, (void (*)())MI_ResurrectBeam, 1, 1, 0, 36, -1, -1 },
    { 63, (void (*)())AddBoneSpirit, (void (*)())MI_Bonespirit, 1, 1, 3, 37, 74, 75 },
    { 64, (void (*)())AddWeapexp, (void (*)())MI_Weapexp, 1, 2, 0, 255, -1, -1 },
    { 65, (void (*)())AddRportal, (void (*)())MI_Rportal, 1, 2, 0, 38, 110, 81 },
    { 66, (void (*)())AddBoom, (void (*)())MI_Boom, 1, 2, 0, 39, -1, -1 },
    { 67, (void (*)())AddDiabApoca, (void (*)())MI_Dummy, 0, 2, 0, 255, -1, -1 },
};

void (*MissPrintRoutines[68])() = { /* @0x800D6E50 */
    (void (*)())FuncARROW,
    (void (*)())FuncFIREBOLT,
    (void (*)())FuncGUARDIAN,
    (void (*)())FuncNULL,
    (void (*)())FuncLIGHTNING,
    (void (*)())FuncFIREWALL,
    (void (*)())FuncFIREBOLT,
    (void (*)())FuncNULL,
    (void (*)())FuncLIGHTNING,
    (void (*)())FuncMISEXP,
    (void (*)())FuncTOWN,
    (void (*)())FuncFLASH,
    (void (*)())FuncFLASH2,
    (void (*)())FuncMANASHIELD,
    (void (*)())FuncFIREMOVE,
    (void (*)())FuncNULL,
    (void (*)())FuncNULL,
    (void (*)())FuncNULL,
    (void (*)())FuncNULL,
    (void (*)())FuncNULL,
    (void (*)())FuncRHINO,
    (void (*)())FuncMAGMABALL,
    (void (*)())FuncNULL,
    (void (*)())FuncLIGHTNING,
    (void (*)())FuncFLARE,
    (void (*)())FuncFLAREXP,
    (void (*)())FuncNULL,
    (void (*)())FuncFARROW,
    (void (*)())FuncNULL,
    (void (*)())FuncNULL,
    (void (*)())FuncNULL,
    (void (*)())FuncNULL,
    (void (*)())FuncNULL,
    (void (*)())FuncNULL,
    (void (*)())FuncNULL,
    (void (*)())FuncNULL,
    (void (*)())FuncBOOM,
    (void (*)())FuncNULL,
    (void (*)())FuncNULL,
    (void (*)())FuncNULL,
    (void (*)())FuncNULL,
    (void (*)())FuncNULL,
    (void (*)())FuncNULL,
    (void (*)())FuncNULL,
    (void (*)())FuncNULL,
    (void (*)())FuncNULL,
    (void (*)())FuncNULL,
    (void (*)())FuncNULL,
    (void (*)())FuncFLAME,
    (void (*)())FuncNULL,
    (void (*)())FuncNULL,
    (void (*)())FuncNULL,
    (void (*)())FuncCBOLT,
    (void (*)())FuncHBOLT,
    (void (*)())FuncNULL,
    (void (*)())FuncNULL,
    (void (*)())FuncLARROW,
    (void (*)())FuncACID,
    (void (*)())FuncACIDSPLAT,
    (void (*)())FuncACIDPUD,
    (void (*)())FuncNULL,
    (void (*)())FuncELEMENT,
    (void (*)())FuncRESURRECTBEAM,
    (void (*)())FuncBONESPIRIT,
    (void (*)())FuncWEAPEXP,
    (void (*)())FuncRPORTAL,
    (void (*)())FuncBOOM,
    (void (*)())FuncNULL,
};

MisFileData misfiledata[47] = { /* @0x800D6F60 */
    { 0, 1, 2, 0, 28 },
    { 1, 16, 0, 0, 10 },
    { 2, 3, 0, 48, 163 },
    { 3, 1, 0, 0, 22 },
    { 4, 2, 0, 0, 178 },
    { 5, 1, 0, 16, 24 },
    { 6, 2, 0, 210, 44 },
    { 7, 1, 0, 0, 30 },
    { 8, 1, 0, 0, 30 },
    { 9, 1, 2, 0, 16 },
    { 10, 4, 0, 0, 228 },
    { 11, 3, 0, 49, 54 },
    { 12, 3, 0, 49, 56 },
    { 13, 16, 0, 0, 3 },
    { 14, 9, 1, 144, 155 },
    { 15, 1, 1, 0, 0 },
    { 16, 2, 0, 33, 38 },
    { 17, 1, 0, 16, 27 },
    { 18, 1, 0, 16, 25 },
    { 19, 1, 0, 0, 27 },
    { 20, 1, 0, 0, 31 },
    { 21, 1, 1, 0, 22 },
    { 22, 1, 0, 0, 28 },
    { 23, 1, 0, 0, 21 },
    { 24, 8, 1, 128, 140 },
    { 25, 1, 1, 0, 26 },
    { 26, 1, 0, 16, 22 },
    { 27, 16, 0, 16, 10 },
    { 28, 1, 0, 0, 22 },
    { 29, 16, 0, 0, 3 },
    { 30, 1, 0, 0, 20 },
    { 31, 16, 1, 0, 6 },
    { 32, 1, 1, 0, 22 },
    { 33, 2, 1, 0, 194 },
    { 34, 1, 0, 0, 16 },
    { 35, 8, 0, 128, 137 },
    { 36, 1, 0, 0, 28 },
    { 37, 9, 0, 144, 249 },
    { 38, 2, 0, 0, 44 },
    { 39, 1, 1, 16, 29 },
    { 40, 1, 1, 0, 28 },
    { 41, 1, 1, 0, 20 },
    { 42, 1, 1, 0, 28 },
    { 43, 1, 1, 0, 20 },
    { 44, 1, 1, 0, 28 },
    { 45, 1, 1, 0, 20 },
    { 255, 0, 0, 0, 0 },
};


/* @0x8004EA8C MISDAT.CPP:33 */
void nullmissile(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
}

/* @0x8004EA94 MISDAT.CPP:812 */
void FuncNULL(struct MissileStruct *Ms, int ScrX, int ScrY, int OtPos)
{
}
