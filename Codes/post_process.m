function pdkl=post_process(dkl)
pdkl=zeros(size(dkl));
pdkl=dkl/max(dkl);
pdkl=pdkl-mean(pdkl);
end

