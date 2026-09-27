%% To use prepare matrix U where U=[u(1),u(2),...,u(n)]
%  with u(1)=[u0(1), u1(1), ... , uk(1)]' column vectors are time 1 for
%  nodes 1 through k. Then simply type M=Waveanim(U).
%  To replay movie, type movie(M)

function [M]=Waveanim(u)

figure
for i=1:size(u,2)
    plot(u(:,i))
    if max(max(u))<5
        ylim([0,max(max(u))])
    end
    M(i)=getframe(gcf);

end
set(gca,'XTick',[],'YTick',[],'position',[0 0 1 1]);
movie(M);
