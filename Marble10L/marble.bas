10 screen 5
20 XS=100:YS=10:TW=16:TH=8:MH=6:HW=TW/2:HH=TH/2:Z=RND(-TIME)

30 forI=0TO10:FORJ=0TO16:K!=(I+J)/26.0:
40 X=J:Y=I:H=MH*SIN(k!*3.14)*MH:GOSUB 100:GOSUB200
50 next j,i

70 K$=inkey$:IFK$=""then70
90 stop
100 REM
110 Z=MH-H
120 X0=XS+(X-Y)*HW
130 Y0=YS+(X+Y)*HH+Z
140 X1=X0-HW:Y1=Y0:
150 X2=X0:Y2=Y0-HH
160 X3=X0+HW:Y3=Y0:
170 X4=X0:Y4=Y0+HH
180 return
200 LINE(x1,y1)-(x2,y2),1:LINE-(x3,y3),1:LINE-(x4,y4),1:LINE-(x1,y1),1:PAINT(x0,Y0),3,1:RETURN



  let x_screen = x_start + (x - y) * TILE_WIDTH/2;
  let y_screen = y_start + (x + y) * TILE_HEIGHT/2;

  let z_offset = MAX_TILE_HEIGHT - img.height;
  
  image(img, x_screen, y_screen + z_offset);