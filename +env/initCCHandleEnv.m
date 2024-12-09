function envHandle = initCCHandleEnv()
    
    % Create UIFigure and hide until all components are created
        envHandle.UIFigure = uifigure('Visible', 'off');
        envHandle.UIFigure.Position = [100 100 1025 447];
        envHandle.UIFigure.Name = 'th3Flow´s Crazy Car Simulator';
        envHandle.UIFigure.CloseRequestFcn = @env.closereq_CC; %createCallbackFcn(envHandle, @UIFigureCloseRequest, true);
        envHandle.UIFigure.Tag = 'GUI_tag'; % add some unique tag name to the figure
        envHandle.UIFigure.MenuBar = 'none';
        envHandle.UIFigure.ToolBar = 'none';
        envHandle.UIFigure.AutoResizeChildren = 'off';
        
        % Create DataFront
        envHandle.DataFront = uiaxes(envHandle.UIFigure);
        envHandle.DataFront.Position = [1025 280 550 120];
        envHandle.DataFront.Tag = 'Data_Front';
        envHandle.DataFront.Visible = 'off';
        title(envHandle.DataFront, 'Front Sensor')
        xlabel(envHandle.DataFront, 'time (s)')
        ylabel(envHandle.DataFront, 'Dist (m)')
        envHandle.DataFront.Box = 'on';
        envHandle.DataFront.Toolbar.Visible = 'off';
        envHandle.DataFront.Toolbar.BusyAction = 'cancel';
        envHandle.DataFront.XMinorGrid = 'on';
        envHandle.DataFront.YMinorGrid = 'on';
        envHandle.DataFront.MinorGridAlpha = 0.25;
        envHandle.DataFront.XLimMode = 'auto';
        disableDefaultInteractivity(envHandle.DataFront);        
        
        % Create DataLeft
        envHandle.DataLeft = uiaxes(envHandle.UIFigure);
        envHandle.DataLeft.Position = [1025 160 550 120];
        envHandle.DataLeft.Tag = 'Data_Left';
        envHandle.DataLeft.Visible = 'off';
        title(envHandle.DataLeft, 'Left Sensor')
        xlabel(envHandle.DataLeft, 'time (s)')
        ylabel(envHandle.DataLeft, 'Dist (m)')
        envHandle.DataLeft.Box = 'on';
        envHandle.DataLeft.Toolbar.Visible = 'off';
        envHandle.DataLeft.Toolbar.BusyAction = 'cancel';
        envHandle.DataLeft.XMinorGrid = 'on';
        envHandle.DataLeft.YMinorGrid = 'on';
        envHandle.DataLeft.MinorGridAlpha = 0.25;
        disableDefaultInteractivity(envHandle.DataLeft);
        
        % Create DataRight
        envHandle.DataRight = uiaxes(envHandle.UIFigure);
        envHandle.DataRight.Position = [1025 40 550 120];
        envHandle.DataRight.Tag = 'Data_Right';
        envHandle.DataRight.Visible = 'off';
        title(envHandle.DataRight, 'Right Sensor')
        xlabel(envHandle.DataRight, 'time (s)')
        ylabel(envHandle.DataRight, 'Dist (m)')
        envHandle.DataRight.Box = 'on';
        envHandle.DataRight.Toolbar.Visible = 'off';
        envHandle.DataRight.Toolbar.BusyAction = 'cancel';
        envHandle.DataRight.XMinorGrid = 'on';
        envHandle.DataRight.YMinorGrid = 'on';
        envHandle.DataRight.MinorGridAlpha = 0.25;
        disableDefaultInteractivity(envHandle.DataRight);
        
        % Create Carview
        envHandle.Carview = uiaxes(envHandle.UIFigure);
        title(envHandle.Carview, '')
        xlabel(envHandle.Carview, '')
        ylabel(envHandle.Carview, '')
        envHandle.Carview.PlotBoxAspectRatio = [2.1142061281337 1 1];
        envHandle.Carview.ClippingStyle = 'rectangle';
        envHandle.Carview.Layer = 'top';
        envHandle.Carview.TickLength = [0 0];
        envHandle.Carview.MinorGridColor = [0.1 0.1 0.1];
        envHandle.Carview.MinorGridAlpha = 0.25;
        envHandle.Carview.Box = 'on';
        envHandle.Carview.XAxisLocation = 'origin';
        envHandle.Carview.XMinorTick = 'on';
        envHandle.Carview.YAxisLocation = 'origin';
        envHandle.Carview.YMinorTick = 'on';
        envHandle.Carview.XGrid = 'on';
        envHandle.Carview.XMinorGrid = 'on';
        envHandle.Carview.YGrid = 'on';
        envHandle.Carview.YMinorGrid = 'on';
        envHandle.Carview.LabelFontSizeMultiplier = 1.5;
        envHandle.Carview.TitleFontSizeMultiplier = 1.5;
        envHandle.Carview.Clipping = 'on';
        envHandle.Carview.Position = [200 17 812 407];
        envHandle.Carview.Toolbar.Visible = 'off';
        envHandle.Carview.Toolbar.BusyAction = 'cancel';
        envHandle.Carview.Tag = 'Axs_tag'; 
        disableDefaultInteractivity(envHandle.Carview);
        envHandle.Carview.Visible = 'off';

        % Create OnOffSW
        envHandle.OnOffSW = uiswitch(envHandle.UIFigure, 'slider');
        envHandle.OnOffSW.Items = {'On', 'Off'};
        envHandle.OnOffSW.Orientation = 'vertical';
        envHandle.OnOffSW.ValueChangedFcn = @env.runSwitch;
        envHandle.OnOffSW.FontSize = 14;
        envHandle.OnOffSW.FontWeight = 'bold';
        envHandle.OnOffSW.Position = [28 330 20 45];
        
        % Creat OnOffSW Label
        envHandle.OnOffSWLabel = uilabel(envHandle.UIFigure);
        envHandle.OnOffSWLabel.FontSize = 12;
        envHandle.OnOffSWLabel.FontWeight = 'bold';
        envHandle.OnOffSWLabel.Position = [25 405 117 30];
        envHandle.OnOffSWLabel.Text = 'RUN';
        
        % Create OnOffPlot
        envHandle.OnOffPlot = uiswitch(envHandle.UIFigure, 'slider');
        envHandle.OnOffPlot.Items = {'On', 'Off'};
        envHandle.OnOffPlot.Orientation = 'vertical';
        envHandle.OnOffPlot.ValueChangedFcn = @env.runPlot;
        envHandle.OnOffPlot.FontSize = 14;
        envHandle.OnOffPlot.FontWeight = 'bold';
        envHandle.OnOffPlot.Position = [65 330 20 45];
        
        % Creat OnOffPlot Label
        envHandle.OnOffPlotLabel = uilabel(envHandle.UIFigure);
        envHandle.OnOffPlotLabel.FontSize = 12;
        envHandle.OnOffPlotLabel.FontWeight = 'bold';
        envHandle.OnOffPlotLabel.Position = [60 405 117 30];
        envHandle.OnOffPlotLabel.Text = 'PLOT';
        
        % Create OnOffManual
        envHandle.OnOffManual = uiswitch(envHandle.UIFigure, 'slider');
        envHandle.OnOffManual.Items = {'On', 'Off'};
        envHandle.OnOffManual.Orientation = 'vertical';
        envHandle.OnOffManual.ValueChangedFcn = @env.runManual;
        envHandle.OnOffManual.FontSize = 14;
        envHandle.OnOffManual.FontWeight = 'bold';
        envHandle.OnOffManual.Position = [105 330 20 45];
        
        % Creat OnOffMAN Label
        envHandle.OnOffManualLabel = uilabel(envHandle.UIFigure);
        envHandle.OnOffManualLabel.FontSize = 12;
        envHandle.OnOffManualLabel.FontWeight = 'bold';
        envHandle.OnOffManualLabel.Position = [103 405 117 30];
        envHandle.OnOffManualLabel.Text = 'MAN';

        % Create OnOffLamp
        envHandle.OnOffLamp = uilamp(envHandle.UIFigure);
        envHandle.OnOffLamp.Position = [28 285 20 20];
        envHandle.OnOffLamp.Tag = 'OnOffLamp';
        
        % Create LAPTimeLabel
        envHandle.LAPTimeLabel = uilabel(envHandle.UIFigure);
        envHandle.LAPTimeLabel.FontSize = 24;
        envHandle.LAPTimeLabel.FontWeight = 'bold';
        envHandle.LAPTimeLabel.Position = [26 95 117 30];
        envHandle.LAPTimeLabel.Text = 'LAP-Time';

        % Create TimeOutput
        envHandle.TimeOutput = uilabel(envHandle.UIFigure);
        envHandle.TimeOutput.FontSize = 24;
        envHandle.TimeOutput.FontAngle = 'italic';
        envHandle.TimeOutput.Position = [65 70 117 30];
        envHandle.TimeOutput.Text = '';
        envHandle.TimeOutput.Tag = 'ShowLapTime';
        
        envHandle.bt_ResetCCW = uibutton(envHandle.UIFigure, 'push','FontSize',10,'Text','RESET CCW','Position',[135, 360, 70 , 22],...
            'ButtonPushedFcn',@env.button_ResetCCW);
        envHandle.bt_ResetCW = uibutton(envHandle.UIFigure, 'push','FontSize',10,'Text','RESET CW','Position',[135, 335, 70 , 22],...
            'ButtonPushedFcn',@env.button_ResetCW);

        % Show the figure after all components are created
        
        envHandle.Logo = uiaxes(envHandle.UIFigure);
        envHandle.Logo.Position = [-20 80 227 206];
        envHandle.Logo.Toolbar.Visible = 'off';
        envHandle.Logo.Toolbar.BusyAction = 'cancel';
        envHandle.Logo.Tag = 'Axs_tag'; 
        disableDefaultInteractivity(envHandle.Logo);
        imshow('+env/logo.png', 'Parent', envHandle.Logo);
        
        drawnow;
        time.milliPause(10^-9);
        
