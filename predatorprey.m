%% Modelling and Simulation WS2017/18
% Predator Prey Model Project
% Version 0.1
% 12.01.2018
% Authors: Christoph Hämmerle, Philipp Ganiu, Jennifer Lumetzberger

clear all; close all; clc;

% duration
months = 120;
% schrittweite der diskretisierung
h = 0.1; 
% resource capacity
M = 10000;
% deer growth
alpha = 0.001;
% fox decreasing 
gamma = 2;
% deer reduction
beta = 0.003;
% fresh meat increase
delta = 0.001;

% deer
x0 = 4000;
% fox
y0 = 1000; 

%1. := index
%2. := x
%3. := y
result= zeros(3,months+1);
%result(1,1)=1;
result(1,1)=0;
result(2,1)=x0;
result(3,1)=y0;

for i=2:months+1
    
    result(1,i)=i-1;
    %xn-1
    x = result(2,i-1);
    %yn-1
    y = result(3,i-1);
    
    %difference equation for x
    x_new = x + h * (x * alpha * (M - x - y) - x * y * beta);
    x_new = round(x_new);
    %difference equation for y
    y_new = y + h * (y * (delta * x - gamma));
    y_new = round(y_new);
        
    result(2,i)= x_new;
    result(3,i)= y_new;
    
end
figure(1);
plot(result(1,:), result(2,:), result(1,:), result(3,:));
legend('deer','fox');
grid on;
ylabel('population number');
xlabel('months');
axis([0 120 0 6000]);

% Task 2
% create rectangular
rows = 70; %70
col = 200; % 200, that means 70*200=14000 cells 
k=1;%1
p1= 0.05; % probability for prey reproduction 0.01
p2= 0.6; % probability for predator reproduction 0.8
p3= 0.01; % probability for predator dying 0.01

result_ca= zeros(3,months+1);%zeros(3,months)
result_ca(1,1)=0;%*
result_ca(2,1)=x0;
result_ca(3,1)=y0;

%init a matix of rows*col cells with x0 deers and y0 foxes at random
%positions
% 0 ... empty
% 1 ... deer
% 2 ... fox
N = rows*col;
random_positions = randperm(N, y0 + x0); % choose 5000 cells which have a value between 0 and N
init_values = zeros(1,N);
for i=1:(y0+x0)
    if i<=x0 %for the amount of deers
        init_values(random_positions(i))=1; % 4000 x deer (1)
    else
        init_values(random_positions(i))=2; % 1000 x fox (2)
    end
   
end
%ca = vec2mat(init_values, col); % create rectangular matrix and fill with 1,2,0;  
ca = reshape(init_values,rows,col);

%simulation of ca

% plot figure at initial state
m = 0;
figure(2);
hold on;
spy(ca==0, 'w'); % want to color my cells
spy(ca==2,'r');
spy(ca==1,'g');
%axis([]);
legend('empty','foxes','deer');
xlabel(['Months: ' num2str(m)])
hold off;
%Delaying animation
pause(1);


for m=1:months %m=1:months 
    tmp=ca; % want to obtain original matrix
    for i=1:rows
        for j=1:col % go through all cells
            
            %if cell is empty
            if ca(i,j) == 0
                
                neighbour = getRandomNeighbour(ca,k,i,j);
                
                %check if neighbour is prey
                if neighbour == 1
                    
                    %if rand <= p1 empty cell is prey
                    if rand()<= p1
                        tmp(i,j) = 1;
                    end
                end
                
            %if cell is prey    
            elseif ca(i,j) == 1
             neighbour = getRandomNeighbour(ca,k,i,j);
                
                %check if neighbour is predator
                if neighbour == 2
                    
                    %if rand <= p2 empty cell is predator
                    if rand()<= p2
                        tmp(i,j) = 2;
                    end
                end
                
            %if cell is predator
            elseif ca(i,j) == 2
                
                %if rand <= p3 predator is dying
                if rand() <= p3
                    tmp(i,j) = 0;
                end
            end
   
        end
    end
    ca=tmp; % now we have our new matrix setup for the next month
    hold on;
    spy(ca==0, 'w'); % want to color my cells
    spy(ca==2,'r');
    spy(ca==1,'g');
    %axis([]);
    legend('empty','foxes','deer');
    xlabel(['Months: ' num2str(m)])
    hold off;
    %drawnow
    %Delaying animation
    pause(0.001);
        
    result_ca(1,m+1)= m; % result_ca(1,m) = m
    result_ca(2,m+1)= sum(sum(ca==1));
    result_ca(3,m+1)= sum(sum(ca==2));
    
end
% add plot of aggregated ca
figure(3);
plot(result_ca(1,:), result_ca(2,:), result_ca(1,:), result_ca(3,:));
legend('deer','fox');

%return random neighbour 
function neighbour = getRandomNeighbour(ca,k,x,y)
neighbours = [];
rows=size(ca,1);
col=size(ca,2);
for i=(x-k):(x+k)
    for j= (y-k):(y+k)
        if i>0 && i<=rows && j>0 && j<=col 
          neighbours = [neighbours;ca(i,j)];  
        end
    end
end

neighbour = neighbours(randperm(numel(neighbours),1));
end




