module traffic_light (
    input clk,
    input rst,
    output reg [2:0] light_NS, // [Red, Yellow, Green]
    output reg [2:0] light_EW  // [Red, Yellow, Green]
);

    // State Encoding
    parameter S0 = 2'b00, // NS Green, EW Red
              S1 = 2'b01, // NS Yellow, EW Red
              S2 = 2'b10, // NS Red, EW Green
              S3 = 2'b11; // NS Red, EW Yellow

    reg [1:0] current_state, next_state;
    reg [3:0] count; // Timer to keep track of clock cycles

    // State Transition Logic (Sequential)
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            current_state <= S0;
            count <= 0;
        end else begin
            if (count == 4'd10) begin // Change state every 10 clock cycles
                current_state <= next_state;
                count <= 0;
            end else begin
                count <= count + 1;
            end
        end
    end

    // Next State Logic (Combinational)
    always @(*) begin
        case (current_state)
            S0: next_state = S1;
            S1: next_state = S2;
            S2: next_state = S3;
            S3: next_state = S0;
            default: next_state = S0;
        endcase
    end

    // Output Logic (Combinational)
    always @(*) begin
        case (current_state)
            S0: begin light_NS = 3'b001; light_EW = 3'b100; end // NS Green, EW Red
            S1: begin light_NS = 3'b010; light_EW = 3'b100; end // NS Yellow, EW Red
            S2: begin light_NS = 3'b100; light_EW = 3'b001; end // NS Red, EW Green
            S3: begin light_NS = 3'b100; light_EW = 3'b010; end // NS Red, EW Yellow
            default: begin light_NS = 3'b100; light_EW = 3'b100; end
        endcase
    end

endmodule