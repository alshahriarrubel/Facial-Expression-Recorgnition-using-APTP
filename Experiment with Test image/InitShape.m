% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % Copyright (C) 2014, Akshay Asthana, all rights reserved.
% %  * Do not redistribute without permission.
% %  * Strictly for academic and non-commerial purpose only.
% %  * Use at your own risk.
% % 
% % Please cite the follwing paper if you use this code:
% %  * Incremental Face Alignment in the Wild.
% %    A. Asthana, S. Zafeiriou, S. Cheng and M. Pantic.
% %    In CVPR 2014.
% % 
% % Contact
% % akshay.asthana@gmail.com
% % For details refer to https://sites.google.com/site/chehrahome/ 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
function shape = InitShape(bbox,rshape)
    n = size(rshape,1)/2;
    if(isempty(bbox))
       bbox(1)=29; 
       bbox(2)=41;
       bbox(3)=80; 
       bbox(4)=80;
       disp(bbox);
    end
    a = 0.80*bbox(3)/(max(rshape(1:n))-min(rshape(1:n)));
    b = 0;
    tx = bbox(1) + bbox(3)/2;
    ty = bbox(2) + bbox(4)/2+15;

    shape = zeros(2*n,1);
    for i = 1:n
        shape(i) = a*rshape(i) - b*rshape(i+n) + tx;
        shape(i+n) = b*rshape(i) + a*rshape(i+n) + ty;
    end
end
