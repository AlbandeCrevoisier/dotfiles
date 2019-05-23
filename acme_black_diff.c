void
iconinit(void)
{

	Rectangle r;
	Image *tmp;

	if(tagcols[BACK] == nil) {
		/* Blue
		tagcols[BACK] = allocimagemix(display, DPalebluegreen, DWhite);
		tagcols[HIGH] = allocimage(display, Rect(0,0,1,1), screen->chan, 1, DPalegreygreen);
		tagcols[BORD] = allocimage(display, Rect(0,0,1,1), screen->chan, 1, DPurpleblue);
		tagcols[TEXT] = display->black;
		tagcols[HTEXT] = display->black;
		*/
	
		/* Yellow
		textcols[BACK] = allocimagemix(display, DPaleyellow, DWhite);
		textcols[HIGH] = allocimage(display, Rect(0,0,1,1), screen->chan, 1, DDarkyellow);
		textcols[BORD] = allocimage(display, Rect(0,0,1,1), screen->chan, 1, DYellowgreen);
		textcols[TEXT] = display->black;
		textcols[HTEXT] = display->black;
		*/

		/* Black */
#define DGrey 		0x212121FF
#define DLightgrey 	0x484848FF
#define DGreyText 	0x888888FF
#define DLightGreyText 	0xB6B6B6FF
		tagcols[BACK] = allocimage(display, Rect(0,0,1,1), screen->chan, 1, DGrey);
		tagcols[HIGH] = allocimage(display, Rect(0,0,1,1), screen->chan, 1, DLightgrey);
		tagcols[BORD] = allocimage(display, Rect(0,0,1,1), screen->chan, 1, DLightgrey);
		tagcols[TEXT] = allocimage(display, Rect(0,0,1,1), screen->chan, 1, DLightGreyText);
		tagcols[HTEXT] = allocimage(display, Rect(0,0,1,1), screen->chan, 1, DLightGreyText);
		textcols[BACK] = display->black;
		textcols[HIGH] = allocimage(display, Rect(0,0,1,1), screen->chan, 1, DGrey);
		textcols[BORD] = allocimage(display, Rect(0,0,1,1), screen->chan, 1, DGrey);
		textcols[TEXT] = allocimage(display, Rect(0,0,1,1), screen->chan, 1, DGreyText);
		textcols[HTEXT] = allocimage(display, Rect(0,0,1,1), screen->chan, 1, DGreyText);
	}
	
	r = Rect(0, 0, Scrollwid+ButtonBorder, font->height+1);
	if(button && eqrect(r, button->r))
		return;

	if(button){
		freeimage(button);
		freeimage(modbutton);
		freeimage(colbutton);
	}

	button = allocimage(display, r, screen->chan, 0, DNofill);
	draw(button, r, tagcols[BACK], nil, r.min);
	r.max.x -= ButtonBorder;
	border(button, r, ButtonBorder, tagcols[BORD], ZP);

	r = button->r;
	modbutton = allocimage(display, r, screen->chan, 0, DNofill);
	draw(modbutton, r, tagcols[BACK], nil, r.min);
	r.max.x -= ButtonBorder;
	border(modbutton, r, ButtonBorder, tagcols[BORD], ZP);
	r = insetrect(r, ButtonBorder);
	tmp = allocimage(display, Rect(0,0,1,1), screen->chan, 1, DGreyText);
	draw(modbutton, r, tmp, nil, ZP);
	freeimage(tmp);

	r = button->r;
	colbutton = allocimage(display, r, screen->chan, 0, DLightgrey);

	but2col = allocimage(display, r, screen->chan, 1, 0xAA0000FF);
	but3col = allocimage(display, r, screen->chan, 1, 0x006600FF);
}
