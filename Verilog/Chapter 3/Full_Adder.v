module Full_Adder1(
    input X,
    input Y,
    input Z,

    output reg S,
    output reg C
);

  reg L, P, Q;

  always @(*)
    begin
      L = X ^ Y;
      P = L & Z;
      Q = X & Y;
      S = L ^ Z;
      C = P | Q;
    end

endmodule


module Full_Adder2(
    input X,
    input Y,
    input Z,

    output reg S,
    output reg C
);

  always @(*)
    begin
      {C, S} = X + Y + Z;
    end


endmodule