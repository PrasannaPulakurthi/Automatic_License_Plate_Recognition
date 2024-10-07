
aa(1:42,1:24)=1;
aa(1:42,1)=0;
aa(1:42,24)=0;
aa(1,1:24)=0;
aa(42,1:24)=0;
imwrite(aa,'pen.bmp','bmp');
A=imread('A.bmp');
B=imread('B.bmp');
B1=imread('B1.bmp');
C=imread('C.bmp');
D=imread('D.bmp');
D1=imread('D1.bmp');
E=imread('E.bmp');
F=imread('F.bmp');
G=imread('G.bmp');
G1=imread('G1.bmp');
G2=imread('G2.bmp');
H=imread('H.bmp');
H1=imread('H1.bmp'); 
I=imread('I.bmp');
J=imread('J.bmp');
K=imread('K.bmp');
L=imread('L.bmp');
M=imread('M.bmp');
M1=imread('M1.bmp');
M2=imread('M2.bmp');
N=imread('N.bmp');
N1=imread('N1.bmp');
O=imread('O.bmp');
P=imread('P.bmp');
Q=imread('Q.bmp');
R=imread('R.bmp');
S=imread('S.bmp');
T=imread('T.bmp');
U=imread('U.bmp');
V=imread('V.bmp');
W=imread('W.bmp');
W1=imread('W1.bmp');
X=imread('X.bmp');
Y=imread('Y.bmp');
Z=imread('Z.bmp');
Afill=imread('fillA.bmp');
Bfill=imread('fillB.bmp');
Dfill=imread('fillD.bmp');
Ofill=imread('fillO.bmp');
Pfill=imread('fillP.bmp');
Qfill=imread('fillQ.bmp');
Rfill=imread('fillR.bmp');




%Number
one=imread('1.bmp');  
two=imread('2.bmp');
twoa=imread('2a.bmp');
three=imread('3.bmp');
four=imread('4.bmp');
five=imread('5.bmp');
six=imread('6.bmp');
seven=imread('7.bmp');
eight=imread('8.bmp');
nine=imread('9.bmp');
zero=imread('0.bmp');
zeroa=imread('0a.bmp');
zerofill=imread('fill0.bmp');
fourfill=imread('fill4.bmp');
sixfill=imread('fill6.bmp');
sixfill2=imread('fill6_2.bmp');
eightfill=imread('fill8.bmp');
ninefill=imread('fill9.bmp');
ninefill2=imread('fill9_2.bmp');
a1=imread('pen.bmp');




%*-*-*-*-*-*-*-*-*-*-*-
letter=[A Afill B B1 Bfill C D D1 Dfill E F G G1 G2 H H1 I J K L M M1 M2 ...
    N N1 O Ofill P Pfill Q Qfill R Rfill S T U V W W1 X Y Z];
number=[];
character=[];

number=[one two twoa three four fourfill five six sixfill sixfill2 seven ...
    eight eightfill nine ninefill ninefill2 zero zeroa zerofill a1];

character=[letter number];

NewTemplates=mat2cell(character,42,[24 24 24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 24 24 24 24 24 24]);


char_name={'A';'A';'B';'B';'B';'C' ;'D';'D';'D'; 'E'; 'F'; 'G'; 'G'; 'G'; 'H'; 'H'; 'I'; 'J'; 'K'; 'L' ;
    'M';'M';'M';'N'; 'N';'O' ;'O'; 'P'; 'P'; 'Q' ;'Q'; 'R'; 'R'; 'S' ;'T' ;'U'; 'V'; 'W'; 'W'; 'X'; 'Y';
    'Z';'1'; '2'; '2'; '3' ;'4' ;'4'; '5' ;'6'; '6' ;'6'; '7'; 
    '8'; '8'; '9' ;'9'; '9' ;'0' ;'0' ;'0';'-'};



save ('NewTemplates','NewTemplates','char_name')




