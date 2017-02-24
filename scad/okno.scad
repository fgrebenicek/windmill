
module okno(sirka, vyska, hloubka=1) {
  translate([-sirka/2,0,0]) cube([sirka,hloubka,vyska]);
}

difference() {
  cylinder(10,5,5, $fn=64);
  translate([0,4.3,2.5]) okno(2,5);
  rotate(30,[0,0,1]) translate([0,4.3,2.5]) okno(2,5);
  rotate(-30,[0,0,1]) translate([0,4.3,2.5]) okno(2,5);
}