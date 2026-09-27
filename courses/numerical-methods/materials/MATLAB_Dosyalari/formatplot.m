function [] = formatplot(HH, h, TT, TT2)
% function [] = formatplot(HH, h, TT, TT2)
% Formats Plots
% INPUTS:
%   HH:     Plot handle
%   h:      Axis handle
%   TT:     Text object handles
%   TT2:    Text Object handles with larger bolded fonts (titles)
%
% Written by: Matt Ueckermann
if ~isempty(HH);
    for i = 1:length(HH)
        set(HH(i),'LineWidth',2)
    end
end
if ~isempty(HH);
    set(h,'fontsize',12)
end
for i = 1:length(TT)
    set(TT(i),'fontsize',12)
end

if nargin==4
    for i = 1:length(TT2)
        set(TT2(i),'fontsize',16,'FontWeight','bold');
    end
end
