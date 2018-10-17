rotate([00,0,0])
translate([0,0,1])
    difference()
    {
    union()
    {
    scale([0.25,0.25,4])
    cylinder(10,10,10,$fn=200);
    
    
    translate([0,0,-1.5]) 
    cube([6.5,6.5,7],true);
    }
    translate([0,0,-1.8]) 
    cube([6.2,6.2,7],true);
    
}