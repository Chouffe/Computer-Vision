function [X, w, h] = LoadData(DirName, ext, n, ph, pw)
    ls = dir(strcat(strcat(DirName,'*.'),ext));
    
    X = [];
    for i = 1:n
        if i < size(ls,1)
            [cim w h] = GrabCenterPixelsForFaces(strcat(DirName, ls(i).name), ph, pw);
            if i == 1
                X = zeros(size(cim,1)*size(cim,2), n);
            end
            X(:,i) = cim;
        end
    end
end