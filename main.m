%_______________________________________________________________________________________
%  The Arithmetic Optimization Algorithm (AOA) source codes demo version 1.0                  
%                                                                                       
%  Developed in MATLAB R2015a (7.13)                                                    
%                                                                                       
%  Authors: Laith Abualigah, Ali Diabat, Seyedali Mirjalili, Mohamed Abd Elaziz, & Amir H. Gandomi                      
%                                                                                       
%  E-Mail: Aligah.2020@gmail.com  (Laith Abualigah)                                               
%  Homepage:                                                                       
%  1- https://scholar.google.com/citations?user=39g8fyoAAAAJ&hl=en               
%  2- https://www.researchgate.net/profile/Laith_Abualigah                       
%                                                                                      
% Main paper:   The Arithmetic Optimization Algorithm
% Reference: Abualigah, L., Diabat, A., Mirjalili, S., Abd Elaziz, M., and Gandomi, A. H. (2021). The Arithmetic Optimization Algorithm. Computer Methods in Applied Mechanics and Engineering.
%
%_______________________________________________________________________________________

clear all 
clc



Solution_no=20; %Number of search solutions
F_name='F1';    %Name of the test function F1-f23
M_Iter=1000;    %Maximum number of iterations




 
 
        f(i) = CostFunction(par(i).Position);
     p=par(i).Position;
     pp=CostFunction(par(i).Position);
   f(i)=CostFunction(par(i).Position);

   for k=1:numel(par(1).Position)
   xs(i,:) = par(i).Position;
   xs(i,k) = xs(i,k) + 0.00001;
   gradx_imp(i,k)= (CostFunction(xs(i,:)) -f(i))/hstep;
   end
 

[LB,UB,Dim,F_obj]=Get_F(F_name); %Give details of the underlying benchmark function


      

[Best_FF,Best_P,Conv_curve]=AOA(Solution_no,M_Iter,LB,UB,Dim,F_obj); % Call the AOA 

 

figure('Position',[454   445   694   297]);
subplot(1,2,1);
func_plot(F_name);
title('Parameter space')
xlabel('x_1');
ylabel('x_2');
zlabel([F_name,'( x_1 , x_2 )'])


subplot(1,2,2);
semilogy(Conv_curve,'Color','r','LineWidth',2)
title('Convergence curve')
xlabel('Iteration#');
ylabel('Best fitness function');
axis tight
legend('AOA')



display(['The best-obtained solution by Math Optimizer is : ', num2str(Best_P)]);
display(['The best optimal value of the objective funciton found by Math Optimizer is : ', num2str(Best_FF)]);
 function par = CGOperator(par, Iter)
    VarMin = [-1, -1, -1];
    VarMax = [1, 1, 1];
 end
    
    % افتراض أن دالة CostFunction معرفة في مكان آخر
    for i = 1:numel(par)
        f(i) = CostFunction(par(i).Position);
    end
    
    % افتراض أن المتغير hstep معرف
    hstep = 0.00001;
    for i = 1:numel(par)
        for k = 1:numel(par(1).Position)
            xs = par(i).Position;
            xs(k) = xs(k) + hstep;
            gradx_imp(i, k) = (CostFunction(xs) - f(i)) / hstep;
        end
    end
end    
end


