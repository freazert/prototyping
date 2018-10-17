width = 130;
length = 100;


joystick_width = 33;
joystick_length = 25;

joystick_inner_width = 21;
joystick_inner_length = 26;

btn_size = 6;

posj1_x = -width/2+30;
posj1_y = length/2-30;

posj2_x = width/2-30;
posj2_y = length/2-30;

screen_width = 80.6;
screen_length = 36;

screen_inner_width = 69;
screen_inner_length = 24;

pos_screen_x = width/2-30-19;
pos_screen_y = length/2-7-10;


module screws()
{
    
 translate([width/2-3, length/2-3, border_thick+13])
 rotate([180,0,0])   
 circle(1, $fn=50,center=true);
    
 translate([-width/2+3, -length/2+3, border_thick+13])
 rotate([180,0,0])   
 circle(1, $fn=50,center=true);
    
    translate([-width/2+3, length/2-3, border_thick+13])
 rotate([180,0,0])   
 circle(1, $fn=50,center=true);
    
    translate([width/2-3, -length/2+3, border_thick+13])
 rotate([180,0,0])   
 circle(1, $fn=50,center=true);
}

module screwsJoystick()
{
    translate([3/2+1,3/2+1])
    circle(2, $fn=50,center=true);
    
    translate([3/2+1,3/2+1])
    circle(2, $fn=50,center=true);
}
module screwsScreen()
{
    translate([4/2+1.2,4/2+1.2])
    circle(3, $fn=50,center=true);
}
module screen()
{
    
    
        translate([(screen_width-screen_inner_width)/2,(screen_length-screen_inner_length)/2])
        square(size = [screen_inner_width, screen_inner_length]);
       screwsScreen(); 
        translate([0,29.6])
        screwsScreen(); 
        
        translate([74,29.6])
        screwsScreen(); 
        
        translate([74,0])
        screwsScreen(); 
    
}
module joysticks()
{
    //translate([posj1_x,posj1_y])
    
        translate([6,-0.5])
        square(size = [joystick_inner_width   ,  joystick_inner_length]); 
    screwsJoystick();
    translate([27,0])
    screwsJoystick();
    translate([0,17])
    screwsJoystick();
    translate([27,17])
    screwsJoystick();
    
    //translate([posj2_x,posj2_y])
    //square(size = [joystick_width, joystick_length], center = true); 
}
module screw_lipo_charger()
{
    circle(4, $fn=50);
    translate([23,0])
    circle(4, $fn=50);
}

module buttons()
{
}
translate([0,0,1])
difference(){
    square(size = [width, length], center = true); 
    screws();
    translate([-60,-30])
    joysticks();
    mirror()
    translate([-60,-30])
    joysticks();
    translate([-60,10])
    screen();
    translate([14,-40])
    screw_lipo_charger();
}