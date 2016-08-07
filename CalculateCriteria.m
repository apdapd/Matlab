function  resCri  = CalculateCriteria( isTrade, isTrade1, tod_h, tod_m)

  resCri =  (~isTrade & ~isTrade1 & ((tod_h == 8 & tod_m > 30) | tod_h > 8) & tod_h < 15);

end

