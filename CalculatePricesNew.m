function [resBid, resAsk, tAB] = Calculate(ap, aq, bp, bq, isTrade, tod_h, tod_m, time_ms)
    resBid = [];
    resAsk = [];
    tAB = [];
%    tB = [];
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
  resAsk = ap(cri);
  resBid = bp(cri);
  tAB = time_ms(cri);
  
%    for i = 2:length(ap)
%        if ~isTrade(i) && ~isTrade(i-1) && ((tod_h(i) == 8 && tod_m(i) > 30) || tod_h(i) > 8) && tod_h(i) < 15
%            resAsk = [resAsk; ap(i)];
%            tA = [tA; time_ms(i)];
%            resBid = [resBid; bp(i)];
%            tB = [tB; time_ms(i)];
%        end
%    end
end