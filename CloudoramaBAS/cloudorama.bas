

10 screen5,0:color 15,5,5:cls:keyoff:open"grp:"as#1:definta-z:R=rnd(-time):SH$="C=S;BU7 G5F5 E5H5":SX=90:SY=70:WC=12:WR=6:   HS$="C=S;R1BR2R1 F1L6 D1R6 D1L6 D1R6 G1L4 F1R2G1"
11 UL=32:dimUG(UL),UE(UL),UR(UL),UC(UL)    :GL=4:dimGP(GL),GC(GL),GR(GL),GU(GL),GM(GL),PG(GL),PM(GL):  ML=10:dimMG(ML,ML),MU(ML,ML): forI=0toGL-1:readK:PG(I)=k:readK:PM(I)=K:nextI
15 for j=0to1:SP$="":for I=1 TO 8:read K:SP$=SP$+CHR$(K):next:sprite$(j)=SP$:nextJ
20 CR=0:CC=0:CS=0:CG=0: rem cls:pset(95,10): print#1,"Cloudorama":

rem TODO random units
30 GN=4:UN=GN*2:MR=4:MC=4:remRND(1)*2+2: RND(0)*3
31 J=0::K=0:forI=0toGN-1:GP(I)=5+RND(1)*5:GR(I)=(MR-1)*RND(1):GC(I)=(MC-1)*RND(1):GU(I)=PG((J+I)mod4):GM(I)=PM((J+I)mod4):UG(K)=I:UE(K)=5+RND(1)*5:UR(K)=GR(I)+RND(1)*4-2: UC(K)=GC(I)+RND(1)*4-2:K=K+1:   nextI

rem draw map
60 for J=0 TO  MC-1: for I=0 to MR-1
70 X =(JMOD2)* 6+ SX+WC*I:Y=SY+ WR*J
75 SM=0:forK=0toGN-1:RD=GR(K)-I:CD=GC(K)-J:S=GP(K)/(RD*RD+CD*CD+0.1):ifS>SMthenSM=S:MG(I,J)=K
80 nextK: S=GM(MG(I,J)): preset(X,Y): draw SH$:paint (X,Y),S: :next I,J: rem S=PG(MG(I,J)):draw SH$ :next I,J

95 CO=0:CE=10:TU=1:
100 PSET(35,20): print#1,"CREDIT";CE;"CO2";CO;"TURN";TU;

rem Cursor Movement
1000 LINE(20,80+CS*5)-STEP(30,8),0,BF
1005 if MU(CR,CC)>0then LINE(20,80-(UG(MU(CR,CC))>0)*5)-STEP(UE(MU(CR,CC)) * 3 ,+2),GU(UG(MU(CR,CC))),BF: 
1010 X=SX-4+(CRmod2)* WR+WC*CC:Y=SY-7+WR*CR: put sprite 31,(X,Y),15-CS,0
1060 K$=inkey$:IFK$=""then1060:elsek=asc(k$)
1070 ifK=31andCR<MR-1thenCR=CR+1:elseifK=30andCR>0thenCR=CR-1
1080 ifK=28andCC<MC-1thenCC=CC+1:elseifK=29andCC>0thenCC=CC-1
1090 ifk=32and(CS=0or((abs(CR-SR)+abs(CC-SC))<=2))then MU(CR,CC)=1: pset(X+2,Y+2): S=5:draw HS$:
1200 goto 1000

1900 data 7,4,8,6,11,10,2,12 : rem unit color
rem sprites
2000 data 255,129,129,129,129,129,129,255, &H00,&H00,&H3C,&H3C,&H3C,&H3C,&H00,&H00




Variabili

CO: CO2
CE: CREDIT
TU: TURN


PG(): palette dei gruppi
PM(): palette delle mappe
Cursor
CR: cursor row
CC: col
CS: cursor selection mode
CG: cursor group
CU: cursor unit

Mappa:
MR, MC: dimensione
MG(,), group owner
MU( ,) unit presente
ML: lemght of cols/rows matrix

SX,SY: start x,y
WC, WR: wide shape
SM: max shape power value

Groups
GN: numero di gruppi
GP(): power of group, for map
GR(), GC() center of power of group, for map
GC(): group color
GU(): group unit color
GM(): Group map color
GL: lenght of array

Unita'
UN: numero
UG(): group, 0: user, 1: enemy, 2: ...
UE() energy: 0-9
UR() unita riga
UC() unita colonna
UL: lenght of array

