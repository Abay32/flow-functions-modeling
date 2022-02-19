clc; clear
close all

% Number of Nodes in different dimensions
nt  = 3*200;  
ift = 0.007;
geometry = 1;
pdrop    = 0.1;
% Throat radius data
minR     = 1e-06; 
maxR     = 100e-06;
etaR     = 1.5;   deltaR = 0.5;
x = [0.2837
    0.8382
    0.9014
    0.4499
    0.9885
    0.0338
    0.8595
    0.5286
    0.9755
    0.8772
    0.1613
    0.3534
    0.0580
    0.4441
    0.4411
    0.3267
    0.9144
    0.4946
    0.7102
    0.6646
    0.8318
    0.2580
    0.7692
    0.4106
    0.0557
    0.8706
    0.9723
    0.1170
    0.5083
    0.7556
    0.1100
    0.0339
    0.4411
    0.1298
    0.9716
    0.9402
    0.9331
    0.9838
    0.6930
    0.7025
    0.3713
    0.0641
    0.4435
    0.5430
    0.5402
    0.7863
    0.6014
    0.9470
    0.6312
    0.8788
    0.1227
    0.8135
    0.9776
    0.2312
    0.9127
    0.6764
    0.7251
    0.6858
    0.7967
    0.5296
    0.7546
    0.5036
    0.9070
    0.1236
    0.8522
    0.1750
    0.7642
    0.4593
    0.6061
    0.3640
    0.4019
    0.7301
    0.9551
    0.8788
    0.6097
    0.9678
    0.6341
    0.7773
    0.8985
    0.2266
    0.1013
    0.8283
    0.4245
    0.7271
    0.9367
    0.2965
    0.3122
    0.5497
    0.5526
    0.6404
    0.5966
    0.1612
    0.4179
    0.3691
    0.0803
    0.2363
    0.9943
    0.9093
    0.7908
    0.1351
    0.5503
    0.0538
    0.6766
    0.8223
    0.9114
    0.1472
    0.3049
    0.7799
    0.4872
    0.5492
    0.8782
    0.9883
    0.0192
    0.3513
    0.5346
    0.7478
    0.9700
    0.6951
    0.2733
    0.9511
    0.9077
    0.4574
    0.7332
    0.5582
    0.9939
    0.3893
    0.8817
    0.8933
    0.3860
    0.7276
    0.9126
    0.9041
    0.0815
    0.0333
    0.5724
    0.0093
    0.1983
    0.0207
    0.7923
    0.1908
    0.9521
    0.7702
    0.8166
    0.4261
    0.3002
    0.6803
    0.8585
    0.8718
    0.8971
    0.8436
    0.4852
    0.4885
    0.0653
    0.4570
    0.5956
    0.1101
    0.3438
    0.2641
    0.5802
    0.4354
    0.4151
    0.0542
    0.2597
    0.2442
    0.7091
    0.6589
    0.1192
    0.1292
    0.0780
    0.7352
    0.5561
    0.8344
    0.1061
    0.2566
    0.0541
    0.6566
    0.2774
    0.7091
    0.1303
    0.5240
    0.0459
    0.1013
    0.4689
    0.7106
    0.6013
    0.2049
    0.6188
    0.6992
    0.3148
    0.8048
    0.1780
    0.2413
    0.5947
    0.8682
    0.8187
    0.5901
    0.0023
    0.9445
    0.7925
    0.3993
    0.8734
    0.6744
    0.2424
    0.1684
    0.8611
    0.3266
    0.3252
    0.4002
    0.7635
    0.1641
    0.6883
    0.6433
    0.8214
    0.3785
    0.1119
    0.8595
    0.7132
    0.5750
    0.7411
    0.7537
    0.5551
    0.8009
    0.6703
    0.5351
    0.6859
    0.9552
    0.6278
    0.8191
    0.1890
    0.7515
    0.2216
    0.4164
    0.7909
    0.4000
    0.0451
    0.2010
    0.0429
    0.6392
    0.2518
    0.4199
    0.1718
    0.8845
    0.3410
    0.2051
    0.7954
    0.0245
    0.0398
    0.5298
    0.9334
    0.6022
    0.6012
    0.6439
    0.9219
    0.2193
    0.8849
    0.0488
    0.8120
    0.0326
    0.4150
    0.5947
    0.1968
    0.7961
    0.2110
    0.1744
    0.6138
    0.9411
    0.6616
    0.2149
    0.9136
    0.3802
    0.0350
    0.2273
    0.9069
    0.8690
    0.5825
    0.5608
    0.0011
    0.1269
    0.2146
    0.8268
    0.3876
    0.3181
    0.2618
    0.2965
    0.4282
    0.1924
    0.5675
    0.6577
    0.6856
    0.3537
    0.9568
    0.2437
    0.7483
    0.3902
    0.8448
    0.3720
    0.7076
    0.3457
    0.8772
    0.7505
    0.4344
    0.4007
    0.3729
    0.4433
    0.3803
    0.0727
    0.4403
    0.6065
    0.3048
    0.4066
    0.1010
    0.4769
    0.2924
    0.0163
    0.8844
    0.2103
    0.6836
    0.1544
    0.9743
    0.5027
    0.8914
    0.7265
    0.4972
    0.6072
    0.3493
    0.5262
    0.7969
    0.2737
    0.2927
    0.3482
    0.8760
    0.0933
    0.2067
    0.3028
    0.3515
    0.7267
    0.8863
    0.0519
    0.0786
    0.0145
    0.1933
    0.0263
    0.4688
    0.2434
    0.9199
    0.7158
    0.4886
    0.0781
    0.5301
    0.6661
    0.6077
    0.4196
    0.1108
    0.8166
    0.2493
    0.5092
    0.8041
    0.5098
    0.3027
    0.8619
    0.0574
    0.7308
    0.9009
    0.4640
    0.4694
    0.1538
    0.9618
    0.8763
    0.4886
    0.4071
    0.1266
    0.9254
    0.0056
    0.1864
    0.3241
    0.0502
    0.1445
    0.7294
    0.4823
    0.3381
    0.2368
    0.4509
    0.1855
    0.3243
    0.2640
    0.8301
    0.6964
    0.3335
    0.5802
    0.2878
    0.2640
    0.2599
    0.6771
    0.5198
    0.0768
    0.0558
    0.2587
    0.4399
    0.2843
    0.6788
    0.9496
    0.7740
    0.6361
    0.7536
    0.7468
    0.5860
    0.7731
    0.3925
    0.6053
    0.2474
    0.2902
    0.0193
    0.3473
    0.1418
    0.4115
    0.1531
    0.8290
    0.7392
    0.0989
    0.8206
    0.2271
    0.1069
    0.6628
    0.9546
    0.8146
    0.6233
    0.3283
    0.2774
    0.4344
    0.3503
    0.8778
    0.0062
    0.6964
    0.3381
    0.3050
    0.6481
    0.9211
    0.8931
    0.9972
    0.0729
    0.1296
    0.9816
    0.0902
    0.6862
    0.9290
    0.1418
    0.8844
    0.0198
    0.3427
    0.2383
    0.9846
    0.8466
    0.7945
    0.9003
    0.7801
    0.8365
    0.3211
    0.7427
    0.6645
    0.2892
    0.3374
    0.9086
    0.0323
    0.6964
    0.2088
    0.8241
    0.2182
    0.0996
    0.6195
    0.1038
    0.7991
    0.9029
    0.3125
    0.2816
    0.0068
    0.4959
    0.9885
    0.7379
    0.3107
    0.6004
    0.7817
    0.1115
    0.5793
    0.8704
    0.6898
    0.2430
    0.3427
    0.5454
    0.0676
    0.4104
    0.2375
    0.4890
    0.8061
    0.3778
    0.5180
    0.0946
    0.9091
    0.2076
    0.3821
    0.6603
    0.7584
    0.1731
    0.5174
    0.9953
    0.7076
    0.0806
    0.0433
    0.4912
    0.4466
    0.4868
    0.1659
    0.3607
    0.8807
    0.7444
    0.4168
    0.9074
    0.0943
    0.1813
    0.9466
    0.1008
    0.3880
    0.2892
    0.0731
    0.1946
    0.4175
    0.2929
    0.7021
    0.2397
    0.9595
    0.3055
    0.1549
    0.5555
    0.7905
    0.4439
    0.9958
    0.4366
    0.3044
    0.2465
    0.9608
    0.2229
    0.3956
    0.2245
    0.2700
    0.4184
    0.9977
    0.9110
    0.5504
    0.5963
    0.0791
    0.5766
    0.8982
    0.4633
    0.3984
    0.1045
    0.6522
    0.9917
    0.6781
    0.4285
    0.6548
    0.5887
    0.7451
    0.6409
    0.5037
    0.9380
    0.6053
    0.6389
    0.7027
    0.8609
    0.3797
    0.7121
    0.5235
    0.3635
    0.4347
    0.6876
    0.2269
    0.9790
    0.9757
    0.2895
    0.3384
    0.9964
    0.7890
    0.7949
    0.6324
    0.8115
    0.4481
    0.8306
    0.1267
    0.5133
    0.7159
    0.2481
    0.5319
    0.3822
    0.8018
    0.6709
    0.9829
    0.9368
    0.5763
    0.0802
    0.4138
    0.1808];%rand(nt,1)%linspace(0.000001,0.99999, nt)';%;
 
