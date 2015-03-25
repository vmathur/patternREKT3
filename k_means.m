function [ output_args ] = k_means(k, x)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    x(:,4) = 0;
    n=length(x);
    r=randperm(n);
    r=r(1:k);
    prototypes = [];
    for k = 1:length(r)
        prototypes = [prototypes; x(r(k),:)];
    end
    prototypes = prototypes(:,1:2);
   
    should_continue = true;
    
    while(should_continue)
        for i= 1:n
            z = x(i,1:2);
            class = med(prototypes,z);
            x(i,4)= class;
        end
    
        prototypes2 = [];
        for i= 1:k
            rows = x(x(:,4)==i,:);
            a_mean = mean(rows(:,1));
            b_mean = mean(rows(:,2));
            prototypes2 = [prototypes2; a_mean b_mean];
        end

        errors = [];
        for i= 1:k
            error = norm(prototypes2(i,:)-prototypes(i,:));
            errors = [errors; error];
        end    
        errors;
        if(sum(errors)==0)
            should_continue = false;
        end
        prototypes = prototypes2;
    end
    output_args = prototypes;    
end