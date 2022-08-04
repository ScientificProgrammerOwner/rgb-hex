function hex = rgb2hex(rgb,varargin)
%{
    Features: Converting RGB to Hex using build-in functions.

    Input: rbg(1*3) or R,G,B
    Output: Hex according to RGB.
    
    EXAMPLES: 
    hex = rgb2hex([125 200 56;15 252 175])
    hex =
        '#7DC838'
        '#0FFCAF'
    
    hex = rgb2hex([125 200 56;15 252 175],'')
    hex =
        '7DC838'
        '0FFCAF'
    
    hex = rgb2hex([125 200 56;15 252 175],[])
    hex =
        '7DC838'
        '0FFCAF'

    hex = rgb2hex([125 200 56;15 252 175],'%')
    hex =
        '%7DC838'
        '%0FFCAF'

    hex = rgb2hex([125 200 56;15 252 175],'$')
    hex =
        '$7DC838'
        '$0FFCAF'
    
    Author(作者): 巴山(bashan)
    WeChat Official Account(微信公众号): 懂科学的程序员(ScientificProgrammer)
    Github: https://github.com/ScientificProgrammerOwner
    Youtube: https://www.youtube.com/channel/UC4U9cwe6FxRKec_0s5z0Wkw
    ZhiHu(知乎): https://www.zhihu.com/people/67-93-61-26-8
    BiliBili(B站): https://space.bilibili.com/205153905

    Welcome to subscribe! 欢迎订阅！
%}
hex = [];
narginchk(1,2);
switch(nargin)
    case 1
        validateattributes(rgb,{'numeric'},{'size',[NaN,3],'>=',0,'<=',255,'nonnan'});
        if max(rgb(:)) <= 1
            rgb = round(rgb*255);
        end
        nflag = '#';
    case 2
        validateattributes(rgb,{'numeric'},{'size',[NaN,3],'>=',0,'<=',255,'nonnan'});
        if max(rgb(:)) <= 1
            rgb = round(rgb*255);
        end
        nflag = varargin{1};
        if ~isempty(nflag)
            validateattributes(nflag,{'char'},{'numel',1});
        end
end

nrgb  = reshape(rgb',1,[]);
hrgb  = dec2hex(nrgb);
nhrgb = strjoin(cellstr(hrgb),'');
fhrgb = reshape(nhrgb,6,[])';
len   = size(fhrgb,1);
hex   = [repmat(nflag,len,1),fhrgb];

