function [X, labs, w, h] = LoadData2(DirName)

    ls = dir(strcat(DirName,'test*.png'));

    n = 1000;
    labs = zeros(1, n);

    for i = 1:n
        if i < size(ls,1)
            im = imread(strcat(DirName, ls(i).name));
            if i == 1
                h = size(im)(1);
                w = size(im)(2);
                X = zeros(h * w, n);
            end
            str = ls(i).name;
            expr = '([0-9]+).png';
            [t, m] = regexp(str, expr,'tokens','match');
            labs(i) = str2num(t{1}{1});
            % labs(1) = t{1}{1};
            im = (im - mean(im(:)))/ std(im(:));
            X(:, i) = im(:);
        end
    end
end

