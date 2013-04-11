function [tp, tn] = TestHyperplane(X1, labs1, d1, w)

    tp = 0;
    tn = 0;

    for i=1:length(labs1)
        y = -1;
        if labs1(i) == d1
            y = 1;
        end
        xi = [1 X1(:, i)']';
        % xi
        % w
        % FIXME: Right size but strange error: binary operator `*' not
        % implemented for `matrix' by `uint8 matrix' operations
        y * uint8(xi)' * w
        if (y * w' * xi) < 0
            tn = tn + 1
        else
            tp = tp + 1
        end
    end
end
