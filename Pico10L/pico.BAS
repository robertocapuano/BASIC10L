10 screen1,0,0:COLOR 3,12,12::KEYOFF:CLS:DEFINTA-Z:VB=base(5):R=RND(-TIME)
11 BB=VB+8*32+10:CB=BASE(6):PB=BASE(7):DIM CM(8,8): DIM UM(8,8): 
15 DIM PA(8):PA(0)=128:PA(1)=64:PA(2)=32:PA(3)=16:PA(4)=8:PA(5)=4:PA(6)=2:PA(7)=1
20 GC=65:CP=PB+GC*8: for i=0TO7:CB=VPEEK(CP+I):forJ=0to7:CM(I,J)=-((CB AND PA(J))>0) : NEXT J,I
30 for i=0to7:forJ=0to7:vpoke BB+I*32+j, 46:NEXT J,I:rem +CM(I,J)
40 for i=0to7:CR=0:CC=0:NR=0: NC=0: for J=0to7: 
42 CR=CR-(CM(I,J)=1): if (CM(I,J)=0 or J=7)and CR>0 then NC=NC+1: VPOKE  BB+8 +32*I+NC , 48 +CR: CR=0
44 CC=CC-(CM(J,I)=1): if (CM(J,I)=0 or j=7) and CC>0 then NR=NR+1: VPOKE BB +32*(NR+8)+I, 48 +CC: cC=0
50 next j,i:R=0:C=0:

55  LOCATE8+C,8+R 
60 k$=INPUT$(1):K=ASC(K$)
70 if K=32 then vpoke BB+R*32+C,254
80  if K=30andr>0thenR=R-1
90 if K=31andR<7thenR=R+1
100 if K=28andC<7thenC=C+1
110 if K=29andC>0thenC=C-1
130 goto 55



NR next row
NC: next col
CR contatori per riga
CC contatori per colonna

GC= character to guess
CP= char pointer

PA: power array
CB: char byte
CM: mappa del carattere
UM: mappa dell'utente

BB=grid base
VB=base(5)=video table
CB=base(6)=color table
PB=base(7)=char memory
