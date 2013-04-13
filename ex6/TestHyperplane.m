function [tp, tn, fp, fn] = TestHyperplane(X1, labs1, d1, w)

    % WTF is tp and tn
    tp = 0;
    tn = 0;
    fp = 0;
    fn = 0;

    for i=1:length(labs1)
        y = -1;
        if labs1(i) == d1
            y = 1;
        end
        xi = [1 X1(:, i)']';
        xi = double(xi);
        % Well classified
        if (y * w' * xi) > 0
            if labs1(i) == d1
                tp = tp + 1;
            else
                tn = tn + 1;
            end
        else
            if labs1(i) == d1
                fp = fp + 1;
            else
                fn = fn + 1;
            end
        end
    end
end
