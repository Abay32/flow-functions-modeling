clc; clear
close all

% Number of Nodes in different dimensions
nt  = 3*200;  
ift = 0.007;
geometry = 2;
pdrop    = 0.1;
% Throat radius data
minR     = 1e-06; 
maxR     = 20e-06;
etaR     = 1.5;   deltaR = 0.2;
x        = [0.2859
    0.5437
    0.9848
    0.7157
    0.8390
    0.4333
    0.4706
    0.5607
    0.2691
    0.7490
    0.5039
    0.6468
    0.3077
    0.1387
    0.4756
    0.3625
    0.7881
    0.7803
    0.6685
    0.1335
    0.0216
    0.5598
    0.3008
    0.9394
    0.9809
    0.2866
    0.8008
    0.8961
    0.5975
    0.8840
    0.9437
    0.5492
    0.7284
    0.5768
    0.0259
    0.4465
    0.6463
    0.5212
    0.3723
    0.9371
    0.8295
    0.8491
    0.3725
    0.5932
    0.8726
    0.9335
    0.6685
    0.2068
    0.6539
    0.0721
    0.4067
    0.6669
    0.9337
    0.8110
    0.4845
    0.7567
    0.4170
    0.9718
    0.9880
    0.8641
    0.3889
    0.4547
    0.2467
    0.7844
    0.8828
    0.9137
    0.5583
    0.5989
    0.1489
    0.8997
    0.4504
    0.2057
    0.8997
    0.7626
    0.8825
    0.2850
    0.6732
    0.6643
    0.1228
    0.4073
    0.2753
    0.7167
    0.2834
    0.8962
    0.8266
    0.3900
    0.4979
    0.6948
    0.8344
    0.6096
    0.5747
    0.3260
    0.4564
    0.7138
    0.8844
    0.7209
    0.0186
    0.6748
    0.4385
    0.4378
    0.1170
    0.8147
    0.3249
    0.2462
    0.3427
    0.3757
    0.5466
    0.5619
    0.3958
    0.3981
    0.5154
    0.6575
    0.9509
    0.7223
    0.4001
    0.8319
    0.1343
    0.0605
    0.0842
    0.1639
    0.3242
    0.3017
    0.0117
    0.5399
    0.0954
    0.1465
    0.6311
    0.8593
    0.9742
    0.5708
    0.9969
    0.5535
    0.5155
    0.3307
    0.4300
    0.4918
    0.0710
    0.8877
    0.0646
    0.4362
    0.8266
    0.3945
    0.6135
    0.8186
    0.8862
    0.9311
    0.1908
    0.2586
    0.8979
    0.5934
    0.5038
    0.6128
    0.8194
    0.5319
    0.2021
    0.4539
    0.4279
    0.9661
    0.6201
    0.6954
    0.7202
    0.3469
    0.5170
    0.5567
    0.1565
    0.5621
    0.6948
    0.4265
    0.8363
    0.7314
    0.3600
    0.4542
    0.3864
    0.7756
    0.7343
    0.4303
    0.6938
    0.9452
    0.7842
    0.7056
    0.1093
    0.3899
    0.5909
    0.4594
    0.0503
    0.2287
    0.8342
    0.0156
    0.8637
    0.0781
    0.6690
    0.5002
    0.2180
    0.5716
    0.1222
    0.6712
    0.5996
    0.0560
    0.0563
    0.1525
    0.0196
    0.4352
    0.8322
    0.6174
    0.5201
    0.8639
    0.0977
    0.9081
    0.1080
    0.5170
    0.1432
    0.5594
    0.0046
    0.7667
    0.8487
    0.9168
    0.9870
    0.5051
    0.2714
    0.1008
    0.5078
    0.5856
    0.7629
    0.0830
    0.6616
    0.5170
    0.1710
    0.9386
    0.5905
    0.4406
    0.9419
    0.6559
    0.4519
    0.8397
    0.5326
    0.5539
    0.6801
    0.3672
    0.2393
    0.5789
    0.8669
    0.4068
    0.1126
    0.4438
    0.3002
    0.4014
    0.8334
    0.4036
    0.3902
    0.3604
    0.1403
    0.2601
    0.0868
    0.4294
    0.2573
    0.2976
    0.4249
    0.1192
    0.4951
    0.7064
    0.2436
    0.7851
    0.0741
    0.3939
    0.0034
    0.2207
    0.0013
    0.1892
    0.1425
    0.2681
    0.1749
    0.1386
    0.5989
    0.9011
    0.9394
    0.2212
    0.4827
    0.3760
    0.5238
    0.2649
    0.0684
    0.4363
    0.1739
    0.0261
    0.9547
    0.4306
    0.9616
    0.7624
    0.0073
    0.6800
    0.7060
    0.6451
    0.5523
    0.2181
    0.7724
    0.2280
    0.3709
    0.8909
    0.8564
    0.4024
    0.3180
    0.6086
    0.9102
    0.9091
    0.5916
    0.3326
    0.8531
    0.4424
    0.9044
    0.0332
    0.5324
    0.7165
    0.1793
    0.3365
    0.1877
    0.3219
    0.4039
    0.5486
    0.0487
    0.5527
    0.2748
    0.2415
    0.2431
    0.1542
    0.9564
    0.9357
    0.8187
    0.7283
    0.1758
    0.3604
    0.1888
    0.0012
    0.3164
    0.6996
    0.6253
    0.5431
    0.4390
    0.2874
    0.5017
    0.7615
    0.7624
    0.5761
    0.7477
    0.6455
    0.1232
    0.5044
    0.3473
    0.0921
    0.1478
    0.1982
    0.6723
    0.4315
    0.6944
    0.2568
    0.0098
    0.5323
    0.2794
    0.9462
    0.9064
    0.3927
    0.0249
    0.6714
    0.8372
    0.9715
    0.0569
    0.4503
    0.5825
    0.6866
    0.7194
    0.6500
    0.7269
    0.3738
    0.5816
    0.1161
    0.0577
    0.9798
    0.2848
    0.5950
    0.9622
    0.1858
    0.1930
    0.3416
    0.9329
    0.3907
    0.2732
    0.1519
    0.3971
    0.3747
    0.1311
    0.4350
    0.0915
    0.6146
    0.0110
    0.5733
    0.7897
    0.2354
    0.4480
    0.5694
    0.0614
    0.4963
    0.6423
    0.2213
    0.8371
    0.9711
    0.8464
    0.5060
    0.2789
    0.7466
    0.2369
    0.9573
    0.6203
    0.6003
    0.1726
    0.0903
    0.2553
    0.8586
    0.9111
    0.6996
    0.7252
    0.2299
    0.5761
    0.8106
    0.4038
    0.9884
    0.0900
    0.3209
    0.5114
    0.0606
    0.7257
    0.5566
    0.5294
    0.8300
    0.8588
    0.7890
    0.3178
    0.4522
    0.7522
    0.1099
    0.1097
    0.2699
    0.5246
    0.9727
    0.7104
    0.3119
    0.2915
    0.8504
    0.9116
    0.6393
    0.2554
    0.0887
    0.8383
    0.5847
    0.9481
    0.0610
    0.5846
    0.2851
    0.8277
    0.1910
    0.4425
    0.3934
    0.8266
    0.6769
    0.2076
    0.3181
    0.1338
    0.6715
    0.5710
    0.1698
    0.1477
    0.4761
    0.9081
    0.5522
    0.0329
    0.0539
    0.8051
    0.4514
    0.3826
    0.7896
    0.3643
    0.5323
    0.7117
    0.8715
    0.3287
    0.6501
    0.9748
    0.0760
    0.5870
    0.4139
    0.3091
    0.2638
    0.7588
    0.9952
    0.1866
    0.7811
    0.1958
    0.9924
    0.8023
    0.4242
    0.7289
    0.4984
    0.8090
    0.3565
    0.0732
    0.5910
    0.9102
    0.1938
    0.4324
    0.7492
    0.0392
    0.9463
    0.7637
    0.5588
    0.1838
    0.4979
    0.5178
    0.9942
    0.8549
    0.9624
    0.6789
    0.4035
    0.9350
    0.4795
    0.2318
    0.3963
    0.7051
    0.5586
    0.7566
    0.9955
    0.9624
    0.5351
    0.9639
    0.1156
    0.0514
    0.3043
    0.5802
    0.5310
    0.9012
    0.5406
    0.4320
    0.5427
    0.7124
    0.0167
    0.8009
    0.1425
    0.4785
    0.2568
    0.3691
    0.6618
    0.1696
    0.2788
    0.1982
    0.1951
    0.3268
    0.8803
    0.4711
    0.4040
    0.1792
    0.9689
    0.4075
    0.8445
    0.6153
    0.3766
    0.8772
    0.7849
    0.4650
    0.8140
    0.8984
    0.4292
    0.3343
    0.5966
    0.9020
    0.7021
    0.3775
    0.7350
    0.9541
    0.5428
    0.5401
    0.3111
    0.0712
    0.1820
    0.0930
    0.4635
    0.0093
    0.9150
    0.6427
    0.0014
    0.0304
    0.2085
    0.4550
    0.1273
    0.0086
    0.7271
    0.3541
    0.7804
    0.4367
    0.4366
    0.0492
    0.0496
    0.0911
    0.5940];%rand(nt,1)%linspace(0.000001,0.99999,nt);% ;
 
