function Fs = ComputeDescriptors(DirName, nbins, ng)

Fs = cell(1, 4);
for j=1:4
    Fs{j} = [];
end

mystr = [DirName, '/*.png'];
im_files = dir(mystr);
ni = length(im_files);
ims = cell(1, ni);
addpath(DirName);

for i=1:ni
    col_im = imread(im_files(i).name);
    im = single(rgb2gray(col_im));
    ims{i} = (im - mean(im(:)))/ std(im(:));
end

N = size(ims, 2);
for i=1:N
    im = ims{i};
    fs = cell(4);
    fs{1} = im(:);
    fs{2} = ExtractHistogram(im, nbins); 
    fs{3} = ExtractGridHistogram(im, ng, nbins); 
    fs{4} = ExtractSiftDescriptor(im);
    for j=1:4
        Fs{j} = [Fs{j}, fs(j)];
    end
end

end
