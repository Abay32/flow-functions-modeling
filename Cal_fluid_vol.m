function [oil_volume_in_each_element,water_volume_in_each_element] =...
    Cal_fluid_vol(A_oil,A_water,length)

oil_volume_in_each_element = A_oil*length;
water_volume_in_each_element = A_water*length;