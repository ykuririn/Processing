int mRange = 10;  //moving range
int fade = 30;  //opacity
float randomR = 0;
float randomG = 0;
float randomB = 0;

int margin = 30;

int marginX = 30;
int marginY = 30;


class Walker {
  float x;      //current position x
  float y;      //current position y
  float prevX;  //previous position x
  float prevY;  //previous position y

  Walker() {
    x = width/2;    //initial position x
    y = height/2;  //initial position y

    prevX = x;
    prevY = y;
  }

  void step() {
    prevX = x;  //前回フレーム時のx座標を保管
    prevY = y;  //前回フレーム時のy座標を保管

    float stepx;  //移動距離
    float stepy;  //移動距離

    //衝突判定 x
    if (x-marginX < mRange) {  //left wall
      stepx = random(-(x-marginX), mRange);
    } else if (width-marginY-x < mRange) {  //right wall
      stepx = random(-mRange, width-marginX-x);
    } else {
      stepx = random(-mRange, mRange);
    }

    //衝突判定 y
    if (y-marginY < mRange) {  //top wall
      stepy = random(-(y-marginY), mRange);
    } else if (height-marginY-y < mRange) {  //bottom wall
      stepy = random(-mRange, height-marginY-y);
    } else {
      stepy = random(-mRange, mRange);
    }

    x += stepx;  //x方向に移動
    y += stepy;   //y方向に移動
  }

  void display() {
    randomR = random(0, 255);
    randomG = random(0, 255);
    randomB = random(0, 255);

    stroke(randomR, randomG, randomB);  //line color
    
    /*
    //距離によって線幅を変更
    float maxLineDist = dist(0, 0, mRange, mRange);
    float lineDist = dist(prevX, prevY, x, y);
    float lineWeight = map(lineDist, 0, maxLineDist, 1, 2);
    strokeWeight(lineWeight);
    */
    
    line(prevX, prevY, x, y);

    /*
    //console
     print("x = ");
     print(x);
     print(", y = ");
     println(y);
     */

    noFill();
    stroke(80);
    strokeWeight(1);
    rect(marginX, marginY, width-(marginX*2), height-(marginY*2));
  }
}

void fadeToBlack() {
  noStroke();
  fill(0, fade);
  rectMode(CORNER);
  rect(0, 0, width, height);
}

Walker w;

void setup() {
  size(640, 320);
  background(0);
  frameRate(15);

  w = new Walker();
}

void draw() {
  fadeToBlack();
  w.step();
  w.display();
}