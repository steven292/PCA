clear all
clc
% M606 Term Structure HW 3



%% Q1 Part a
r=xlsread('HW3Q1-SpotRates','B:AY'); %IMPORT DATA TO MATLAB

for i=1:2020 %calculate dr=r(t)-r(t-1) by using loop
    r1(i,:)=r(i+1,:)-r(i,:);
end
c=cov(r1); % covariance matrix of the dr series
fprintf('Question 1 part a : Since it is 50x50 Matrix I will not print out')



%% Q1 Part b
[eig_vactor,eig_value]=eig(c); %eigenvactor,eigenvalues of square matrix c
eig_vactor
eig_value
diag_eig_value=diag(eig_value);
diag_eig_value
[eig_value_sort,originalpos2]=sort(diag_eig_value(:),'descend');%Find the biggest 10 evalue
fprintf('Question 1 part b : first 10(largest) eigenvalues is : ')
largest10_evalue=eig_value_sort(1:10) %??????

fprintf('Question 1 part b : first 10(largest) eigenvalues is : ')
evactor_of_l10evactor=[eig_vactor(:,originalpos2(1:10))];
evactor_of_l10evactor       %?????????????
fprintf('50X10 Matrix')



%% Q1 Part c
%Percentage Variation

percentage_variation=largest10_evalue/sum(eig_value_sort);
fprintf('Question 1 part c : Percentage Variation Table : ')
table(largest10_evalue,percentage_variation)


%Cumulative Percentage
sum_of_largest_10_evalue=sum(largest10_evalue);
cumulative_sum_largest_10_evalue=cumsum(largest10_evalue);
cumulative_percentage=cumulative_sum_largest_10_evalue/sum_of_largest_10_evalue;
fprintf('Question 1 part C : Cumulative Percentage Table : ')
table(largest10_evalue,cumulative_percentage)
fprintf('About 88.8% of the variation is explained by this first eigenvalue,ect.')


%% Q1 Part d
largest3_evactor=largest10_evalue(1:3,:);        %Find the biggest 3 evactor
largest3_evactor_weight=percentage_variation(1:3);%Find the weight of biggest 3 evactor
evactor_of_l3evactor=[eig_vactor(:,originalpos2(1:3))];%Find evector to the biggest 3 evalue

figure (1);
plot([0.5:0.5:25],evactor_of_l3evactor)
legend('Component 1- Level','Component 2- Slop','Component 3- Curvature')
title('Graph of maturity and eigenvector weight');
xlabel('Maturity');
ylabel('Eigenvector Weight');



%% Q1 Part e
%Transpose daily rates and evactor first, then multiple 
trans_r=r';
trans_l3_evactor=evactor_of_l3evactor';
PC=trans_l3_evactor*trans_r; 
figure (2);
plot([1:1:2021],PC)
legend('Component 1- Level','Component 2- Slop','Component 3- Curvature')
title('Graph of Day and Principal Component');
xlabel('Day');
ylabel('Principal Component')