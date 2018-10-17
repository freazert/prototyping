rotate([00,0,0])
    difference()
    {
    union()
    {
    scale([0.25,0.25,1])
    cylinder(10,10,10);
    
    
    translate([0,0,-1.5]) 
    cube([5.5,5.5,3],true);
    }
    translate([0,0,-1.8]) 
    cube([5,5,3],true);
    
}