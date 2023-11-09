function name = task_101 ()

   X = input("First Matrix : ");
   Y = input("Second Matrix : ");
   max_X = max (max (X));
   fprintf ("Maximum value of first matrix : %d\n", max_X);
   if size (X,2) == size (Y,1)
      Mul = X * Y;
      fprintf("Multiplication Result :\n");
      disp (Mul);
   else
      fprintf ("Multiplication is not possible\n");
   end

endfunction
