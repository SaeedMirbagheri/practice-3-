function [u,U_real] = BandI_conditions(BC,x,t)
u=zeros(1,1);
U_real=zeros(1,1);
if BC==1
    for i=1:length(x)
        if x(i)<0.25
            u(i,1)=1;
        else
            u(i,1)=0;
        end
        if x(i)<0.75
            U_real(i,1)=1;
        else
            U_real(i,1)=0;
        end
    end
    u(1,2:length(t))=u(1,1);
elseif BC==2
    for i=1:length(x)
            if x(i)<0.2
                u(i,1)=0;
            elseif x(i)>=0.2 && x(i)<0.3
                u(i,1)=1;
            else
                u(i,1)=0;
            end
             if x(i)<0.7
                U_real(i,1)=0;
            elseif x(i)>=0.7 && x(i)<0.8
                U_real(i,1)=1;
            else
                U_real(i,1)=0;
            end
    end
else
    for i=1:length(x)
         u(i,1)=sin(4*pi*x(i));
    end
    for i=1:length(x)
        if x(i)>=0.5
         U_real(i,1)=sin(4*pi*x(i));
        end
    end
end
    u(1,2:length(t))=u(1,1);

end