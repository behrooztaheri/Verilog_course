`include "pro_1.v"
module protb1;
    reg DR, AC, INPR, COM, SHR, SHL, AND, ADD, INPR_op, COM_op, SHR_op, SHL_op, LD;
    wire Q;

    pro_1 in (
        .DR(DR),
        .AC(AC),
        .INPR(INPR),
        .COM(COM),
        .SHR(SHR),
        .SHL(SHL),
        .AND(AND),
        .ADD(ADD),
        .INPR_op(INPR_op),
        .COM_op(COM_op),
        .SHR_op(SHR_op),
        .SHL_op(SHL_op),
        .LD(LD),
        .Q(Q)
    );

    initial begin
        $dumpfile("pro_1.vcd");
        $dumpvars(0, protb1);

        #10 DR = 1; AC = 1; AND = 1; LD = 1;
        #10 AND = 0; LD = 0;

        #10 DR = 1; AC = 1; ADD = 1; LD = 1;
        #10 ADD = 0; LD = 0;

        #10 AC = 1; COM = 1; LD = 1;
        #10 COM = 0; LD = 0;

        #10 SHR = 1; SHR_op = 1; LD = 1;
        #10 SHR_op = 0; LD = 0;

        #10 SHL = 1; SHL_op = 1; LD = 1;
        #10 SHL_op = 0; LD = 0;
        #10;
    end
endmodule
