module memory(
    input [15:0] address,
    inout [15:0] data,
    input read,
    input write,
    input clk
);

    reg [15:0] mem [0:4095];

    assign data = (read && !write) ? mem[address] : 16'bz;

    always @(posedge clk) begin
        if (write && !read) begin
            mem[address] <= data;
        end
    end

endmodule

module IR(
    input [11:0] address,
    input [2:0] opcode,
    input I,
    output reg [11:0] address_out,
    output reg [2:0] opcode_out,
    output reg I_out
);

    always @(*) begin
        address_out = address;
        opcode_out = opcode;
        I_out = I;
    end

endmodule

module decoder_IR(
    input [2:0] opcode_in,
    output reg [7:0] D
);

    always @(*) begin
        case(opcode_in)
            3'b000: D = 8'b00000001;
            3'b001: D = 8'b00000010;
            3'b010: D = 8'b00000100;
            3'b011: D = 8'b00001000;
            3'b100: D = 8'b00010000;
            3'b101: D = 8'b00100000;
            3'b110: D = 8'b01000000;
            3'b111: D = 8'b10000000;
            default: D = 8'b00000000;
        endcase
    end

endmodule

module counter(
    input clk,
    input clear,
    input Increment,
    output reg [3:0] count
);

    always @(posedge clk) begin
        if (clear)
            count <= 4'b0000;
        else if (Increment)
            count <= count + 1;
    end

endmodule

module decoder_count(
    input [3:0] count_in,
    output reg [15:0] T
);

    always @(*) begin
        case(count_in)
            4'b0000: T = 16'b0000000000000001;
            4'b0001: T = 16'b0000000000000010;
            4'b0010: T = 16'b0000000000000100;
            4'b0011: T = 16'b0000000000001000;
            4'b0100: T = 16'b0000000000010000;
            4'b0101: T = 16'b0000000000100000;
            4'b0110: T = 16'b0000000001000000;
            4'b0111: T = 16'b0000000010000000;
            4'b1000: T = 16'b0000000100000000;
            4'b1001: T = 16'b0000001000000000;
            4'b1010: T = 16'b0000010000000000;
            4'b1011: T = 16'b0000100000000000;
            4'b1100: T = 16'b0001000000000000;
            4'b1101: T = 16'b0010000000000000;
            4'b1110: T = 16'b0100000000000000;
            4'b1111: T = 16'b1000000000000000;
            default: T = 16'b0000000000000000;
        endcase
    end

endmodule