al       = pi/6;
c        = 0.0001;%0.0001;%0.00009;%0.00007;%
R        =  weibull(maxR, minR, deltaR, etaR, x) ;
if geometry == 1 
    porearea = pi*R.^2;
elseif geometry == 2
    porearea = 3*R.^2.*cot(pi/6);
end
% Throat Length data
minL = 1e-6; maxL   = 1e-6; 
etaL = 3;    deltaL = 0.2;
l    = 0.0001*ones(nt,1);%weibull(maxL,minL,deltaL,etaL,x);
% Aspect ratio data
teta   = [0 pi]; % the maximum and the initial minimum contact angle
recang = 0*ones(nt,1);
% Advancing Angle data
%
minAdvancingAngle = 0; maxAdvancingAngle = 0;%pi/2 +al;
%advangle          = weibull(maxAdvancingAngle,minAdvancingAngle,.4 , 1.5,x);
%
watervisco = 1e-3; %Pa_s = 1 cp ----(1e-3 = 1 cp)
oilvisco   = 1e-3; %Pa_s = 1 cp ----(1e-3 = 1 cp)
%
pressdrop_d1 = .001; pressdrop_d2 = .0001; pressdrop_d3 = .0001; pressdrop_d4 = .0001; pressdrop_d5 = .00001;pressdrop_d6 = .000001;
%% Time for drainage displacements
totaltime_d1 = sum(2*l(1)^2.*(watervisco + oilvisco)./(R.^2.*pressdrop_d1));
totaltime_d2 = sum(2*l(1)^2.*(watervisco + oilvisco)./(R.^2.*pressdrop_d2));      
totaltime_d3 = sum(2*l(1)^2.*(watervisco + oilvisco)./(R.^2.*pressdrop_d3));
totaltime_d4 = sum(2*l(1)^2.*(watervisco + oilvisco)./(R.^2.*pressdrop_d4));  
totaltime_d5 = sum(2*l(1)^2.*(watervisco + oilvisco)./(R.^2.*pressdrop_d5));  
totaltime_d6 = sum(2*l(1)^2.*(watervisco + oilvisco)./(R.^2.*pressdrop_d6));
%
%
%%% Time to displace the oil phase
pressdrop_i1 = .001; pressdrop_i2 = .0001; pressdrop_i3 = .0001; pressdrop_i4 = .0001;pressdrop_i5 = .00001; pressdrop_i6 = .000001;
totaltime_i1 = sum(2*l(1)^2.*(watervisco + oilvisco)./(R.^2.*pressdrop_i1));
totaltime_i2 = sum(2*l(1)^2.*(watervisco + oilvisco)./(R.^2.*pressdrop_i2));      
totaltime_i3 = sum(2*l(1)^2.*(watervisco + oilvisco)./(R.^2.*pressdrop_i3));
totaltime_i4 = sum(2*l(1)^2.*(watervisco + oilvisco)./(R.^2.*pressdrop_i4)); 
totaltime_i5 = sum(2*l(1)^2.*(watervisco + oilvisco)./(R.^2.*pressdrop_i5)); 
totaltime_i6 = sum(2*l(1)^2.*(watervisco + oilvisco)./(R.^2.*pressdrop_i6)); 
%% the total time to complete the system
totaltime_d  = totaltime_d1 + totaltime_d2 + totaltime_d3 + totaltime_d4 + totaltime_d5 + pressdrop_d6 ;
totaltime_i  = totaltime_i1 + totaltime_i2 + totaltime_i3 + totaltime_i4 + totaltime_i5;
totaltime    = totaltime_d + totaltime_i
%
%% 
[td1, sud_1, bpd, Sarea, H, advang, pcd1, Krw, Kro, Sw, Swc,  check, oc, wc, Ao, Aw] = Primary_drainage_displacement(recang, pressdrop_d1, ... 
    geometry, ift, R, porearea, watervisco,  oilvisco, pdrop, l, nt, teta, c,totaltime);
%
teta   = [0 0]; % the maximum and the initial contact angle
pressdrop = 7;
[~,suin, Sarea_in, advanglefin, Hin, oillayerin, check_in, Sw_in, Sw_c, oilSat_layer,  pcin, Krw_in, Kro_in, oc_in, wc_in, Ao_in, Aw_in] = Secondary_imbibition(geometry,bpd, advang, pressdrop, R, ... 
    ift, porearea, l, pdrop, watervisco, oilvisco, check, oc,wc,Ao,Aw, nt, H, teta, c, sud_1, td1, totaltime);
%
teta   = [pi pi]; % the maximum and the initial contact angle
pressdrop = 7;
[~,sui, Sarea_if, advanglef, Hif, oillayerf, check_if, Sw_if, Sw_c_if, oilSat_layer_f, pcif, Krw_if, Kro_if, oc_if, wc_if, Ao_if, Aw_if] = Secondary_imbibition(geometry,bpd, advang, pressdrop, R, ... 
    ift, porearea, l, pdrop, watervisco, oilvisco, check, oc,wc,Ao,Aw, nt, H, teta, c, sud_1, td1,totaltime);


teta   = [0 pi]; % the maximum and the initial minimum contact angle




















