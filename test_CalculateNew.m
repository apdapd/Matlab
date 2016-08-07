load('data.mat', 'data');
%ap = data.ap(1:200000);
%aq = data.aq(1:200000);
%bp = data.bp(1:200000);
%bq = data.bq(1:200000);
%isTrade = data.isTrade(1:200000);
%todh = data.todh(1:200000);
%todm = data.todm(1:200000);
%tod_fullms = data.tod_fullms(1:200000);

%[rB, rA, t1] = CalculatePricesNew(ap, aq, bp, bq, isTrade, todh, todm, tod_fullms);
%[rB2, rA2, t2] = CalculateRVNew(ap, aq, bp, bq, isTrade, todh, todm, tod_fullms);
[rB, rA, t1] = CalculatePricesNew(data.ap, data.aq, data.bp, data.bq, data.isTrade, data.todh, data.todm, data.tod_fullms);
[rB2, rA2, t2] = CalculateRVNew(data.ap, data.aq, data.bp, data.bq, data.isTrade, data.todh, data.todm, data.tod_fullms);

%[rB, tB, rA, tA] = CalculatePrices(data.ap, data.aq, data.bp, data.bq, data.isTrade, data.todh, data.todm, data.tod_fullms);
%[rB2,tB, rA2, tA] = CalculateRV(data.ap, data.aq, data.bp, data.bq, data.isTrade, data.todh, data.todm, data.tod_fullms);


t1=t1(1:20000);
t2=t2(1:20000);
rB=rB(1:20000);
rB2=rB2(1:20000);
rA=rA(1:20000);
rA2=rA2(1:20000);

figure
plot(t1, rB, '-b')
hold on
plot(t1, rA, '-r')
plot(t2, rB2, '-m')
plot(t2, rA2, '-c')
hold off;
grid on;
title('Prices and relative values plots')
legend('bid', 'ask', 'bidFV', 'askFV');