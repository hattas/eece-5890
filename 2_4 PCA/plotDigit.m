function plotDigit(v)
    v = reshape(v,28,28)';
    imagesc(v)
    daspect([1 1 1]); 
    colormap('Gray')
    set(gca,'xtick',[],'ytick',[]);
end