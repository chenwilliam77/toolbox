aa1 = 1;
bb1 = par.n1;
aa2 = 1;
bb2 = par.n2;
cc = 0.99;
dd = 1;

va = 0;
vb = 0;

va = -50;
vb = 25;

% vece_g  = linspace(vece(1),vece(end),par.ne);
% veck_g  = linspace(veck(1),veck(end),par.nk);

vec1_g  = vec1;
vec2_g  = vec2;
[x2_g,x1_g] = meshgrid(vec2_g,vec1_g);

nlin = floor(sqrt(par.nx));
ncol = ceil((par.nx)/nlin);

figure(1); clf(1);
for h=1:par.nx
    subplot(nlin,ncol,h); hold on
    
    eval(['Zq  = squeeze(X0(par.X.i',vars{h},',:,:));'])
    
    m = mesh(x1_g,x2_g,Zq);
    set(m,'facecolor','none')
    view([va,vb]); grid on;

    ylabel('$\theta$','Interpreter','LateX'); 
    
    xlabel('$\eta$','Interpreter','LateX');

    title(['$',latex{h},'$'],'Interpreter','LateX');
    set(gca,'FontSize',16)
    xlim([vec1(aa1) vec1(bb1)]);
    ylim([vec2(aa2) vec2(bb2)]);  
    drawnow
    tix=get(gca,'ztick')';
    set(gca,'zticklabel',num2str(tix,'%.3f'));
end

nlin = floor(sqrt(length(vplot_)));
ncol = ceil((length(vplot_))/nlin);

figure(2); clf(2);
hh_ = 0;
for h=1:par.nx
if  any(ismember(vplot_,vars{h}))
    hh_ = hh_+1;
    subplot(nlin,ncol,hh_);
    
    eval(['Zq  = squeeze(X0(par.X.i',vars{h},',:,:));'])
    
    m = mesh(x1_g,x2_g,Zq);
    set(m,'facecolor','none')
    view([va,vb]); grid on;

    ylabel('$\theta$','Interpreter','LateX'); 
    
    xlabel('$\eta$','Interpreter','LateX');

    title(['$',latex{h},'$'],'Interpreter','LateX');
    set(gca,'FontSize',16)
    xlim([vec1(aa1) vec1(bb1)]);
    ylim([vec2(aa2) vec2(bb2)]); 
    drawnow
    tix = get(gca,'ztick')';
    set(gca,'zticklabel',num2str(tix,'%.3f'));
end
end
for h_=1:par.nx_
if  any(ismember(vplot_,vars_{h_}))
    hh_ = hh_+1;
    subplot(nlin,ncol,hh_);
    
    eval(['Zq  = squeeze(X_(par.X_.i',vars_{h_},',:,:));'])
    
    m = mesh(x1_g,x2_g,Zq);
    set(m,'facecolor','none')
    view([va,vb]); grid on;

    ylabel('$\theta$','Interpreter','LateX'); 
    
    xlabel('$\eta$','Interpreter','LateX');

    title(['$',latex_{h_},'$'],'Interpreter','LateX');
    set(gca,'FontSize',16)
    xlim([vec1(aa1) vec1(bb1)]);
    ylim([vec2(aa2) vec2(bb2)]); 
    drawnow
    tix = get(gca,'ztick')';
    set(gca,'zticklabel',num2str(tix,'%.3f'));
end
end
for v=1:par.nv
if  any(ismember(vplot_,value{v}))
    hh_ = hh_+1;
    subplot(nlin,ncol,hh_); hold on
    
    eval(['Zq  = squeeze(V0(par.V.i',value{v},',:,:));'])
    
    m = mesh(x1_g,x2_g,Zq);
    set(m,'facecolor','none')
    view([va,vb]); grid on;

    ylabel('$\theta$','Interpreter','LateX'); 
    
    xlabel('$\eta$','Interpreter','LateX');

    title(['$',latexv{v},'$'],'Interpreter','LateX');
    set(gca,'FontSize',16)
    xlim([vec1(aa1) vec1(bb1)]);
    ylim([vec2(aa2) vec2(bb2)]);   
    tix=get(gca,'ztick')';
    set(gca,'zticklabel',num2str(tix,'%.3f'));
end
end

if strcmp(par.plotall,'on')
nlin = floor(sqrt(par.nx_));
ncol = ceil((par.nx_)/nlin);

figure(3); clf(3);
for h_=1:par.nx_
    subplot(nlin,ncol,h_); hold on
    
    eval(['Zq  = squeeze(X_(par.X_.i',vars_{h_},',:,:));'])
    
    m = mesh(x1_g,x2_g,Zq);
    set(m,'facecolor','none')
    view([va,vb]); grid on;

    ylabel('$\theta$','Interpreter','LateX'); 
    
    xlabel('$\eta$','Interpreter','LateX');

    title(['$',latex_{h_},'$'],'Interpreter','LateX');
    set(gca,'FontSize',16)
    xlim([vec1(aa1) vec1(bb1)]);
    ylim([vec2(aa2) vec2(bb2)]);   
    tix=get(gca,'ztick')';
    set(gca,'zticklabel',num2str(tix,'%.3f'));
end

nlin = floor(sqrt(par.nv));
ncol = ceil((par.nv)/nlin);

figure(4); clf(4);
for v=1:par.nv
    subplot(nlin,ncol,v); hold on
    
    eval(['Zq  = squeeze(V0(par.V.i',value{v},',:,:));'])
    
    m = mesh(x1_g,x2_g,Zq);
    set(m,'facecolor','none')
    view([va,vb]); grid on;

    ylabel('$\theta$','Interpreter','LateX'); 
    
    xlabel('$\eta$','Interpreter','LateX');

    title(['$',latexv{v},'$'],'Interpreter','LateX');
    set(gca,'FontSize',16)
    xlim([vec1(aa1) vec1(bb1)]);
    ylim([vec2(aa2) vec2(bb2)]);   
    tix=get(gca,'ztick')';
    set(gca,'zticklabel',num2str(tix,'%.3f'));
end
end

% if strcmp(par.savegraph_,'on')
%     set(gcf,'PaperPosition', [0 0 12 12]);
%     set(gcf,'PaperSize', [12 12]);    
%     filename = [par.name,'_theta_',num2str(par.theta,'%0.0f')];
%     
%     cdtmp = cd;
%     cd ..
%     cd ..
%     graphpath = [pwd,'/graphs/'];
%     cd(cdtmp)
%     
%     saveas(gcf,[graphpath,filename],'pdf')
% end


