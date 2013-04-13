function w = PerceptronLearning(X, labs, d1)

    w = zeros(1, 785);
    w(1) = 1;
    w(2) = 1;
    % w = ones(1, length(labs));
    w = w';
    eta = .0001;
    T = 1000;

    for t=1:T
        for i=1:length(labs)
            y = -1;
            if labs(i) == d1
                y = 1;
            end
            xi = [1 X(:, i)']';
            if (y * w' * xi) < 0
                w = w + eta * y * xi;
            end
        end
    end
end
