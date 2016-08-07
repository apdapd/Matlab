function [ resBid, resAsk, tAB ] = CalculateRV1( ap, aq, bp, bq, isTrade, tod_h, tod_m, time_ms)
    resBid = [];
    resAsk = [];
    tAB = [];
    %tB = [];
    cri = [];
    ccc = [];
    ap = ap(2:length(ap));
    aq = aq(2:length(aq));
    bp = bp(2:length(bp));
    bq = bq(2:length(bq));
    isTrade1 = isTrade(1:length(isTrade)-1);
    isTrade = isTrade(2:length(isTrade));
    tod_h = tod_h(2:length(tod_h));
    tod_m = tod_m(2:length(tod_m));
    time_ms = time_ms(2:length(time_ms));

  cri = CalculateCriteria( isTrade, isTrade1, tod_h, tod_m);
%  cri = ((~isTrade & ~isTrade1 & ((tod_h == 8 & tod_m > 30) | tod_h > 8) & tod_h < 15));

%ccc = aq.*0.5;
%ccc = ccc .*(ap-bp);
%ccc = ccc ./ (aq+bq);
%resAsk = ap - ccc;

resAsk = (ap - aq.*0.5.*(ap-bp)./ ( aq + bq));
resAsk = resAsk( cri);
tAB = time_ms(cri);

ccc = bq.*0.5;
ccc = ccc.*(ap-bp);
ccc = ccc./(aq+ bq);
resBid = bp + ccc;

%resBid = ( bp + bq.*0.5*(ap-bp)./(aq+ bq));
resBid = resBid( cri);
end

