module gear_set(rst,clutch,reverse,gear_1, gear_2, gear_3, gear_4, gear_5, velocity_in, gear);

  
   input rst,clutch,reverse, gear_1, gear_2, gear_3, gear_4, gear_5;
   input [7:0] velocity_in;

   output reg [2:0] gear;

always @(*)
begin
      if(rst)
      begin
         if(velocity_in > 85)
         begin
            if(!clutch)
            begin
               if(!reverse)
               begin
                  if(gear_5)
                     begin
                        gear <= 5;
                     end
                     else
                     begin
                        gear <= gear;
                     end
               end
               else
               begin
                  gear <= 6;
               end
            end
            else
            begin
               gear <= gear;
            end
         end
         if((velocity_in > 74) && (velocity_in < 86))
         begin
            if(!clutch)
            begin
               if(!reverse)
               begin
                  if(gear_5)
                     begin
                        gear <= 5;
                     end
                  else if(!gear_5)
                     begin
                        gear <= 4;
                     end
                  else
                     begin
                     gear <= gear;
                     end
               end
               else
               begin
                  gear <= 6;
               end
            end
            else
            begin
               gear <= gear;
            end
         end 
         if((velocity_in > 65) && (velocity_in < 75))
         begin
            if(!clutch)
            begin
               if(!reverse)
               begin
                  if(gear_4)
                     begin
                        gear <= 4;
                     end
                     else
                     begin
                        gear <= gear;
                     end
               end
               else
               begin
                  gear <= 6;
               end
            end
            else
            begin
               gear <= gear;
            end
         end
        if((velocity_in > 54) && (velocity_in < 66))
         begin
            if(!clutch)
            begin
               if(!reverse)
               begin
                  if(gear_4)
                     begin
                        gear <= 4;
                     end
                  else if(!gear_4)
                     begin
                        gear <= 3;
                     end
                  else
                     begin
                     gear <= gear;
                     end
               end
               else
               begin
                  gear <= 6;
               end
            end
            else
            begin
               gear <= gear;
            end
         end 
         if((velocity_in > 45) && (velocity_in < 55))
         begin
            if(!clutch)
            begin
               if(!reverse)
               begin
                  if(gear_3)
                     begin
                        gear <= 3;
                     end
                  else
                     begin
                        gear <= gear;
                     end
               end
               else
               begin
                  gear <= 6;
               end
            end
            else
            begin
               gear <= gear;
            end
         end
        if((velocity_in > 34) && (velocity_in < 46))
         begin
            if(!clutch)
            begin
               if(!reverse)
               begin
                  if(gear_3)
                     begin
                        gear <= 3;
                     end
                  else if(!gear_3)
                     begin
                        gear <= 2;
                     end
                  else
                     begin
                     gear <= gear;
                     end
               end
               else
               begin
                  gear <= 6;
               end
            end
            else
            begin
               gear <= gear;
            end
         end 
         if((velocity_in > 25) && (velocity_in < 35))
         begin
            if(!clutch)
            begin
               if(!reverse)
               begin
                  if(gear_2)
                     begin
                        gear <= 2;
                     end
                  else
                     begin
                        gear <= gear;
                     end
               end
               else
               begin
                  gear <= 6;
               end   
            end
            else
            begin
               gear <= gear;
            end
         end
         if((velocity_in > 14) && (velocity_in < 26))
         begin
            if(!clutch)
            begin
               if(!reverse)
               begin
                  if(gear_2)
                     begin
                        gear <= 2;
                     end
                  else if(!gear_2)
                     begin
                        gear <= 1;
                     end
                  else
                     begin
                     gear <= gear;
                     end
               end
               else
               begin
                  gear <=6;
               end
            end
            else
            begin
               gear <= gear;
            end
         end 
         if((0 <= velocity_in) && (velocity_in < 15))
         begin
            if(!clutch)
            begin
               if(!reverse)
               begin
                  if(gear_1)
                     begin
                        gear <= 1;
                     end
                  else if(!gear_1)
                     begin
                        gear <= 0;
                     end
                  else
                     begin
                     gear <= gear;
                     end
               end
               else
               begin
                  gear <= 6;
               end
            end
            else
            begin
               gear <= gear;
            end
         end
      end
      else
         begin
         gear <=0;
         end
end
endmodule 