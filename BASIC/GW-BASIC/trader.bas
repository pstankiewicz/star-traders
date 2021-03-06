00005 REM                   STAR TRADERS
00010 REM - MODIFIED FOR 'ALTAIR BASIC 4.0' BY - S J SINGER
00020 REM
00030 REM
00035 DEFINT C
00036 DEFINT I
00040 DIM M(10,13),S(5,4),N$(5),D1(5),S1(5),Q(5),M$(12),C$(25)
00050 DIM C1$(25),C2$(25)
00060 DATA 1,"'ALTAIR STARWAYS'"
00070 DATA 2,"'BETELGEUSE,LTD.'"
00080 DATA 3,"'CAPELLA FREIGHT CO.'"
00090 DATA 4,"'DENEBOLA SHIPPERS'"
00100 DATA 5,"'ERIDANI EXPEDITERS'"
00120 CLS
00130   FOR I=1 TO 5
00140    FOR J=1 TO 4
00150 S(I,J)=0: D1(I)=0: S1(I)=100: Q(I)=0: B(I)=6000
00160    NEXT J
00170   NEXT I
00180 L$=".+*ABCDE"
00190 M$="ABCDEF GHIJKL"
00195 PRINT "              **********   STAR TRADERS   **********":PRINT
00197 PRINT :PRINT
00200 INPUT "TYPE A 3 DIGIT NUMBER  ";R1
00220 R1=RND(-R1/1000)
00230   FOR I=1 TO 9
00240    FOR J=1 TO 12
00250 IF INT(20*RND(R1)+1)<>10 THEN M(I,J)=1 ELSE M(I,J)=3
00260   NEXT J
00270  NEXT I
00280 CLS
00290 INPUT "HOW MANY PLAYERS  (2-4)  ";P1
00300 PRINT :PRINT
00310 INPUT "DOES ANY PLAYER NEED INSTRUCTIONS  ";Q$
00320 IF Q$     ="Y" THEN GOSUB 3410
00330 CLS
00340   FOR I=1 TO P1
00350 PRINT "PLAYER",I,
00370 INPUT " WHAT IS YOUR NAME  ";P$
00380 IF I=1 THEN P1$=P$
00390 IF I=2 THEN P2$=P$
00400 IF I=3 THEN P3$=P$
00410 IF I=4 THEN P4$=P$
00420   NEXT I
00430 CLS
00440 PRINT TAB(10),"...NOW I WILL DECIDE WHO GOES FIRST...":: PRINT :PRINT
00445 PRINT :PRINT
00450 PRINT :PRINT :PRINT
00460 I=INT(P1*RND(R1)+1)
00470 GOSUB 490
00480 GOTO 550
00490 PRINT
00500 ON I GOTO 510,520,530,540: REM - IDENTIFY PLAYER
00510 PRINT P1$;:P5$=P1$: RETURN
00520 PRINT P2$;:P5$=P2$: RETURN
00530 PRINT P3$;:P5$=P3$: RETURN
00540 PRINT P4$;:P5$=P4$: RETURN
00550 PRINT " IS THE FIRST PLAYER TO MOVE."
00560 FOR W=1 TO 2000: NEXT
00570 K=0
00580 P=I:GOTO 610
00590 K=K+1: IF K=48 THEN 4450
00600 P=P+1: IF P=P1+1 THEN P=1
00610  FOR I=1 TO 5: REM   SELECT 5 LEGAL MOVES
00620 R(I)=INT(9*RND(R1)+1)
00630 C(I)=INT(12*RND(R1)+1)
00640    FOR I1=I-1 TO 0 STEP -1
00650 IF R(I)=R(I1) AND C(I)=C(I1) THEN  620
00660    NEXT I1
00670 IF M(R(I),C(I))>1 THEN 620
00680    FOR I1=1 TO 5
00690 IF Q(I1)=0 THEN  870
00700    NEXT I1
00710 IF M(R(I),C(I)+1)>3 THEN 870
00720 IF M(R(I),C(I)-1)>3 THEN 870
00730 IF M(R(I)+1,C(I))>3 THEN 870
00740 IF M(R(I)-1,C(I))>3 THEN 870
00750 A1=M(R(I),C(I)+1)
00760 A2=M(R(I),C(I)-1)
00770 A3=M(R(I)+1,C(I))
00780 A4=M(R(I)-1,C(I))
00790 IF A1=2 AND A2<4 AND A3<4 AND A4<4 THEN  620
00800 IF A2=2 AND A1<4 AND A3<4 AND A4<4 THEN  620
00810 IF A3=2 AND A1<4 AND A2<4 AND A4<4 THEN  620
00820 IF A4=2 AND A1<4 AND A2<4 AND A3<4 THEN  620
00830 IF A1=3 AND A2<4 AND A3<4 AND A4<4 THEN  620
00840 IF A2=3 AND A1<4 AND A3<4 AND A4<4 THEN  620
00850 IF A3=3 AND A1<4 AND A2<4 AND A4<4 THEN  620
00860 IF A4=3 AND A1<4 AND A2<4 AND A3<4 THEN  620
00870   NEXT I
00880 GOSUB 2060
00890 PRINT
00900 I=P
00910 GOSUB 490
00920 PRINT ", HERE ARE YOUR LEGAL MOVES FOR THIS TURN"
00930 PRINT
00940   FOR I=1 TO 5
00950 PRINT R(I);MID$(M$,C(I),1);" ";
00960   NEXT I
00970 PRINT :PRINT
00980 INPUT "WHAT IS YOUR MOVE ";R$
00990 IF LEN(R$)=0 THEN R$="S"
01000 IF LEFT$(R$,1)="M" THEN R$="" ELSE 1030
01010 GOSUB 2060
01020 GOTO 900
01030 IF LEFT$(R$,1)="S" THEN R$="" ELSE 1060
01040 GOSUB 3230
01050 GOTO 900
01060 IF LEN(R$)<>2 THEN 1110
01070 IF ASC(MID$(R$,2,1))-64<1 THEN 1110
01080 IF ASC(MID$(R$,2,1))-64>12 THEN 1110 ELSE 1120
01090 IF VAL(R$)<1 THEN 1110
01100 IF VAL(R$)>9 THEN 1110
01110 PRINT "I DIDN'T UNDERSTAND THAT - TRY AGAIN ": GOTO 980
01120 R=VAL(LEFT$(R$,1))
01130 C=ASC(RIGHT$(R$,1))-64
01140   FOR I= 1 TO 5
01150 IF R=R(I) AND C=C(I) THEN  1190
01160   NEXT I
01170 PRINT "THAT SPACE WAS NOT INCLUDGD IN THE LIST..."
01180 GOTO 980
01190 A1=M(R-1,C)
01200 A2=M(R+1,C)
01210 A3=M(R,C+1)
01220 A4=M(R,C-1)
01230 IF A1<=1 AND A2<=1 AND A3<=1 AND A4<=1 THEN M(R,C)=2 ELSE 1250
01240 GOTO 1760
01250 IF A1>3 AND A2>3 AND A2<>A1 THEN GOSUB 2220:REM - LINE 2090 IS
01260 IF A1>3 AND A3>3 AND A3<>A1 THEN GOSUB 2220:REM   THE MERGER SUB.
01270 IF A1>3 AND A4>3 AND A4<>A1 THEN GOSUB 2220
01280 IF A2>3 AND A3>3 AND A3<>A2 THEN GOSUB 2220
01290 IF A2>3 AND A4>3 AND A4<>A2 THEN GOSUB 2220
01300 IF A3>3 AND A4>3 AND A4<>A3 THEN GOSUB 2220
01310 IF A1<4 AND A2<4 AND A3<4 AND A4<4 THEN 1410
01320 IF M(R,C)>3 THEN 1760
01330 IF A1>3 THEN I=A1-3
01340 IF A2>3 THEN I=A2-3
01350 IF A3>3 THEN I=A3-3
01360 IF A4>3 THEN I=A4-3
01370 Q(I)=Q(I)+1
01380 S1(I)=S1(I)+100
01390 M(R,C)=I+3
01400 GOTO 1570
01410   FOR I=1 TO 5
01420 IF Q(I)=0 THEN 1460
01430   NEXT I
01440 IF M(R,C)<3 THEN M(R,C)=2
01450 GOTO 1760
01460 CLS
01470 GOSUB 3370
01480 PRINT "A NEW SHIPPING COMPANY HAS BEEN FORMED!"
01490 PRINT "IT'S NAME IS ",
01500 RESTORE
01510 READ N,C$
01520 IF I<>N THEN 1510
01530 PRINT C$
01540 S(I,P)=S(I,P)+5
01550 Q(I)=1
01560 PRINT :PRINT :PRINT :PRINT
01570 IF A1=3 THEN S1(I)=S1(I)+500
01580 IF A2=3 THEN S1(I)=S1(I)+500
01590 IF A3=3 THEN S1(I)=S1(I)+500
01600 IF A4=3 THEN S1(I)=S1(I)+500
01610 IF A1=2 THEN S1(I)=S1(I)+100 ELSE 1640
01620 Q(I)=Q(I)+1
01630 M(R-1,C)=I+3
01640 IF A2=2 THEN S1(I)=S1(I)+100 ELSE 1670
01650 Q(I)=Q(I)+1
01660 M(R+1,C)=I+3
01670 IF A3=2 THEN S1(I)=S1(I)+100 ELSE 1700
01680 Q(I)=Q(I)+1
01690 M(R,C+1)=I+3
01700 IF A4=2 THEN S1(I)=S1(I)+100 ELSE 1730
01710 Q(I)=Q(I)+1
01720 M(R,C-1)=I+3
01730 IF S1(I)>=3000 THEN T1=I ELSE 1750
01740 GOSUB 3100
01750 M(R,C)=I+3
01760  FOR I=1 TO 5
01770 B(P)=B(P)+INT(.05*S(I,P)*S1(I))
01780  NEXT I
01790  FOR I=1 TO 5
01800 IF Q(I)=0 THEN 2040
01810 PRINT :PRINT   "YOUR CURRENT CASH= $";B(P)
01820 PRINT :PRINT   "BUY HOW MANY SHARES OF ";
01830 RESTORE
01840 READ N,C$
01850 IF I<>N THEN 1840
01860 PRINT C$;
01870 PRINT " AT $";S1(I)
01880 PRINT TAB(5); "YOU NOW OWN ";S(I,P);
01890 INPUT R3$:IF LEN(R3$)=0 THEN R3$="0"
01900 IF R3$(1,1)="M" THEN R3$="" ELSE 1930
01910 GOSUB 2060
01920 GOTO 1810
01930 IF R3$(1,1)="S" THEN R3$="" ELSE 1960
01940 GOSUB 3230
01950 GOTO 1810
01960 R3=VAL(R3$)
01970 R3$=""
01980 IF R3*S1(I)<=B(P) THEN 2010
01990 PRINT "YOU ONLY HAVE $";B(P);" - TRY AGAIN"
02000 GOTO 1810
02010 IF R3=0 THEN 2040
02020 S(I,P)=S(I,P)+R3
02030 B(P)=B(P)-(R3*S1(I))
02040   NEXT I
02050 GOTO 590
02060 CLS: REM             SUBROUTINE - PRINT MAP
02070 PRINT TAB(22);"MAP OF THE GALAXY"
02080 PRINT TAB(21);"*******************"
02090 PRINT TAB(13);" A  B  C  D  E  F  G  H  I  J  K  L"
02100   FOR R2=1 TO 9
02110 PRINT "         ";R2;" ";
02120 FOR C2=1 TO 12
02130 PRINT " ";
02140 Z2=M(R2,C2)
02150 IF Z2=0THEN Z2=Z2+1
02160 PRINT MID$(L$,Z2,1)" ";
02180 NEXT
02190 PRINT
02200 NEXT
02210 RETURN
02220 F1=A1-3: IF F1<0 THEN F1=0:REM  SUBROUTINE - CALCULATES THE
02230 F2=A2-3: IF F2<0 THEN F2=0:REM     SURVIVOR IN THE EVENT
02240 F3=A3-3: IF F3<0 THEN F3=0:REM        OF A MERGER
02250 F4=A4-3: IF F4<0 THEN F4=0
02260 T=Q(F1)
02270 T1=F1
02280 IF Q(F2)>Q(F1) THEN T=Q(F2) ELSE 2300
02290 T1=F2
02300 IF Q(F3)>T THEN T=Q(F3) ELSE 2320
02310 T1=F3
02320 IF Q(F4)>T THEN T=Q(F4) ELSE 2340
02330 T1=F4
02340 IF F1=T1 OR A1<4 THEN 2370
02350 X=F1
02360 GOSUB 2470
02370 IF F2=T1 OR A2<4 THEN 2400
02380 X=F2
02390 GOSUB 2470
02400 IF F3=T1 OR A3<4 THEN 2430
02410 X=F3
02420 GOSUB 2470
02430 IF F4=T1 OR A4<4 THEN 2460
02440 X=F4
02450 GOSUB 2470
02460 RETURN
02470 CLS
02480 GOSUB 3370: REM     SUBROUTINE - PERFORMS CALCULATIONS
02490 RESTORE: REM         TO ACCOMPLISH A MERGER
02500 READ N,C$
02510 IF X<>N THEN 2500
02520 C1$=C$
02530 PRINT C1$;
02540 PRINT " HAS JUST BEEN MERGED INTO ";
02550 RESTORE
02560 READ N,C$
02570 IF T1<>N THEN 2560
02580 C2$=C$
02590 PRINT C2$;"!"
02610 PRINT "PLEASE NOTE THE FOLLOWING TRANSACTIONS."
02620 PRINT
02630 PRINT TAB(3);"OLD STOCK = ";C1$;"      NEW STOCK = ";
02640 PRINT C2$
02650 PRINT
02660 PRINT "PLAYER";TAB(10);"OLD STOCK";TAB(22);"NEW STOCK";
02670 PRINT TAB(34);"TOTAL HOLDINGS";TAB(53);"BONUS PAID"
02680   FOR I=1 TO P1
02690 GOSUB 490
02700 PRINT TAB(10);S(X,I);TAB(22);INT((.5*S(X,I))+.5);
02710 PRINT TAB(34);S(T1,I)+INT((.5*S(X,I))+.5);
02720 X1=0
02730    FOR I1=1 TO P1
02740 X1=X1+S(X,I1)
02750    NEXT
02760 PRINT TAB(53);" $";INT(10*((S(X,I)/X1)*S1(X)))
02770   NEXT I
02780   FOR I=1 TO P1
02790 S(T1,I)=S(T1,I)+INT((.5*S(X,I))+.5)
02800 B(I)=B(I)+INT(10*((S(X,I)/X1)*S1(X)))
02810   NEXT I
02820   FOR I=1 TO 9
02830    FOR J=1 TO 12
02840 IF M(I,J)=X+3 THEN M(I,J)=T1+3
02850    NEXT J
02860   NEXT I
02870 A1=M(R-1,C)
02880 A2=M(R+1,C)
02890 A3=M(R,C+1)
02900 A4=M(R,C-1)
02910 F1=A3-3
02920 IF F1<0 THEN F1=0
02930 F2=A2-3
02940 IF F2<0 THEN F2=0
02950 Q(T1)=Q(T1)+Q(X)
02960 S1(T1)=S1(T1)+S1(X)
02970 IF S1(T1)=>3000 THEN GOSUB 3100
02980 F3=A3-3
02990 IF F3<0 THEN F3=0
03000 F4=A4-3
03010 IF F4<0 THEN F4=0
03020 S1(X)=100
03030 Q(X)=0
03040   FOR I=1 TO P1
03050 S(X,I)=0
03060   NEXT I
03070 PRINT :PRINT
03080 M(R,C)=T1+3
03090 RETURN
03100 GOSUB 3370: REM        SUBROUTINE - CALCULATES STOCK SPLITS
03110 PRINT "THE STOCK OF ",
03120 RESTORE
03130 READ N,C$
03140 IF T1<>N THEN 3130
03150 PRINT C$,
03160 PRINT " HAS SPLIT 2 FOR 1 !"
03170 S1(T1)=INT(S1(T1)/2)
03180 PRINT :PRINT
03190   FOR I1=1 TO P1
03200 S(T1,I1)=2*S(T1,I1)
03210   NEXT I1
03220 RETURN
03230 CLS
03240 PRINT
03250 PRINT "STOCK";TAB(30);"PRICE PER SHARE";
03260 PRINT TAB(50);"YOUR HOLDINGS"
03270   FOR I3=1 TO 5
03280 IF S1(I3)=100 THEN 3340
03290 RESTORE
03300 READ N,C$
03310 IF I3<>N THEN 3300
03320 PRINT C$,
03330 PRINT TAB(30);S1(I3);TAB(50);S(I3,P)
03340   NEXT I3
03350 RESTORE
03360 RETURN
03370 PRINT CHR$(7)
03380 PRINT TAB(22);"SPECIAL ANNOUNCEMENT !!!":PRINT
03390 PRINT
03400 RETURN
03410 CLS
03420 PRINT "   STAR LANES IS A GAME OF INTERSTELLAR TRADING."
03430 PRINT "THE OBJECT OF THE GAME IS TO AMASS THE GREATEST AMOUNT"
03440 PRINT "OF MONEY.  THIS IS ACCOMPLISHED BY ESTABLISHING VAST,"
03450 PRINT "INTERSTELLAR SHIPPING LANES, AND PURCHASING STOCK IN"
03460 PRINT "THE COMPANIES THAT CONTROL THOSE TRADE ROUTES.  DURING"
03470 PRINT "THE COURSE OF THE GAME, STOCK APPRECIATES IN VALUE AS"
03480 PRINT "THE SHIPPING COMPANIES BECOME LARGER.  ALSO, SMALLER"
03490 PRINT "COMPANIES CAN BE MERGED INTO LARGER ONES, AND STOCK"
03500 PRINT "IN THE SMALLER FIRM IS CONVERTED INTO STOCK IN THE"
03510 PRINT "LARGER ONE AS DESCRIBED BELOW.":PRINT
03520 PRINT "EACH TURN, THE COMPUTER WILL PRESENT THE PLAYER WITH"
03530 PRINT "FIVE PROSPECTIVE SPACES TO OCCUPY ON A 9X12 MATRIX"
03540 PRINT "(ROWS 1-9, COLUMNS A-L).  THE PLAYER, AFTER EXAMINING"
03550 PRINT "THE MAP OF THE GALAXY TO DECIDE WHICH SPACE HE WISHES"
03560 PRINT "TO OCCUPY, RESPONDS WITH THE ROW AND COLUMN OF THAT"
03570 PRINT "SPACE, I.E., 7E, 8A, ETC.  THERE ARE FOUR POSSIBLE"
03580 PRINT "MOVES A PLAYER CAN MAKE.":PRINT :PRINT
03590 PRINT
03600 GOSUB 3620
03610 GOTO 3660
03620 INPUT "PRESS RETURN TO CONTINUE";X2$
03650 RETURN
03660 CLS
03670 PRINT "   1. HE CAN ESTABLISH AN UNATTACHED OUTPOST- IF HE"
03680 PRINT "SELECTS A SPACE THAT IS NOT ADJACENT TO A STAR, ANOTHER"
03690 PRINT "UNATTACHED OUTPOST, OR AN EXISTING SHIPPING LANE, THIS"
03700 PRINT "SPACE WILL BE DESIGNATED WITH A '+'.  HE WILL THEN PROCEED"
03710 PRINT "WITH STOCK TRANSACTIONS, AS LISTED BELOW.":PRINT
03720 PRINT "   2. HE CAN ADD TO AN EXISTING LANE- IF HE SELECTS A"
03730 PRINT "SPACE THAT IS ADJACENT TO ONE - AND ONLY ON E EXISTING"
03740 PRINT "SHIPPING LANE, THE SPACE HE SELECTS WILL BE ADDED TO "
03750 PRINT "THAT SHIPPING LANE AND WILL BE DISIGNATED WITH THE FIRST"
03760 PRINT "LETTER OF THE COMPANY THAT OWNS THAT LANE.  IF THERE ARE"
03770 PRINT "ANY STARS OR UNATTACHED OUTPOSTS ALSO ADJACENT TO THE"
03780 PRINT "SELECTED SPACE, THEY, TOO, WILL BE INCORPORATED INTO THE"
03790 PRINT "EXISTING LANE.  EACH NEW SQUARE ADJACENT TO A STAR ADDS"
03800 PRINT "$500 PER SHARE, AND EACH NEW OUTPOST ADDS $100 PER SHARE"
03810 PRINT "TO THE MARKET VALUE OF THE STOCK OF THAT COMPANY."
03820 PRINT :PRINT
03830 GOSUB 3620
03840 CLS
03850 PRINT "   3. HE MAY ESTABLISH A NEW SHIPPING LANE- IF THERE"
03860 PRINT "ARE FIVE OR LESS EXISTING SHIPPING LANES ESTABLISHED,"
03870 PRINT "THE PLAYER MAY, GIVEN THE PROPER SPACE TO PLAY, ESTABLISH"
03880 PRINT "A NEW SHIPPING LANE.  HE MAY DO THIS BY OCCUPYING A SPACE"
03890 PRINT "ADJACENT TO A STAR OR ANOTHER UNATTACHED OUTPOST, BUT"
03900 PRINT "NOT ADJACENT TO AN EXISTING SHIPPING LANE.  IF HE"
03910 PRINT "ESTABLISHES A NEW SHIPPING LANE, HE IS AUTOMATICALLY"
03920 PRINT "ISSUED 5 SHARES KN THE NEW COMPANY AS A REWARD.  HE"
03930 PRINT "MAY THEN PROCEED TO BUY STOCK IN ANY ACTIVE COMPANY,"
03940 PRINT "INCLUDING THE ONE JUST FORMED, AS DESCRIBED BELOW."
03950 PRINT "THE MARKET VALUE OF THE NEW STOCK IS ESTABLISHED BY"
03960 PRINT "THE NUMBER OF STARS AND OCCUPIED SPACES AS DESCRIBED"
03970 PRINT "IN #2 ABOVE."
03980 PRINT :PRINT
03990 GOSUB 3620
04000 CLS
04010 PRINT "   4.  HE MAY MERGE TWO EXISTING COMPANIES- IF A PLAYER"
04020 PRINT "SELECTS A SPACE ADJACENT TO TWO EXISTING SHIPPING"
04030 PRINT "LANES, A MERGER OCCURS.  THE LARGER COMPANY TAKES OVER THE"
04040 PRINT "SMALLER COMPANY - (IF BOTH COMPANIES ARE THE SAME SIZE"
04050 PRINT "PRIOR TO THE MERGER, THEN THE SURVIVOR IS DETERMINED BY"
04060 PRINT "ALPHABETICAL ORDER OF THE TWO COMPANY NAMES - THE EARLIER"
04070 PRINT "SURVIVES).  THE STOCK OF THE SURVIVING COMPANY IS"
04080 PRINT "INCREASED IN VALUE ACCORDING TO THE NUMBER OF SPACES"
04090 PRINT "AND STARS ADDED TO ITS LANE.  EACH PLAYERS STOCK IN"
04100 PRINT "THE DEFUNCT COMPANY IS EXCHANGED FOR SHARES KN THE"
04110 PRINT "SURVIVOR ON A RATIO OF 2 FOR 1.  ALSO, EACH PLAYER"
04120 PRINT "IS PAID A CASH BONUS PROPORTIONAL TO THE PERCENTAGE"
04130 PRINT "OF OUTSTANDING STOCK HE HELD IN THE DEFUNCT COMPANY."
04140 PRINT "NOTE: AFTER A COMPANY BECOMES DEFUNCT THROUGH THE"
04150 PRINT "MERGER PROCESS, IT CAN REAPPEAR ELSE WHERE ON THE"
04160 PRINT "BOARD WHEN, AND IF , A NEW COMPANY IS ESTABLISHED."
04170 PRINT :PRINT
04180 GOSUB 3620
04190 CLS
04200 PRINT "   NEXT THE COMPUTER CDDS STOCK DIVIDENDS TO THE PLAYER'S"
04210 PRINT "CASH ON HAND (5% OF THE MARKET VALUE OF THE STOCK IN HIS"
04220 PRINT "POSSESSION ), AND OFFERS HIM THE OPPOR TUNITY TO PURCHASE"
04230 PRINT "STOCK KN ANY OF THE ACTIVE COMPANIES ON THE BOARD."
04240 PRINT "STOCK MAY NOT BE SOLD, BUT THE MARKET VALUE OF EACH"
04250 PRINT "PLAYER'S STOCK IS TAKEN INTO ACCOUNT AT THE END OF THE"
04260 PRINT "GAME TO DETERMINE THE WINNER. IF THE OARKET VALUE OF A GIVEN"
04270 PRINT "STOCK EXCEEDS $3000 AT ANY TIME DURING THE GAME, THAT"
04280 PRINT "STOCK SPLITS 2 FOR 1.  THE PRICE IS CUT IN HALF, AND "
04290 PRINT "THE NUMBER OF SHARES OWNED BY THAT PLAYER IS DOUBLED."
04300 PRINT
04310 PRINT "NOTE:  THE PLAYER MAY LOOK AT HIS PORTFOLIO AT ANY TIME"
04320 PRINT "DURING THE COURSE OF HIS TURN BY RESPONDING WITH 'STOCK'"
04330 PRINT "TO AN INPUT STATEMENT.  LIKEWISE, HE CAN REVIEW THE MAP"
04340 PRINT "OF THE GALAXY BY TYPING 'MAP' TO AN INPUT STATEMENT."
04350 PRINT :PRINT
04360 GOSUB 3620
04370 CLS
04380 PRINT :PRINT :PRINT :PRINT :PRINT :PRINT :PRINT :PRINT
04390 PRINT TAB(16);"** GAME ENDS AFTER 48 MOVES **"
04400 PRINT :PRINT :PRINT :PRINT
04410 PRINT "PLAYER WITH THE GREATEST NET WORTH AT THAT POINT IS THE WINNER."
04420 PRINT :PRINT
04430 FOR W=1 TO 2000:NEXT W
04440 RETURN
04450 CLS
04460 GOSUB 3370
04470 FOR W=1 TO  500:NEXT W:PRINT CHR$(7)
04480 FOR W=1 TO 500:NEXT W:PRINT CHR$(7)
04490 PRINT TAB(10)," THE GAME IS OVER - HERE ARE THE FINAL STANDINGS"
04500 PRINT :PRINT :PRINT :PRINT
04510 PRINT CHR$(7)
04520 PRINT "PLAYER";TAB(10);"CASH VALUE OF STOCK";TAB(33);"CASH ON HAND ",
04530 PRINT TAB(50);"NET WORTH"
04540 PRINT
04550   FOR I=1 TO P1
04560    FOR J=1 TO 5
04570 D1(I)=D1(I)+(S1(J)*S(J,I))
04580    NEXT J
04590   NEXT I
04600   FOR I=1 TO P1
04610 GOSUB 490
04620 PRINT TAB(10);"$";D1(I);TAB(33);"$";B(I);
04630 PRINT TAB(50);"$";D1(I)+B(I)
04640   NEXT I
04650 PRINT :PRINT :PRINT :PRINT
04660 END