%% The dynamic part
% Secondary imbibition
%
%
[timei_1, sui_1, Sarea_i, advangle, Hi, oillayer, check_i, Sw_i, Sw_c_i, oilSat_layer_i, pci, Krw_i, Kro_i, oc_i, wc_i, Ao_i, Aw_i] = ...
    Secondary_imbibition(geometry, bpd, advang, pressdrop_i1, R, ... 
    ift, porearea, l, pdrop, watervisco, oilvisco, check, oc,wc,Ao,Aw, nt, H, teta, c, sud_1, td1, totaltime);

% Secondary drainage
pcmin = min(pci);
[td2, sud_2, Sarea2, Hd2, advang2, pcd2, Krw_d, Kro_d, Sw_d, Swc_d, check_d, oc_d, wc_d, Ao_d, Aw_d] = ...
    Secondary_drainage_displacement(advangle, pressdrop_d2, pcmin, ... 
    geometry, ift, oillayer, R, porearea, watervisco, oilvisco, pdrop, bpd, l, oc_i, wc_i, Ao_i, Aw_i, nt, Hi, check_i, teta, c, sui_1, timei_1,totaltime) ;
%
%third imbibition
[timei_2, sui_2, Sarea_i2, advang3, Hi2, oillayer,check_i2, Sw_i2, Sw_c_i2, oilSat_layer_i2, pci2,  Krw_i2, Kro_i2,oc_i2, wc_i2, Ao_i2, Aw_i2] = ...
    Secondary_imbibition(geometry, bpd, advang2, pressdrop_i2, R, ... 
    ift,porearea, l, pdrop, watervisco, oilvisco, check_d, oc_d,wc_d, Ao_d, Aw_d, nt, Hd2, teta, c, sud_2, td2, totaltime);
%
% third drainage
pcmin = min(pci2);
[td3, sud_3, Sarea3, Hd3, advang4, pcd3, Krw_d3, Kro_d3, Sw_d3, Swc3, check_d3, oc_d3, wc_d3, Ao_d3, Aw_d3] = ...
    Secondary_drainage_displacement(advang3, pressdrop_d3,pcmin, ... 
    geometry, ift, oillayer, R, porearea, watervisco, oilvisco, pdrop, bpd, l, oc_i2, wc_i2, Ao_i2, Aw_i2, nt, Hi2, check_i2, teta, c, sui_2, timei_2,totaltime) ;
%
% fourth imbibition
[timei_3, sui_3, Sarea_i3,advang5, Hi3, oillayer, check_i3, Sw_i3, Sw_c_i3, oilSat_layer_i3, pci3, Krw_i3, Kro_i3, oc_i3, wc_i3, Ao_i3, Aw_i3] = ...
    Secondary_imbibition(geometry, bpd, advang4, pressdrop_i3, R, ... 
    ift,porearea, l, pdrop, watervisco, oilvisco, check_d3, oc_d3, wc_d3, Ao_d3, Aw_d3, nt, Hd3, teta, c, sud_3,td3, totaltime);
%
% fourth drainage 
pcmin = min(pci3);
[td4, sud_4, Sarea4, Hd4, advang6,  pcd4,  Krw_d4, Kro_d4, Sw_d4, Swc4, check_d4, oc_d4, wc_d4, Ao_d4, Aw_d4] = ...
    Secondary_drainage_displacement(advang5, pressdrop_d4, pcmin, ... 
    geometry, ift, oillayer, R, porearea, watervisco, oilvisco, pdrop, bpd, l, oc_i3, wc_i3, Ao_i3, Aw_i3, nt, Hi3, check_i3, teta, c, sui_3,timei_3, totaltime) ;
%

% fiveth imbibition
[timei_4, sui_4, Sarea_i4,advang7, Hi4, oillayer,check_i4, Sw_i4, Sw_c_i4, oilSat_layer_i4, pci_curve_i4,  Krw_i4, Kro_i4, oc_i4, wc_i4, Ao_i4, Aw_i4] = ...
    Secondary_imbibition(geometry, bpd, advang6, pressdrop_i4, R, ... 
    ift,porearea, l, pdrop, watervisco, oilvisco, check_d4, oc_d4, wc_d4, Ao_d4, Aw_d4, nt, Hd4, teta, c, sud_4,td4, totaltime);
%
% fivth drainage 
pcmin = min(pci_curve_i4);
[td5,sud_5, Sarea5, Hd5, advang8,  pcd5,  Krw_d5, Kro_d5, Sw_d5, Swc5, check_d5, oc_d5, wc_d5, Ao_d5, Aw_d5] = ...
    Secondary_drainage_displacement(advang7, pressdrop_d5, pcmin, ... 
    geometry, ift, oillayer, R, porearea, watervisco, oilvisco, pdrop, bpd, l, oc_i4, wc_i4, Ao_i4, Aw_i4, nt, Hi4, check_i4, teta, c, sui_4,timei_4, totaltime) ;

% six imbibition
[timei_5,sui_5, Sarea_i5,advang9, Hi5, oillayer,check_i5, Sw_i5, Sw_c_i5, oilSat_layer_i5, pci_curve_i5, Krw_i5, Kro_i5, oc_i5, wc_i5, Ao_i5, Aw_i5] = ...
    Secondary_imbibition(geometry, bpd, advang8, pressdrop_i5, R, ... 
    ift,porearea, l, pdrop, watervisco, oilvisco, check_d5, oc_d5, wc_d5, Ao_d5, Aw_d5, nt, Hd5, teta, c, sud_5, td5, totaltime);
%

pcmin = min(pci_curve_i4);
%[td6,sud_6, Sarea6, Hd6, advang10,  pcd6,  Krw_d6, Kro_d6, Sw_d6, Swc6, check_d6, oc_d6, wc_d6, Ao_d6, Aw_d6] = ...
%    Secondary_drainage_displacement(advang9, pressdrop_d6, pcmin, ... 
%    geometry, ift, oillayer, R, porearea, watervisco, oilvisco, pdrop, bpd, l, oc_i5, wc_i5, Ao_i5, Aw_i5, nt, Hi5, check_i5, teta, c, sui_5,timei_5, totaltime) ;


% sevnth imbibition
% [timei_6,sui_6, Sarea_i6,advang11, Hi6, oillayer,check_i6, Sw_i6, Sw_c_i6, oilSat_layer_i6, pci_curve_i6, Krw_i6, Kro_i6, oc_i6, wc_i6, Ao_i6, Aw_i6] = ...
%     Secondary_imbibition(geometry, bpd, advang10, pressdrop_i6, R, ... 
%     ift,porearea, l, pdrop, watervisco, oilvisco, check_d6, oc_d6, wc_d6, Ao_d6, Aw_d6, nt, Hd6, teta, c, sud_6, td6, totaltime);

teta   = [pi pi];
pressdrop = 0.1;
pcmin = min(pcif);
[td6, sud_df, Sarea2f, Hd2f, advang2f, pcd2f, Krw_df, Kro_df, Sw_df, Swcf, check_df, oc_df, wc_df, Ao_df, Aw_df] = Secondary_drainage_displacement(advanglef, pressdrop_d4, pcmin, ... 
    geometry, ift, oillayer, R, porearea, watervisco, oilvisco, pdrop, bpd, l, oc_i5, wc_i5, Ao_i5, Aw_i5, nt, Hi4, check_i5, teta, c, sui_5, timei_5, totaltime) ;

 td1 = td1/(12*30*24*3600)
 td2 = td2/(12*30*24*3600)
 td3 = td3/(12*30*24*3600)
 td4 = td4/(12*30*24*3600)
 td5 = td5/(12*30*24*3600)
 td6 = td6/(12*30*24*3600)

 
