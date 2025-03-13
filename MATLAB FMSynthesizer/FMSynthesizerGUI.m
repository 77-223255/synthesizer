function FMSynthesizerGUI()
    global inputText 
    % 将类文件所在的文件夹添加到搜索路径中
    addpath('path_to_FM_synthesizer_folder');  % 替换为实际的文件夹路径

    % 创建主窗口
    fig = figure('Position', [0 0 2560 1600], 'Name', 'FM Synthesizer', 'NumberTitle', 'off', 'CloseRequestFcn', @closeApp);

    % 创建 "播放/停止" 按钮
    playButton = uicontrol('Style', 'pushbutton', ...
        'Position', [500 10 600 80], ...
        'String', '▶', ...
        'FontSize', 25, ...
        'Callback', @playButtonCallback);

    textHandle = uicontrol('Style', 'text', ...
                       'String', 'nothing right now', ...  % 设置显示的文字
                       'Position', [20, 10, 450, 100],...
                       'FontSize',15,...
                       'BackgroundColor',[81 60 32] / 255,...
                       'ForegroundColor',[249 236 195] / 255);  % 设置文本框的位置和大小

    % 创建1滑动条及其输入框
    % 创建音量滑动条
    LevelSlider1 = uislider(fig, 'Position', [40 500 150 100], ...
        'Limits', [0 5], ...
        'Value', 1, ...
        'Orientation', 'vertical');
    uicontrol('Style', 'text', ...
        'Position', [35 450 50 20], ...
        'String', 'Level', ...
        'HorizontalAlignment', 'left', ...
        'FontSize', 12);
    LevelEdit1 = uicontrol('Style', 'edit', ...
        'Position', [30 470 50 20], ...
        'String', num2str(LevelSlider1.Value), ...
        'Callback', @(hObject, eventdata) updateSlider(hObject, LevelSlider1));

    % 创建频率滑动条
    FreqSlider1 = uislider(fig, 'Position', [110 500 150 100], ...
        'Limits', [0 5000], ...
        'Value', 50, ...
        'Orientation', 'vertical');
    uicontrol('Style', 'text', ...
        'Position', [105 450 50 20], ...
        'String', 'Freq', ...
        'HorizontalAlignment', 'left', ...
        'FontSize', 12);
    FreqEdit1 = uicontrol('Style', 'edit', ...
        'Position', [100 470 50 20], ...
        'String', num2str(FreqSlider1.Value), ...
        'Callback', @(hObject, eventdata) updateSlider(hObject, FreqSlider1));


    % 创建2滑动条及其输入框
    % 创建音量滑动条
    LevelSlider2 = uislider(fig, 'Position', [270 500 150 100], ...
        'Limits', [0 5], ...
        'Value', 1, ...
        'Orientation', 'vertical');
    uicontrol('Style', 'text', ...
        'Position', [265 450 50 20], ...
        'String', 'Level', ...
        'HorizontalAlignment', 'left', ...
        'FontSize', 12);
    LevelEdit2 = uicontrol('Style', 'edit', ...
        'Position', [260 470 50 20], ...
        'String', num2str(LevelSlider2.Value), ...
        'Callback', @(hObject, eventdata) updateSlider(hObject, LevelSlider2));

    % 创建频率滑动条
    FreqSlider2 = uislider(fig, 'Position', [340 500 150 100], ...
        'Limits', [0 5000], ...
        'Value', 50, ...
        'Orientation', 'vertical');
    uicontrol('Style', 'text', ...
        'Position', [335 450 50 20], ...
        'String', 'Freq', ...
        'HorizontalAlignment', 'left', ...
        'FontSize', 12);
    FreqEdit2 = uicontrol('Style', 'edit', ...
        'Position', [330 470 50 20], ...
        'String', num2str(FreqSlider2.Value), ...
        'Callback', @(hObject, eventdata) updateSlider(hObject, FreqSlider2));


    % 创建3滑动条及其输入框
    % 创建音量滑动条
    LevelSlider3 = uislider(fig, 'Position', [40 280 150 100], ...
        'Limits', [0 5], ...
        'Value', 1, ...
        'Orientation', 'vertical');
    uicontrol('Style', 'text', ...
        'Position', [35 230 50 20], ...
        'String', 'Level', ...
        'HorizontalAlignment', 'left', ...
        'FontSize', 12);
    LevelEdit3 = uicontrol('Style', 'edit', ...
        'Position', [30 250 50 20], ...
        'String', num2str(LevelSlider3.Value), ...
        'Callback', @(hObject, eventdata) updateSlider(hObject, LevelSlider3));

    % 创建频率滑动条
    FreqSlider3 = uislider(fig, 'Position', [110 280 150 100], ...
        'Limits', [0 5000], ...
        'Value', 50, ...
        'Orientation', 'vertical');
    uicontrol('Style', 'text', ...
        'Position', [105 230 50 20], ...
        'String', 'Freq', ...
        'HorizontalAlignment', 'left', ...
        'FontSize', 12);
    FreqEdit3 = uicontrol('Style', 'edit', ...
        'Position', [100 250 50 20], ...
        'String', num2str(FreqSlider3.Value), ...
        'Callback', @(hObject, eventdata) updateSlider(hObject, FreqSlider3));


    % 创建4滑动条及其输入框
    % 创建音量滑动条
    LevelSlider4 = uislider(fig, 'Position', [270 280 150 100], ...
        'Limits', [0 5], ...
        'Value', 1, ...
        'Orientation', 'vertical');
    uicontrol('Style', 'text', ...
        'Position', [265 230 50 20], ...
        'String', 'Level', ...
        'HorizontalAlignment', 'left', ...
        'FontSize', 12);
    LevelEdit4 = uicontrol('Style', 'edit', ...
        'Position', [260 250 50 20], ...
        'String', num2str(LevelSlider4.Value), ...
        'Callback', @(hObject, eventdata) updateSlider(hObject, LevelSlider4));

    % 创建频率滑动条
    FreqSlider4 = uislider(fig, 'Position', [340 280 150 100], ...
        'Limits', [0 5000], ...
        'Value', 50, ...
        'Orientation', 'vertical');
    uicontrol('Style', 'text', ...
        'Position', [335 230 50 20], ...
        'String', 'Freq', ...
        'HorizontalAlignment', 'left', ...
        'FontSize', 12);
    FreqEdit4 = uicontrol('Style', 'edit', ...
        'Position', [330 250 50 20], ...
        'String', num2str(FreqSlider4.Value), ...
        'Callback', @(hObject, eventdata) updateSlider(hObject, FreqSlider4));


    % 创建一个输入框
    Algorithm = uicontrol('Style', 'edit',...
        'Position', [20, 180, 450, 40],...
        'FontSize', 15);

    % 创建一个“OK”按钮
    uicontrol('Style', 'pushbutton',...
        'Position', [20, 120, 450, 50],...  % 调整按钮位置以适应窗口
        'String', 'OK',...  % 按钮显示的文本
        'FontSize', 20,...  % 按钮字体大小
        'Callback', @(btn, event) buttonCallback(btn, Algorithm));  % 设置按钮的回调函数

    % 创建坐标区用于绘制波形
    axesHandle = axes('Position', [0.45 0.2 0.5 0.75]);

    % 标志变量，指示音源是否正在播放
    isPlaying = false;

    % 创建 FM 合成器实例
    fmSynth1 = FM_synthesizer(); 
    fmSynth2 = FM_synthesizer(); 
    fmSynth3 = FM_synthesizer(); 
    fmSynth4 = FM_synthesizer();
    Fs = 16000;  % 采样率
  
    function buttonCallback(btn, editField)
        % 按钮的回调函数
        inputText = get(editField, 'String');  % 获取编辑框中的文本
    end
  
    function playButtonCallback(~, ~)
        isPlaying = ~isPlaying;  % 切换播放状态
  
        if isPlaying
            playButton.String = '| |';
        else
            playButton.String = '▶';
        end
      
        if isPlaying
            % 直接对每个 FM_synthesizer 实例的属性进行赋值
            fmSynth1.modulationLevel = round(LevelSlider1.Value,2);
            fmSynth1.modulationFrequency = round(FreqSlider1.Value);

            
            fmSynth2.modulationLevel = round(LevelSlider2.Value,2);
            fmSynth2.modulationFrequency = round(FreqSlider2.Value);

            
            fmSynth3.modulationLevel = round(LevelSlider3.Value,2);
            fmSynth3.modulationFrequency = round(FreqSlider3.Value);

            
            fmSynth4.modulationLevel = round(LevelSlider4.Value,2);
            fmSynth4.modulationFrequency = round(FreqSlider4.Value);

            expr = change(inputText,fmSynth1,fmSynth2,fmSynth3,fmSynth4);
            [t, y] = generateWaveformData(expr, 1);

          
          
          
            % 在坐标区中绘制波形
            plot(axesHandle, t, y,'Color',[242 118 53] / 255);
            xlabel(axesHandle, '时间 (秒)');
            ylabel(axesHandle, '幅度');
            title(axesHandle, sprintf('FM 合成'));
          
            % 持续生成和播放 FM 合成波形
            while isPlaying
              
                % 播放音源
                sound(y, Fs);
  
                % 暂停 1 秒，以避免音源重叠
                pause(1);
              
            end
        end
    end
  
    % 关闭应用程序的回调函数
    function closeApp(~, ~)
        isPlaying = false;  % 停止播放
        delete(fig);  % 关闭窗口
    end
  
    % 更新滑动条值的回调函数
    function updateSlider(hObject, slider)
        value = str2double(get(hObject, 'String'));
        if ~isnan(value) && value >= slider.Limits(1) && value <= slider.Limits(2)
            slider.Value = value;
        else
            set(hObject, 'String', num2str(slider.Value));
        end
    end
    
    

    % 输入文字转化为表达式
    function expr = change(inputText,fmSynth1,fmSynth2,fmSynth3,fmSynth4)
        function c = generate(a, b,fmSynth1,fmSynth2,fmSynth3,fmSynth4)
            % 定义 fmSynth 对象数组
            fmSynthArray = {fmSynth1, fmSynth2, fmSynth3, fmSynth4};
                
            % 根据 a 的值选择不同的逻辑
            if a == 1
                % 当 a == 1 时，根据 b(1) 选择 fmSynth 对象并生成波形
                c = fmSynthArray{str2double(b(1))}.generatewave(0, a);
            elseif a == 2
                % 当 a == 2 时，根据 b(1) 和 b(3) 选择 fmSynth 对象和参数，并生成波形
                synthIndex = str2double(b(1));  % 选择主 fmSynth 对象
                paramIndex = str2double(b(3));  % 选择参数 fmSynth 对象
                c = fmSynthArray{synthIndex}.generatewave(fmSynthArray{paramIndex}, a);
            else
                a = a - 1 ;
                d = b(3:length(b)-1);
                q = generate(a,d,fmSynth1,fmSynth2,fmSynth3,fmSynth4);
                c = fmSynthArray{str2double(b(1))}.generatewave(q, a + 1);
            end
        end
        a = 1;
        text = {};
        for i = 1:length(inputText)
            if inputText(i) == '+'
                text = cat(1, text, inputText(a:i-1));
                a = i + 1;
            elseif i == length(inputText)
                text = cat(1, text, inputText(a:i));
            end
        end
        for i = 1:numel(text)
            a = 0;
            b = text{i}
            for q = 1:length(b)
                if contains('123456789', b(q))
                    a = a + 1;
                end
                if b(q) == '0'
                    break
                end
            end
            if i == 1
                expr = generate(a,b,fmSynth1,fmSynth2,fmSynth3,fmSynth4);
            else
                p = generate(a,b,fmSynth1,fmSynth2,fmSynth3,fmSynth4);
                expr = expr + p;
            end
        end
        textHandle.String = char(expr)
    end
    
    
   
    
    % 生成波形数据的辅助函数
    function [t, y] = generateWaveformData(expr, period)
        syms t;
        minTime = min(period, 10);
        y = double(subs(expr, t, linspace(0, minTime, minTime*Fs)));
        t = linspace(0, minTime, minTime*Fs);
    end
end
