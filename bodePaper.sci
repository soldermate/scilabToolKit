clear;close;clc;

// https://help.scilab.org/docs/2025.0.0/en_US/axes_properties.html


a = newaxes();
a = sca(a);


/* Plot data bound definitions */
xLow = 0.1;      //hertz
xHigh = 1e6;
yLow = -60;     // dB
yHigh = 40;


/* Define the x axis ticks */
base = 0.1:0.1:0.9;      // base multiplier
exponent = -1:6;        // exponent

xTicks = zeros(1,length(base)*length(exponent));

index = 1;
while index < length(base)*length(exponent);
    for n = exponent;
        for i = base;
            xTicks(index) = i*10^n;
            index = index + 1;
        end
    end
end


/* Define the x axis labels */
xLabels = emptystr(1,length(base)*length(exponent));

index = 1;
while index < length(base)*length(exponent);
    for n = exponent;
        for i = base;
            if i == 0.1 then
                xLabels(index) = msprintf("10^%i",n);
            else
                xLabels(index) = "";
            end
            index = index + 1;
        end
    end
end


/* Set the x axis ticks and labels */
a.x_ticks = tlist(["ticks", "locations", "labels"], xTicks, xLabels);
a.sub_ticks = [0, 3];


/* Set the y axis ticks and labels*/
yInterval = 10;
yTicks = yLow+yInterval*[0:(yHigh-yLow)/yInterval];
a.y_ticks = tlist(["ticks", "locations", "labels"], yTicks, string(yTicks));


/* Set the data bounds of the plot */
a.data_bounds = [xLow, yLow; xHigh, yHigh];
a.auto_ticks = ['off', 'off'];


/* Set the grid */
a.grid = [1, 1]             // black color
a.grid_style = [9, 9];      // light dashed lines
a.grid_position = "background";


/* Set the title */
t = a.title();
t.text = "Magnitude Vs Frequency";

/* Set y label */
y = a.y_label();
y.text = "dB";

/* Set x label */
x = a.x_label();
x.text = "Frequency";



semilogx(1,1);