al       = pi/6;
c        = 1500;
R        =  weibull(maxR, minR, deltaR, etaR, x) ;
if geometry == 1 
    porearea = pi*R.^2;
elseif geometry == 2
    porearea = 3*R.^2.*cot(pi/6);
end
% Throat Length data
minL = 1e-6; maxL   = 1e-6; 
etaL = 3;    deltaL = 0.2;
l    = 0.0009*ones(nt,1);%weibull(maxL,minL,deltaL,etaL,x);
% Aspect ratio data
teta   = [0 0.45*pi]; % the maximum and the initial minimum contact angle
recang = 0*ones(nt,1);
% Advancing Angle data
%
minAdvancingAngle = 0; maxAdvancingAngle = 0;%pi/2 +al;
%advangle          = weibull(maxAdvancingAngle,minAdvancingAngle,.4 , 1.5,x);
%
watervisco = 1e-3; %Pa_s = 1 cp ----(1e-3 = 1 cp)
oilvisco   = 1e-3; %Pa_s = 1 cp ----(1e-3 = 1 cp)
%
pressdrop_d1 = 2.5; pressdrop_d2 = 1.5; pressdrop_d3 = 1.25; pressdrop_d4 = .25; pressdrop_d5 = .1;pressdrop_d6 = .01;
%% Time for drainage displacements
totaltime_d1 = sum(2*l(1)^2.*(watervisco + oilvisco)./(R.^2.*pressdrop_d1));
totaltime_d2 = sum(2*l(1)^2.*(watervisco + oilvisco)./(R.^2.*pressdrop_d2));      
totaltime_d3 = sum(2*l(1)^2.*(watervisco + oilvisco)./(R.^2.*pressdrop_d3));
totaltime_d4 = sum(2*l(1)^2.*(watervisco + oilvisco)./(R.^2.*pressdrop_d4));  
totaltime_d5 = sum(2*l(1)^2.*(watervisco + oilvisco)./(R.^2.*pressdrop_d5));  
totaltime_d6 = sum(2*l(1)^2.*(watervisco + oilvisco)./(R.^2.*pressdrop_d6));

%% Time to displace the oil phase
pressdrop_i1 = 2.75; pressdrop_i2 = 1.5; pressdrop_i3 = 1.25; pressdrop_i4 = .25;pressdrop_i5 = .1;pressdrop_i6 = .01;
totaltime_i1 = sum(2*l(1)^2.*(watervisco + oilvisco)./(R.^2.*pressdrop_i1));
totaltime_i2 = sum(2*l(1)^2.*(watervisco + oilvisco)./(R.^2.*pressdrop_i2));      
totaltime_i3 = sum(2*l(1)^2.*(watervisco + oilvisco)./(R.^2.*pressdrop_i3));
totaltime_i4 = sum(2*l(1)^2.*(watervisco + oilvisco)./(R.^2.*pressdrop_i4)); 
totaltime_i5 = sum(2*l(1)^2.*(watervisco + oilvisco)./(R.^2.*pressdrop_i5)); 
totaltime_i6 = sum(2*l(1)^2.*(watervisco + oilvisco)./(R.^2.*pressdrop_i6)); 
%% the total time to complete the system
totaltime_d  = totaltime_d1 + totaltime_d2 + totaltime_d3 + totaltime_d4 + totaltime_d5 + totaltime_d6;
totaltime_i  = totaltime_i1 + totaltime_i2 + totaltime_i3 + totaltime_i4 + totaltime_i5;
totaltime    = totaltime_d + totaltime_i;

