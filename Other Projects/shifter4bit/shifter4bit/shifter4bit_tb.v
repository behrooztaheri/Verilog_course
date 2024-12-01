`include "shifter4bit.v" // فراخوانی 
module shifter4bit_tb;
    // پورت‌های ورودی و خروجی
    reg clk = 0;
    reg rst;
    reg [3:0] data_in;
    reg sel;
    wire [3:0] data_out;

    // شیفت‌دهنده
    shifter4bit shifter (.clk(clk), .rst(rst), .data_in(data_in), .sel(sel), .data_out(data_out));

    // بلوک always برای تولید سیگنال‌های کلاک
    always #5 clk = ~clk; // فرکانس کلاک 200 مگاهرتز

    // بلوک initial برای تعریف وضعیت اولیه و تست‌های مختلف
    initial begin
        // تنظیم فایل خروجی VCD
        $dumpfile("shifter4bit.vcd");
        $dumpvars(0, shifter4bit_tb);

        // وضعیت اولیه
        rst = 1'b1;
        data_in = 4'b0000;
        sel = 1'b0;
        #10 rst = 1'b0; // ریست غیرفعال

        // تست‌های مختلف
        #20 data_in = 4'b0101; sel = 1'b0; // شیفت راست
        #20 data_in = 4'b1010; sel = 1'b1; // شیفت چپ
        #20 data_in = 4'b1111; sel = 1'b0; // شیفت راست
        #20 data_in = 4'b0001; sel = 1'b1; // شیفت چپ
        #20 $finish; // پایان شبیه‌سازی
    end

    // بلوک monitor برای نمایش مقادیر سیگنال‌ها
    initial begin
        $monitor("Time = %t : clk = %b, rst = %b, data_in = %b, sel = %b, data_out = %b", $time, clk, rst, data_in, sel, data_out);
    end
endmodule