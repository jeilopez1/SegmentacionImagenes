x=imread ('2.png');
imggris = rgb2gray(x);
dibujo=x;
tam=size(x);

i=x;
i2=rgb2gray(i);
tama=size(i);
i2= double(i2);

for i=1:tama(1);
    
    for j=1:tama(2);
       if i2(i,j)<120
           i2(i,j)=0;
       else
           i2(i,j)=255;
       end
       
       
    end;
end;
 BWdfill = imfill (i2);
 
 ref_pts=detectSURFFeatures(imggris);
 ref_img = dibujo;
 
 figure; imshow(dibujo);
 hold on; 
 plot(ref_pts.selectStrongest(20));
  
 figure;
subplot(5,5,3); title('20 Nucleos de Celulas');
for i=1:20
    scale = ref_pts(i).Scale;
    image = imcrop(ref_img,[ref_pts(i).Location-5*scale 20*scale 20*scale]);
    subplot(4,5,i);
    imshow(image);
    hold on;
    rectangle('Position',[20*scale 20*scale 30*scale 30*scale],'Curvature',1,'EdgeColor','g');
    
    
    
end
    