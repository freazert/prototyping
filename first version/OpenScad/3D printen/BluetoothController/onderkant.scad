include <C:\Users\Kris\Documents\OpenSCAD\full_thing_scad.scad>


PCB_width=8.5;
        PCB_height=1;
        PCB_length = 8;
        PCB_thickness = 0.5;
        PCB_position_Y = 0;
        PCB_position_Z = 0;
        
        PCB_hole_diea = 0.1;
        PCP_hole_offwidth = 2;
        
        Battery_width=2.5;
        Battery_height = 1;
        Battery_length =5;
        Battery_thickness = 0.5;
        
        Battery_position_Y = 0;
        Battery_position_Z = 0;
        Battery_position_X = 8.5;
        
    
        
        screw5_x= Battery_position_X;
        screw5_y=-0;
        screw5_z=0;
        
module board()
{
   /* difference()
    {
       
        translate([0,-(PCB_length)/2,PCB_position_Z-PCB_height]) 
        cube([PCB_width+PCB_thickness,PCB_length+           PCB_thickness,PCB_height+PCB_thickness],true);
        
        translate([0,-PCB_length/2,PCB_position_Z-PCB_height]) 
        cube([PCB_width,PCB_length,2],true);
    }
    
   */ translate([PCB_width/2-PCP_hole_offwidth,-1,-1.5]) 
    
    scale([1,1,10])
    cylinder(PCB_hole_diea,PCB_hole_diea, PCB_hole_diea);
    
    translate([-PCB_width/2+PCP_hole_offwidth,-1,-1.5]) 
    
    scale([1,1,10])
    cylinder(PCB_hole_diea,PCB_hole_diea, PCB_hole_diea);
}
module battery()
{
     /*difference()
    {
       
        translate([Battery_position_X,-(Battery_length)/2+Battery_position_Y,Battery_position_Z-Battery_height]) 
        cube([Battery_width+Battery_thickness,Battery_length+           Battery_thickness,Battery_height+Battery_thickness],true);
        
        translate([Battery_position_X,-Battery_length/2+Battery_position_Y,Battery_position_Z-Battery_height]) 
        cube([Battery_width,Battery_length,10],true);
    }*/
}
scale([10,10,10])
difference()
{
    union()
    {
        onderkant();
        battery();
        board();
    }
}