% Sw_d(1) = Sw(1);
% Sw_d3(1) = Sw(1);
% Sw_d4(1) = Sw(1);
% Sw_d5(1) = Sw(1);
% Sw_df(1) = Sw(1);
%% drainage water relative permeability
%
Krw_ddiff1 = Krw_d - Krw ; Krw_ddiff2 = Krw_d3-Krw; Krw_ddiff3 = Krw_d4-Krw; Krw_ddiff4 = Krw_d5 - Krw; Krw_ddiff5 = Krw_df - Krw; Krwdiff = Krw_df - Krw; % 
omegaw_d  = Krw_ddiff1./Krwdiff; omegaw_d2 = Krw_ddiff2./Krwdiff; omegaw_d3 = Krw_ddiff3./Krwdiff; omegaw_d4 = Krw_ddiff4./Krwdiff; omegaw_d5 = Krw_ddiff5./Krwdiff;
%
% Imbibition water relative permeability
Krw_idiff1 = Krw_i-Krw_in; Krw_idiff2 = Krw_i2 - Krw_in; Krw_idiff3 = Krw_i3-Krw_in; Krw_idiff4 = Krw_i4 - Krw_in; Krw_idiff5 = sort(Krw_df) - Krw_in; Krwdiff_i  = -Krw_in + sort(Krw_df);
omegaw_i = Krw_idiff1./Krwdiff_i;omegaw_i2 = Krw_idiff2./Krwdiff_i; omegaw_i3 = Krw_idiff3./Krwdiff_i; omegaw_i4 = Krw_idiff4./Krwdiff_i; omegaw_i5 = Krw_idiff5./Krwdiff_i;
%% 
%% omegaw_i3 = Krw_idiff3./Krwdiff_i;
%% 
%% 
% drainage oil relative permeability
Kro_ddiff1 =  Kro - Kro_d; Kro_ddiff2 = Kro - Kro_d3; Kro_ddiff3 = Kro - Kro_d4; Kro_ddiff4 = Kro - Kro_d5; Kro_ddiff5 = Kro - Kro_df; Krodiff    =  Kro-Kro_df ;  
omegao_d   =  Kro_ddiff1./Krodiff; omegao_d2 =  Kro_ddiff2./Krodiff; omegao_d3 =  Kro_ddiff3./Krodiff; omegao_d4 =  Kro_ddiff4./Krodiff; omegao_d5 =  Kro_ddiff5./Krodiff;
%
id2 = Sw_d3 > 0.585;
id3 = Sw_d4 > 0.2;
id4 = Sw_d5 > 0.1;

Sw_d3_id2 = Sw_d3(id2);
Sw_d3_id3 = Sw_d4(id3);
Sw_d3_id4 = Sw_d5(id4);
omegao_d2_id2 =   omegao_d2(id2);
omegao_d2_id3 =   omegao_d3(id3);
omegao_d2_id4 =   omegao_d4(id4);
%
a_1 = 0.0006123; b_1 = -2.522; c_1 = 0.13;
a_2 = 0.00155;   b_2 = -2.1;   c_2 = 0.2007;
omg_id2 = (Sw_d3_id2 - 0.5757)./(Sw_d3_id2 - 0.5757 + 0.5613);
omg_id3 = (Sw_d3_id3 - 0.2182)./(Sw_d3_id3 + 0.07747);
omg_id4 = (Sw_d3_id4 - 0.1332)./(Sw_d3_id4 + 0.07401);

Krw_d3_id2 = Krw_d3(id2);
Krw_d3_id3 = Krw_d4(id3);
Krw_d3_id4 = Krw_d5(id4);



beta = [0.5613;0.2956;0.2072];
shift_a = [0.5757;0.2185;0.1332];

chi_omega = [sud_3(1); sud_4(1);sui_5(1)];


% Imbibition oil relative permeability
Kro_idiff1 = Kro_in - Kro_i; Kro_idiff2 = Kro_in  - Kro_i3; Kro_idiff3 = Kro_in - Kro_i4;
Kro_idiff  = Kro_in - Kro_if;
omegao_i   = Kro_idiff1./Kro_idiff; omegao_i2 =  Kro_idiff2./Kro_idiff; omegao_i3 =  Kro_idiff3./Kro_idiff;
%KrwCor1 = (1 - Sw_d)^b/((1-Sw_d) + Sw_d^d);
% 
%%Parameter fiting using lsnonlin
pcsto = [Kro_d Kro_d3 Kro_d4 Kro_df];
coefb = zeros(4,2);
sw    = [Sw_d Sw_d3 Sw_d4 Sw_df];

%coefs = zeros(6,4);
% for i = 1:4
%     fun = @(x) (1 - sw(:,i))./((1 - sw(:,i) + x(1)*sw(:,i).^x(2))) - pcsto(:,i);
%     x0  = [0.2313, 0.6059]; 
%     b1  = [0;0;0;0];       b2 = [inf;inf;inf;inf];
%     c1  = [2.3;0;0;0];     c2 = [inf;inf;inf;inf]; 
%     lb  = [b1 c1];  ub = [b2 c2];
%     %ls  = [56.12 0 -56 0];us = [360 1 0 1];
%     [xcoefb, resnorm] = lsqnonlin(fun,x0,lb(i,:),ub(i,:));
%     coefb(i,:) = xcoefb;
% end

%% static end wetting correlation models
% Krw = Sw^(a+1+b) for the water wet rock
% Krw = (1 - (1-Sw)^(2a+1))Sw^m for oil wet system
a = 0.531; b = 0.7777; Krwc_ww =  Sw_in.^(a+1+b);
a = 1.569; b = 0.2225; Krwc_ow = (1 - (1-Sw_if).^(2*a+1)).*Sw_if.^b;
%
a = -0.6913;b = 2; Krwc_ww =  Sw_in.^(a+1+b);
a =  46.3;  b = 2; Krwc_ow = (1 - (1-Sw_if).^(2*a+1)).*Sw_if.^b;

