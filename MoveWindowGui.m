classdef MoveWindowGui < handle
    %MOVEWINDOWGUI Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (SetAccess=public, GetAccess=public)
        figure_handle
        app
        step
    end

    properties (SetAccess=private, GetAccess=private)
        button_up
        button_down
        button_left
        button_right
        edit_step
    end
    
    methods
        function obj = MoveWindowGui(figure_handle)
            obj.figure_handle = figure_handle;
            obj.step = 10;
            obj.draw_app();
        end

        function draw_app(obj)
            obj.app = figure('Name','MoveWindow','Position',[100,300,600,300]);

            obj.button_up = uicontrol('Parent', obj.app, 'Style','pushbutton', 'String','Up',...
                    'Position', [150, 150, 50, 50], 'Callback', @obj.button_up_Callback);

            obj.button_down = uicontrol('Parent', obj.app, 'Style','pushbutton', 'String','Down',...
                    'Position', [150, 10, 50, 50], 'Callback', @obj.button_down_Callback);
            
            obj.button_left = uicontrol('Parent', obj.app, 'Style','pushbutton', 'String','Left',...
                    'Position', [10, 75, 50, 50], 'Callback', @obj.button_left_Callback);

            obj.button_right = uicontrol('Parent', obj.app, 'Style','pushbutton', 'String','Right',...
                    'Position', [300, 75, 50, 50], 'Callback', @obj.button_right_Callback);

            obj.edit_step = uicontrol('Parent', obj.app, 'Style','edit', 'String', num2str(obj.step),...
                    'Position', [150, 75, 50, 20], 'Callback', @obj.edit_step_Callback);
        end

        function edit_step_Callback(obj, source, eventdata)
            input = get(obj.edit_step,'String');
            obj.step = abs(str2double(input));
        end

        function button_up_Callback(obj, source, eventdata)
            obj.figure_handle.Position(2) = obj.figure_handle.Position(2) + obj.step;
        end

        function button_down_Callback(obj, source, eventdata)
            obj.figure_handle.Position(2) = obj.figure_handle.Position(2) - obj.step;
        end

        function button_left_Callback(obj, source, eventdata)
            obj.figure_handle.Position(1) = obj.figure_handle.Position(1) - obj.step;
        end

        function button_right_Callback(obj, source, eventdata)
            obj.figure_handle.Position(1) = obj.figure_handle.Position(1) + obj.step;
        end

    end
end

