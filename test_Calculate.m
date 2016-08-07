load('data.mat', 'data');
[rB, tB, rA, tA] = CalculatePrices(data.ap, data.aq, data.bp, data.bq, data.isTrade, data.todh, data.todm, data.tod_fullms);
[rB2,tB, rA2, tA] = CalculateRV(data.ap, data.aq, data.bp, data.bq, data.isTrade, data.todh, data.todm, data.tod_fullms);

tA=tA(1:20000);
tB=tB(1:20000);
rB=rB(1:20000);
rB2=rB2(1:20000);
rA=rA(1:20000);
rA2=rA2(1:20000);

figure
plot(tB, rB, '-b')
hold on
plot(tA, rA, '-r')
plot(tB, rB2, '-m')
plot(tA, rA2, '-c')
hold off;
grid on;
title('Prices and relative values plots')
legend('bid', 'ask', 'bidFV', 'askFV');