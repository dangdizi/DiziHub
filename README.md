# Dizi UI Hacking roblox

Phiên bản: D2.0


Người thiết kế: Đăng Dizi


Liên hệ: +84789424036


Bộ Framework cơ bản dành cho các DEV tiết kiệm thời gian để phát triển script hack roblox của mình.


Framework hoạt động độc lập, bạn phải tự code logic, flag để gán vào framework, UI không có sẵn các chức năng hack / cheats.

## Cách dùng
### 1. Khởi tạo gui
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/dangdizi/DiziHub/refs/heads/main/UI-D2.0.lua"))()
local DiziGui = Dizi:new()
```

Lúc này, bạn đã có thể nhìn thấy GUI xuất hiện trên màn hình, tiếp theo là một số hàm để bạn có thể thay đổi tùy thích, hoặc bạn có thể bỏ qua để dùng mặc định của UI.
```lua
DiziGui:setTitle("Tên hiển thị trên header của GUI")
DiziGui:setLogo("Image Id trong roblox")
```
### 2. Tạo - Gắn Tab cho Action
Tab là bảng chọn chức năng, khi click vào Tab bên trái, thì Action (Tổ hợp chức năng sẻ hiển thị sang bên phải).


Action là một Frame chứa các tổ hợp chức năng của bạn có thể tạo.
```lua
local TeleportAction = DiziGui:createAction()
-- hoặc
local TeleportAction = DiziGui:createAction(true)
```

nếu là *true* thì Action sẽ được hiển thị làm trang chủ, khi mở UI thì action đó sẽ được hiển thị đầu tiên, có thể để trống.

```lua
local TeleportTab = DiziGui:createTab("rbxassetid://133458018032042", "Teleport")
TeleportTab:setAction(TeleportAction)
```

### 3. Các chức năng tạo Action
Chúng ta sẽ có các chức năng gồm:

- Tạo dòng text: ```createText(text, color: Color3)```
- Tạo dòng label: ```createLabel(text, color: Color3)```
- Tạo dòng ngăn cách: ```createHr()```
- Tạo nút bật / tắt: ```createToggleSwitch(label, callble)```
- Tạo nút bấm: ```createButton(label, text, callble)```
- Tạo menu chọn: ```createDropdown(label, list: {{label = "quests", value = "result"}}, callable)```

Dưới đây là một số ví dụ về các chức năng kèm logic cơ bản

```lua
-- Tạo label
TeleportAction:createLabel("Dịch chuyển", Color3.fromRGB(255,255,255))

-- Tạo nút dịch chuyển
TeleportAction:createButton("Vào sea 1", "Di chuyển", function ()
  print ("Đã thực hiện lệnh vào sea 1")
end)

-- Tạo ngăn cách
teleportAction:createHr()

-- Tạo dòng text
teleportAction:createText("Dưới đây là dịch tới vị trí", Color3.fromRGB(255,255,255))

-- Tạo menu chọn
teleportAction:createLabel("Dịch chuyển đảo")
teleportAction:createDropdown("Chọn đảo", {
  {label = "đảo 1", value = "1"},
  {label = "đảo 2", value = "2"},
  {label = "đảo 3", value = "3"},
}, function (data)
  print(data.value)
end)

-- Tạo nút bật tẳt
local flag = false
DiziGui:createToggleSwitch("Auto Farm", function (status)
  flag = status
  if (status) then
    while true do
      if (flag) then
        print ("Đang Farm")
        wait(1)
      end
    end
  end
end)
```

#### Dưới đây là tổng hợp code ở trên, các bạn thử copy paste xem có hoạt động không nhé!
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/dangdizi/DiziHub/refs/heads/main/UI-D2.0.lua"))()
local DiziGui = Dizi:new()

local TeleportAction = DiziGui:createAction(true)

local TeleportTab = DiziGui:createTab("rbxassetid://133458018032042", "Teleport")
TeleportTab:setAction(TeleportAction)


-- Tạo label
TeleportAction:createLabel("Dịch chuyển", Color3.fromRGB(255,255,255))

-- Tạo nút dịch chuyển
TeleportAction:createButton("Vào sea 1", "Di chuyển", function ()
  print ("Đã thực hiện lệnh vào sea 1")
end)

-- Tạo ngăn cách
teleportAction:createHr()

-- Tạo dòng text
teleportAction:createText("Dưới đây là dịch tới vị trí", Color3.fromRGB(255,255,255))

-- Tạo menu chọn
teleportAction:createLabel("Dịch chuyển đảo")
teleportAction:createDropdown("Chọn đảo", {
  {label = "đảo 1", value = "1"},
  {label = "đảo 2", value = "2"},
  {label = "đảo 3", value = "3"},
}, function (data)
  print(data.value)
end)

-- Tạo nút bật tẳt
local flag = false
DiziGui:createToggleSwitch("Auto Farm", function (status)
  flag = status
  if (status) then
    while true do
      if (flag) then
        print ("Đang Farm")
        wait(1)
      end
    end
  end
end)


```
