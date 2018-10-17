
width = 170;//+40
height = 50;
length = 120;//+20

border_thick = 10;

widht_pad = 30;
height_pad = 20;
lenght_pad = 80;

micro_usb_width= 20;
micro_usb_length= 20;
micro_usb_height= 20;

position_micro_usb_x = 20;
position_micro_usb_y =-length/2-micro_usb_width/2;
position_micro_usb_z = height/2-micro_usb_height/2;

switch_width= 20;
switch_length= 20;
switch_height= 20;

switch_offset = -30;
position_switch_x = switch_offset;
position_switch_y = -length/2-micro_usb_width/2;
position_switch_z = height/2-micro_usb_height/2;

battery_width= 40;
battery_length= 40;
battery_height= 20;

position_battery_x = width/2-battery_width/2;
position_battery_y = length/2-battery_length/2;
position_battery_z = 0;

PCB_width= 110;
PCB_length= 80;
PCB_height= 20;

position_PCB_x = position_battery_x-battery_width-22;
position_PCB_y = length/2-PCB_length/2;
position_PCB_z = 0;



module screws()
{
    
 translate([width/2-3, length/2-3, border_thick+13])
 rotate([180,0,0])   
 cylinder(h=5, r1=2, r2=0, $fn=50,center=true);
    
 translate([-width/2+3, -length/2+3, border_thick+13])
 rotate([180,0,0])   
 cylinder(h=5, r1=2, r2=0,$fn=50, center=true);
    
    translate([-width/2+3, length/2-3, border_thick+13])
 rotate([180,0,0])   
 cylinder(h=5, r1=2, r2=0, $fn=50,center=true);
    
    translate([width/2-3, -length/2+3, border_thick+13])
 rotate([180,0,0])   
 cylinder(h=5, r1=2, r2=0, $fn=50, center=true);
}


module mid()
{
    difference()
    {
        cube([width,length,height],true);
        translate([0,0,border_thick])
        cube([width-border_thick,length-border_thick,height],true);
    }
}

module pad(mirror)
{   
    if(mirror)
    {   
        mirror()
        translate([width/2,-(length/2),-(height/2)])
        hull()
        {
            translate([2000,000,2000])
            sphere(2000);
      
            cube([widht_pad,lenght_pad,height_pad],false);
            translate([1500,14000,1000])
            sphere(400);
        }
    }else
    {
        translate([width/2,-(length/2),-(height/2)])
        hull()
        {
            translate([2000,000,2000])
            sphere(2000);
            cube([widht_pad,lenght_pad,height_pad],false);
            translate([1500,14000,1000])
            sphere(400);
        }
    }
    
}
module battery ()
{
    translate([position_battery_x,position_battery_y,position_battery_z])
    difference()
    {
        cube([battery_width,battery_length,battery_height],true);
        translate([0,0,border_thick])
        cube([battery_width-border_thick,battery_length-border_thick,battery_height],true);
    }
    
}

module PCB()
{
  
     translate([position_PCB_x,position_PCB_y,position_PCB_z])
    difference()
    {
        cube([PCB_width,PCB_length,PCB_height],true);
        translate([0,0,border_thick])
        cube([PCB_width-border_thick,PCB_length-border_thick,PCB_height],true);
    }
}
module micro_usb()
{
 
    translate([position_micro_usb_x,position_micro_usb_y,position_micro_usb_z])
    cube([micro_usb_width,micro_usb_length,micro_usb_height]);
}

module switch()
{
 
    translate([position_switch_x,position_switch_y,position_switch_z])
    cube([switch_width,micro_usb_length,switch_height]);
}

module full_model()
{
    difference()
    {
        union()
        {
            mid();
            //battery();
            //PCB();
           // micro_usb();
            
        }
        micro_usb();
        switch();
        screws();
    //pad(true);
    //pad(false);
    }
    
}
full_model();