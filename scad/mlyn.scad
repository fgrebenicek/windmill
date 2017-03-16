$fn = 64;

bkamen = [238/255,229/255,208/255];
bdrevo = [140/255,140/255,120/255];  

module strecha(vyska, hloubka) {
  rotate(90, [0,0,1]) rotate(90, [1,0,0])
  linear_extrude(height=hloubka) 
  polygon(points=[[-vyska,0],[vyska,0],[0,vyska]]);
}

module budka(vyska, sirka, hloubka, dx, dz, presah=0.2) {
  v2 = vyska/2;
  sirkax = sirka-2*presah;
  translate([dx,-sirkax/2,dz]) cube([hloubka,sirkax,v2]);
  translate([dx+presah,0,dz+v2]) strecha(sirka/2,hloubka);
}

module budkaDira(vyska, sirka, hloubka, dx, dz, presah=0.2) {
  v2 = vyska/2;
  sirkax = sirka-2*presah;
  translate([dx,-sirkax/2,dz]) cube([hloubka,sirkax,v2]);
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
  difference() {
	color(bdrevo) translate([0,0,vyska]) cylinder(strecha,polomer+presah,0);
	budkaDira(2.0,2.0,3,polomer-3+presah,vyska-0.1);
  }
  color(bdrevo) budka(2.0,2.0,3,polomer-3,vyska);
}

module lopata(delka, sirkaA, sirkaB, tloustka=0.1) {
  linear_extrude(height=tloustka) 
  polygon(points=[[-sirkaA/2,-delka],[sirkaA/2,-delka],[sirkaB/2,0], [-sirkaB/2,0]]);
}

module vrtule(polomer, tram=0.2) {
  delkaLopaty = 6;
  for (a = [0,90,180,270]) {
    rotate(a, [0,0,1]) rotate(-10, [0,1,0]) translate([0,delkaLopaty-polomer,0]) lopata(delkaLopaty,2.8,1.8);
    rotate(a, [0,0,1]) translate([-tram/2,-polomer-tram, 0]) cube([tram,polomer+tram,tram]);
  }
}

module hridel(natoceni=30) {
  polomer = 0.2;
  vyska   = 8.5;
  color(bdrevo) translate([1.25,0,vyska]) rotate(90, [0,1,0]) cylinder(3.75,polomer,polomer);
  translate([4.6,0,vyska]) rotate(natoceni, [1,0,0]) rotate(90, [0,1,0]) vrtule(8);
}

budova(8,7.5,3.4,0.3);
hridel();

