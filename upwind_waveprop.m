%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Writing a program to solve the wave equation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% initialing the arrays and vector for initial condition 
%and also defining the constants
clear
clc
tic

% this is with dx= .01, dt= 0.01 %%%%%%%%%%%%%%%%%%%%%%%%%

del_t= .01;
del_x= .01;
%%%%%%%%%%%%%%%%%%% this is for dx= .01%%%%%%%%%%%%%%%%%%%
dummy_disp=zeros(2001,1);
displacement=zeros(2001,500);
 x= [-10:.01: 10];
  dummy_disp(1:901,1)= 0.;

 dummy_disp(901:1000,1)= 1. + x(901:1000);
 dummy_disp(1001:1101,1)= 1 -x(1001:1101);
 dummy_disp(1102:end,1)= 0.;
  displacement(:,1)= dummy_disp(:,1);
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 

 
 %del_x= .01;
 max_time= 100;
 c= 2;
 max_iteration= max_time/del_t;
 t= 0:del_t:max_time;
 
 max_length=length(dummy_disp(:,1)) -1 ;
 % looping over time and space to solve the wave equation. 
for nn= 1:max_iteration
    

          
    for kk= 2:max_length;
            % Lax- Frendrich scheme  
        dummy_disp(kk,1) = 0.5* (  displacement(kk+1,nn)+ displacement(kk-1,nn)  ) + (  0.5* (c* del_t/ del_x)* (  displacement(kk+1,nn)- displacement(kk-1,nn)  )    );
           
    end
    
    %displacement(:) =dummy_disp (:)
    
    for kk= 2:max_length;
    displacement(kk,nn+1) =dummy_disp (kk,1);
    end
    
end
plot(x,displacement(:,1));

toc;
xMat = repmat(x', 1, 11);

 
%%%%%%%%%%%%%%%%% this is for dt= 0.01 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y=[t(:,1), t(:,50), t(:,100), t(:,150), t(:,200), t(:,250), t(:,300), t(:,350), t(:,400), t(:,450), t(:,500)];
yMat = repmat(y, numel(x), 1);
zMat = [displacement(:,1) displacement(:,50) displacement(:,100) displacement(:,150) displacement(:,200) displacement(:,250) displacement(:,300) displacement(:,350) displacement(:,400) displacement(:,450) displacement(:,500)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


plot3(xMat, yMat, zMat, 'black'); %// Make all traces blue
grid;
xlabel('x'); ylabel('time'); zlabel('Amplitude');
title('upwind scheme- dt=0.01, dx= 0.01 ');
view(40,40); %// Adjust viewing angle so you can clearly see data

figure(2)
plot(x,displacement(:,1000));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear

%%%%%%%%%% this is with dx= .1 and dt= .01 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
del_x= 0.1
 del_t= .01


dummy_disp=zeros(201,1);
displacement=zeros(201,500);
 x= [-10:.1: 10];
  dummy_disp(1:91,1)= 0.;

 dummy_disp(91:100,1)= 1+x(91:100);
 
 dummy_disp(101:110,1)=    1 - x(101:110);
 dummy_disp(111:end,1)= 0.;
 
displacement(:,1)= dummy_disp(:,1);


max_time= 100;
 c= 2;
 max_iteration= max_time/del_t;
 t= 0:del_t:max_time;
 
 max_length=length(dummy_disp(:,1)) -1 ;
 % looping over time and space to solve the wave equation. 
for nn= 1:max_iteration
    

          
    for kk= 2:max_length;
            % upwind scheme  
        dummy_disp(kk,1) = displacement(kk,nn) + (   (c* del_t/ del_x)* (  displacement(kk+1,nn)- displacement(kk,nn)  )    );
           
    end
    
    %displacement(:) =dummy_disp (:)
    
    for kk= 2:max_length;
    displacement(kk,nn+1) =dummy_disp (kk,1);
    end
    
end
figure(4)
plot(x,displacement(:,1));

toc;
xMat = repmat(x', 1, 11);

 
%%%%%%%%%%%%%%%%% this is for dt= 0.01 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y=[t(:,1), t(:,50), t(:,100), t(:,150), t(:,200), t(:,250), t(:,300), t(:,350), t(:,400), t(:,450), t(:,500)];
yMat = repmat(y, numel(x), 1);
zMat = [displacement(:,1) displacement(:,50) displacement(:,100) displacement(:,150) displacement(:,200) displacement(:,250) displacement(:,300) displacement(:,350) displacement(:,400) displacement(:,450) displacement(:,500)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(5)
plot3(xMat, yMat, zMat, 'black'); %// Make all traces blue
grid;
xlabel('x'); ylabel('time'); zlabel('Amplitude');
title('upwind scheme- dt=0.01, dx= 0.1 ');
view(40,40); %// Adjust viewing angle so you can clearly see data


%%%%%%%%%%%%%%%%%%%%this is with dx= 1 and dt= 0.01 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear

 del_x= 1
 del_t= .01

dummy_disp=zeros(201,1);
displacement=zeros(201,500);
 x= [-100:1: 100];
  dummy_disp(1:100,1)= 0.;

 dummy_disp(101,1)= 1+x(101);
 
 %dummy_disp(10:11,1)=    1 - x(10:11);
 dummy_disp(102:end,1)= 0.;
 displacement(:,1)= dummy_disp(:,1);
 plot(x,displacement(:,1));
 
 max_time= 100;
 c= 1;
 max_iteration= max_time/del_t;
 t= 0:del_t:max_time;
 
 max_length=length(dummy_disp(:,1)) -1 ;
 % looping over time and space to solve the wave equation. 
for nn= 1:max_iteration
    

          
    for kk= 2:max_length;
            % upwind scheme  
        dummy_disp(kk,1) = displacement(kk,nn) + (   (c* del_t/ del_x)* (  displacement(kk+1,nn)- displacement(kk,nn)  )    );
           
    end
    
    %displacement(:) =dummy_disp (:)
    
    for kk= 2:max_length;
    displacement(kk,nn+1) =dummy_disp (kk,1);
    end
    
end
plot(x,displacement(:,1));

toc;
xMat = repmat(x', 1, 11);

 
%%%%%%%%%%%%%%%%% this is for dt= 0.01 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y=[t(:,1), t(:,50), t(:,100), t(:,150), t(:,200), t(:,250), t(:,300), t(:,350), t(:,400), t(:,450), t(:,500)];
yMat = repmat(y, numel(x), 1);
zMat = [displacement(:,1) displacement(:,50) displacement(:,100) displacement(:,150) displacement(:,200) displacement(:,250) displacement(:,300) displacement(:,350) displacement(:,400) displacement(:,450) displacement(:,500)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(6)
plot3(xMat, yMat, zMat, 'black'); %// Make all traces blue
grid;
xlabel('x'); ylabel('time'); zlabel('Amplitude');
view(40,40); %// Adjust viewing angle so you can clearly see data

figure(7)
plot(x,displacement(:,500));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


 
 