end



        % Create BroadcastSW
%         envHandle.BroadcastSW = uiswitch(envHandle.COMPORTPanel, 'slider');
%         envHandle.BroadcastSW.Items = {'On', 'Off'};
%         envHandle.BroadcastSW.Orientation = 'vertical';
%         envHandle.BroadcastSW.FontSize = 14;
%         envHandle.BroadcastSW.FontWeight = 'bold';
%         envHandle.BroadcastSW.Position = [12 55 20 45];
%         envHandle.BroadcastSW.ValueChangedFcn = @serialCmd.broadCastSW;

        % Create BroadcasLamp
%         envHandle.BroadCastLamp = uilamp(envHandle.COMPORTPanel);
%         envHandle.BroadCastLamp.Position = [12 9 20 20];
%         envHandle.BroadCastLamp.Tag = 'BroadCastLamp';

%         % Create COMPORTPanel
%         envHandle.COMPORTPanel = uipanel(envHandle.UIFigure);
%         envHandle.COMPORTPanel.Title = 'COM-PORT';
%         envHandle.COMPORTPanel.FontName = 'Arial Black';
%         envHandle.COMPORTPanel.FontWeight = 'bold';
%         envHandle.COMPORTPanel.Position = [26 130 210 170];
% 
%         % Create IPAdressEditFieldLabel
%         envHandle.IPAdressEditFieldLabel = uilabel(envHandle.COMPORTPanel);
%         envHandle.IPAdressEditFieldLabel.HorizontalAlignment = 'right';
%         envHandle.IPAdressEditFieldLabel.Position = [38 118 58 22];
%         envHandle.IPAdressEditFieldLabel.Text = 'IP-Adress';

