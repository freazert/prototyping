include <C:\Users\Kris\Documents\OpenSCAD\full_thing_scad.scad>

module LCD_scherm()
{
    
    
    translate([-4,-5.3,0])
    cube([7,2.1,8]);
}
module pot_meter()
{
    
    translate([-5.4,-4.5,0])
    scale([0.06,0.06,0.7])
    cylinder(10,10,10);
}

module button(x,y)
{
    
    rotate([00,0,0])
    translate([4+x,-3.8+y,-3])
    scale([0.025,0.025,9])
    cylinder(10,10,10);
}

module joystick()
{
    
    translate([-4.2,-2,0.5])
    cube([2,2,4]);
}
module joystick2()
{
    
    translate([2,-2,0.5])
    cube([2,2,4]);
}

module switch()
{
    
    rotate([0,0,0])
    translate([-2.4,-12,-0.1])
    
    cube([1.4,8,1.5]);
}
module touch()
{
    translate([-0,-1,-0])
    scale([1,1,3])
    cube([2,2,2],true);
}

module led()
{
    
    translate([5.0,-7,0.5])
    rotate([90,00,0])
    scale([0.03,0.03,1])
    cylinder(10,10,10,true);
}
scale([10,10,10])
difference()
{
    bovenkant();
    
    
    LCD_scherm();
    pot_meter();
    button(0,0);
    
    joystick();
    joystick2();
    
    button(1.5,0);
    button(0.75,-1);
    switch();
    
    touch();
    led();
}