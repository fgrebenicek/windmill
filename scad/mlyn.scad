$fn = 64;

bkamen = [238/255,229/255,208/255];
bdrevo = [140/255,140/255,120/255];  

module strecha(vyska, hloubka) {
  rotate(90, [0,0,1]) rotate(90, [1,0,0])
  linear_extrude(height=hloubka) 
  polygon(points=[[-vyska,0],[vyska,0],[0,vyska]]);
}

module budka(vyska, sirka, hloubka, dx, dz) {
  translate([dx,-sirka/2,dz]) cube([hloubka,sirka,vyska]);
  translate([dx,0,dz+vyska]) strecha(sirka/2,hloubka);
}

module okno(sirka, vyska, hloubka=1) {
  translate([-sirka/2,0,0]) cube([sirka,hloubka,vyska]);
}

module dvere(sirka, vyska, hloubka=1) {
  intersection() {
    rotate(90, [1,0,0]) translate([0,vyska*0.2,-hloubka]) cylinder(hloubka,vyska*0.8,vyska*0.8,$fn=64);
    translate([-sirka/2,0,0]) cube([sirka,hloubka,vyska]);
  }
}

module budova(vyska,sirka,strecha,presah) {
  polomer = sirka/2;
  difference() {
    color(bkamen) cylinder(vyska,polomer,polomer);
    rotate(-45, [0,0,1]) translate([0,polomer-0.5,1.5]) okno(0.5,1.1);
    rotate(-45, [0,0,1]) translate([0,polomer-0.5,3.8]) okno(0.5,1.1);
    rotate(-135, [0,0,1]) translate([0,polomer-0.5,0.1]) dvere(1.3,2.3);
  }
  color(bdrevo)
    translate([0,0,vyska])
    cylinder(strecha,polomer+presah,0);
  color(bdrevo) 
    budka(1.0,1.6,3,polomer-3+presah/2,vyska);
}

budova(8,7.5,3,0.3);
// translate([3,-0.5,8]) cube([2,1,1]);

