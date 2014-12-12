N = 2000;
img = zeros( N, N );

for i=1:100
    i
    c = [ceil( rand(1,2)*N ),1];
    d = [randn(1,2),0]/10;
    k = fspecial('gaussian',15,rand*6);
    k = k/(max(k(:))) * rand;
    img = mk_curve(img,c,d,k);
end

img = img + rand(size(img))*0.1;
img = imresize(img,0.25);

figure(1)
imagesc(img)
colormap pink
%%
imwrite(img,'artifitial002b.png')