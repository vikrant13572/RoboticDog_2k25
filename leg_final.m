sl1 = uicontrol('style','slider','Min',-180,'Max',180,'Value',0,...
    'Position',[930 20 400 20],'Callback',@update_leg);
uicontrol('Style','text','Position',[925 40 80 20],'String','Hip');

sl2 = uicontrol('Style','slider','Min',-180,'Max',180,'Value',0,...
    'Position',[520 20 400 20],'Callback',@update_leg);
uicontrol('Style','text','Position',[510 40 80 20],'String','Knee');

sl3 = uicontrol('Style','slider','Min',-180,'Max',180,'Value',0,...
    'Position',[100 20 400 20],'Callback',@update_leg);
uicontrol('Style','text','Position',[90 40 80 20],'String','Foot');


function update_leg(~,~)
    ax = findobj('Type','axes');
    sl1 = findobj('Style','slider','Position',[930 20 400 20]);
    sl2 = findobj('Style','slider','Position',[520 20 400 20]);
    sl3 = findobj('Style','slider','Position',[100 20 400 20]);
    
    thd1 = get(sl1, 'Value');
    thd2 = get(sl2, 'Value');
    thd3 = get(sl3, 'Value');
    

    

    disp(thd2);
    disp(thd3);

    
    th1 = deg2rad(thd1);
    th2 = deg2rad(thd2);
    th3 = deg2rad(thd3);

    Rx = @(th)[-sin(th) 0 cos(th);cos(th) 0 sin(th);0 1 0];
    Ry = @(th)[cos(th) -sin(th) 0; sin(th) cos(th) 0; 0 0 1];
    Rz = @(th)[cos(th) -sin(th) 0; sin(th) cos(th) 0; 0 0 1];

   
    a1 = 5; a2 = 4; a3 = 3;

  
    D1 = [a1*cos(th1); a1*sin(th1); 0];
    D2 = [a2*cos(th2); a2*sin(th2); 0];
    D3 = [a3*cos(th3); a3*sin(th3); 0];

   
   T1 = [Rx(th1) D1; 0 0 0 1];
    T2 = [Ry(th2) D2; 0 0 0 1];
    T3 = [Rz(th3) D3; 0 0 0 1];

    
    T01 = T1;
    T02 = T1*T2;
    T03 = T1*T2*T3;

  
    P0 = [0;0;0];
   P1 = T01(1:3,4);
    P2 = T02(1:3,4);
    P3 = T03(1:3,4);


 
    cla(ax);

    
    plot3(ax,[P0(1) P1(1)],[P0(2) P1(2)],[P0(3) P1(3)],'r-','LineWidth',3); hold(ax,'on');
    plot3(ax,[P1(1) P2(1)],[P1(2) P2(2)],[P1(3) P2(3)],'g-','LineWidth',3);
    plot3(ax,[P2(1) P3(1)],[P2(2) P3(2)],[P2(3) P3(3)],'b-','LineWidth',3);
    
    text(P3(1),P3(2),P3(3),sprintf('  (%.2f, %.2f, %.2f)',P3(1),P3(2),P3(3)));

    axis(ax,[-15 15 -15 15 -15 15]);
    
    xlabel(ax,'X');
    ylabel(ax,'Y');
    zlabel(ax,'Z');
    title(ax,'Robotic dog leg simulation');
    grid(ax,'on');
    view(90, 0);

   
    
end