%
% Kro = (1-Sw^(2a + 1))(1-Sw)^b for water wet rock 
% Kro = (1-Sw)^(a+1+b) for oil wet rock surface 
a = 1.568;    b = 0.2224;  Kroc_ww = (1-Sw_in.^(2*a + 1)).*(1-Sw_in).^b;
a = 0.452;    b = 0.8563;  Kroc_ow = (1-Sw_if).^(a+1+b);
a = 1.568;    b = 2;  Kroc_ww = (1-Sw_in.^(2*a + 1)).*(1-Sw_in).^b;
a = -0.6917;  b = 2;  Kroc_ow = (1-Sw_if).^(a+1+b);
%
% Krw = Sw^b/(Sw^b + a*(1-Sw)) for LET model 
a = 2.917;  b = 1.395; LKrwc_ww = Sw_in.^b./(Sw_in.^b + a*(1-Sw_in));
a = 0.2152; b = 1.23;  LKrwc_ow = Sw_if.^b./(Sw_if.^b + a*(1-Sw_if));
% Kro = (1-Sw)/((1-Sw) + a*Sw^b) for all wetting state 
a = 0.3428; b = 1.395; LKroc_ww = (1-Sw_in)./((1-Sw_in) + a*Sw_in.^b);
a = 4.646;  b = 1.23;  LKroc_ow = (1-Sw_if)./((1-Sw_if) + a*Sw_if.^b);
x = 1:13:nt;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%
r       = 0.00001;
t       = 100:50:5070;
deno    = 0.002*r.*t;
muo     = 0.0015;
num     = 2*0.01^2*muo;
Steta   = acos(num./deno) ; % simulated data for \theta
scat    = 0.5*t./t(end);
scat(1) = 5.5e-4;
modteta = (1.58 )*scat./(scat + 0.00221)  ;%model prediction 
xteta   = [1 2 3 4 5 6 7 8 9 10 15 20 25 35 55 70 95];
%
figure(1)
plot(scat(xteta),     Steta(xteta),     'd', 'color', 'b','linewidth', 0.5)
hold on
%plot(scat,     modteta,     '-', 'color', 'r','linewidth', 2.5)
xlabel('scale time [-]')
ylabel('contact angle')
set(gca,  'FontSize',13)
%


Sw_scat  = [Sw_d(x);Sw_d3(x);Sw_d4(x);Sw_d5(x);Sw_df(x)];% Sw_scat(end) = 1;
Kro_scat = [Kro_d(x);Kro_d3(x);Kro_d4(x);Kro_d5(x);Kro_df(x)];
Krw_scat = [Krw_d(x);Krw_d3(x);Krw_d4(x);Krw_d5(x);Krw_df(x)];
c_scat   = linspace(td1, td6, length(Sw_scat));
%
%
KrwT_scat = [Krw_i(x);Krw_d(x); Krw_i2(x); Krw_d3(x); Krw_i3(x); Krw_d4(x); Krw_i4(x); Krw_d5(x); Krw_i5(x)]; %; Krw_df(x)
Sw_scat_m = [Sw_i(x); Sw_d(x);  Sw_i2(x);  Sw_d3(x);  Sw_i3(x);  Sw_d4(x);  Sw_i4(x);  Sw_d5(x);  Sw_i5(x)];  %;  Sw_df(x)

KroT_scat = [Kro_i(x) ;Kro_d(x);Kro_i2(x) ;Kro_d3(x); Kro_i3(x); Kro_d4(x);Kro_i4(x);Kro_d5(x);Kro_i5(x);];%Kro_df(x)
Chi_scat  = [sui_1(x); sud_2(x); sui_2(x); sud_3(x) ;sui_3(x) ;sud_4(x);sui_4(x);sud_5(x);sui_5(x)];%;sud_df(x)
C_tscat   = linspace(td1, td6, length(Chi_scat));
%

%
%
figure(2)
scatter(Chi_scat, KrwT_scat, 24,C_tscat, 'filled')
leg = xlabel('$\overline{\chi}$ [-]');
ylabel('k_{rw} [-]')
set(leg,'Interpreter','latex')
set(gca,'FontSize',13)
h = colorbar;
set(get(h,'title'), 'string', 'Time');
box on
axis tight
%
%
figure(3)
scatter(Chi_scat, KroT_scat, 24,C_tscat, 'filled')
leg = xlabel('$\overline{\chi}$ [-]');
ylabel('k_{ro} [-]')
set(leg,'Interpreter','latex')
set(gca,'FontSize',13)
h = colorbar;
set(get(h,'title'), 'string', 'Time');
h = colorbar;
set(get(h,'title'), 'string', 'Time');
box on
axis tight
%
%
%
chi_1 = Sw_d(x).*sud_2(x) ;chi_2 = Sw_d3(x).*sud_3(x);chi_3 = Sw_d4(x).*sud_4(x);chi_4 = Sw_d5(x).*sud_5(x);chi_5 = Sw_df(x).*sud_df(x);
omegW_scat = [omegaw_d(x); omegaw_d2(x); omegaw_d3(x);omegaw_d4(x);omegaw_d5(x)];
ChiW_scat  = [chi_1;chi_2;chi_3;chi_4;chi_5];
chi_ = Sw_d3.*sud_3;


figure(4)
scatter(ChiW_scat,  omegW_scat,  24, c_scat)
axis tight 
xle = xlabel('$S_w\overline{\chi}$');
set(xle,'Interpreter', 'latex')
ylg=ylabel('$\omega_\alpha$');
set(gca,'FontSize',13)
set(ylg,'Interpreter', 'latex')
h = colorbar;
set(get(h,'title'), 'string', 'Time');
box on
axis tight
%
%
%
% omega_scat = [omegaw_i(x);omegaw_d(x);omegaw_i2(x);omegaw_d2(x); omegaw_i3(x);omegaw_d3(x);omegaw_i4(x);omegaw_d4(x);omegaw_i5(x);omegaw_d5(x)];
% figure(5)
% scatter(Chi_scat, omega_scat, 24, C_tscat, 'filled')
% legx = xlabel('$\overline{\chi}$ [-]');
% legy = ylabel('\omega_\alpha');
% set(gca,'FontSize',13)
% set(legx,'Interpreter','latex')
% set(legx,'Interpreter','latex')
% set(gca,'FontSize',13)
% h = colorbar;
% set(get(h,'title'), 'string', 'Time');
% box on
% axis tight
%
%
%
figure(6)
plot(Sw,  Kro,     '.', 'color', 'k','linewidth', .5)
hold on
scatter(Sw_scat, Kro_scat, 24,c_scat, 'filled')
plot(Sw_df,  Kro_df,  '--', 'color', 'k','linewidth', .5)
xlabel('S_w')
ylabel('K_{rn}')
legend('Initial state', 'Simulated data', 'Final state')
set(gca,'FontSize',13)
h = colorbar;
set(get(h,'title'), 'string', 'Time');
box on
axis tight
%

figure(7)
plot(Sw,     Krw,     '.', 'color', 'k','linewidth', .75)
hold on
scatter(Sw_scat, Krw_scat, 24,c_scat, 'filled')
plot(Sw_df,  Krw_df,  '--', 'color', 'k','linewidth', .5)
xlabel('S_w')
ylabel('K_{rw}')
legend('Initial state', 'Simulated data', 'Final state')
set(gca,'FontSize',13)
h = colorbar;
set(get(h,'title'), 'string', 'Time');
box on
axis tight
%
%
%
R_scat    = [sort(R(x))/1e-6; sort(R(x))/1e-6; sort(R(x))/1e-6; sort(R(x))/1e-6; sort(R(x))/1e-6];
conta_ang = [sort(advangle(x))*180/pi;sort(advang3(x))*180/pi;sort(advang6(x))*180/pi;sort(advang9(x))*180/pi;sort(advang2f(x))*180/pi];
finalcon  = pi*ones(1,nt);
figure(8)
scatter(R_scat, conta_ang, 24, c_scat, 'filled')
xlabel('Radius [\mu m]')
ylabel('Contact angle [degrees]')
set(gca,'FontSize', 13)
h = colorbar;
set(get(h,'title'), 'string', 'Time');
box on
axis tight%
%
%

