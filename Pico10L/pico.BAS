0 screen1,0,0:COLOR1,15,15:KEYOFF:CLS:DEFINTA-Z:VB=base(5):R=RND(-TIME):BB=VB+266:PB=BASE(7):sy(0)=46:SY(1)=254:PA(7)=1
1 forI=6to0step-1:PA(i)=PA(i+1)*2:next:ifGC<>0thenforI=0to7:forJ=0to7:vpokeBB+I*32+j,SY(CM(I,J)):nextJ,I:k$=INPUT$(1)
2 cls:PLAY"T120O4L15A":GC=RND(1)*255:CP=PB+GC*8:fori=0TO7:CB=VPEEK(CP+I):forJ=0to7:CM(I,J)=-((CBANDPA(J))>0):nextJ,I
3 ?"PTS"PT:forI=0to7:forJ=0to7:vpoke BB+I*32+j,SY(0):UM(I,J)=0:next J,I:forI=0to7:CR=0:CC=0:NR=0:NC=0:R=0:C=0:forJ=0to7: 
4 CR=CR-(CM(I,J)=1):if(CM(I,J)=0orJ=7)andCR>0thenNC=NC+1:VPOKEBB+8+32*I+NC,48+CR:CR=0
5 CC=CC-(CM(J,I)=1):if(CM(J,I)=0orj=7)andCC>0thenNR=NR+1:VPOKEBB+32*(NR+8)+I,48+CC:CC=0
6 if RND(1)<0.1 and CM(I,J)>0 then UM(I,J)=1:vpoke BB+I*32+J,SY(1):nextJ,I:LOCATE 8,8:else nextJ,I:LOCATE 8,8
7 k=ASC(INPUT$(1)):P=BB+R*32+C:ifK=120orK=46thenvpokeP,K:UM(R,C)=0:elseifK=32thenUM(R,C)=UM(R,C)xor1:vpokeP,SY(UM(R,C))
8 ifK=30andr>0thenR=R-1:elseifK=31andR<7thenR=R+1:elseifK=28andC<7thenC=C+1:elseifK=29andC>0thenC=C-1:elseifk=27then1
9 LOCATE8+C,8+R:ifk=13then ER=0:forI=0to7:forJ=0to7:ER=ER-(UM(i,j)<>CM(i,j)):nextj,I:ifER=0thenPT=PT+1:goto2:else7:else7
