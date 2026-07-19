# 同步到本地 N 盘说明

云端仓库路径：

```text
AI软件开发/日常开发文档/AI与跨境相关产品/
```

对应本地目标路径：

```text
N:\AI软件开发\日常开发文档\AI与跨境相关产品\
```

## Windows 同步方式（任选其一）

### 方式 A：直接复制

1. 从 GitHub 拉取或下载本仓库  
2. 将文件夹 `AI软件开发\日常开发文档\AI与跨境相关产品` 整体复制到 `N:\AI软件开发\日常开发文档\`  
3. 覆盖前建议先备份 N 盘旧版

### 方式 B：PowerShell 镜像同步

在仓库根目录执行（请按实际仓库路径修改 `$src`）：

```powershell
$src = "D:\your-repo\AI软件开发\日常开发文档\AI与跨境相关产品"
$dst = "N:\AI软件开发\日常开发文档\AI与跨境相关产品"
New-Item -ItemType Directory -Force -Path $dst | Out-Null
robocopy $src $dst /MIR /R:2 /W:2
```

> `/MIR` 会让目标与源完全一致（含删除）。首次建议先去掉 `/MIR`，改用 `/E` 只做增量复制。

### 方式 C：Git 直接放到 N 盘

```powershell
cd N:\AI软件开发\日常开发文档
git clone <你的仓库地址> temp-clone
# 将 temp-clone\AI软件开发\日常开发文档\AI与跨境相关产品 挪到当前目录
```

## 目录完整性自检

同步后应看到：

- `README.md`、`00-总览与实施路线图.md`、`同步到N盘说明.md`
- `01`～`10` 共 10 个项目文件夹
- 每个项目内 5 个文件：`README.md`、`01`～`04` 文档

共约 **52** 个 Markdown 文件。
