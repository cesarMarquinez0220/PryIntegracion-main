%Metodo de Integracion
clc;
%variable
opcion=0;
fprintf("\t\t\tMETODOS DE INTEGRACION\n")
%Ingresion de la funcion de la integral
fprintf("Ingrese la funcion de la integral definida, ejemplo: @(x) (3*x^2)\n");
f=input('');
%Puntos extremos de la integral
a=input('Ingrese el extremo de la integral a: ');
fprintf('');
b=input('Ingrese el extremo de la integral b: ');
clc;
fprintf("\n1. Integracion por TRAPECIO");
fprintf("\n2. Integracion por SIMPSON");
fprintf("\n3. Salir");
fprintf("\n\n-----------\n");
opcion = input('Ingrese la opción requerida: ');
switch (opcion)
      case 1
            clc;
            %variable
            opcn1=0;
            sumatoria=0;
            fprintf("\n1. Trapecio Simple");
            fprintf("\n2. Trapecio Compuesto");
            fprintf("\n3. Salir");
            fprintf("\n\n");
            opcn1 = input('Ingrese la opción requerida: ');

            switch (opcn1)
            case 1
                   %TRAPECIO SIMPLE
                      clc;
                      fprintf("\t\t\tTrapecio Simple");
                      solc = ( b - a ) *  ((feval(f,a) + feval(f,b)) / 2 ) ;
                      fprintf('\n\nEl Resultado es : %10.9f', solc);
                      f = vectorize (f);
                      ezplot(f);grid
            case 2
                   %TRAPECIO COMPUESTO
                      clc;
                      fprintf("\t\t\tTrapecio Compuesto \n\n");
                      n = input('Ingrese las n de divisiones requeridas: ');
                      %calculo de h 
                      h = ( b - a ) / n;
                      aux = a ; 
                      while ( aux <= b )
                        
                        if ( aux == a || aux == b )
                          sumatoria += (feval (f,aux));
                        else
                          sumatoria += 2 * (feval (f,aux));
                        endif
                        aux += h; 
                      endwhile
                      %multiplicación
                      calculo = (h/2) * sumatoria; 
                      fprintf('\n');
                      fprintf('\nEl resultado por Trapecio Compuesto con %2i divisiones  es: %10.5f\n\n', n, calculo);
                      f = vectorize (f);
                      ezplot(f);grid
            case 3
                    fprintf("Finalizacion del programa");
                   %salir            
          endswitch
      case 2
                clc
                fprintf("\n1. Simpson Simple");
                fprintf("\n2. Simpson Compuesto 1/3");
                fprintf("\n3. Simpson Compuesto 3/8");
                fprintf("\n4. Salir");
                fprintf("\n\n");
                option=input('Eliga la opcion requerida: ');
                switch(option)
                    case 1
                          clc;
                          %Metodo simpson simple
                          fprintf("\t\t\tSimpson Simple");
                          disp('')
                          h= feval(f,((a+b)/2));
                          %Simpson Simple
                          fs=((b-a)/6)*(f(a)+(4*h)+f(b));
                          fprintf("\nLa respuesta por Simpson Simple es: %10.4f ",fs);
                          f = vectorize (f);
                          ezplot(f);grid
                    		
                  case 2 
                          %Metodo Compuesta de Simpson 1/3
                          clc;
                          fprintf("\t\t\tSimpson Compuesto 1/3");
                          %variables
                          SMFP=0;SMFIP=0;smh=a;i=0;k=0;s=0;
                          n= input("\n\nIngrese n intervalos pares : ");
                          h2=((b-a)/n);
                          for (i=1:n)
                            s+=1;
                          if mod(s,2)==0
                          k+=1;
                          endif
                          endfor

                          if k>=1
                          for(i=1:n)
                           smh+=h2;
                          if mod(i,2)==0
                           if i<n
                            SMFP+=f(smh);
                            endif
                          else
                           if i<n
                            SMFIP+=f(smh);
                           endif
                           endif
                          endfor
                          p=(2*SMFP);
                          ip=(4*SMFIP);
                          x0=f(a);
                          xf=f(b);
                          %Compuesta de Simpson 1/3
                          fcs=((h2/3)*(x0+p+ip+xf));
                          fprintf("\nLa respuesta por Simpson Compuesto de 1/3 es: %10.4f ",fcs);
                          else 
                          printf("No se puede realizar por este metodo ya que n es impar\n")
                          endif
                          f = vectorize (f);
                          ezplot(f);grid
                  case 3   
                          %Metodo Compuesta de Simpson 3/8
                          clc;
                          fprintf("\t\t\tSimpson Compuesto 3/8");
                          %variables
                          k=0;s=0;smt=0;fsc=0;t=a;suma=0;
                          n= input("\n\nIngrese n intervalos multiplos de 3 : ");
                          h3=((b-a)/n);
                          for (i=1:n)
                            s+=1;
                          if mod(s,3)==0
                          k+=1;
                          endif
                          endfor
                          if k>=1    %@(x)(3*x^2)
                          while(t<=b)
                              if (t==a ||t==b)
                                 suma += feval(f,t);
                                else
                                if (rem(smt,3)==0)
                                 suma+=2*(feval(f,t));
                                else
                                 suma+=3*(feval(f,t));
                                endif
                             endif
                             smt+=1;
                             t+=h3;
                           endwhile
                           %Realizando ultimos calculos
                          fsc=((3*h3)/8*suma);
                          printf("\nLa respuesta por Simpson Compuesto de 3/8 es: %10.4f",fsc);
                            else
                            printf("No se puede solucionar por este metodo ya que \n no cuenta con un multiplo de tres");
                          endif
                      endswitch
                         f = vectorize (f);
                         ezplot(f);grid
                case 4
                      fprintf("Finalizacion del programa");
      case 3
        fprintf("Finalizacion del programa");
             %salir  
endswitch  