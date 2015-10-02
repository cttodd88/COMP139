%Simulator for COMP139 2015 Lab1 (surveying)

%Chris Todd 
%C0304228
%Oct 2 2015

%NOTE, program breaks when the chord distance is more 
%than the diameter of the circle inscribed by the radius
%of curvature. This is due to the limitations imposed by 
%arcsin which ranges from 0-90 degrees. Don't know if this 
%will need to be rectified for the final lab submission.

clear all;
close all;
clc;

r = 1000 %Radius of curvature

spc = 100 %Spacing

d = 2000 %Chord distance 

c = pi*r*2  %Circumfrence based on r (reference)

theta = 2*asin((d/2)/r) %Find theta based on chord length

a = r*theta  %Find arc length based on radius of curvature and theta

n = round(a / spc) %Calculate number of lights and round 

angles = zeros(1,n);  %hold reference angles for all lights
distance = zeros(1,n); %hold distances for all lights

figure('position', [0, 0,1000,2000]) %plot parameters
xlim([-1000,1000]); %set x-axis limits
hold on


%finds distance and angle for 
%each traffic light and stores into 
%previously defined array. 
%Calculates the x-y components of each 
%distance vector and plots to figure to verify
%that the lines and respective angles lie on a 
%circle with radius of curvature 'r'

for k=1:n
    
    a1 = spc*k;
    theta1 = a1/r;
    distance(1,k) = 2*r*sin(theta1/2);
    
    angles(1,k) = 90 - ((180-theta1)/2);
    
    x = distance(1,k)*cos(angles(1,k));
    y = distance(1,k)*sin(angles(1,k));
    plot(x,y,'-o')
    
end

distance
angles
