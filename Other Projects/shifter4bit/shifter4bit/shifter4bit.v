// ماژول شیفت‌دهنده 4 بیتی

module shifter4bit (
    input clk,          // ورودی کلاک
    input rst,          // ورودی ریست
    input [3:0] data_in, // داده ورودی
    input sel,          // ورودی انتخاب جهت شیفت (0: راست، 1: چپ)
    output [3:0] data_out // داده خروجی
);

    // رجیسترها برای ذخیره داده‌ها
    reg [3:0] reg1, reg2;

    // بلوک always فعال با لبه مثبت کلاک
    always @(posedge clk) begin
        if (rst) begin
            // در صورت ریست فعال، رجیسترها را با 0 مقداردهی اولیه می‌کنیم
            reg1 <= 0;
            reg2 <= 0;
        end else begin
            // در غیر این صورت، داده‌ها را بر اساس ورودی انتخاب به رجیسترها منتقل می‌کنیم
            reg1 <= data_in;
            if (sel) begin
                // شیفت چپ
                reg2 <= {reg1[2:0], 1'b0};
            end else begin
                // شیفت راست
                reg2 <= {1'b0, reg1[3:1]};
            end
        end
    end

    // خروجی شیفت‌دهنده
    assign data_out = reg2;

endmodule