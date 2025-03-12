
void setup(){
size(1000,800);
background(0,0,0);
changey = 0;
move =1;
}
//randomSeed(6);



void draw() {
   background(0, 0, 0);//画面のリセット
   move();
   print();
}

  //変数の宣言、大文字は座標、小文字は数値
  int F;//床の座標
  int X;//中心のX座標
  int r;//半径
  int d;//直径
  int movey;//上下運動の大きさ
  int l;//脚の長さ
  int Y;//中心のY座標
  int w;//波の幅、大きくなるほど細かくなる。数式より、半径に依存しているため数値の固定のみ。
  int wh;//波の高さ
  int hr;//穴の半径
  int hd;//穴の直径
  int eye;//目の大きさ、直径
  int EyeL;//目の高さの座標
  int eyedis;//目の離れ具合
  int LY; //脚の付け根の高さの座標
  int ldis;//脚の離れ具合
  int KneeH;//膝の高さの座標
  int knees;//膝の太さ
  int kneedis;//膝の離れ具合
  int f;//足の大きさ
  int fh;//足の高さ
  int heel;//かかとの大きさ

 int changey ;//現在の下り具合
 int vy ; //上下運動のスピード
 int move; //上下の判定

  //関
    
  
  
  void move(){
    if(changey == 0){
      move = 1;
    }
    if(changey >= 0 && changey < movey && move == 1 ){
      changey += vy;
      }
  if(changey == movey){
      move = 0;
    }
     if(changey <= movey && changey > 0 && move == 0){
    changey -= vy;
    }
  }
  
  void print(){
    X = 500;
    F= 500;
    r = 60;
    d = r*2;
    movey= r/2;
    l = r;
    Y = F -( r + l - changey);
    w = 12;
    wh = r/10;
    hr = r/3;
    hd = hr*2;
    eye = r/3;
    EyeL = Y-hr;
    eyedis = hr+eye/2;
    LY = F - l -r/10;
    ldis = hr;
    KneeH = F -(F - Y - r)/2;
    knees = r/12;
    kneedis = hr + changey;
    f = r/2;
    fh = l/10;
    heel = fh/2;
    vy = 1;
  //大きな丸、輪郭あり、黒
 stroke(255,255,255);//線を白
 strokeWeight(2);//線の太さ
 fill(0,0,0);//中を黒
 ellipse(X,Y, d,d);
 
 strokeWeight(2);
 stroke(255,255,255);
 fill(255,255,255);
 int LXl = X -ldis;
 int KXl = X-kneedis;
  int LXr = X + ldis;
  int KXr= X+kneedis;
  int FH = F - fh;
 quad(LXl,LY,KXl-knees,KneeH,LXl,FH,KXl,KneeH);//左脚
 quad(LXr,LY,KXr+knees,KneeH,LXr,FH,KXr,KneeH);//右脚
 triangle(LXl,FH ,LXl+heel,F,LXl-f,F);
  triangle(LXr,FH ,LXr-heel,F,LXr+f,F);
 
  //波線〜下の弧まで白
  float sw = r/40;
 strokeWeight(sw);
 for (float i =0  ; i < 180 ; i += 0.5){
 stroke(255,255,255);
 line(X+cos(radians(i))*r,Y+sin(radians(i))*r, X+cos(radians(i))*r, Y+sin(radians(i*w))*wh+r/10);
 //波線より下が白、波線は中心より(r/10)下
 }
 
 //目
 noStroke();
 fill(255,255,255);
 arc(X-eyedis,EyeL,eye,eye,radians(0),radians(180));
 arc(X+eyedis,EyeL,eye,eye,radians(0),radians(180));
 
 //粒々
  strokeWeight(5);
strokeJoin(ROUND);
 randomSeed(1);
 fill(0,0,0);
 int tY = Y + r/2;//粒々のY座標
 int tw = d/8;//粒々の間隔
 int tX = X - r;//粒々の始めのX座標
 int tr = r/6;//ランダムの振り幅
 int tru = tr/2;
 int trix;
 int triy;
 int triix ;
 int triiy ; 
 int triiix ;
 int triiiy;
 for(int i = 0 ; i < 7 ; i++){
   trix = int(random(-tru,tru)); 
   triy = int(random(0,tru));
   triix = int(random(tru,tr)); 
   triiy = -int(random(tru,tr));
   triiix = -int(random(tru,tr)); 
   triiiy = -int(random(tru,tr));
   tX = tX + tw;
  triangle(tX+trix,tY+triy,tX+triix,tY+triiy,tX+triiix,tY+triiiy);
  if(tY == Y+r/2){
  tY = Y + r*4/5 ;
  }else{
  tY = Y+r/2;
  }
 } 
 strokeJoin(MITER);
  //穴,輪郭あり、黒
 strokeWeight(2);
 stroke(255,255,255);
 fill(0,0,0);
 ellipse(X,Y,hd,hd);
  }
  



