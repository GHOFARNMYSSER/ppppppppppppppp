function par=CGOperator(par,Iter)

format long
hstep=0.00001;
lambda=0.1;
VarMin=[-1,-1,-1];
VarMax=[1 1 1];
 for i=1:numel(par)
     p=par(i).Position;
     pp=CostFunction(par(i).Position);
   f(i)=CostFunction(par(i).Position);
   for k=1:numel(par(1).Position)
   xs(i,:) = par(i).Position;
   xs(i,k) = xs(i,k) + 0.00001;
   gradx_imp(i,k)= (CostFunction(xs(i,:)) -f(i))/hstep;
   end
    par(i).g_new=(norm(gradx_imp(i,:)))^2;
    if Iter==1 %|| mod(Iter,M)==0 
     par(i).Position=par(i).Position-lambda*gradx_imp(i,:);
     par(i).Cost=CostFunction(par(i).Position);
    else
    b=par(i).g_new/par(i).g_old;
    if b>1||b<0
        b=0.5;
    end
        par(i).d=-gradx_imp(i,:)+b*par(i).d;
        par(i).Position=par(i).Position+lambda*par(i).d;
  par(i).Position=min(max(par(i).Position,VarMin),VarMax);
    par(i).Cost=CostFunction(par(i).Position);
    
    
    end
     par(i).d=-gradx_imp(i,:);
     par(i).g_old=par(i).g_new;
    if pp<par(i).Cost
         par(i).Position=p;
        par(i).Cost=pp;
     end
 end
 end
