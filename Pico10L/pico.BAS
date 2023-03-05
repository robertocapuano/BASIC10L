10 screen1,0,0:COLOR 1,15,15::KEYOFF:CLS:DEFINTA-Z:VB=base(5):R=RND(-TIME)
11 BB=VB+8*32+10:PB=BASE(7): sy(0)=46:SY(1)=254:PA(0)=1:forI=1to7:PA(i)=PA(i-1)*2:next
20 cls:GC=RND(1)*255:CP=PB+GC*8: for i=0TO7:CB=VPEEK(CP+I):forJ=0to7:CM(I,J)=-((CB AND PA(J))>0) : NEXT J,I
30 for i=0to7:forJ=0to7:vpoke BB+I*32+j,SY(0): UM(I,J)=0:NEXT J,I:rem +CM(I,J)
40 for i=0to7:CR=0:CC=0:NR=0: NC=0: for J=0to7: 
42 CR=CR-(CM(I,J)=1): if( CM(I,J)=0 or J=7) and CR>0 then NC=NC+1: VPOKE  BB+8 +32*I+NC , 48 +CR: CR=0
44 CC=CC-(CM(J,I)=1): if( CM(J,I)=0 or j=7) and CC>0 then NR=NR+1: VPOKE BB +32*(NR+8)+I, 48 +CC: cC=0
50 next j,i:R=0:C=0:
55 LOCATE8+C,8+R : k$=INPUT$(1):K=ASC(K$)
70 if K=32 then UM(R,C)=UM(R,C)xor1: vpoke BB+R*32+C,SY(UM(R,C)):
80  if K=30andr>0thenR=R-1:elseif K=31andR<7thenR=R+1:
100 if K=28andC<7thenC=C+1:elseif K=29andC>0thenC=C-1:elseifk=27then20
120 if k=13 then ER=0:for i=0to7:forJ=0to7:ER=ER-(UM(i,j)<>CM(i,j)):nextj,I:if ER=0then beep:goto20 
130 goto 55


SY:symbols
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