%         % Create IPAdressEditField
%         envHandle.IPAdressEditField = uieditfield(envHandle.COMPORTPanel, 'text');
%         envHandle.IPAdressEditField.Position = [100 118 100 22];
%         envHandle.IPAdressEditField.Tag = 'IPAdressField';
% 
%         % Create HostPortEditFieldLabel
%         envHandle.HostPortEditFieldLabel = uilabel(envHandle.COMPORTPanel);
%         envHandle.HostPortEditFieldLabel.HorizontalAlignment = 'right';
%         envHandle.HostPortEditFieldLabel.Position = [38 84 52 22];
%         envHandle.HostPortEditFieldLabel.Text = 'HostPort';

        % Create HostPortEditField
%         envHandle.HostPortEditField = uieditfield(envHandle.COMPORTPanel, 'text');
%         envHandle.HostPortEditField.Position = [100 84 100 22];
%         envHandle.HostPortEditField.Tag = 'HostPortField';
%         
%         % Create LocalPortEditFieldLabel
%         envHandle.LocalPortEditFieldLabel = uilabel(envHandle.COMPORTPanel);
%         envHandle.LocalPortEditFieldLabel.HorizontalAlignment = 'right';
%         envHandle.LocalPortEditFieldLabel.Position = [38 51 56 22];
%         envHandle.LocalPortEditFieldLabel.Text = 'LocalPort';

%         % Create LocalPortEditField
%         envHandle.LocalPortEditField = uieditfield(envHandle.COMPORTPanel, 'text');
%         envHandle.LocalPortEditField.Position = [99 51 100 22];
%         envHandle.LocalPortEditField.Tag = 'LocalPortField';