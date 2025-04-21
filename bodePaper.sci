clear;close;clc;

/* Define Remarkable Pro pixel resolution */
remarkableRes = [1620, 2160];
axesSize = [1*remarkableRes(1), 0.35*remarkableRes(2)];

/* y axis bounds and intervals */
yMagLow = -60; yMagHigh = 80; yMagInterval = 20;
yPhaseLow = -225; yPhaseHigh = 90; yPhaseInterval = 45;  // degrees


/* Define the x axis ticks and labels */
base = 0.1:0.1:0.9;      // base multiplier
exponent = 0:4;        // exponent

xTicks = zeros(1,length(base)*length(exponent));
xLabels = emptystr(1,length(base)*length(exponent));

index = 1;
while index < length(base)*length(exponent);
    for n = exponent;
        for i = base;
            /* ticks */
            xTicks(index) = i*10^n;
            
            /* labels */
            if i == 0.1 then
                xLabels(index) = msprintf("$10^{%i}$",n-1);
            else
                xLabels(index) = "";
            end
                index = index + 1;
        end
    end
end


/************** Magnitude figure *****************/
scf(0);
f1 = gcf();
a1 = newaxes();

f1.figure_name = "Magnitude";
f1.axes_size = axesSize;
f1.auto_resize = "off";

/* Set the x axis ticks and labels */
a1.x_ticks = tlist(["ticks", "locations", "labels", "interpreters"], xTicks, xLabels);
a1.sub_ticks = [0, 3];

/* Define the magnitude axis ticks */
yTicks = yMagLow+yMagInterval*[0:(yMagHigh-yMagLow)/yMagInterval];
disp(size(yTicks));

/* Set the magnitude axis ticks and labels*/
a1.y_ticks = tlist(["ticks", "locations", "labels", "interpreters"], yTicks, string(yTicks));

/* Set the tick font size */
a1.font_size = 5;

/* Set the data bounds of the plot */
a2.tight_limits = "on";
a1.data_bounds = [min(xTicks), min(yTicks); max(xTicks), max(yTicks)];
a1.auto_ticks = ['off', 'off'];

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
scf(1);
f2 = gcf();
a2 = newaxes();

f2.figure_name = "Phase";
f2.axes_size = axesSize;
f2.auto_resize = "off";


/* Set the x axis ticks to same as magnitude plot */
a2.x_ticks = tlist(["ticks", "locations", "labels", "interpreters"], xTicks, xLabels);
a2.sub_ticks = [0, 1];

/* Define the phase axis ticks */
yTicks = yPhaseLow+yPhaseInterval*[0:(yPhaseHigh-yPhaseLow)/yPhaseInterval];

/* Set the phase axis ticks and labels*/
a2.y_ticks = tlist(["ticks", "locations", "labels", "interpreters"], yTicks, string(yTicks));

/* Set the tick font size */
a2.font_size = 5;

/* Set the data bounds of the plot */
a2.tight_limits = "on";
a2.data_bounds = [min(xTicks), min(yTicks); max(xTicks), max(yTicks)];
a2.auto_ticks = ["off", "off"];
a2.sub_ticks = [0, 8];

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
