function result_ca = Task2_3(x0,y0, months, rows, col, k, p1, p2, p3)

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
        fig2=figure(2);
        set(fig2,'units','points','position',[5,5,1400,700]);
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
end    

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