
module dvere(sirka, vyska, hloubka=1) {
  intersection() {
    rotate(90, [1,0,0]) translate([0,vyska*0.2,-hloubka]) cylinder(hloubka,vyska*0.8,vyska*0.8,$fn=64);
    translate([-sirka/2,0,0]) cube([sirka,hloubka,vyska]);
  }
}

dvere(3,5);

//difference() {
//  cylinder(10,5,5, $fn=64);
//  translate([0,4.3,2.5]) okno(2,5);
//  rotate(30,[0,0,1]) translate([0,4.3,2.5]) okno(2,5);
//  rotate(-30,[0,0,1]) translate([0,4.3,2.5]) okno(2,5);
//}