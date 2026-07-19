# 将本仓库中的「AI与跨境相关产品」同步到 N 盘
# 用法：在「仓库根目录」或本脚本所在目录打开 PowerShell 后执行：
#   Set-ExecutionPolicy -Scope Process Bypass; .\一键同步到N盘.ps1

$ErrorActionPreference = "Stop"

# 脚本所在目录 = 源目录
$src = $PSScriptRoot
if (-not (Test-Path (Join-Path $src "README.md"))) {
  Write-Error "未找到源文档目录，请确认脚本位于：...\AI与跨境相关产品\一键同步到N盘.ps1"
}

$dst = "N:\AI软件开发\日常开发文档\AI与跨境相关产品"
New-Item -ItemType Directory -Force -Path $dst | Out-Null

Write-Host "源: $src"
Write-Host "目标: $dst"
Write-Host "开始同步..."

robocopy $src $dst /E /R:2 /W:2 /NFL /NDL /NJH /NJS /nc /ns /np
$code = $LASTEXITCODE
# robocopy: 0-7 通常表示成功/有复制
if ($code -ge 8) {
  Write-Error "robocopy 失败，退出码=$code"
}

$count = (Get-ChildItem -Path $dst -Recurse -File).Count
Write-Host "完成。目标文件数: $count"
Write-Host "请打开: $dst"
