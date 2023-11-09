function name = Task_103()

  function y = f(x)
    y = x.^3 - 2*(x.^2) - 4;
  end
  a = 2;
  b = 3;

  M = [];
     c = (a * f(b) - b * f(a)) / (f(b) - f(a));

  tol = 1e-6;

  while abs(f(c)) > tol
      M =[M; c];

      c = (a * f(b) - b * f(a)) / (f(b) - f(a));

      if f (c) == 0
        break;
      elseif f(a) * f(c) < 0
        b = c;
      else f(b) * f(c) < 0
        a = c;
      end
    end
   fprintf ('%f\n', M(end));


  x = linspace (4, 1, 20);
  y = f(x);
  plot (x, y, 'b');
  grid on;
  hold on;
  plot(M, f(M), 'rd');
  xlabel('X');
  ylabel('F(x)');
  title('False Position Method');
  legend('F(x) ', 'x');


endfunction
