# 同步到 N 盘（私有仓库专用）

仓库 `gulingle/GULINGLE` 为 **Private**，浏览器匿名下载 Release 会 **404**。  
请用下面「整段复制」脚本（依赖本机已安装 Git，且你有该仓库权限）。

## 推荐：PowerShell 整段执行

打开 PowerShell，**从上到下整段粘贴**（不要从下往上）：

```powershell
$ErrorActionPreference = "Stop"
$repoUrl = "https://github.com/gulingle/GULINGLE.git"
$branch  = "cursor/ai-crossborder-product-docs-2c9c"
$work    = Join-Path $env:TEMP ("GULINGLE-docs-" + (Get-Date -Format "yyyyMMddHHmmss"))
$dstRoot = "N:\AI软件开发\日常开发文档"
$dst     = Join-Path $dstRoot "AI与跨境相关产品"
New-Item -ItemType Directory -Force -Path $dstRoot,$work | Out-Null
git clone --depth 1 -b $branch $repoUrl $work
if ($LASTEXITCODE -ne 0) { throw "git clone 失败" }
$src = Join-Path $work "AI软件开发\日常开发文档\AI与跨境相关产品"
Copy-Item -Recurse -Force $src $dst
(Get-ChildItem $dst -Recurse -File).Count
explorer $dst
```

成功时 Count 应约 **50+**。

## 若 git clone 要求登录

- 安装 GitHub Desktop 并登录你的账号后重试；或  
- 在 https://github.com/settings/tokens 创建 token，clone 时用户名填 GitHub 用户名、密码填 token。

## 备选：浏览器下载 zip（需已登录 GitHub）

登录 GitHub 后打开：

https://github.com/gulingle/GULINGLE/archive/refs/heads/cursor/ai-crossborder-product-docs-2c9c.zip

解压后把其中的：

`AI软件开发\日常开发文档\AI与跨境相关产品`

复制到：

`N:\AI软件开发\日常开发文档\AI与跨境相关产品`
