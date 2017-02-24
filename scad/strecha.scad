// linear_extrude(height=10) circle(5,$fn=3);

module strecha(vyska, hloubka) {
  rotate(90, [1,0,0]) 
  linear_extrude(height=hloubka) 
  polygon(points=[[-vyska,0],[vyska,0],[0,vyska]]);
}

color("magenta") strecha(2,6);