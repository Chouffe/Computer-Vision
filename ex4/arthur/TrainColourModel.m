function [mu, Sigma] = TrainColourModel(DirName, p, n, m)
    % Train the model bt reading the pictures located in DirName
    % Compute mu and sigma as the trained parameters
    % m = 0: RGB
    % m = 1: HSV
    ls = dir(strcat(DirName,'*.jpg'));
    
    datas = [];
    for i = 1:n
        if i < size(ls,1)
            cim = GrabCenterPixels(strcat(DirName, ls(i).name), p);
            rgb_data = reshape(cim, [size(cim,1)*size(cim,2), 3]);
            datas = [datas; rgb_data];
            size(datas);
        end
    end
    
    % Use HSV
    if m > 0
    	datas = rgb2hsv(datas);
        datas = [cos(datas(:,1)), sin(datas(:,1)), datas(:,2:3)];
    end
    
    mu = sum(datas, 1)/size(datas,1);
    Sigma = cov(double(datas));
end
