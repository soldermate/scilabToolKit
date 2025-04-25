clear;close;clc;

/* Define Remarkable Pro pixel resolution */
remarkableRes = [1620, 2160];
axesSize = [1*remarkableRes(1), 0.35*remarkableRes(2)];

/* y axis bounds and intervals */
yMagLow = -60; yMagHigh = 80; yMagInterval = 20;
yPhaseLow = -270; yPhaseHigh = 45; yPhaseInterval = 45;  // degrees

/* Define the x axis ticks and labels */
xTicks = logspace(-1, 4, 6) // [0.1, 1, 10, 100, 1000, 10000]
xLabels = string(xTicks);
xLabels = ["$10^{-1}$","$10^0$","$10^1$","$10^2$","$10^3$","$10^4$"];

/************** Magnitude figure *****************/
scf(0); f1 = gcf(); a1 = gca();

f1.figure_name = "Magnitude";
f1.axes_size = axesSize;
f1.auto_resize = "off";
f1.figure_size = axesSize*2;

/* Set the x axis ticks and labels */
a1.x_ticks = tlist(["ticks", "locations", "labels", "interpreters"], xTicks, xLabels);

/* Define the magnitude axis ticks */
yTicks = yMagLow+yMagInterval*[0:(yMagHigh-yMagLow)/yMagInterval];

/* Set the magnitude axis ticks and labels*/
a1.y_ticks = tlist(["ticks", "locations", "labels", "interpreters"], yTicks, string(yTicks));

/* Set the tick font size */
a1.font_size = 5;

/* Set the data bounds and sub ticks */
a2.tight_limits = "on";
a1.data_bounds = [min(xTicks), min(yTicks); max(xTicks), max(yTicks)];
a1.auto_ticks = ['off', 'off'];

a1.sub_ticks = [9, 0];

/* Set the grid */
a1.grid = [1, 1]             // black color
a1.grid_style = [8, 8];      // light dashed lines
a1.grid_position = "background";

/* Set y label */
y = a1.y_label();
y.text = "Magnitude (dB)";
y.font_size = 5;

/* Magnitude plot */
semilogx(1,1);
xs2svg(0, "bodePaperMag", "portrait");


/************** Phase figure *****************/
scf(1); f2 = gcf(); a2 = gca();

f2.figure_name = "Phase";
f2.axes_size = axesSize;
f2.auto_resize = "off";

/* Set the x axis ticks to same as magnitude plot */
a2.x_ticks = tlist(["ticks", "locations", "labels", "interpreters"], xTicks, xLabels);

/* Define the phase axis ticks */
yTicks = yPhaseLow+yPhaseInterval*[0:(yPhaseHigh-yPhaseLow)/yPhaseInterval];

/* Set the phase axis ticks and labels*/
a2.y_ticks = tlist(["ticks", "locations", "labels", "interpreters"], yTicks, string(yTicks));

/* Set the tick font size */
a2.font_size = 5;

/* Set the data bounds and sub ticks*/
a2.tight_limits = "on";
a2.data_bounds = [min(xTicks), min(yTicks); max(xTicks), max(yTicks)];
a2.auto_ticks = ["off", "off"];
a2.sub_ticks = [9, 8];

/* Set the grid */
a2.grid = [1, 1]             // black color
a2.grid_style = [8, 8];      // light dashed lines
a2.grid_position = "background";

/* Set y label */
y = a2.y_label();
y.text = "Phase (Deg)";
y.font_size = 5;

/* Phase plot */
semilogx(1,1);
xs2svg(1, "bodePaperPhase", "portrait");