/*class Donut{
 
 void update(){
 print();
 }
 int floor;
 int moveY;
 int posX;
 int posY;
 int r;
 int d;
 int hr;
 int hd;//穴の直径
 int waveW;
 int waveH;
 int eyelevel;
 int eye;
 int eyedis;
 int foot;
 int footh;
 int knees;
 int kneew;
 int kneeh;
 int ljlX;
 int ljY;
 int ljrX ;
 int triX;
 int triY;
 
 Donut(int X,int Y, int R){
 floor = Y-1;
 r = R;
 d = r*2;
 posX = X;
 posY = floor -r/5*8;
 hr = r/3 ;
 hd = hr*2;
 waveW = 12;
 waveH = r/10;
 eyelevel = posY-hr;
 eye = r/3;
 eyedis = r/5;
 foot = r/2;
 footh = floor-r/12; 
 knees = r/20;
 kneew = r/14;
 kneeh =(footh+posY+r)/2;
 ljlX = posX-hr; 
 ljY = posY+r-r/5;
 ljrX = posX +hr+ r/7;
 }
 
 void print(){
 //下地
 stroke(255,255,255);
 strokeWeight(2);
 fill(0,0,0);
 ellipse(posX,posY, d,d);
 //波線
 strokeWeight(1);
 for (float i =0  ; i < 180 ; i += 0.5){
 stroke(255,255,255);
 line( posX+cos(radians(i))*r, posY+r/10+sin(radians(i*waveW))*waveH,posX+cos(radians(i))*r,posY+sin(radians(i))*r);//波線より下が白
 }
 
 //脚
 strokeWeight(2);
 strokeJoin(ROUND);
 stroke(255,255,255);
 fill(255,255,255);
 quad(ljlX,ljY,ljlX+kneew-knees,kneeh,ljlX,floor,ljlX-knees,kneeh);
 quad(ljrX,ljY,ljrX+kneew-knees,kneeh,ljrX,floor,ljrX-knees,kneeh);
 triangle(ljlX,footh,ljlX+knees,floor,ljlX-foot,floor);
 triangle(ljrX,footh,ljrX+knees,floor,ljrX-foot,floor);
 
 //半目
 noStroke();
 fill(255,255,255);
 arc(posX-hr-eyedis,eyelevel,eye,eye,radians(0),radians(180));
 arc(posX+hr+eyedis,eyelevel,eye,eye,radians(0),radians(180));
 
 //粒々
/*fill(0,0,0);
 stroke(0,0,0);
 strokeJoin(ROUND);
 
 triangle(triX+9,triY+10,triX+8,triY+3,triX+5,triY+6);
 triangle(triX+22,triY+20,triX+20,triY+13,triX+28,triY+19);
 triangle(triX+37,triY+15,triX+46,triY+14,triX+38,triY+18);
 triangle(triX+50,triY+30,triX+42,triY+35,triX+47,triY+28);
 triangle(triX+64,triY + 25,triX+69,triY+30,triX + 68,triY+19);
 triangle(triX+79,triY+5,triX+82,triY+10,triX+75,triY+12);
 
 
 //穴
 stroke(255,255,255);
 fill(0,0,0);
 ellipse(posX,posY,hd,hd);
 
 }
 }*/







/*int floor;
int posX;
int posY;
int r;
int d;
int hr;
int hd;//穴の直径
int eyelevel;
int eye;
int ljlX;
int ljY;
int ljrX ;
int triX;
int triY;

posX = width/2;
floor = height/2 ;
posY = floor -80;
r = 50;
d = r*2;
hr = 17;
hd = hr*2;
eyelevel = posY-hr+3;
eye = 16;
ljlX = posX-hr; 
ljY = posY+r-10;
ljrX = posX +hr +4;
triX = posX - r+3;
triY = posY+10;



stroke(255,255,255);
strokeWeight(1);
for (float i =0  ; i < 180 ; i += 0.5){
line( posX+cos(radians(i))*r, posY+5+sin(radians(i*13))*5,posX+cos(radians(i))*r,posY+sin(radians(i))*r);//波線より上が黒
}

//脚
strokeWeight(2);
strokeJoin(ROUND);
stroke(255,255,255);
fill(255,255,255);
quad(ljlX,ljY,ljlX+2,ljY+20,ljlX,floor,ljlX-4,ljY+20);
quad(ljrX,ljY,ljrX+2,ljY+20,ljrX,floor,ljrX-4,ljY+20);
triangle(ljlX,floor-4,ljlX+1,floor,ljlX-20,floor);
triangle(ljrX,floor-4,ljrX+1,floor,ljrX-20,floor);

//半目
noStroke();
fill(255,255,255);
arc(posX-hr-10,eyelevel,eye,eye,radians(0),radians(180));
arc(posX+hr+10,eyelevel,eye,eye,radians(0),radians(180));

//粒々
fill(0,0,0);
stroke(0,0,0);
strokeJoin(ROUND);
 
triangle(triX+9,triY+10,triX+8,triY+3,triX+5,triY+6);
triangle(triX+22,triY+20,triX+20,triY+13,triX+28,triY+19);
triangle(triX+37,triY+15,triX+46,triY+14,triX+38,triY+18);
triangle(triX+50,triY+30,triX+42,triY+35,triX+47,triY+28);
triangle(triX+64,triY + 25,triX+69,triY+30,triX + 68,triY+19);
triangle(triX+79,triY+5,triX+82,triY+10,triX+75,triY+12);


//輪郭
stroke(255,255,255);
noFill();
ellipse(posX,posY, d,d);
//穴
fill(0,0,0);
ellipse(posX,posY,hd,hd);


int triY = int(random(posY,posY+15));
int triX = posX-r;
int s = 20;
int[] x,y,tri,trii,triii,triiii;
x = new int[s]; y = new int[s];
 tri = new int[s]; trii = new int[s];
 triii = new int[s]; triiii = new int[s];

for(int i=0; i < s && triX < posX + r ; ++i){
   x[i] = int(random(triX,triX+5)); y[i] = int(random(triY,triY+15));
   tri[i] = int(random(-3,9)); trii[i] = int(random(-3,9));
   triii[i] = int(random(-3,9)); triiii[i] = int(random(-3,9));
   triangle(x[i],y[i],x[i]+tri[i],y[i]+trii[i],x[i]+triii[i],y[i]+triiii[i]);
   triX = x[i]+5;
   triY = y[i]+8;
   if(triY > posY+r-10){
   triY = triY - 40; 
   }
 }*/
