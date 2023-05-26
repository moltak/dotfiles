--hs.hotkey.bind({'shift', 'cmd'}, 'H', function() hs.alert.show('Hello, world!') end)
-- comment

hs.hotkey.bind({'option', 'cmd'}, 'r', hs.reload)

hs.hotkey.bind({'shift', 'option'}, 'C', function()
    hs.application.launchOrFocus('Google Chrome')
end)

hs.hints.hintChars = {'1', '2', '3', '4', 'Q', 'W', 'E', 'R'}
hs.hotkey.bind({'cmd'}, 'F2', hs.hints.windowHints)

local logger = hs.logger.new('logger', 'debug')

local function move_win_to_left()
    local win = hs.window.focusedWindow()   -- 현재 활성화된 앱의 윈도우
    local frame = win:frame()
    local screen = win:screen():frame()     -- 현재 화면

    if frame.x == 0 then
      frame.h = screen.h
    end

    frame.x = screen.x
    --frame.y = screen.y
    --frame.w = screen.w / 2      -- width를 화면의 1/2 로 조정
    --frame.h = screen.h
    win:setFrame(frame)
end


local function move_win_to_right()
    local win = hs.window.focusedWindow()
    local frame = win:frame()
    local screen = win:screen():frame()

    local half = screen.x + (screen.w / 2)
    
    if frame.x == half then
      frame.h = screen.h
    end

    frame.x = half
    --frame.y = screen.y
    --frame.w = screen.w / 2      -- width를 화면의 1/2 로 조정
    --frame.h = screen.h
    win:setFrame(frame)
end

local function move_win_to_up()
    local win = hs.window.focusedWindow()
    local frame = win:frame()
    local screen = win:screen():frame()
    --frame.x = screen.x
    frame.y = 0 -- y를 탑으로 조정
    --frame.w = screen.w
    frame.h = screen.h / 2 
    win:setFrame(frame)
end

local function move_win_to_down()
    local win = hs.window.focusedWindow()
    local frame = win:frame()
    local screen = win:screen():frame()
    --frame.x = screen.x
    frame.y = screen.y + (screen.h / 2) -- y를 중간으로 조정
    --frame.w = screen.w
    frame.h = screen.h / 2
    win:setFrame(frame)
end

local function resize_to_full_screen()
    local win = hs.window.focusedWindow()
    local frame = win:frame()
    local screen = win:screen():frame()
    frame.x = screen.x
    frame.y = screen.y
    frame.w = screen.w
    frame.h = screen.h
    win:setFrame(frame)
end

-- tmux 처럼 커맨드 명령어에 들어가서 대기하도록 할 수 없을까?
hs.hotkey.bind({'option', 'shift'}, 'h', move_win_to_left)
hs.hotkey.bind({'option', 'shift'}, 'k', move_win_to_up)
hs.hotkey.bind({'option', 'shift'}, 'j', move_win_to_down)
hs.hotkey.bind({'option', 'shift'}, 'l', move_win_to_right)

hs.hotkey.bind({'option', 'control'}, 'f', resize_to_full_screen)


-- https://johngrib.github.io/blog/2017/05/04/input-source/
local inputEnglish = "com.apple.keylayout.ABC"

local input_source = hs.keycodes.currentSourceID()

if not (input_source == inputEnglish) then
    hs.eventtap.keyStroke({}, 'right')
    hs.keycodes.currentSourceID(inputEnglish)
end

hs.eventtap.keyStroke({'control'}, 'c')

--
-- 한영 오로라
local boxes = {}
-- 자신이 사용하고 있는 English 인풋 소스 이름을 넣어준다
local inputEnglish = "com.apple.keylayout.ABC"
local box_height = 23
local box_alpha = 0.35
local GREEN = hs.drawing.color.osx_green

-- 입력소스 변경 이벤트에 이벤트 리스너를 달아준다
hs.keycodes.inputSourceChanged(function()
    disable_show()
    if hs.keycodes.currentSourceID() ~= inputEnglish then
        enable_show()
    end
end)

function enable_show()
    reset_boxes()
    hs.fnutils.each(hs.screen.allScreens(), function(scr)
        local frame = scr:fullFrame()

        local box = newBox()
        draw_rectangle(box, frame.x, frame.y, frame.w, box_height, GREEN)
        table.insert(boxes, box)

        -- 이 부분의 주석을 풀면 화면 아래쪽에도 보여준다
        -- local box2 = newBox()
        -- draw_rectangle(box2, frame.x, frame.y + frame.h - 10, frame.w, box_height, GREEN)
        -- table.insert(boxes, box2)
    end)
end

function disable_show()
    hs.fnutils.each(boxes, function(box)
        if box ~= nil then
            box:delete()
        end
    end)
    reset_boxes()
end

function newBox()
    return hs.drawing.rectangle(hs.geometry.rect(0,0,0,0))
end

function reset_boxes()
    boxes = {}
end

function draw_rectangle(target_draw, x, y, width, height, fill_color)
  target_draw:setSize(hs.geometry.rect(x, y, width, height))
  target_draw:setTopLeft(hs.geometry.point(x, y))

  target_draw:setFillColor(fill_color)
  target_draw:setFill(true)
  target_draw:setAlpha(box_alpha)
  target_draw:setLevel(hs.drawing.windowLevels.overlay)
  target_draw:setStroke(false)
  target_draw:setBehavior(hs.drawing.windowBehaviors.canJoinAllSpaces)
  target_draw:show()
end
