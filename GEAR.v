/*module gear (rst, clutch, gear_up, gear_down, velocity, gear_out);

   input rst, clutch, gear_up, gear_down;
   input [7:0] velocity;
   output reg [2:0] gear_out;
   
   //parameter GEAR_UP = (velocity[7]&&velocity[4]) || (velocity[3] || !(velocity[2]) || !(velocity[1]) &&velocity[0]);
   //parameter GEAR_DOWN = (!velocity[4] && (!velocity[7]||!velocity[6])&& (!velocity[7]||!velocity[5])&& (velocity[7]||velocity[6]||velocity[5]));
   
   always @ (negedge gear_up or negedge gear_down)
   begin
         if(velocity == 19)
         begin
            if(!gear_up)
            begin
               gear_out <= 2;
            end
				else
				begin
					gear_out <= gear_out;
				end
         end
         else if(velocity == 39)
			begin
				if(!gear_up)
            begin
               gear_out <= 3;
            end
            else if(!gear_down)
            begin
               gear_out <= 1;
            end
				else
				begin
					gear_out <= gear_out;
				end
         end
			else if(velocity == 59)
			begin
				if(!gear_up)
            begin
               gear_out <= 4;
            end
            else if(!gear_down)
            begin
               gear_out <= 2;
            end
				else
				begin
					gear_out <= gear_out;
				end
         end
			else if(velocity == 79)
			begin
				if(!gear_up)
            begin
               gear_out <= 5;
            end
            else if(!gear_down)
            begin
               gear_out <= 3;
            end
				else
				begin
					gear_out <= gear_out;
				end
         end
			else
      begin
         gear_out <= gear_out;
      end
     end
 
endmodule*/