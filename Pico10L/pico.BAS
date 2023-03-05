0 screen1,0,0:COLOR 1,15,15:KEYOFF:CLS:DEFINTA-Z:VB=base(5):R=RND(-TIME):BB=VB+266:PB=BASE(7):sy(0)=46:SY(1)=254:PA(0)=1
1 forI=1to7:PA(i)=PA(i-1)*2:next:ifGC<>0thenforI=0to7:forJ=0to7:vpokeBB+I*32+j,SY(CM(I,J)):nextJ,I:PLAY"T250O4L11C"
2 cls:GC=RND(1)*255:CP=PB+GC*8:fori=0TO7:CB=VPEEK(CP+I):forJ=0to7:CM(I,J)=-((CBANDPA(J))>0):nextJ,I
3 forI=0to7:forJ=0to7:vpoke BB+I*32+j,SY(0):UM(I,J)=0:next J,I:forI=0to7:CR=0:CC=0:NR=0:NC=0:forJ=0to7: 
4 CR=CR-(CM(I,J)=1):if(CM(I,J)=0orJ=7)andCR>0thenNC=NC+1:VPOKEBB+8+32*I+NC,48+CR:CR=0
5 CC=CC-(CM(J,I)=1):if(CM(J,I)=0orj=7)andCC>0thenNR=NR+1:VPOKEBB+32*(NR+8)+I,48+CC:CC=0
6 if RND(1)<0.1 and CM(I,J)>0 then UM(I,J)=1:vpoke BB+I*32+J,SY(1):nextJ,I:else nextJ,I:R=0:C=0
7 LOCATE8+C,8+R:k$=INPUT$(1):K=ASC(K$):if K=32 then UM(R,C)=UM(R,C)xor1: vpoke BB+R*32+C,SY(UM(R,C)):
8 ifK=30andr>0thenR=R-1:elseifK=31andR<7thenR=R+1:elseifK=28andC<7thenC=C+1:elseifK=29andC>0thenC=C-1:elseifk=27then1
9 ifk=13then ER=0:forI=0to7:forJ=0to7:ER=ER-(UM(i,j)<>CM(i,j)):nextj,I:ifER=0thenPLAY"T120O4L15A":goto2:else7:else7

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
