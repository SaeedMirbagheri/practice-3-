function [G,u] = Linear_wave_solution_methods(u,BBeta,x,t,v,method)
if method==1
    G=(((1-v)+v*cos(BBeta)).^2+(v*sin(BBeta)).^2).^(0.5);
    for j=1:length(t)-1
        for i=2:length(x)
            u(i,j+1)=v*u(i-1,j)+(1-v)*u(i,j);
        end 
    end 
elseif method==2
    G=((cos(BBeta)).^2+(v.*sin(BBeta)).^2).^(0.5);
    for j=1:length(t)-1
        for i=2:length(x)-1
            u(i,j+1)=((-v/2)+1/2)*u(i+1,j)+((v/2)+1/2)*u(i-1,j);
        end 
            u(length(x),j+1)=v*u(length(x)-1,j)+(1-v)*u(length(x),j);

    end 
elseif method==3
    G=((1-2*(v.*sin(BBeta./2)).^2).^2+(v*sin(BBeta)) .^2).^(0.5);
    for j=1:length(t)-1
            for i=2:length(x)-1
                u(i,j+1)=u(i,j)+(-v/2)*(u(i+1,j)-u(i-1,j))+(((v^2)/2))*(u(i+1,j)-2*u(i,j)+u(i-1,j));
            end 
                u(length(x),j+1)=v*u(length(x)-1,j)+(1-v)*u(length(x),j);
    
    end
elseif method==4
     G=((1-2*(v^2)*(sin(BBeta./2).^2)).^2+(v*sin(BBeta)).^2);
    for j=1:length(t)-1
            for i=2:length(x)-1
                u(i,j+1)=-v*u(i+1,j)+(1+v)*u(i,j);

            end 
            for i=2:length(x)-1   
                u(i,j+1)=(1/2)*(u(i,j)+u(i,j+1)-v*(u(i,j+1)-u(i-1,j+1)));
            end

                u(length(x),j+1)=v*u(length(x)-1,j)+(1-v)*u(length(x),j);
    
    end
end
end