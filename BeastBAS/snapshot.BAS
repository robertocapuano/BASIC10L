10 color 8,6,1:SCREEN 5,3,0: cls :KEYOFF:
15 rem bsave"a:snapshot.sc5",0,&h7fff,s
20 bload"a:snapshot.sc5",S
30 K$=inkey$:IFK$=""then30
