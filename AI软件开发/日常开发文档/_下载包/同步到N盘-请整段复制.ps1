# ============================================================
# 请整段选中后粘贴到 PowerShell（从上到下执行，不要倒序）
# 私有仓库需要已登录 GitHub（浏览器登录或 git credential）
# ============================================================
$ErrorActionPreference = "Stop"

$repoUrl = "https://github.com/gulingle/GULINGLE.git"
$branch  = "cursor/ai-crossborder-product-docs-2c9c"
$work    = Join-Path $env:TEMP ("GULINGLE-docs-" + (Get-Date -Format "yyyyMMddHHmmss"))
$dstRoot = "N:\AI软件开发\日常开发文档"
$dst     = Join-Path $dstRoot "AI与跨境相关产品"

Write-Host "1) 创建目录..."
New-Item -ItemType Directory -Force -Path $dstRoot | Out-Null
New-Item -ItemType Directory -Force -Path $work | Out-Null

Write-Host "2) 从 GitHub 拉取文档分支（若提示登录请完成授权）..."
git clone --depth 1 -b $branch $repoUrl $work
if ($LASTEXITCODE -ne 0) { throw "git clone 失败。请确认已安装 Git，且有 gulingle/GULINGLE 仓库权限。" }

$src = Join-Path $work "AI软件开发\日常开发文档\AI与跨境相关产品"
if (-not (Test-Path $src)) { throw "仓库中未找到文档目录: $src" }

Write-Host "3) 同步到 N 盘..."
if (Test-Path $dst) { Remove-Item -Recurse -Force $dst }
Copy-Item -Recurse -Force $src $dst

$count = (Get-ChildItem $dst -Recurse -File).Count
Write-Host "完成！文件数: $count"
Write-Host "路径: $dst"
explorer $dst
