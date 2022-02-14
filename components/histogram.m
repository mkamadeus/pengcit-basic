classdef histogram < matlab.ui.componentcontainer.ComponentContainer
    %HISTOGRAM Summary of this class goes here
    %   Detailed explanation goes here
    %   Load it with appdesigner.customcomponent.configureMetadata('./components/histogram.m');
    
    properties
        Values1 = zeros(1, 256)
        Values2 = zeros(1, 256)
        Values3 = zeros(1, 256)
        HistType = HistogramType.Color
    end
    
    properties (Access = private,Transient,NonCopyable)
        HistGrid         matlab.ui.container.GridLayout
        Axes3            matlab.ui.control.UIAxes
        Axes2            matlab.ui.control.UIAxes
        Axes1            matlab.ui.control.UIAxes
    end   
    
    methods (Access = protected) 
        function setup(obj) 
            % Create App1HistGrid
            obj.HistGrid = uigridlayout(obj);
            obj.HistGrid.ColumnWidth = {'1x'};
            obj.HistGrid.RowHeight = {'1x', '1x', '1x'}; 

            % Create App1Axes1
            obj.Axes1 = uiaxes(obj.HistGrid);
            title(obj.Axes1, 'Title')
            xlabel(obj.Axes1, 'X')
            ylabel(obj.Axes1, 'Y')
            zlabel(obj.Axes1, 'Z')
            obj.Axes1.XTick = [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1];
            obj.Axes1.XTickLabel = {'0'; '32'; '64'; '96'; '128'; '160'; '192'; '224'; '256'};
            obj.Axes1.Layout.Row = 1;
            obj.Axes1.Layout.Column = 1;

            % Create App1Axes2
            obj.Axes2 = uiaxes(obj.HistGrid);
            title(obj.Axes2, 'Title')
            xlabel(obj.Axes2, 'X')
            ylabel(obj.Axes2, 'Y')
            zlabel(obj.Axes2, 'Z')
            obj.Axes2.XTick = [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1];
            obj.Axes2.XTickLabel = {'0'; '32'; '64'; '96'; '128'; '160'; '192'; '224'; '256'};
            obj.Axes2.Layout.Row = 2;
            obj.Axes2.Layout.Column = 1;

            % Create App1Axes3
            obj.Axes3 = uiaxes(obj.HistGrid);
            title(obj.Axes3, 'Title')
            xlabel(obj.Axes3, 'X')
            ylabel(obj.Axes3, 'Y')
            zlabel(obj.Axes3, 'Z')
            obj.Axes3.XTick = [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1];
            obj.Axes3.XTickLabel = {'0'; '32'; '64'; '96'; '128'; '160'; '192'; '224'; '256'};
            obj.Axes3.Layout.Row = 3;
            obj.Axes3.Layout.Column = 1;
        end 

        function update(obj)
            % Update Axes 1 Values
            x = 0:(size(obj.Values1, 2)-1);
            y = obj.Values1;
            bar(obj.Axes1, x, y);
            obj.Axes1.XTick = 0:32:256;

            % Update Axes 2 Values
            x = 0:(size(obj.Values2, 2)-1);
            y = obj.Values2;
            bar(obj.Axes2, x, y);
            obj.Axes2.XTick = 0:32:256;

            % Update Axes 3 Values
            x = 0:(size(obj.Values3, 2)-1);
            y = obj.Values3;
            bar(obj.Axes3, x, y);
            obj.Axes3.XTick = 0:32:256;
            
            % Update histogram count
            if obj.HistType == HistogramType.Color
                obj.HistGrid.RowHeight = {'1x', '1x', '1x'};
                obj.Axes2.Visible = true;
                obj.Axes3.Visible = true;
            else
                obj.HistGrid.RowHeight = {'1x', '0x', '0x'};
                obj.Axes2.Visible = false;
                obj.Axes3.Visible = false;
            end
        end
    end
end
