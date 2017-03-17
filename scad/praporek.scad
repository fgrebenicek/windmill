module praporek(vyska,sirka,tloustka=0.01,tycka=0.04) {
  v2 = vyska/2;
  s2 = sirka*0.707;
  rotate(90, [1,0,0])
  linear_extrude(height=tloustka) polygon(points=[[0,-v2], [0,v2], [sirka,v2], [s2,0], [sirka,-v2]]);
  translate([0,0,-1.5*vyska]) cylinder(2*vyska,tycka,tycka,$fn=32);
}

praporek(0.3,0.6);