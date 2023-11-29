clear 
close all
clc
Lgp =38e-3;
Wgp = 36e-3;
L = 26e-3;
W = 35.5e-3;
d = 14e-3;
h = 3.2e-3;   
Ux1 = 8e-3;
Ux2 = 12e-3;
Ux3 = 16e-3;
Uy1 = 17e-3;
Uy2 = 6e-3;
Uy3 = 3.5e-3;
Ua1 = 0.9e-3;
Ua2 = 0.9e-3;
Ua3 = 0.9e-3;
Ud1 = 6e-3;
Ud2 = 2e-3;
Ud3 = 1e-3;
N1 = 2; 
N2 = 2; 
 
s = antenna.Rectangle('Length',W,'Width',L,'NumPoints',60);
h1 = antenna.Rectangle('Length',Ua1,'Width',Uy1,'NumPoints',[N2 N1 N2 N1],'Center',[-0.013,  0.0013]);
h2 = antenna.Rectangle('Length',Ua1,'Width',Uy1,'NumPoints',[N2 N1 N2 N1],'Center',[-0.005,  0.0013]);
h3 = antenna.Rectangle('Length',Ux1,'Width',Ua1,'NumPoints',[N1 N2 N1 N2],'Center',[-0.009,-0.0067]);
Uslot_patch = s-h1-h2-h3;
h4 = antenna.Rectangle('Length',Ua2,'Width',Uy2,'NumPoints',[N2 N1 N2 N1],'Center',[-0.015,  -0.0057]);
h5 = antenna.Rectangle('Length',Ua2,'Width',Uy2,'NumPoints',[N2 N1 N2 N1],'Center',[-0.003, -0.0057]);
h6 = antenna.Rectangle('Length',Ux2,'Width',Ua2,'NumPoints',[N1 N2 N1 N2],'Center',[-0.009,-0.0083]);
DoubleUslot_patch = Uslot_patch-h4-h5-h6;
h7 = antenna.Rectangle('Length',Ua3,'Width',Uy3,'NumPoints',[N2 N1 N2 N1],'Center',[-0.017, -0.0097]);
h8 = antenna.Rectangle('Length',Ua3,'Width',Uy3,'NumPoints',[N2 N1 N2 N1],'Center',[-0.001, -0.0097]);
h9 = antenna.Rectangle('Length',Ux3,'Width',Ua3,'NumPoints',[N1 N2 N1 N2],'Center',[-0.009,-0.011]);
TripleUslot_patch = DoubleUslot_patch-h7-h8-h9;
 
 
h1_1 = antenna.Rectangle('Length',Ua1,'Width',Uy1,'NumPoints',[N2 N1 N2 N1],'Center',[0.013, 0.0013]);
h2_1 = antenna.Rectangle('Length',Ua1,'Width',Uy1,'NumPoints',[N2 N1 N2 N1],'Center',[0.005,0.0013]);
h3_1 = antenna.Rectangle('Length',Ux1,'Width',Ua1,'NumPoints',[N1 N2 N1 N2],'Center',[0.009,-0.0067]);
Uslot_patch_1 = TripleUslot_patch-h1_1-h2_1-h3_1;
h4_1 = antenna.Rectangle('Length',Ua2,'Width',Uy2,'NumPoints',[N2 N1 N2 N1],'Center',[0.015,  -0.0057]);
h5_1 = antenna.Rectangle('Length',Ua2,'Width',Uy2,'NumPoints',[N2 N1 N2 N1],'Center',[0.003, -0.0057]);
h6_1 = antenna.Rectangle('Length',Ux2,'Width',Ua2,'NumPoints',[N1 N2 N1 N2],'Center',[0.009,-0.0083]);
DoubleUslot_patch_1 = Uslot_patch_1-h4_1-h5_1-h6_1;
h7_1 = antenna.Rectangle('Length',Ua3,'Width',Uy3,'NumPoints',[N2 N1 N2 N1],'Center',[0.017, -0.0097]);
h8_1 = antenna.Rectangle('Length',Ua3,'Width',Uy3,'NumPoints',[N2 N1 N2 N1],'Center',[0.001, -0.0097]);
h9_1 = antenna.Rectangle('Length',Ux3,'Width',Ua3,'NumPoints',[N1 N2 N1 N2],'Center',[0.009,-0.011]);
TripleUslot_patch_1 = DoubleUslot_patch_1-h7_1-h8_1-h9_1;
figure
show(TripleUslot_patch_1)
 
p2  = antenna.Rectangle('Length',Lgp,'Width',Wgp,'NumPoints',10);
d1 = dielectric('FR4'); 
slotPatch = pcbStack;
slotPatch.Name = 'U-Slot Patch';
slotPatch.BoardThickness = h;
slotPatch.BoardShape = p2;
slotPatch.Layers = {TripleUslot_patch_1,d1,p2};
slotPatch.FeedLocations = [-0.009 -0.004 1 3;0.009 -0.004 1 3];
slotPatch.FeedDiameter = (1e-3);
figure;
show(slotPatch)
freq = linspace(1e9,6e9,200);
s1 = sparameters(slotPatch,freq);
s11Fig = figure;
rfplot(s1,1,1)
legend('Triple')
title('S_1_1')
figure
pattern(slotPatch,3e9)
figure

