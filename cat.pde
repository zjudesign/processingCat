PImage mao;
//猫头猫图层
//PImage zui;
//猫嘴图层
PImage yu2;
//老鼠图层
// 两张图片的导入变量
int size = 50;
Eye e1,e2;
// 生成两只眼睛
void setup() {
  size(1440, 810);
  // 窗口大小
  mao = loadImage("cat.png");
  //zui = loadImage("mouth.png");
  yu2 = loadImage("mice.png");
  //导入猫猫、嘴巴和老鼠

}
void draw() {
  float X = map(mouseX, 0, 1440, -10, 10);
  float Y = map(mouseY, 0, 810, -10, 10);
  // 将鼠标坐标映射到该范围
  e1 = new Eye( 510+2*X,  258+2*Y, 45);
  e2 = new Eye( 600+2*X,  250+2*Y,45);
  //创建眼睛
  background(255, 182, 185);
  // 设置背景
  imageMode(CENTER);
  // 图片坐标点描点设置为中心
  image(mao, 700+2*X,400+2*Y);
  //image(zui, 570+3*X, 300+3*Y);
  // 设置图片坐标，加上随鼠标移动偏移量
  e1.update(mouseX, mouseY);
  e2.update(mouseX, mouseY);
  e1.display();
  e2.display();
  //眼睛的显示
  line(mouseX-40,0,mouseX-40, mouseY);
  //跟随鼠标的竖线
  image(yu2,mouseX, mouseY);
  //老鼠随鼠标移动


}



class Eye {
  float x, y;
  int size;
  float angle = 0.0;

  Eye(float tx, float ty, int ts) {
    x = tx;
    y = ty;
    size = ts;
 }

  void update(int mx, int my) {
    angle = atan2(my-y, mx-x);
  }

  void display() {
    pushMatrix();
    translate(x, y);
    //变换整个坐标系的位置
    fill(255);
    strokeWeight(4);
    ellipse(0, 0, size, size);
    rotate(angle);
    fill(31, 197,255);
    ellipse(size/4, 0, size/2, size/2);
    popMatrix();
  }
}