%% 
[td1, sud_1, bpd, Sarea, H, advang, pcd1, Krw, Kro, Sw, check, oc, wc, Ao, Aw, Lf] = Primary_drainage_displacement(recang, pressdrop_d1, ... 
    geometry, ift, R, porearea, watervisco,  oilvisco, pdrop, l, nt, teta, c,totaltime);
%

teta   = [0 0]; % the maximum and the initial contact angle
pressdrop = 7;
[~,suin, Sarea_in, advanglefin, Hin, oillayerin, check_in, Sw_in, pcin, Krw_in, Kro_in, oc_in, wc_in, Ao_in, Aw_in, Lff] = Secondary_imbibition(geometry,bpd, advang, pressdrop, R, ... 
    ift, porearea, l, pdrop, watervisco, oilvisco, check, oc,wc,Ao,Aw, nt, H, teta, c, sud_1, td1, totaltime, Lf);
%
teta   = [0.45*pi 0.45*pi]; % the maximum and the initial contact angle
pressdrop = 7;
[~,sui, Sarea_if, advanglef, Hif, oillayerf, check_if, Sw_if, pcif, Krw_if, Kro_if, oc_if, wc_if, Ao_if, Aw_if, Lf_if] = Secondary_imbibition(geometry,bpd, advang, pressdrop, R, ... 
    ift, porearea, l, pdrop, watervisco, oilvisco, check, oc,wc,Ao,Aw, nt, H, teta, c, sud_1, td1,totaltime, Lf);


teta   = [0 0.45*pi]; % the maximum and the initial minimum contact angle
%% The dynamic part
% Secondary imbibition
%
%
[timei_1, sui_1, Sarea_i, advangle, Hi, oillayer, check_i, Sw_i,pci, Krw_i, Kro_i, oc_i, wc_i, Ao_i, Aw_i, Lf] = Secondary_imbibition(geometry, bpd, advang, pressdrop_i1, R, ... 
    ift, porearea, l, pdrop, watervisco, oilvisco, check, oc,wc,Ao,Aw, nt, H, teta, c, sud_1, td1, totaltime, Lf);

% Secondary drainage
pcmin = min(pci);
[td2, sud_2, Sarea2, Hd2, advang2, pcd2, Krw_d, Kro_d, Sw_d, check_d, oc_d, wc_d, Ao_d, Aw_d, Lf] = Secondary_drainage_displacement(advangle, pressdrop_d2, pcmin, ... 
    geometry, ift, oillayer, R, porearea, watervisco, oilvisco, pdrop, bpd, l, oc_i, wc_i, Ao_i, Aw_i, nt, Hi, check_i, teta, c, sui_1, timei_1,totaltime, Lf) ;
%
%third imbibition
[timei_2, sui_2, Sarea_i2, advang3, Hi2, oillayer,check_i2, Sw_i2, pci2, Krw_i2, Kro_i2,oc_i2, wc_i2, Ao_i2, Aw_i2, Lf] = Secondary_imbibition(geometry, bpd, advang2, pressdrop_i2, R, ... 
    ift,porearea, l, pdrop, watervisco, oilvisco, check_d, oc_d,wc_d, Ao_d, Aw_d, nt, Hd2, teta, c, sud_2, td2, totaltime, Lf);
%
% third drainage
pcmin = min(pci2);
[td3, sud_3, Sarea3, Hd3, advang4, pcd3, Krw_d3, Kro_d3, Sw_d3, check_d3, oc_d3, wc_d3, Ao_d3, Aw_d3, Lf] = Secondary_drainage_displacement(advang3, pressdrop_d3,pcmin, ... 
    geometry, ift, oillayer, R, porearea, watervisco, oilvisco, pdrop, bpd, l, oc_i2, wc_i2, Ao_i2, Aw_i2, nt, Hi2, check_i2, teta, c, sui_2, timei_2,totaltime, Lf) ;
%
% fourth imbibition
[timei_3, sui_3, Sarea_i3,advang5, Hi3, oillayer,check_i3, Sw_i3, pci3, Krw_i3, Kro_i3, oc_i3, wc_i3, Ao_i3, Aw_i3, Lf] = Secondary_imbibition(geometry, bpd, advang4, pressdrop_i3, R, ... 
    ift,porearea, l, pdrop, watervisco, oilvisco, check_d3, oc_d3, wc_d3, Ao_d3, Aw_d3, nt, Hd3, teta, c, sud_3,td3, totaltime, Lf);
%
% fourth drainage 
pcmin = min(pci3);
[td4, sud_4, Sarea4, Hd4, advang6,  pcd4,  Krw_d4, Kro_d4, Sw_d4, check_d4, oc_d4, wc_d4, Ao_d4, Aw_d4, Lf] = Secondary_drainage_displacement(advang5, pressdrop_d4, pcmin, ... 
    geometry, ift, oillayer, R, porearea, watervisco, oilvisco, pdrop, bpd, l, oc_i3, wc_i3, Ao_i3, Aw_i3, nt, Hi3, check_i3, teta, c, sui_3,timei_3, totaltime, Lf) ;
%
% fiveth imbibition
[timei_4, sui_4, Sarea_i4,advang7, Hi4, oillayer,check_i4, Sw_i4, pci_curve_i4, Krw_i4, Kro_i4, oc_i4, wc_i4, Ao_i4, Aw_i4, Lf] = Secondary_imbibition(geometry, bpd, advang6, pressdrop_i4, R, ... 
    ift,porearea, l, pdrop, watervisco, oilvisco, check_d4, oc_d4, wc_d4, Ao_d4, Aw_d4, nt, Hd4, teta, c, sud_4,td4, totaltime, Lf);
%
% fivth drainage 
pcmin = min(pci_curve_i4);
[td5,sud_5, Sarea5, Hd5, advang8,  pcd5,  Krw_d5, Kro_d5, Sw_d5, check_d5, oc_d5, wc_d5, Ao_d5, Aw_d5, Lf5] = Secondary_drainage_displacement(advang5, pressdrop_d5, pcmin, ... 
    geometry, ift, oillayer, R, porearea, watervisco, oilvisco, pdrop, bpd, l, oc_i4, wc_i4, Ao_i4, Aw_i4, nt, Hi4, check_i4, teta, c, sui_4,timei_4, totaltime, Lf) ;

