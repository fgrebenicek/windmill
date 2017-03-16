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

// lopata(6,2.8,1.8);
// polomer = 8;
// tram = 0.2;
// translate([-tram/2,-polomer-tram, 0]) cube([tram,polomer+tram,tram]);
vrtule(8);
