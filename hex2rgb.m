function rgb = hex2rgb(hex,varargin)
%{
    Features: Converting Hex to RGB using build-in functions.

    Input: hex   -- the hex char arrays
           nflag -- indicates the value range of RGB, '01'('0-1') or '0255'('0-255')(default).
           
    Output: RGB(m*3).
    
    rgb = hex2rgb('#7DC83B')
    rgb = 125   200    59

    rgb = hex2rgb('7DC83B')
    rgb = 125   200    59

    rgb = hex2rgb('#7DC83B','01') or rgb = hex2rgb('#7DC83B','0-1')
    rgb = 0.4902    0.7843    0.2314

    rgb = hex2rgb('#7DC83B','0255') or rgb = hex2rgb('#7DC83B','0-255')
    rgb = 125   200    59

    rgb = ['#7DC83B';'#0FD9B0';'#7DF538';'#0FFDAF'];
    rgb = hex2rgb(rgb)
    rgb = 125   200    59
           15   217   176
          125   245    56
           15   253   175

    rgb = {'#7DC83B';'#0FD9B0';'#7DF538';'#0FFDAF'}; 
    rgb = hex2rgb(rgb)
    rgb = 125   200    59
           15   217   176
          125   245    56
           15   253   175

    Author(作者): 巴山(bashan)
    WeChat Official Account(微信公众号): 懂科学的程序员(ScientificProgrammer)
    Github: https://github.com/ScientificProgrammerOwner
    Youtube: https://www.youtube.com/channel/UC4U9cwe6FxRKec_0s5z0Wkw
    ZhiHu(知乎): https://www.zhihu.com/people/67-93-61-26-8
    BiliBili(B站): https://space.bilibili.com/205153905

    Welcome to subscribe! 欢迎订阅！
%}
rgb = [];
narginchk(1,2);

switch(nargin)
    case 1
        if ischar(hex)
            try
                validateattributes(hex,{'char'},{'size',[NaN,6],'nonempty'});
            catch
                validateattributes(hex,{'char'},{'size',[NaN,7],'nonempty'});
                hex(:,1) = [];
            end
        elseif iscell(hex)
            if isrow(hex)
                hex = hex';
            end
            switch(length(hex{1,1}))
                case 6
                    hex = cell2mat(hex);
                case 7
                    hex = cell2mat(hex);
                    hex(:,1) = [];
                otherwise
                   error('The length of the cell sub-element can only be 6 or 7!') 
            end 
        else
            error('The data type of input hex can only be char or cell!');
        end
        nflag = '0255';
    case 2
        if ischar(hex)
            try
                validateattributes(hex,{'char'},{'size',[NaN,6],'nonempty'});
            catch
                validateattributes(hex,{'char'},{'size',[NaN,7],'nonempty'});
                hex(:,1) = [];
            end
        elseif iscell(hex)
            if isrow(hex)
                hex = hex';
            end
            switch(length(hex{1,1}))
                case 6
                    hex = cell2mat(hex);
                case 7
                    hex = cell2mat(hex);
                    hex(:,1) = [];
                otherwise
                    error('The length of the cell sub-element can only be 6 or 7!')
            end
        else
            error('The data type of input hex can only be char or cell!');
        end
        nflag = varargin{1};
        switch(nflag)
            case {'01','0-1'}
                nflag = '01';
            case {'0255','0-255'}
                nflag = '0255';
            otherwise
                error('The range of RGB can only be ''01''(''0-1'') or ''0255''(''0-255'')!');
        end
end
nhex = strjoin(cellstr(hex),'');
nhex = reshape(nhex,2,[])';
trgb = hex2dec(nhex);
switch nflag
    case {'0255','0-255'}
        rgb  = reshape(trgb,3,[])';
    case {'01','0-1'}
        rgb  = reshape(trgb,3,[])'/255;
end


