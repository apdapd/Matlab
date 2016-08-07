function [resBid, tB, resAsk, tA] = Calculate(ap, aq, bp, bq, isTrade, tod_h, tod_m, time_ms)
    resBid = [];
    resAsk = [];
    tA = [];
    tB = [];
    for i = 2:length(ap)
        if ~isTrade(i) && ~isTrade(i-1) && ((tod_h(i) == 8 && tod_m(i) > 30) || tod_h(i) > 8) && tod_h(i) < 15
            resAsk = [resAsk; ap(i)];
            tA = [tA; time_ms(i)];
        end
        if ~isTrade(i) && ~isTrade(i-1) && ((tod_h(i) == 8 && tod_m(i) > 30) || tod_h(i) > 8) && tod_h(i) < 15
            resBid = [resBid; bp(i)];
            tB = [tB; time_ms(i)];
        end
    end
end