include <C:\Program Files\OpenSCAD\libraries\MCAD\screw.scad>
        x=450;
        y=1000;
        radius=400;
        
        screw1_x=19;
        screw1_y=8;
        screw1_z=-4.3;
        
        screw2_x=-19;
        screw2_y=8;
        screw2_z=-4.3;
         
        screw3_x=-14;
        screw3_y=-7;
        screw3_z=-2.4;
        
        
        
        screw4_x=13;
        screw4_y=-7;
        screw4_z=-2.4;
        
module pad()
{
    scale([0.68,0.7,1])
    translate([-46,-8,5])
      hull()
    {
        translate([-10,-10,5])
        sphere(30, $fn =100);
        translate([-40,20,0])
        cube([20,20,6]);
        translate([-40,40,0])
        cylinder(6,10,10);
        translate([-15,15,0])
        cylinder(6,15,15);
        translate([-40,40,-2])
        sphere(10, $fn = 100);
    
    };
}

module twoPads()
{
    translate([45,0,0])
    rotate([0,0,-4])
    scale([1,2,1])
    mirror()
    pad();
  
    translate([-45,0,0])
    rotate([0,0,4])
    scale([1,2,1])
    pad();
}


module thing()
{
    scale([18,20,6])
    translate([0,10,-13])
    rotate([-10,0,0])
    twoPads();
    translate([0,0,-100])
    scale([4,2,2])
    hull()
    {
        
        linear_extrude(height=100)
    // place 4 circles in the corners, with the given radius
    translate([(-x/2)+(radius/2), (-y/2)+(radius/2), 0])
    circle(r=radius);

    translate([(x/2)-(radius/2), (-y/2)+(radius/2), 0])
    circle(r=radius);

    translate([(-x/2)+(radius/2), (y/2)-(radius/2), 0])
    circle(r=radius);

    translate([(x/2)-(radius/2), (y/2)-(radius/2), 0])
    circle(r=radius);
     
    translate([-400,-100,0])    
    cube([100,100,100]);
        
    translate([300,-100,0])    
    cube([100,100,100]);
    
        
    translate([300,-100,0])    
    cube([100,100,100]);
        
    translate([-20,-600,20])    
    scale([2,2,0.50])
    sphere(10,$fn=100);
    translate([-20,-30,-30])    
    scale([2,2,0.50])
    sphere(0);
    
    translate([-20,-500,120])    
    scale([2,2,0.50])
    sphere(20,$fn=100  );
    translate([-20,-400,-30])    
    scale([2,2,0.50])
    sphere(1);

    
    }
    
}
module block_inside()
{
    translate([0,-0.3,0.27])
    scale([0.007,0.008,0.00675])
 scale([1.2,0.98,1])
hull(){
        scale([1.05,0.94,1])
    translate([0,-400,0])
    cube([3600,900,500],true);
    translate([0,-700,0])
    cylinder(500,500,500,true);
    }
    

}
module screws(x,y,z)
{
    
    
    translate([x,y,z])
    union()
    {
    scale([9/3,9/3,25/7])
scale([0.19,0.19,0.21])
translate([0,0,-3])
scale([0.049,0.049,0.2])
 cylinder(  15,    10,    10,$fn=100);
scale([8.5/3,8.5/3,25/7])
scale([0.01,0.01,0.01])
 cylinder(  15,    10,    0, $fn =100);
    }
    //screw(screw1_x,screw1_y,screw1_z);
    //screw(screw2_x,screw2_y,screw2_z);
    //scale([1,1,2])
    //screw(screw3_x,screw3_y,screw3_z);
    //scale([1,1,2])
    //screw(screw4_x,screw4_y,screw4_z);
}

module screw(x,y,z)
{
    translate([x,y,z])
    scale([0.0475,0.0475,0.0475])
    translate([5, 0, 0]) auger(40, 80, 25, 5);
}
module splitDown()
{
    
    rotate([-12,0,0]) 
    translate([-23,-0,-51])
    cube([46,22,51],false);
        
    
    translate([-22,-42,-10])
    cube([43,42,10]);
}
module splitUp()
{
    
    rotate([-12,0,0]) 
    translate([-23,-0,0])
    cube([46,20,20],false);
        
        
    translate([-22,-25,0])
    cube([43,30,10]);
}
module bovenkant()
{

    difference()
    {   
    thing_rescaled();
    splitDown();
    }

    
}

module onderkant()
{

difference(){
        thing_rescaled();  
        splitUp();
    }
}

module thing_rescaled()
{
    scale([0.9,0.9,1.5])
    difference()
    {
        scale([0.6,0.8,0.7])
        union()
        {
            difference()
            {
            scale([0.0075,0.0075,0.0065])
            scale([1.3,1,1])
            scale([1,1,3])
            thing();
                
            block_inside();
        }
    
   
}
screws(-11,5.7,-1.2);
    screws(11,5.5,-1.2);
    screws(-4,-7.5,0.5);
}

  
}