% six imbibition
[timei_5, sui_5, Sarea_i5, advang9, Hi5, oillayer, check_i5, Sw_i5, pci_curve_i5, Krw_i5, Kro_i5, oc_i5, wc_i5, Ao_i5, Aw_i5, Lf6] = Secondary_imbibition(geometry, bpd, advang6, pressdrop_i5, R, ... 
    ift, porearea, l, pdrop, watervisco, oilvisco, check_d5, oc_d5, wc_d5, Ao_d5, Aw_d5, nt, Hd5, teta, c, sud_5, td5, totaltime, Lf5);
%
teta      = [0.45*pi 0.45*pi];
pressdrop = 0.1;
pcmin     = min(pcif);


[td6, sud_df, Sarea2f, Hd2f, advang2f, pcd2f, Krw_df, Kro_df, Sw_df, check_df, oc_df, wc_df, Ao_df, Aw_df, Lf_df] = Secondary_drainage_displacement(advanglef, pressdrop_d6, pcmin, ... 
    geometry, ift, oillayer, R, porearea, watervisco, oilvisco, pdrop, bpd, l, oc_i5, wc_i5, Ao_i5, Aw_i5, nt, Hi4, check_i5, teta, c, sui_5, timei_5, totaltime, Lf6) ;

td1 = td1*1.15740741e-5;
td2 = td2*1.15740741e-5;
td3 = td3*1.15740741e-5;
td4 = td4*1.15740741e-5;
td5 = td5*1.15740741e-5;
td6 = td6*1.15740741e-5;

%% drainage water relative permeability
%
Krw_ddiff1 = Krw_d - Krw; Krw_ddiff2 = Krw_d3 - Krw; Krw_ddiff3 = Krw_d4 - Krw; Krw_ddiff4 = Krw_d5 - Krw; Krw_ddiff5 = Krw_df - Krw; Krwdiff    =  Krw_df - Krw;  
omegaw_d  = Krw_ddiff1./Krwdiff; omegaw_d2 = Krw_ddiff2./Krwdiff; omegaw_d3 = Krw_ddiff3./Krwdiff; omegaw_d4 = Krw_ddiff4./Krwdiff; omegaw_d5 = Krw_ddiff5./Krwdiff;
%
% Imbibition water relative permeability
Krw_idiff1 = Krw_i-Krw_in; Krw_idiff2 = Krw_i2 - Krw_in; Krw_idiff3 = Krw_i3-Krw_in; Krw_idiff4 = Krw_i4 - Krw_in; Krw_idiff5 = Krw_if - Krw_in; Krwdiff_i  = -Krw_in + Krw_if;
omegaw_i = Krw_idiff1./Krwdiff_i;omegaw_i2 = Krw_idiff2./Krwdiff_i; omegaw_i3 = Krw_idiff3./Krwdiff_i; omegaw_i4 = Krw_idiff4./Krwdiff_i; omegaw_i5 = Krw_idiff5./Krwdiff_i;
%% 
%% omegaw_i3 = Krw_idiff3./Krwdiff_i;
%% 
%% 
% drainage oil relative permeability
Kro_ddiff1 =  Kro - Kro_d; Kro_ddiff2 = Kro - Kro_d3; Kro_ddiff3 = Kro - Kro_d4; Kro_ddiff4 = Kro - Kro_d5; Kro_ddiff5 = Kro - Kro_df; Krodiff    =  Kro -Kro_df ;  
omegao_d   =  Kro_ddiff1./Krodiff; omegao_d2 =  Kro_ddiff2./Krodiff; omegao_d3 =  Kro_ddiff3./Krodiff; omegao_d4 =  Kro_ddiff4./Krodiff; omegao_d5 =  Kro_ddiff5./Krodiff;
%
% Imbibition oil relative permeability
Kro_idiff1 = Kro_in - Kro_i; Kro_idiff2 = Kro_in - Kro_i3; Kro_idiff3 = Kro_in - Kro_i4;
Kro_idiff  = Kro_in-Kro_if;
omegao_i   = Kro_idiff1./Kro_idiff; omegao_i2 =  Kro_idiff2./Kro_idiff; omegao_i3 =  Kro_idiff3./Kro_idiff;
%KrwCor1 = (1 - Sw_d)^b/((1-Sw_d) + Sw_d^d);
% 
%%Parameter fiting using lsnonlin
pcsto = [Kro_d Kro_d3 Kro_d4 Kro_df];
coefb = zeros(4,2);
sw    = [Sw_d Sw_d3 Sw_d4 Sw_df];
%coefs = zeros(6,4);
for i = 1:4
    fun = @(x) (1 - sw(:,i))./((1 - sw(:,i) + x(1)*sw(:,i).^x(2))) - pcsto(:,i);
    x0  = [0.2313, 0.6059]; 
    b1  = [0;0;0;0];       b2 = [inf;inf;inf;inf];
    c1  = [2.3;0;0;0];     c2 = [inf;inf;inf;inf]; 
    lb  = [b1 c1];  ub = [b2 c2];
    %ls  = [56.12 0 -56 0];us = [360 1 0 1];
    [xcoefb, resnorm] = lsqnonlin(fun,x0,lb(i,:),ub(i,:));
    coefb(i,:) = xcoefb;
