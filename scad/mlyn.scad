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
  wokno = 0.55;
  hokno = 1.25;
  wstena = 0.6;
  difference() {
    color(bkamen) cylinder(vyska,polomer,polomer);
    // Velka okna
    for (a = [0,180]) {
      rotate(a-60, [0,0,1]) translate([0,polomer-wstena,1.4]) okno(wokno,hokno);
    }
    for (a = [0,105,180,285]) {
      rotate(a-60, [0,0,1]) translate([0,polomer-wstena,4.3]) okno(wokno,hokno);
    }
    // Mala okna
    for (a = [0,180]) {
      rotate(a-30, [0,0,1]) translate([0,polomer-wstena,6.9]) okno(wokno,wokno);
    }
    // Dvere
    for (a = [0,-135]) {
      rotate(a, [0,0,1]) translate([0,polomer-wstena,0.1]) dvere(1.5,2.45);
    }
  }
  color(bdrevo)
    translate([0,0,vyska])
    cylinder(strecha,polomer+presah,0);
  color(bdrevo) 
    budka(1.0,1.6,3,polomer-3+presah/2,vyska);
}

budova(8,7.5,3.4,0.3);
// translate([3,-0.5,8]) cube([2,1,1]);

