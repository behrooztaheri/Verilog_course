module pro_1 (
    input DR, AC, INPR, COM, SHR, SHL, AND, ADD, INPR_op, COM_op, SHR_op, SHL_op, LD,
    output reg Q
);
    always @(*) begin
        if (LD) begin
            // عملیات AND
            Q = (DR & AC & AND);

            // عملیات جمع
            if (ADD) begin
                Q = Q | (AC + DR);
            end

            // عملیات مکمل
            Q = Q | (~AC & COM);

            // عملیات انتقال به راست
            Q = Q | (SHR & SHR_op);

            // عملیات انتقال به چپ
            Q = Q | (SHL & SHL_op);
        end
        else begin
            Q = 0;
        end
    end
endmodule
