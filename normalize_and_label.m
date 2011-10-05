function rg_im = normalize_and_label(im, label)
%RG_IM This function normalize each pixel on its intensity of red and green
%and labels them with a indicator variable
%   INPUT im = image
%   INPUT label = the label
%   RETURN rg_im = (intensity_red, intensity_green, label)
%

im = double(im);
rg_im = [];
for y=1:size(im,1)
     for x=1:size(im,2)
        s = sum(im(y,x,:));
        if (s > 0)
            rg_im = [rg_im; im(y,x,1)/s im(y,x,2)/s label];
        end
     end
end