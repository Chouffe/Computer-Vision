function [mu, Sigma] = TrainColourModel(DirName, n)
    ls = dir(strcat(DirName,'*.jpg'));
    
    datas = [];
    for i = 1:n
        if i < size(ls,1)
            cim = GrabCenterPixels(ls(i).name, 0.2);
            rgb_data = reshape(cim, [size(cim,1)*size(cim,2), 3]);
            datas = [datas; rgb_data];
            size(datas);
        end
    end
    
    mu = sum(datas, 1)/size(datas,1);
    Sigma = cov(double(datas));