<<<<<<< HEAD
//2016.12.11 ykuririn

=======
>>>>>>> origin/master
import java.util.Random;
Random generator;

int r;
int g;
int b;

void setup() {
  size(640, 360);
  background(0);
  frameRate(30);
  generator = new Random();  //平均値0, 標準偏差1 の値をランダムに返す
}

void draw() {
  float numX = (float) generator.nextGaussian();  //nextGaussian()はdouble値を返す
  float sdX = 60;        //標準偏差(x座標)
  float meanX = width/2;  //平均値(x座標)
  
  float numY = (float) generator.nextGaussian();  //nextGaussian()はdouble値を返す
  float sdY = 60;        //標準偏差(y座標)
  float meanY = height/2;  //平均値(y座標)

  float x = sdX * numX + meanX;  //標準偏差を乗算し平均を加算
  float y = sdY * numY + meanY;
  
  int cl = int(random(3));
  if(cl==0) {          //CYAN
    r = 0;
    g = 255;
    b = 255;
  } else if (cl==1) {  //MAGENTA
    r = 255;
    g = 0;
    b = 255;
  } else {             //YELLOW
    r = 255;
    g = 255;
    b = 0;
  }
  
  noStroke();
  fill(r,g,b,30);
  ellipse(x,y,15,15);
}