module Controlunit(
    input [11:0] IR_address,
    input IR_I,
    input [7:0] decoder_IR_output,
    inout [15:0] decoder_count_output,
    input clk,
    input reset,
    output reg [15:0] pc,
    output reg [15:0] acc,
    output reg [15:0] mem_address,
    inout [15:0] data_bus,
    output reg mem_read,
    output reg mem_write
);

    reg [15:0] decoder_count_output_reg;
    reg [15:0] data_bus_reg;
    reg [15:0] effective_address;
    reg count_zero;
    assign decoder_count_output = decoder_count_output_reg;
    assign data_bus = data_bus_reg;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pc <= 16'b0;
            acc <= 16'b0;
            mem_address <= 16'b0;
            mem_read <= 1'b0;
            mem_write <= 1'b0;
            effective_address <= 16'b0;
            count_zero <= 1'b0;
        end else begin
            case (decoder_count_output)
                16'b0000000000000001: begin //T0
                    mem_address <= pc;
                    mem_read <= 1;
                    count_zero <= 0;
                end
                16'b0000000000000010: begin //T1
                    pc <= pc + 1;
                    mem_read <= 0;
                end
                16'b0000000000000100: begin //T2
                    if (IR_I) begin
                        mem_address <= {4'b0000, IR_address};
                        mem_read <= 1;
                    end else begin
                        effective_address <= {4'b0000, IR_address};
                    end
                end
                16'b0000000000001000: begin //T3
                    if (IR_I) begin
                        effective_address <= data_bus;
                        mem_read <= 0;
                    end
                end
                16'b0000000000010000: begin //T4
                    case (decoder_IR_output)
                        8'b00000001: begin //AND
                            mem_address <= effective_address;
                            mem_read <= 1;
                        end
                        8'b00000010: begin //ADD
                            mem_address <= effective_address;
                            mem_read <= 1;
                        end
                        8'b00000100: begin // LDA
                            mem_address <= effective_address;
                            mem_read <= 1;
                        end
                        8'b00001000: begin // STA
                            mem_address <= effective_address;
                            data_bus_reg <= acc;
                            mem_write <= 1;
                        end
                        8'b00010000: begin // BUN
                            pc <= effective_address;
                            count_zero <= 1;
                        end
                        8'b00100000: begin // BSA
                            mem_address <= effective_address;
                            data_bus_reg <= pc;
                            mem_write <= 1;
                        end
                        8'b01000000: begin // ISZ
                            mem_address <= effective_address;
                            mem_read <= 1;
                        end
                        8'b10000000: begin
                            count_zero <= 1;
                        end
                        default: begin
                            count_zero <= 1;
                        end
                    endcase
                end
                16'b0000000000100000: begin // T5
                    case (decoder_IR_output)
                         8'b00000001: begin // AND
                            acc <= acc & data_bus;
                            mem_read <= 0;
                            count_zero <= 1;
                        end
                        8'b00000010: begin // ADD
                            acc <= acc + data_bus;
                            mem_read <= 0;
                            count_zero <= 1;
                        end
                        8'b00000100: begin // LDA
                            acc <= data_bus;
                            mem_read <= 0;
                        count_zero <= 1;
                        end
                        8'b00001000: begin // STA
                            mem_write <= 0;
                            count_zero <= 1;
                        end
                        8'b00100000: begin // BSA
                            pc <= effective_address + 1;
                            mem_write <= 0;
                            count_zero <= 1;
                        end
                        8'b01000000: begin // ISZ
                            if (data_bus == 16'b0) pc <= pc + 1;
                            mem_read <= 0;
                            count_zero <= 1;
                        end
                        default: begin
                            count_zero <= 1;
                        end
                    endcase
                end
                default: begin
                    if (count_zero) begin
                        decoder_count_output_reg <= 16'b0000000000000001;
                    end else begin
                        mem_read <= 0;
                        mem_write <= 0;
                    end
                end
            endcase
        end
    end

endmodule

module CPU(
    input clk,
    input reset,
    input [11:0] IR_address,
    input [2:0] opcode,
    input I
);

    wire [15:0] address;
    wire [15:0] data;
    wire read;
    wire write;
    wire [7:0] D;
    wire [15:0] T;
    wire [3:0] count;
    wire mem_read;
    wire mem_write;
    wire [15:0] pc;
    wire [15:0] acc;
    reg [15:0] effective_address;
   
    memory mem(
        .address(address),
        .data(data),
        .read(mem_read),
        .write(mem_write),
        .clk(clk)
    );

    IR ir(
        .address(IR_address),
        .opcode(opcode),
        .I(I),
        .address_out(IR_address),
        .opcode_out(opcode),
        .I_out(I)
    );

    decoder_IR decoder_IR(
        .opcode_in(opcode),
        .D(D)
    );

    counter counter(
        .clk(clk),
        .clear(reset),
        .Increment(1'b1),
        .count(count)
    );

    decoder_count decoder_count(
        .count_in(count),
        .T(T)
    );

    Controlunit control_unit(
        .IR_address(IR_address),
        .IR_I(I),
        .decoder_IR_output(D),
        .decoder_count_output(T),
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .acc(acc),
        .mem_address(address),
        .data_bus(data),
        .mem_read(mem_read),
        .mem_write(mem_write)
    );

endmodule