Omega_scat = [omegao_d(x);omegao_d2(x);omegao_d3(x);omegao_d4(x);omegao_d5(x)];
figure(9)
scatter(Sw_scat, Omega_scat, 24,c_scat, 'filled')
box on
xlabel('S_w')
leg_al = ylabel('$\omega_\alpha$');
set(gca,'FontSize',13)
set(leg_al,'Interpreter','latex')
h = colorbar;
set(get(h,'title'), 'string', 'Time');
box on
axis tight

%
Kro_diff_scat = [-Kro_ddiff1(x);-Kro_ddiff2(x);-Kro_ddiff3(x);-Kro_ddiff4(x);-Kro_ddiff5(x)];
figure(10)
scatter(Sw_scat, Kro_diff_scat, 24,c_scat, 'filled')
box on
xlabel('S_w')
leg_al = ylabel('$f^{\rm dyn}_n$');
set(gca,'FontSize',13)
set(leg_al,'Interpreter','latex')
h = colorbar;
set(get(h,'title'), 'string', 'Time');
box on
axis tight

%
Kro_diff_scat = [Krw_ddiff1(x);Krw_ddiff2(x);Krw_ddiff3(x);Krw_ddiff4(x);Krw_ddiff5(x)];
figure(11)
scatter(Sw_scat, Kro_diff_scat, 24,c_scat, 'filled')
box on
xlabel('S_w')
leg_al = ylabel('$f^{\rm dyn}_w$');
set(gca,'FontSize',13)
set(leg_al,'Interpreter','latex')
h = colorbar;
set(get(h,'title'), 'string', 'Time');
box on
axis tight

%
Swc_cat   = [Swc_d(x);Swc3(x);Swc4(x);Swc5(x);Swcf(x)];
Snwc_cat  = [oilSat_layer_i(x); oilSat_layer_i2(x); oilSat_layer_i3(x); oilSat_layer_i4(x); oilSat_layer_i5(x)];
figure(12)
plot(Sw, Swc, '.','color', 'k','linewidth', .5)
hold on
scatter(Sw_scat, Swc_cat, 14,c_scat, 'filled')
box on
xlabel('S_w')
leg_al = ylabel('Corner water saturation');
set(gca,'FontSize',13)
set(leg_al, 'Interpreter', 'latex')
h = colorbar;
set(get(h,'title'), 'string', 'Time');
box on
axis tight
%

figure(13)
scatter(1-Sw_scat, Snwc_cat, 14,c_scat, 'filled')
box on
xlabel('S_w')
leg_al = ylabel('Non-wetting corner saturation');
set(gca,'FontSize',13)
set(leg_al,'Interpreter','latex')
h = colorbar;
set(get(h,'title'), 'string', 'Time');
box on
axis tight

%
%
figure(14)
plot(Sw_d(x),   omegaw_d(x),  '*', 'color',  'r','linewidth', 1.5)
hold on
plot(Sw_d3(x),  omegaw_d2(x), 's', 'color',  'b','linewidth', 1.5)
plot(Sw_d4(x),  omegaw_d3(x), '>', 'color',  'g','linewidth', 1.5)
plot(Sw_d5(x),  omegaw_d4(x), '+','color',   'c', 'linewidth',1.5)
plot(Sw_df(x),  omegaw_d5(x), 'd','color',   'k', 'linewidth',1.5)
xlabel('S_w');
%set(xle, 'Interpreter', 'latex')
ylabel('\omega_w')
set(gca,'FontSize',13)
legend('14 days aged sand', '23 days aged sand','40 days aged sand','65 days aged sand', '90 days aged sand')



%% The dynamic relative permeabilities

%% The oil relative permeability 

% % the initial curve Krw = x^aw - (1-(1-x)^ao)*x^2; Kro = (1.0001-x)^2*(1-(0.0001+x)^aw)+(1-x)^ao
% Kro = (1-x^(aw))*(1-x)^mw
aw = 2.432;   mw = 0.1499;  
Kro_2 = (1-Sw_d.^aw).*(1-Sw_d).^mw;
%
aw2 = 1.83;   mw2 = 0.2517;  
Kro_3 = (1- Sw_d3.^aw2).*(1-Sw_d3).^mw2;
%
aw3 = 1.311; mw3 =   0.5;
Kro_4 =  (1-Sw_d4.^aw3).*(1-Sw_d4).^mw3;
%
aw4 = 0.95; mw4 =  0.8;
Kro_5 =  (1-Sw_d5.^aw4).*(1-Sw_d5).^mw4;
aw5   = 0.85; mw5 =  1.1;
Kro_f = (1-Sw_df.^aw5).*(1-Sw_df).^mw5;
%
%
ao = [aw aw2 aw3 aw4 aw5]; 
mo = [mw mw2 mw3 mw4 mw5];


aw2 = 1.902;   mw2 = 1.5;   
aw3 = 2.452;   mw3 = 0.9924;   
aw4 = 3.293; mw4 =  0.574; 
aw5 = 3.8; mw5 =  0.3387  ; 
aw6 = 4.136; mw6 =  0.25; 
%

sud = [sud_1(end) sud_2(end) sud_3(end) sud_4(end) sud_5(end)];
Aw  = [aw2 aw3 aw4 aw5 aw6]; Mw = [mw2 mw3 mw4 mw5 mw6];
%d
% 
% %Aw = 2./(Aw - 1);
% aw2 = 5.489.*sud_2./(sud_2+0.2054);   mw2 = 0.1709./sud_2;  
% Krw_2 = (1-(1-Sw_d).^aw2).*Sw_d.^mw2;
% %
% aw3 = 5.489.*sud_3./(sud_3+0.2054);   mw3 = 0.1709./sud_3;  
% Krw_3 = (1-(1-Sw_d3).^aw3).*Sw_d3.^mw3;
% %
% aw4 = 5.489.*sud_4./(sud_4 + 0.2054);   mw4 = 0.1709./sud_4; 
% Krw_4 =  (1-(1-Sw_d4).^aw4).*Sw_d4.^mw4;
% %
% aw5   = 5.489.*sud_5./(sud_5 + 0.2054);   mw5 = 0.1709./sud_5; 
% Krw_5 =  (1-(1-Sw_d5).^aw5).*Sw_d5.^mw5;
% aw6   = 5.489.*sud_df./(sud_df+0.2054);   mw6 = 0.1709./sud_df; 
% Krw_f = (1-(1-Sw_df).^aw6).*Sw_df.^mw6;


%
figure(18)
plot(sud, ao, 'd','color',  'r', 'linewidth', 2.5)
hold on
plot(sud, mo, 's','color',  'b', 'linewidth', 2.5)
legend('a_o','m_o')
legxx = xlabel('$\overline{\chi}$ [-]');
ylabel('parameters [-]')
set(legxx,'Interpreter','latex')
set(gca,'FontSize',13)
%
%
%
figure(19)
plot(sud, Aw, 'd','color',  'r', 'linewidth', 2.5)
hold on
plot(sud, Mw, 's','color',  'b', 'linewidth', 2.5)
legend('a_w','m_w')
legxx = xlabel('$\overline{\chi}$ [-]');
ylabel('parameters [-]')
set(legxx,'Interpreter','latex')
set(gca,'FontSize',13)
%% Correlation LET model 
 
