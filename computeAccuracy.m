function accuracy = computeAccuracy(X_train, y_train, X_test, y_test, no_classes, reqd_indices, n)
	len_req_indices = size(reqd_indices)(1);
	final_feat = zeros(n, len_req_indices);
	final_feat = X_test(:, reqd_indices);
	X_test = final_feat;

	

	%K-means Clustering
	K = 7;
	
	initial_centroids = ones(no_classes, len_req_indices);


	X_train_temp = X_train(:, reqd_indices);
	for iter = 1:no_classes,
	    initial_centroids(iter,:) = mean(X_train_temp(y_train==iter, :));
	    endfor;   

	max_iters = 12;
	[centroids, idx] = runkMeans(X_test, initial_centroids, max_iters, false);

	%X_recovered = centroids(idx,:);

	%Accuracy

	accuracy = ((sum(y_test==idx) / size(idx)(1)) * 100);
end;