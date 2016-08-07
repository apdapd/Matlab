function [ resBid, tB, resAsk, tA ] = CalculateRV1( ap, aq, bp, bq, isTrade, tod_h, tod_m, time_ms)
    resBid = [];
    resAsk = [];
    tA = [];
    tB = [];
    cri = [];
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

%[resAsk, tA, resBid, tB] = [(ap - aq.*0.5*(ap-bp)./ ( aq + bq), time_ms, bp + bq.*0.5*(ap-bp)./(aq+ bq), time_ms) & (cri)];
%[resAsk, tA, resBid, tB] = [(ap - aq.*0.5*(ap-bp)./ ( aq + bq), time_ms, bp + bq.*0.5*(ap-bp)./(aq+ bq), time_ms) & (~isTrade & ~isTrade1 & ((tod_h == 8 & tod_m > 30) | tod_h > 8) & tod_h < 15)];
%cri = aq.*0.5;
%cri = cri .*(ap-bp);
%cri = cri ./ (aq+bq);
%resAsk = ap - cri;
resAsk = (DelNan((ap - aq.*0.5.*(ap-bp)./ ( aq + bq))) & (~isTrade & ~isTrade1 & ((tod_h == 8 & tod_m > 30) | tod_h > 8) & tod_h < 15));

tA = ( time_ms & (~isTrade & ~isTrade1 & ((tod_h == 8 & tod_m > 30) | tod_h > 8) & tod_h < 15));
cri = bq.*0.5;
cri = cri.*(ap-bp);
cri = cri./(aq+ bq);
resBid = bp + cri;
cri = ((~isTrade & ~isTrade1 & ((tod_h == 8 & tod_m > 30) | tod_h > 8) & tod_h < 15));
resBid = DelNan(resBid) & cri;
%resBid = (DelNan(( bp + bq.*0.5*(ap-bp)./(aq+ bq))) & (~isTrade & ~isTrade1 & ((tod_h == 8 & tod_m > 30) | tod_h > 8) & tod_h < 15));
tB = ( time_ms & (~isTrade & ~isTrade1 & ((tod_h == 8 & tod_m > 30) | tod_h > 8) & tod_h < 15));
%    for i = 2:length(ap)
%        if ~isTrade(i) && ~isTrade(i-1) && ((tod_h(i) == 8 && tod_m(i) > 30) || tod_h(i) > 8) && tod_h(i) < 15
%            [resAsk, tA, resBid, tB] = [resAsk; ap(i) - aq(i).*0.5*(ap(i)-bp(i))./ ( aq(i) + bq(i)), tA; time_ms(i)];
%            tA = [tA; time_ms(i)];
%            resBid = [resBid; bp(i) + bq(i).*0.5*(ap(i)-bp(i))./(aq(i)+ bq(i))];
%            tB = [tB; time_ms(i)];
%        end
%    end
end