end

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
a = 1.568;  b = 0.2224;  Kroc_ww = (1-Sw_in.^(2*a + 1)).*(1-Sw_in).^b;
a = 0.452;  b = 0.8563;  Kroc_ow = (1-Sw_if).^(a+1+b);
a = 1.568;  b = 2;  Kroc_ww = (1-Sw_in.^(2*a + 1)).*(1-Sw_in).^b;
a = -0.6917;  b = 2;  Kroc_ow = (1-Sw_if).^(a+1+b);
%
% Krw = Sw^b/(Sw^b + a*(1-Sw)) for LET model 
a = 2.917;  b = 1.395; LKrwc_ww = Sw_in.^b./(Sw_in.^b + a*(1-Sw_in));
a = 0.2152; b = 1.23;  LKrwc_ow = Sw_if.^b./(Sw_if.^b + a*(1-Sw_if));
% Kro = (1-Sw)/((1-Sw) + a*Sw^b) for all wetting state 
a = 0.3428; b = 1.395; LKroc_ww = (1-Sw_in)./((1-Sw_in) + a*Sw_in.^b);
a = 4.646;  b = 1.23;  LKroc_ow = (1-Sw_if)./((1-Sw_if) + a*Sw_if.^b);
x = 1:13:nt;
figure(1)
plot(Sw(x),     Sarea(x),     '.', 'color', 'm','linewidth', 0.5)
hold on
plot(Sw_d(x),   Sarea2(x),   '*',  'color', 'r','linewidth',  .5)
plot(Sw_d3(x),  Sarea3(x),   's',   'color', 'b','linewidth',  .5)
plot(Sw_d4(x)', Sarea4(x),   '>',  'color', 'g', 'linewidth', .5)
plot(Sw_d5(x)', Sarea5(x),   '+',  'color', 'c', 'linewidth', .5)
%plot(Sw_df(x)', Sarea2f(x),  'd', 'color', 'k', 'linewidth', 0.05)
%
figure(14)
plot(Sw_in(x),  Sarea_in(x), '.', 'color', 'm','linewidth', 2.5)
hold on
plot(Sw_i(x),  Sarea_i(x),   '*',   'color', 'r', 'linewidth',  .05)
plot(Sw_i2(x), Sarea_i2(x),  's',   'color', 'b', 'linewidth',  0.5)
plot(Sw_i3(x), Sarea_i3(x),  '>',   'color', 'g', 'linewidth',  0.5)
plot(Sw_i4(x), Sarea_i4(x),  '+',   'color', 'k', 'linewidth', 0.05)
%plot(Sw_i5(x), Sarea_i5(x),  'd',   'color', 'm', 'linewidth', 0.05)
%plot(Sw_if(x), Sarea_if(x),  '.',   'color', 'm', 'linewidth', 0.05) 
 
leg = xlabel('$\overline{\chi}$ [-]');
ylabel('k_{rw} [-]')
set(leg,'Interpreter','latex')
set(gca,'FontSize',13)
% plot(Sw(x),     Krw(x),     '.', 'color', 'm','linewidth', 0.05)
% plot(Sw_d(x),   Krw_d(x),   '*',  'color', 'r','linewidth',  .05)
% plot(Sw_d3(x),  Krw_d3(x),  's',   'color', 'b','linewidth',  .5)
% plot(Sw_d4(x),  Krw_d4(x),  '>',  'color', 'g', 'linewidth', .5)
% plot(Sw_d5(x),  Krw_d5(x),  '+',  'color', 'c', 'linewidth', .5)
% plot(Sw_df(x),  Krw_df(x),  'd', 'color',  'k', 'linewidth', 0.05)
% xlabel('S_w')
ylabel('Rel. Perm.')
set(gca,'FontSize',13)

%legend('Fresh sand, drainage','-- aged sand, drainage', '-- aged sand, drainage','-- aged sand, drainage', 'after -- aged sand, drainage')
finalcon = 0.45*pi*ones(1,nt);
%
figure(2)
plot(sort(R(x))/1e-5, sort(advangle(x))*180/pi,'--*','color', 'r','linewidth',  .05)
hold on
plot(sort(R(x))/1e-5, sort(advang3(x))*180/pi,'--s','color', 'b','linewidth',  .05)
plot(sort(R(x))/1e-5, sort(advang5(x))*180/pi,'-->','color', 'g','linewidth',  .05)
plot(sort(R(x))/1e-5, sort(advang7(x))*180/pi,'--+','color', 'c','linewidth',  .05)
plot(sort(R(x))/1e-5, finalcon(x)*180/pi,   '--d','color',   'k','linewidth',  .05)
xlabel('Radius [\mu m]')
ylabel('Contact angle [degrees]')
set(gca,'FontSize', 13)
legend('14 days aged sand', '23 days aged sand', '40 days aged sand', '65 days aged sand', '90 days aged sand')
%
figure(3)
plot(Sw_d(x),   omegao_d(x),  '*', 'color',  'r','linewidth', 1.5)
hold on
plot(Sw_d3(x),  omegao_d2(x), 's', 'color',  'b','linewidth', 1.5)
plot(Sw_d4(x),  omegao_d3(x), '>', 'color',  'g','linewidth', 1.5)
plot(Sw_d5(x),  omegao_d4(x), '+','color',   'c', 'linewidth',1.5)
plot(Sw_df(x),  omegao_d5(x), 'd','color',   'k', 'linewidth',1.5)
xlabel('S_w')
ylabel('\omega_o')
set(gca,'FontSize',13)
legend('14 days aged sand', '23 days aged sand','40 days aged sand','65 days aged sand', '90 days aged sand')
%legend('Fresh sand, imbibe','-- aged sand, imbibe', '-- aged sand, imbibe','-- aged sand, imbibe', 'after -- aged sand, imbibe')
figure(4)
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
%% Omegas
chw_1 = Sw_d.*sud_2 ;
figure(5)
plot(Sw_d(x).*sud_2(x),   omegaw_d(x),  '*', 'color',  'r','linewidth', 1.5)
hold on
plot(Sw_d3(x).*sud_3(x),  omegaw_d2(x), 's', 'color',  'b','linewidth', 1.5)
plot(Sw_d4(x).*sud_4(x),  omegaw_d3(x), '>', 'color',  'g','linewidth', 1.5)
plot(Sw_d5(x).*sud_5(x),  omegaw_d4(x), '+','color',   'c', 'linewidth',1.5)
plot(Sw_df(x).*sud_df(x), omegaw_d5(x), 'd','color',   'k', 'linewidth',1.5)
%
plot(Sw_i(x) .*sui_1(x),  omegaw_i(x),  '*', 'color',  'r', 'linewidth',1.5)
plot(Sw_i2(x).*sui_2(x),  omegaw_i2(x), 's', 'color',  'b', 'linewidth',1.5)
plot(Sw_i3(x).*sui_3(x),  omegaw_i3(x), '>', 'color',  'g', 'linewidth',1.5)
plot(Sw_i4(x).*sui_4(x),  omegaw_i4(x), '+', 'color',  'c', 'linewidth',1.5)
plot(Sw_if(x).*sui_5(x),  omegaw_i5(x), 'd', 'color',  'k', 'linewidth',1.5)
xle = xlabel('$S_w\overline{\chi}$');
set(xle, 'Interpreter', 'latex')
ylabel('\omega_w')
set(gca,'FontSize',13)
legend('14 days aged sand', '23 days aged sand','40 days aged sand','65 days aged sand', '90 days aged sand')
%
%
figure(6)
plot(Sw_d(x).*sud_2(x),   omegao_d(x),  '*', 'color',  'r','linewidth', 1.5)
hold on
plot(Sw_d3(x).*sud_3(x),  omegao_d2(x), 's', 'color',  'b','linewidth', 1.5)
plot(Sw_d4(x).*sud_4(x),  omegao_d3(x), '>', 'color',  'g','linewidth', 1.5)
plot(Sw_d5(x).*sud_5(x),  omegao_d4(x), '+','color',   'c', 'linewidth',1.5)
plot(Sw_df(x).*sud_df(x), omegao_d5(x), 'd','color',   'k', 'linewidth',1.5)
%
% plot(Sw_i(x) .*sui_1(x),  omegao_i(x),  '*', 'color',  'r', 'linewidth',1.5)
% plot(Sw_i2(x).*sui_2(x),  omegao_i2(x), 's', 'color',  'b', 'linewidth',1.5)
% plot(Sw_i3(x).*sui_3(x),  omegao_i3(x), '>', 'color',  'g', 'linewidth',1.5)
% plot(Sw_i4(x).*sui_4(x),  omegao_i4(x), '+', 'color',  'c', 'linewidth',1.5)
% plot(Sw_if(x).*sui_5(x),  omegao_i5(x), 'd', 'color',  'k', 'linewidth',1.5)
xxle = xlabel('$S_w\overline{\chi}$');
set(xxle, 'Interpreter', 'latex')
ylabel('\omega_0')
set(gca,'FontSize',13)
legend('14 days aged sand', '23 days aged sand','40 days aged sand','65 days aged sand', '90 days aged sand')
%
figure(7)
plot(sud_2(x),  omegao_d(x),  '--*', 'color',  'm','linewidth',0.05)
hold on
plot(sud_3(x),  omegao_d2(x),  '--s', 'color',  'r','linewidth',2.5)
plot(sud_4(x),  omegao_d3(x),  '-->', 'color',  'b','linewidth',2.5)
plot(sud_5(x),  omegao_d4(x),  '--+', 'color',  'c', 'linewidth',1.5)
plot(sud_df(x), omegao_d5(x),  '--d', 'color',  'k', 'linewidth',1.5)
xlabel('S_w')
ylabel('K_{rw}')
set(gca,'FontSize',13)
legend('-- aged sand, imbibe', '-- aged sand')
%
figure(8)
plot(Sw_in(x),  omegao_i(x),   '--o', 'color',  'm','linewidth',0.05)
hold on
plot(Sw_i(x),   omegao_i2(x),  '--',  'color',  'r','linewidth',2.5)
plot(Sw_i2(x),  omegao_i3(x),  ':',   'color',  'b','linewidth',2.5)
% plot(Sw_i3(x)', Krw_i3(x),  '-.','color',   'g', 'linewidth',2.5)
% plot(Sw_if(x)', Krw_if(x),  '--d', 'color', 'k', 'linewidth',0.05)
xlabel('S_w')
ylabel('K_{rw}')
set(gca,'FontSize',13)
legend('-- aged sand, imbibe', '-- aged sand')
%
%
%% Omegas
figure(9)
plot(sud_2(x),  omegaw_d(x),    '--o', 'color',  'm','linewidth',0.05)
hold on
plot(sud_3(x),  omegaw_d2(x),   '--', 'color',  'r','linewidth',2.5)
plot(sud_4(x),  omegaw_d3(x),   ':', 'color',   'b','linewidth',2.5)
plot(sui_1(x),  omegaw_i(x),    '--o', 'color',  'm','linewidth',0.05)
plot(sui_2(x),  omegaw_i2(x),   '--',  'color',  'r','linewidth',2.5)
plot(sui_3(x),  omegaw_i3(x),   ':',   'color',   'b','linewidth',2.5)
% plot(Sw_i3(x)', Krw_i3(x),  '-.','color',   'g', 'linewidth',2.5)
% plot(Sw_if(x)', Krw_if(x),  '--d', 'color', 'k', 'linewidth',0.05)
xlabel('S_w')
ylabel('K_{rw}')
set(gca,'FontSize',13)
legend('-- aged sand, imbibe', '-- aged sand')
%
%

%
%
Kr = [Kro_if(x);Kro_df(x);Kro_if(x);Kro_df(x);Kro_if(x);Kro_df(x);Kro_if(x);Kro_df(x)];
su = [sui_1(x);sud_2(x);sui_2(x);sud_3(x);sui_3(x);sud_4(x);sui_4(x);sud_5(x)];
figure(15)
plot(Sw_i(x),   Kro_i(x),   '--*', 'color', 'm','linewidth', 0.05)
hold on
plot(Sw_d(x),   Kro_d(x),   '--*',  'color', 'r','linewidth',  .05)
plot(Sw_i2(x),  Kro_i2(x),  '--s',   'color', 'b','linewidth',  .5)
plot(Sw_d3(x)', Kro_d3(x),  '--s',  'color', 'g', 'linewidth', .5)
plot(Sw_i3(x)', Kro_i3(x),  '-->', 'color',  'k', 'linewidth', 0.05)
plot(Sw_d4(x),  Kro_d4(x),  '-->', 'color', 'm','linewidth',  0.05)
plot(Sw_i4(x),  Kro_i4(x),  '--d',  'color', 'r','linewidth',  .05)
plot(Sw_d5(x),  Kro_d5(x),  '--d',   'color', 'b','linewidth',  .5)
%plot(su,  Kr,   '--', 'color', 'm','linewidth', 2.5) 
legxx = xlabel('$\overline{\chi}$ [-]');
ylabel('k_{ro} [-]')
set(legxx,'Interpreter','latex')
set(gca,'FontSize',13)
%
%
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
%
%
figure(16)
plot(Sw(x),     Kro(x),     'o', 'color', 'm','linewidth', 0.05)
hold on
plot(Sw_d(x),   Kro_d(x),   '*',  'color', 'r','linewidth',  1.5)
plot(Sw_d3(x),  Kro_d3(x),  's',   'color', 'b','linewidth',  1.5)
plot(Sw_d4(x)', Kro_d4(x),  '>',  'color', 'g', 'linewidth', 1.5)
plot(Sw_d5(x)', Kro_d5(x),  '+',  'color', 'c', 'linewidth', 1.5)
plot(Sw_df(x)', Kro_df(x),  'd', 'color', 'k', 'linewidth', 1.5)
%
%corelation 
%plot(Sw(x),     Krw_1(x),     '-', 'color', 'k','linewidth', 2.5)
plot(Sw_d(x),   Kro_2(x),     '-',  'color', 'k', 'linewidth',  2.5)
plot(Sw_d3(x),  Kro_3(x),     '-',  'color', 'k', 'linewidth',  2.5)
plot(Sw_d4(x),  Kro_4(x),     '-',  'color', 'k', 'linewidth',  2.5)
plot(Sw_d5(x),  Kro_5(x),     '-',  'color', 'k', 'linewidth',  2.5)
plot(Sw_df,     Kro_f,        '-',  'color', 'k', 'linewidth',  2.5)
%
xlabel('S_w')
ylabel('K_{ro}')
set(gca,'FontSize',13)
legend('Fresh sand', '14 days aged sand', '23 days aged sand','40 days aged sand','65 days aged sand', '90 days aged sand','Correlation model')%subplot(2,1,2)
% the mixed-wet model
%
% aw = 2.246;  ao =  -0.02053; 
% the initial curve Krw = x^aw - (1-(1-x)^ao)*x^2; Kro = (1.0001-x)^2*(1-(0.0001+x)^aw)+(1-x)^ao
% Krw_1 = (1-(1-Sw).^aw).*Sw.^mw;
aw2 = 1.902;   mw2 = 1.5;  
% Krw_2 = (1-(1-Sw_d).^aw2).*Sw_d.^mw2;
% %
aw3 = 2.452;   mw3 = 0.9924;  
% Krw_3 = (1-(1-Sw_d3).^aw3).*Sw_d3.^mw3;
% %
aw4 = 3.293; mw4 =  0.574;
% Krw_4 =  (1-(1-Sw_d4).^aw4).*Sw_d4.^mw4;
% %
aw5 = 3.8; mw5 =  0.3387  ;
% Krw_5 =  (1-(1-Sw_d5).^aw5).*Sw_d5.^mw5;
aw6 = 4.136; mw6 =  0.25;
% Krw_f = (1-(1-Sw_df).^aw6).*Sw_df.^mw6;
%

sud = [sud_2(end) sud_3(end) sud_4(end) sud_5(end) 1];
Aw  = [aw2 aw3 aw4 aw5 aw6]; Mw = [mw2 mw3 mw4 mw5 mw6];


%Aw = 2./(Aw - 1);
aw2 = 5.489.*sud_2./(sud_2+0.2054);   mw2 = 0.1709./sud_2;  
Krw_2 = (1-(1-Sw_d).^aw2).*Sw_d.^mw2;
%
aw3 = 5.489.*sud_3./(sud_3+0.2054);   mw3 = 0.1709./sud_3;  
Krw_3 = (1-(1-Sw_d3).^aw3).*Sw_d3.^mw3;
%
aw4 = 5.489.*sud_4./(sud_4 + 0.2054);   mw4 = 0.1709./sud_4; 
Krw_4 =  (1-(1-Sw_d4).^aw4).*Sw_d4.^mw4;
%
aw5   = 5.489.*sud_5./(sud_5 + 0.2054);   mw5 = 0.1709./sud_5; 
Krw_5 =  (1-(1-Sw_d5).^aw5).*Sw_d5.^mw5;
aw6   = 5.489.*sud_df./(sud_df+0.2054);   mw6 = 0.1709./sud_df; 
Krw_f = (1-(1-Sw_df).^aw6).*Sw_df.^mw6;

figure(17)
plot(Sw(x),     Krw(x),     'o', 'color',  'm','linewidth', 1.5)
hold on
plot(Sw_d(x),   Krw_d(x),   '*',  'color', 'r','linewidth',  1.5)
plot(Sw_d3(x),  Krw_d3(x),  's',   'color', 'b','linewidth',  1.5)
plot(Sw_d4(x),  Krw_d4(x),  '>',  'color', 'g', 'linewidth', 1.5)
plot(Sw_d5(x),  Krw_d5(x),  '+',  'color', 'c', 'linewidth', 1.5)
plot(Sw_df(x),  Krw_df(x),  'd', 'color',  'k', 'linewidth', 1.5)
%
plot(Sw_d(x),   Krw_2(x),     '-',  'color', 'k','linewidth',  2.5)
plot(Sw_d3(x),  Krw_3(x),     '-',   'color', 'k','linewidth',  2.5)
plot(Sw_d4(x),  Krw_4(x),     '-',  'color',  'k', 'linewidth', 2.5)
plot(Sw_d5(x),  Krw_5(x),     '-',  'color',  'k', 'linewidth', 2.5)
plot(Sw_df,     Krw_f,        '-', 'color',  'k', 'linewidth', 2.5)
xlabel('S_w')
ylabel('K_{rw}')
legend('Fresh sand', '14 days aged sand', '23 days aged sand', '40 days aged sand', '65 days aged sand', '90 days aged sand', 'Correlation model')
set(gca,'FontSize',13)
%
%
%
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
 

E = [0.8784;1.209;2.150;3.19;4.645];
T = [2.0;1.76;1.5;1.3403;1.229];


%pcb1   = (1-Sw)./((1-Sw) + coefb(1,1).*Sw.^coefb(1,2));
pcb2   = (1-Sw_d)./((1-Sw_d)   + E(1,1).*Sw_d.^T(1,1));
pcb3   = (1-Sw_d3)./((1-Sw_d3) + E(2,1).*Sw_d3.^T(2,1));
pcb4   = (1-Sw_d4)./((1-Sw_d4) + E(3,1).*Sw_d4.^T(3,1));
pcb5   = (1-Sw_d5)./((1-Sw_d5) + E(4,1).*Sw_d5.^T(4,1));
pcb6   = (1-Sw_df)./((1-Sw_df) + E(5,1).*Sw_df.^T(5,1));
%
l = [2.327; 2.0;1.7;1.4; 1.25];
e = [1.151;0.6588;0.4;0.24;0.2];
%
%
%pcb1   = (1-Sw)./((1-Sw) + coefb(1,1).*Sw.^coefb(1,2));
pcbw2   = (Sw_d).^l(1,1)./((Sw_d).^l(1,1)   + e(1,1).*(1-Sw_d));
pcbw3   = (Sw_d3).^l(2,1)./((Sw_d3).^l(2,1) + e(2,1).*(1-Sw_d3));
pcbw4   = (Sw_d4).^l(3,1)./((Sw_d4).^l(3,1) + e(3,1).*(1-Sw_d4));
pcbw5   = (Sw_d5).^l(4,1)./((Sw_d5).^l(4,1) + e(4,1).*(1-Sw_d5));
pcbw6   = (Sw_df).^l(5,1)./((Sw_df).^l(5,1) + e(5,1).*(1-Sw_df));
figure(20)
plot(Sw(x),     Kro(x),     '.', 'color', 'm','linewidth', 0.5)
hold on
plot(Sw_d(x),   Kro_d(x),   '*',  'color', 'r','linewidth',  1.5)
plot(Sw_d3(x),  Kro_d3(x),  's',   'color', 'b','linewidth',  1.5)
plot(Sw_d4(x)', Kro_d4(x),  '>',  'color', 'g', 'linewidth', 1.5)
plot(Sw_d5(x)', Kro_d5(x),  '+',  'color', 'c', 'linewidth', 1.5)
plot(Sw_df(x)', Kro_df(x),  'd', 'color', 'k', 'linewidth', 1.5)
%
plot(Sw_d(x),   pcb2(x),    '-',  'color', 'k','linewidth',  2.5)
plot(Sw_d3(x),  pcb3(x),  '-',   'color', 'k','linewidth',  2.5)
plot(Sw_d4(x)', pcb4(x),  '-',  'color', 'k', 'linewidth', 2.5)
plot(Sw_d5(x)', pcb5(x),  '-',  'color', 'k', 'linewidth', 2.5)
plot(Sw_df(x)', pcb6(x),  '-', 'color', 'k', 'linewidth', 2.5)
%
plot(Sw(x),     Krw(x),     '.', 'color', 'm','linewidth', 0.5)
plot(Sw_d(x),   Krw_d(x),   '*',  'color', 'r','linewidth',  1.5)
plot(Sw_d3(x),  Krw_d3(x),  's',   'color', 'b','linewidth',  1.5)
plot(Sw_d4(x)', Krw_d4(x),  '>',  'color', 'g', 'linewidth', 1.5)
plot(Sw_d5(x)', Krw_d5(x),  '+',  'color', 'c', 'linewidth', 1.5)
plot(Sw_df(x)', Krw_df(x),  'd', 'color', 'k', 'linewidth', 1.5)
%
plot(Sw_d(x),   pcbw2(x),  ':',  'color', 'k', 'linewidth', 2.5)
plot(Sw_d3(x),  pcbw3(x),  ':',  'color', 'k', 'linewidth', 2.5)
plot(Sw_d4(x)', pcbw4(x),  ':',  'color', 'k', 'linewidth', 2.5)
plot(Sw_d5(x)', pcbw5(x),  ':',  'color', 'k', 'linewidth', 2.5)
plot(Sw_df(x)', pcbw6(x),  ':',  'color', 'k', 'linewidth', 2.5)
xlabel('S_w')
ylabel('K_{r\alpha}')
%legend('Fresh sand', '14 days aged sand', '23 days aged sand', '40 days aged sand', '65 days aged sand', '90 days aged sand', 'Correlation model')
set(gca,'FontSize',13)
%
figure(21)
plot(sud, E, 'd','color',  'r', 'linewidth', 2.5)
hold on
plot(sud, T, 's','color',  'b', 'linewidth', 2.5)
legend('E_o','T_o')
legxx = xlabel('$\overline{\chi}$ [-]');
ylabel('parameters [-]')
set(legxx,'Interpreter','latex')
set(gca,'FontSize',13)
% LET model 
%
l = [2.327; 2.0;1.7;1.4; 1.25];
e = [1.151;0.6588;0.4;0.24;0.2];
%
%
%pcb1   = (1-Sw)./((1-Sw) + coefb(1,1).*Sw.^coefb(1,2));
pcb2   = (Sw_d).^l(1,1)./((Sw_d).^l(1,1)   + e(1,1).*(1-Sw_d));
pcb3   = (Sw_d3).^l(2,1)./((Sw_d3).^l(2,1) + e(2,1).*(1-Sw_d3));
pcb4   = (Sw_d4).^l(3,1)./((Sw_d4).^l(3,1) + e(3,1).*(1-Sw_d4));
pcb5   = (Sw_d5).^l(4,1)./((Sw_d5).^l(4,1) + e(4,1).*(1-Sw_d5));
pcb6   = (Sw_df).^l(5,1)./((Sw_df).^l(5,1) + e(5,1).*(1-Sw_df));
%
figure(22)
plot(Sw(x),     Krw(x),     'o', 'color', 'm','linewidth', 0.05)
hold on
plot(Sw_d(x),   Krw_d(x),   '*',  'color', 'r','linewidth',  1.5)
plot(Sw_d3(x),  Krw_d3(x),  's',   'color', 'b','linewidth',  1.5)
plot(Sw_d4(x)', Krw_d4(x),  '>',  'color', 'g', 'linewidth', 1.5)
plot(Sw_d5(x)', Krw_d5(x),  '+',  'color', 'c', 'linewidth', 1.5)
plot(Sw_df(x)', Krw_df(x),  'd', 'color', 'k', 'linewidth', 1.5)
%
plot(Sw_d(x),   pcb2(x),    '-',  'color', 'k','linewidth',  2.5)
plot(Sw_d3(x),  pcb3(x),  '-',   'color', 'k','linewidth',  2.5)
plot(Sw_d4(x)', pcb4(x),  '-',  'color', 'k', 'linewidth', 2.5)
plot(Sw_d5(x)', pcb5(x),  '-',  'color', 'k', 'linewidth', 2.5)
plot(Sw_df(x)', pcb6(x),  '-', 'color', 'k', 'linewidth', 2.5)
xlabel('S_w')
ylabel('K_{rw}')
legend('Fresh sand', '14 days aged sand', '23 days aged sand', '40 days aged sand', '65 days aged sand', '90 days aged sand', 'Correlation model')
set(gca,'FontSize',13)
%
figure(23)
plot(sud, e, '-*','color',  'r', 'linewidth', 1.5)
hold on
plot(sud, l, '-s','color',  'b', 'linewidth', 1.5)
%
plot(sud, E, '-d','color',  'r', 'linewidth', 1.5)
plot(sud, T, '->','color',  'b', 'linewidth', 1.5)
legend('E_w','L_w', 'E_o','T_o')
legxx = xlabel('$\overline{\chi}$ [-]');
ylabel('parameters [-]')
set(legxx,'Interpreter','latex')
set(gca,'FontSize',13)