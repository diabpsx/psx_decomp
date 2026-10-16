#ifndef PSXSRC_DIALOG_H
#define PSXSRC_DIALOG_H
/* DIALOG.H -- Climax PSX dialog-box object (C:\diabpsx\PSXSRC\DIALOG.H).  Layout from the retail SYM (sizeof
 * 16); the in-class methods are the ones the retail SYM attributes to DIALOG.H lines 62-99, emitted out of
 * line in every TU that uses a Dialog (-fno-inline).  The constructor reads CBlocks::GetOverlayOtBase, so
 * DIALOG.H parses BLOCK.H first. */
#include "diabpsx_types.h"
#include "psxsrc/block.h"

extern unsigned char DialogRed, DialogGreen, DialogBlue;      /* DIALOG.CPP @0x8011ABFD.. */
extern unsigned char DialogTRed, DialogTGreen, DialogTBlue;   /* @0x8011AC00.. */

class Dialog {
public:
    int BevelGfx;      /* +0x0 */
    int BorderGfx;     /* +0x4 */
    int BackGfx;       /* +0x8 */
    int DialogOTpos;   /* +0xC */

    Dialog()                                                               /* DIALOG.H:62 */
    {
        BackGfx = 0x94;
        BevelGfx = 0x1A;
        BorderGfx = 0x1A;
        DialogRed = 0x80;
        DialogGreen = 0x80;
        DialogBlue = 0x80;
        DialogTRed = 0x20;
        DialogTGreen = 0x20;
        DialogTBlue = 0x20;
        DialogOTpos = CBlocks::GetOverlayOtBase();
    }
    ~Dialog()                                                              /* DIALOG.H:79 */
    {
    }
    void GetSizes();
    void Bevels(int Type);
    void Display(int x, int y, int W, int H);
    void Back(int DX, int DY, int DW, int DH);
    void Line(int DX, int DY, int DW);
    int SetOTpos(int OT);
    void SetBorder(int Type) { BorderGfx = Type; }                         /* DIALOG.H:91 */
    void SetBack(int Type) { BackGfx = Type; }                             /* DIALOG.H:94 */
    void SetRGB(unsigned char R, unsigned char G, unsigned char B)         /* DIALOG.H:99 */
    {
        DialogRed = R;
        DialogGreen = G;
        DialogBlue = B;
    }
};

#endif
