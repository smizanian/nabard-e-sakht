module predictor(
    input wire request,
    input wire result,
    input wire clk,
    input wire taken,
    output reg prediction
);

reg [1:0] count=2'b11;



always @(posedge clk) 
	begin
	    if (result) begin
        	if (taken) begin
	            if (count < 2'b11) begin
	                count = count + 1;
        	    end
	        end else begin
        	    if (count > 2'b00) begin
                	count = count - 1;
	            end
		    end
		end
		if (request) begin
        		if (count[1] == 1) begin
	        	    prediction = 1;
	        	end else begin
		            prediction = 0;
        		end
		    end
		end


endmodule
