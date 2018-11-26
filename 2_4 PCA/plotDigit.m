function plotDigit(v, rescale)
    if nargin < 2,rescale=false;end
    if rescale
        vmin = min(v);
        vmax = max(v);
        v = 255 * (v-vmin)./(vmax-vmin); % rescale from 0 to 255
    end
    v = reshape(v,28,28)';
    image(v)
    daspect([1 1 1]); 
    colormap('Gray')
    set(gca,'xtick',[],'ytick',[]);
end