10 cls:?tab(17)"RPG":DIMS$(16):R=RND(-TIME):KEYOFF:S=10
20  locate 10,1: ? S : for i=0 to 3: for J=0 to 3: vpoke250+I+J*40, 250+M(I,J ): NEXTJ,I
