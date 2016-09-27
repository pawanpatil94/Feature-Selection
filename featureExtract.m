##load -ascii kddcup.dat
##print "Done"

#data = dlmread('kddcup.dat');
#X = sizeof(data);
##Dataset seperation:
#Y = cat(X, data); # extract labels from the data
#msk = sample.split(Y, SplitRatio=3/2);
#size(Y)

#normal. - 1
#neptune. - 2
#smurf. - 3
#teardrop. - 4
#ipsweep. - 5
#buffer_overflow. - 6
#warezclient. - 7


#Extracting from file
data = csvread('my_data_labelled.csv');
[m, n] = size(data);
no_train = int32(m * 0.5);
y = data(:,n);
X = data(:,1:n-1);

no_classes = 7
no_features = 41

#seperating training, test
rndIDX = randperm(m); 
rand_rows_train = rndIDX(1:no_train);
rand_rows_test = rndIDX(no_train+1:end); 
X_train = X(rand_rows_train,:);  % Select the random rows from X
y_train = y(rand_rows_train,:);
X_test = X(rand_rows_test,:);
y_test = y(rand_rows_test,:);

#Calculating total_entropy
entropy = 0;
for i = 1:no_classes
    apriori = (sum(y_train==i)) / m;
    entropy_individual = (-1)*(apriori * log2(apriori));
    entropy = entropy + entropy_individual;
end;

entropy
ig = zeros(n-1, 1);
#To calculate IG
for i = 1:n-1,
    entropy_conditional = 0;
    temp = X_train(:, i);
    unique_vals = unique(temp);
    
    
    length_vals = size(unique_vals)(1);
    
    if 3 <= 5,
        for j = 1:length_vals,
            
            req_classes = y_train(X_train(:, i) == unique_vals(j));
            
            [freq, value] = hist(req_classes, unique(req_classes));#hist: a function which returns frequency and the value of the element only once
            en = 0;
            for k = 1:size(value)(2),
                if freq(k) == 0,###bug -> fix needed
#                    freq(k) = 1;
                    break;
                endif;
#                if freq
                temp_en =  (freq(k) / size(req_classes)(1));
                en = en - (temp_en * log2(temp_en));
            endfor;
            temp2 = (temp == unique_vals(j));
            entropy_conditional = entropy_conditional + (en * (sum(temp2)/ m) );
        endfor;
        ig(i) = entropy - entropy_conditional;
    else
        disp(i);
    endif;
endfor;  

junk = zeros(no_features);
for i=1:no_features,
    junk(i) = i;
    endfor;

[sorted, indices] = sort(-ig);

reqd_indices = junk(indices);


accuracy = computeAccuracy(X_train, y_train, X_test, y_test, no_classes, reqd_indices, n);
fprintf("Before information gain, accuracy is");
disp(accuracy);

fprintf("After information gain, top fifteen features are\n");
reqd_indices = junk(indices(1:15)); %Selecting top 15 features
disp(reqd_indices);
accuracy = computeAccuracy(X_train, y_train, X_test, y_test, no_classes, reqd_indices, n);
fprintf("Accuracy is ");
disp(accuracy);