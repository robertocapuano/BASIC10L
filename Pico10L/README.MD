# Pico10L
Pico10L is an implementation in MSX2 BASIC of classic Picross game.
he game consists in guessing the pixels to 1 of the image.

![screenshot](pico.gif)

# Controls
- Cursor keys to move the cursor
- SPACE to invert state of a pixel
- 'x' to mark a pixel as 0
- '.' to mark a pixel with initial state
- ENTER to check if puzzle is risolved
- ESC to abandon game e go to next puzzle.

Sources are stored at: https://github.com/robertocapuano/BASIC10L/Pico10L

# Installation
Game was developed in MSX-BASIC v3 on a MSX2+. Emulator is available at https://webmsx.org/
1. connect to https://webmsx.org
2. click on the first floppy icon below the blue screen
3. Select "Add Disk Images"
4. Choose "pico.dsk"
5. type in:
```
load "a:pico.bas"
run
```

WebMSX Launch URL:

- https://webmsx.org/?DISK=https://github.com/robertocapuano/BASIC10L/raw/main/Pico10L/pico.dsk&BASIC_RUN=pico.bas


#Variables

Name|Description
----------
PT| Points
ER| errors

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
PB=base(7)=char memory


# Source Description
```
0 screen1,0,0:COLOR1,15,15:KEYOFF:CLS:DEFINTA-Z:VB=base(5):R=RND(-TIME):BB=VB+266:PB=BASE(7):sy(0)=46:SY(1)=254:PA(7)=1
```
- initialize screen and some variables

```
1 forI=6to0step-1:PA(i)=PA(i+1)*2:next:ifGC<>0thenforI=0to7:forJ=0to7:vpokeBB+I*32+j,SY(CM(I,J)):nextJ,I:k$=INPUT$(1)
```
- initialize power array
- in case of game end draw real value of pixels

```
2 cls:PLAY"T120O4L15A":GC=RND(1)*255:CP=PB+GC*8:fori=0TO7:CB=VPEEK(CP+I):forJ=0to7:CM(I,J)=-((CBANDPA(J))>0):nextJ,I
```
- initialize GC (char to guess)
- read value of pixel from char memory to initialize user map

```
3 ?"PTS"PT:forI=0to7:forJ=0to7:vpoke BB+I*32+j,SY(0):UM(I,J)=0:next J,I:forI=0to7:CR=0:CC=0:NR=0:NC=0:R=0:C=0:forJ=0to7: 
```
- print points
- initialize for loop to calculate sequences of 0/1 bits

```
4 CR=CR-(CM(I,J)=1):if(CM(I,J)=0orJ=7)andCR>0thenNC=NC+1:VPOKEBB+8+32*I+NC,48+CR:CR=0
```
- Calculute sequences of horizontal 0/1 bits

```
5 CC=CC-(CM(J,I)=1):if(CM(J,I)=0orj=7)andCC>0thenNR=NR+1:VPOKEBB+32*(NR+8)+I,48+CC:CC=0
```
- Calculute sequences of vertical 0/1 bits

```
6 if RND(1)<0.1 and CM(I,J)>0 then UM(I,J)=1:vpoke BB+I*32+J,SY(1):nextJ,I:LOCATE 8,8:else nextJ,I:LOCATE 8,8
```
- randomically add some hints.

```
7 k=ASC(INPUT$(1)):P=BB+R*32+C:ifK=120orK=46thenvpokeP,K:UM(R,C)=0:elseifK=32thenUM(R,C)=UM(R,C)xor1:vpokeP,SY(UM(R,C))
```
- user inputs: 'x' and '.'

```
8 ifK=30andr>0thenR=R-1:elseifK=31andR<7thenR=R+1:elseifK=28andC<7thenC=C+1:elseifK=29andC>0thenC=C-1:elseifk=27then1
```
- user inputs: cursors

```
9 LOCATE8+C,8+R:ifk=13then ER=0:forI=0to7:forJ=0to7:ER=ER-(UM(i,j)<>CM(i,j)):nextj,I:ifER=0thenPT=PT+1:goto2:else7:else7
```
- user inputs: enter
- check if puzzle is resolved.
