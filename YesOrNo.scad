/* 导入3D模型 YesOrNo.stl 文件，该文件与程序文件在同一目录下。
% 表示以半透明方式查看3D模型，尤其是模型还有较复杂的内部结构时尤为重要。*/

%import("YesOrNo.stl"); 
// 根据中文习惯，程序可以从一对大括号{}内向外进行理解
color("green") // 使用绿色查看左视图投影几何体，系统默认为黄色
rotate([0, -90, 0]) // 将移动后的几何体沿着y轴顺时针旋转90°，旋转方向遵守右手螺旋法则
translate([0, 0, 100]) // 沿着z轴方向线上移动100个单位
linear_extrude(height = 2, center = true) // 将所得截面线性拉伸2个单位
difference() // 使用几何体布尔差值运算，即square平面减去3D投影后剩下的内容
{
square([150,200], center = true); // 建立需要投影的平面
projection() // 建立投影轮廓
rotate([0, 90, 0]) // 由于软件默认的投影方式为顶视图，所以为得到左视图效果，需要将模型沿y轴旋转90°
import("YesOrNo.stl"); // 导入3D模型YorN.stl文件
}

// 下面是重新修改过书写格式的前视图3D模型投影程序
color("red") rotate([90, 0, 0]) translate([0, 0, -100])
linear_extrude(height = 2, center = true) difference() {
square([200,150], center = true);
projection() rotate([90, 0, 0]) import("YesOrNo.stl");
}

translate([0,0,-75]) square([200,200],center=true);