%% Oil relative permeability
E = [0.51; 0.59;1.36;2.146;4]; %[0.54;0.6017;1.415;2.23; 4.06]; %for plotted corerlation
Es = E/4;
E_1 = [0.54;0.653; 1.668;2.43;4.06];
E_3 = [0.54;0.9795;2.18;2.85; 4.06];%[0.54;0.8795;2.18;2.85; 4.06];
E_4 = [0.54;1.55; 2.775;3.341;4.05];
%E4 =  [0.
T = [0.65;2.0;1.76;1.5;1.3403;1.229];

%pcb1   = (1-Sw)./((1-Sw) + coefb(1,1).*Sw.^coefb(1,2));
pcb2   = (1-Sw_d)./((1-Sw_d)   + E(1,1).*Sw_d.^1.45);
pcb3   = (1-Sw_d3)./((1-Sw_d3) + E(2,1).*Sw_d3.^1.45);
pcb4   = (1-Sw_d4)./((1-Sw_d4) + E(3,1).*Sw_d4.^1.45);
pcb5   = (1-Sw_d5)./((1-Sw_d5) + E(4,1).*Sw_d5.^1.45);
pcb6   = (1-Sw_df)./((1-Sw_df) + E(5,1).*Sw_df.^1.45);
%


%
%% Water relative permeability model
l  = [0.51; 0.59;1.36;2.146;4]; %[0.4793; 0.5308;1.208;1.887;3.366];
l2 = [0.4793; 0.5308; 1.208; 1.888;3.366];%[0.6964; 0.7875;2.23; 4.213;11.42];
%l3 = [0.54; 0.879;2.719; 4.213;11.5];
%l4 = [1.452; 1.714; 1.72;1.317;1.3];
alpha_w = [5.1; 4.678; 4.338; 4.175];
c       = [0.00005;0.00007;0.00009;0.0001];
e = 1./l;%[1.852;1.662; 0.7066; 0.4475;0.2463];
%
pcbw2   = l(1)*(Sw_d).^1.45./(l(1)*Sw_d.^1.45    +   (1-Sw_d));
pcbw3   = l(2)*(Sw_d3).^1.45./(l(2)*Sw_d3.^1.45  +   (1-Sw_d3));
pcbw4   = l(3)*(Sw_d4).^1.45./(l(3)*Sw_d4.^1.45  +   (1-Sw_d4));
pcbw5   = l(4)*(Sw_d5).^1.45./(l(4)*Sw_d5.^1.45  +   (1-Sw_d5));
pcbw6   = l(5)*(Sw_df).^1.45./(l(5)*Sw_df.^1.45  +   (1-Sw_df));

pcf = pcbw6 - pcbw2; pcdif1 = pcbw3 - pcbw2; omegaLET = pcdif1./pcf;

KrwM = [pcbw2 pcbw3 pcbw4 pcbw5 pcbw6];
SwM  = [Sw_d Sw_d3 Sw_d4 Sw_d5 Sw_df];



KrwT_scat_ = [Krw_i(x);Krw_d(x); Krw_i2(x); Krw_d3(x); Krw_i3(x); Krw_d4(x); Krw_i4(x); Krw_d5(x); Krw_i5(x)];%; Krw_df(x)
Sw_scat_m = [Sw_i(x); Sw_d(x);  Sw_i2(x);  Sw_d3(x);  Sw_i3(x);  Sw_d4(x);  Sw_i4(x);  Sw_d5(x);Sw_i5(x)]; %; Sw_df(x)

% KroT_scat = [Kro_d(x) ;Kro_i(x);Kro_i2(x) ;Kro_d3(x); Kro_i3(x); Kro_d4(x);Kro_i4(x);Kro_d5(x);Kro_i5(x);Kro_df(x)];
Chi_scat  = [sui_1(x); sud_2(x); sui_2(x); sud_3(x) ;sui_3(x) ;sud_4(x);sui_4(x);sud_5(x);sui_5(x)];%;sud_df(x)

eta = 6.337*Chi_scat  + 0.65078;
eta2 = 7.652*Chi_scat +  0.5297;
pc_mod = eta.*Sw_scat_m.^1.75./(eta.*Sw_scat_m.^1.45 + 1-Sw_scat_m);
nm = length(eta);
PC_Surf_Model = zeros(nm, nm);
PC_SurfW = zeros(nm, nm);
PC_SurfO = zeros(nm, nm);


%Pc_surf_in = zeros(n,n); 
for i = 1:nm
    %Pc_surf_in(:,i) = pp.left;
    for j = 1:nm
        PC_SurfO(i,j) = (1-Sw_scat_m(i))./(eta(j).*Sw_scat_m(i).^1.45 + 1-Sw_scat_m(i));
        PC_SurfW(i,j)  = eta(j).*Sw_scat_m(i).^1.3./(eta(j).*Sw_scat_m(i).^1.3 + 1-Sw_scat_m(i));
        PC_Surf_Model(i,j) = eta2(j).*Sw_scat_m(i).^1.45./(eta2(j).*Sw_scat_m(i).^1.45 + 1-Sw_scat_m(i));
        %if Sw_scat_m(i)< 0.25
         %   PC_Surf_Model(i,j) = KrwT_scat_(j);
        %end%(1 - con_chi_surf(j).*(1-avnwsatu(i)) ./(con_chi_surf(j).*(1-avnwsatu(i)) + K2)).*360.4.*(sw(i)).^-0.2857 + con_chi_surf(j).*(1-avnwsatu(i)) ./(con_chi_surf(j).*(1-avnwsatu(i))   + K2).*af*sw(i).^bf;
    end
end

figure(20) 
pcolor(Chi_scat, Sw_scat_m, PC_SurfW)
shading interp
ylabel('S_w [-]')
legy = xlabel('$\overline{\chi}$ [-]');
zlabel('P_c [Pa]') 
legend('Static vs Dynamic simulation')
set(legy,'Interpreter','latex');
set(gca, 'fontsize',15)
%

Krwdiff =  abs(PC_SurfW - PC_Surf_Model);
cor = Krwdiff<-0.08;
%Krwdiff(:, 1:100) = 0.5.*Krwdiff(:, 1:100);
figure(21)
scatter(Sw_scat, Kro_scat, 24,c_scat, 'filled')
hold on
plot(Sw_d(x),   pcb2(x),    '-',  'color', 'k','linewidth',  2.5)
plot(Sw_d3(x),  pcb3(x),  '-',   'color', 'k','linewidth',  2.5)
plot(Sw_d4(x)', pcb4(x),  '-',  'color', 'k', 'linewidth', 2.5)
plot(Sw_d5(x)', pcb5(x),  '-',  'color', 'k', 'linewidth', 2.5)
plot(Sw_df(x)', pcb6(x),  '-', 'color', 'k', 'linewidth', 2.5)
xlabel('S_w')
ylabel('K_{rn}')
legend('Simulated data', 'Modefied LET model')
set(gca,'FontSize',13)
h = colorbar;
set(get(h,'title'), 'string', 'Time');
box on
axis tight

%
figure(22)
scatter(Sw_scat, Krw_scat, 24,c_scat, 'filled')
hold on
plot(Sw_d(x),   pcbw2(x),  '-',  'color', 'k', 'linewidth', 2.5)
plot(Sw_d3(x),  pcbw3(x),  '-',  'color', 'k', 'linewidth', 2.5)
plot(Sw_d4(x)', pcbw4(x),  '-',  'color', 'k', 'linewidth', 2.5)
plot(Sw_d5(x)', pcbw5(x),  '-',  'color', 'k', 'linewidth', 2.5)
plot(Sw_df(x)', pcbw6(x),  '-',  'color', 'k', 'linewidth', 2.5)
xlabel('S_w')
ylabel('K_{rw}')
legend('Simulated data', 'Modefied LET model')
set(gca,'FontSize',13)
h = colorbar;
set(get(h,'title'), 'string', 'Time');
box on
axis tight
%

figure(23)
plot(sud, E, 'd','color',  'r', 'linewidth', 2.5)
hold on
% plot(sud, T, 's','color',  'b', 'linewidth', 2.5)
legend('E_o','T_o')
legxx = xlabel('$\overline{\chi}$ [-]');
ylabel('parameters [-]')
set(legxx,'Interpreter','latex')
set(gca,'FontSize',13)

%
% Brooks-Corey formula for the end wetting state curves
Krw_w = (1-(1-Sw_d).^0.85).*Sw_d.^0.7329;
Krw_n = (1-(1-Sw_df).^1.839).*Sw_df.^0;
Kro_w = (1-Sw_d.^1.65).*(1-Sw_d).^-0.0744;
Kro_n = (1-(Sw_df).^0.9).*(1-Sw_df).^.733;
 
figure(24)
plot(Sw(x),     Krw(x),     'o',   'color', 'k','linewidth', 2)
hold on
plot(Sw_d(x)',  Krw_w(x),   '-',   'color', 'r', 'linewidth', 2.0)%BC model
plot(Sw_df(x)', Krw_df(x),  'd',   'color', 'k','linewidth', 2)
plot(Sw_d(x),   pcbw2(x),   '-.',  'color', 'b', 'linewidth', 2.0)
plot(Sw_df(x)', pcbw6(x),   '-.',  'color', 'b', 'linewidth', 2.0)
plot(Sw_df(x)', Krw_n(x),   '-',  'color',  'r', 'linewidth', 2.0)%Bcmodel
xlabel('S_w')
ylabel('K_{rw}')
legend('Initial state data', 'BC model', 'Final state data', 'LET model')
set(gca,'FontSize',13)
%

figure(25) 
plot(Sw(x),     Kro(x),     'o', 'color', 'k','linewidth', 2)
hold on
plot(Sw_d(x)',  Kro_w(x),   '-',  'color', 'r', 'linewidth',  2 )
plot(Sw_df(x)', Kro_df(x)',  'd',  'color', 'k', 'linewidth', 2  )
plot(Sw_d(x),   pcb2(x),    '-.',  'color', 'b','linewidth',  2 ) 
plot(Sw_df(x)', pcb6(x),    '-.',  'color', 'b', 'linewidth', 2 )
plot(Sw_df(x)', Kro_n(x),   '-',  'color', 'r', 'linewidth',  2 )
xlabel('S_w')
ylabel('K_{rn}')
legend('Initial state data', 'BC model', 'Final state data', 'LET model')
set(gca,'FontSize',13)
axis tight
%

%% Interpolation model
Pc_Int_id2 = omg_id2.*(Krw_n(id2) - Krw_w(id2)) + Krw_w(id2);
Pc_Int_id3 = omg_id3.*(Krw_n(id3) - Krw_w(id3)) + Krw_w(id3);
corrc1 = Pc_Int_id3 < .085;
%Pc_Int_id3(corrc1) = 0.085;
Pc_Int_id4 = omg_id4.*(Krw_n(id4) - Krw_w(id4)) + Krw_w(id4);
corrc2 = Pc_Int_id4<0.045;
%Pc_Int_id4(corrc2) =  0.045;

figure(26)
scatter(Sw_scat, Krw_scat, 24,c_scat, 'filled')
hold on
plot(Sw_d(x),    pcbw2(x),  ':',  'color', 'k', 'linewidth', 2.5)
plot(Sw_d3_id2,  Pc_Int_id2,  ':',  'color', 'k', 'linewidth', 2.5)
plot(Sw_d3_id3,  Pc_Int_id3,  ':',  'color', 'k', 'linewidth', 2.5)
plot(Sw_d3_id4', Pc_Int_id4,  ':',  'color', 'k', 'linewidth', 2.5)
plot(Sw_df(x)',  pcbw6(x),  ':',  'color', 'k', 'linewidth', 2.5)
xlabel('S_w')
ylabel('K_{rw}')
legend('Simulated data', 'Interpolation model')
set(gca,'FontSize',13)
h = colorbar;
set(get(h,'title'), 'string', 'Time');
box on
axis tight
%

Pc_Int_id2 = omg_id2.*(Kro_n(id2) - Kro_w(id2)) + Kro_w(id2);
Pc_Int_id3 = omg_id3.*(Kro_n(id3) - Kro_w(id3)) + Kro_w(id3);
corrc1 = Pc_Int_id3 < .085;
%Pc_Int_id3(corrc1) = 0.085;
Pc_Int_id4 = omg_id4.*(Kro_n(id4) - Kro_w(id4)) + Kro_w(id4);
corrc2 = Pc_Int_id4<0.045;
%Pc_Int_id4(corrc2) =  0.045;

figure(27)
scatter(Sw_scat, Kro_scat, 24,c_scat, 'filled')
hold on
plot(Sw_d(x),   pcb2(x),  ':',  'color', 'k', 'linewidth', 2.5)
plot(Sw_d3_id2,  Pc_Int_id2,  ':',  'color', 'k', 'linewidth', 2.5)
plot(Sw_d3_id3,  Pc_Int_id3,  ':',  'color', 'k', 'linewidth', 2.5)
plot(Sw_d3_id4', Pc_Int_id4,  ':',  'color', 'k', 'linewidth', 2.5)
plot(Sw_df(x)',  pcb6(x),  ':',  'color', 'k', 'linewidth', 2.5)
xlabel('S_w')
ylabel('K_{rn}')
legend('Simulated data', 'Interpolation model')
h = colorbar;
set(get(h,'title'), 'string', 'Time');
box on
axis tight

%
alpha_core = -18420*c + 6;
figure(28)
plot(c, alpha_w, 'd','color',  'r', 'linewidth', 2.5)
hold on
plot(c, alpha_core, '-','color',  'k', 'linewidth', 2.5)
% plot(su, l, '-s','color',  'b', 'linewidth', 1.5)
%
% plot(sud, E, '-d','color',  'r', 'linewidth', 1.5)
% plot(sud, T, '->','color',  'b', 'linewidth', 1.5)
legend('Data','Model')
legxx = xlabel('C [-]');
ylabel('\alpha_1, \alpha_2 [-]')
set(legxx,'Interpreter','latex')
set(gca,'FontSize',15)
box on
axis tight

figure(29) 
pcolor(Chi_scat, Sw_scat_m, PC_SurfO)
shading interp
ylabel('S_w [-]')
legy = xlabel('$\overline{\chi}$ [-]');
zlabel('P_c [Pa]') 
legend('Static vs Dynamic simulation')
set(legy,'Interpreter','latex');
set(gca, 'fontsize',15)

figure(1) 
pcolor(Chi_scat, Sw_scat_m, Krwdiff)
shading interp
ylabel('S_w [-]')
legy = xlabel('$\overline{\chi}$ [-]');
zlabel('P_c [Pa]') 
legend('Static vs Dynamic simulation')
set(legy,'Interpreter','latex');
set(gca, 'fontsize',15)