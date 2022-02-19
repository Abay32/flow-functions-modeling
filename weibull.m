function [out] = weibull(max,min,delta,eta,x)
out = (max - min)*(-delta*log(x.*(1-exp(-1/delta))+exp(-1/delta))).^(1/eta) + min;