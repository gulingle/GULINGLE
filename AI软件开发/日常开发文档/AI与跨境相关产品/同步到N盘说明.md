# 为什么 N 盘是空的？

本次开发在 **Cursor 云端 Linux 环境** 完成，**无法直接写入你电脑上的 `N:\` 盘**。  
文档已写在 GitHub 仓库分支 `cursor/ai-crossborder-product-docs-2c9c` 中，需要你本机拉取/解压一次。

# 最快方式：解压 ZIP 到 N 盘（推荐）

1. 下载产物：`AI与跨境相关产品.zip`（Cloud Agent Artifacts / 对话附件）
2. 在本机 PowerShell 执行：

```powershell
New-Item -ItemType Directory -Force -Path "N:\AI软件开发\日常开发文档" | Out-Null
Expand-Archive -Path "$env:USERPROFILE\Downloads\AI与跨境相关产品.zip" -DestinationPath "N:\AI软件开发\日常开发文档" -Force
explorer "N:\AI软件开发\日常开发文档\AI与跨境相关产品"
```

若 zip 不在 Downloads，把路径改成你实际下载位置。

解压后应看到 `01`～`10` 共 10 个文件夹，以及 `README.md`、`00-总览与实施路线图.md`。

# 方式二：从 GitHub 拉取后一键同步

```powershell
cd $env:TEMP
git clone -b cursor/ai-crossborder-product-docs-2c9c https://github.com/gulingle/GULINGLE.git GULINGLE-docs
cd .\GULINGLE-docs\AI软件开发\日常开发文档\AI与跨境相关产品
Set-ExecutionPolicy -Scope Process Bypass
.\一键同步到N盘.ps1
```

# 方式三：手动复制

把仓库里的文件夹：

`...\AI软件开发\日常开发文档\AI与跨境相关产品\`

整目录复制到：

`N:\AI软件开发\日常开发文档\AI与跨境相关产品\`

# 自检

```powershell
(Get-ChildItem "N:\AI软件开发\日常开发文档\AI与跨境相关产品" -Recurse -File).Count
# 预期约 50+ 个文件
```
