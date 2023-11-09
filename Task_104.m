function name = Task_104 ()

  function [y, dy] = f(x)
    y = x.^3 - 2*x.^2 - 4;
    dy = 3 * x.^2 - 4*x;
  end

  x0 = 2;
  tol = 1e-6;
  M = [];
  tan = [];

  while true
      [y, dy] = f(x0);
      x1 = x0 - y / dy;
      M =[M; x1];
      tan = [tan; [x0, y, dy]];
      if abs(x0 - x1) < tol
        break;
      end
      x0 = x1;
  end

   fprintf('%f\n', M(end));


  x = linspace(1, 4, 50);
  [y, dy] = f(x);
  y = f(x);
  plot (x, y, 'k');
  grid on;
  hold on;
  plot(M, f(M), 'rd');
  for i = 1 : length(M)
    x_tan = M(i) - 1:0.01:M(i) + 1;
    y_tan = tan(i, 2) + tan(i, 3) * (x_tan - M(i));
    plot (x_tan, y_tan, 'b:');
  end

  xlabel('x');
  ylabel('F(x)');
  title('Newton Raphson Method');
  legend('F(x) ', 'x','Tangent Lines');


endfunction

