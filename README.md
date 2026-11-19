<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>GULINGLE · GitHub Profile Live Preview &amp; Studio</title>
  <!-- Tailwind CSS -->
  <script src="https://cdn.tailwindcss.com"></script>
  <!-- Google Fonts: Inter & JetBrains Mono -->
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&family=JetBrains+Mono:wght@400;500;600;700&display=swap" rel="stylesheet" />
  <style>
    body {
      font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, Arial, sans-serif;
    }
    .font-mono-code {
      font-family: 'JetBrains Mono', ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace;
    }
    /* Custom subtle scrollbar */
    ::-webkit-scrollbar {
      width: 6px;
      height: 6px;
    }
    ::-webkit-scrollbar-track {
      background: rgba(15, 23, 42, 0.4);
    }
    ::-webkit-scrollbar-thumb {
      background: rgba(71, 85, 105, 0.6);
      border-radius: 9999px;
    }
    ::-webkit-scrollbar-thumb:hover {
      background: rgba(100, 116, 139, 0.85);
    }
    /* Knowledge graph animated dash flow */
    @keyframes kgDashFlow {
      to {
        stroke-dashoffset: -36;
      }
    }
    .kg-edge-animated {
      stroke-dasharray: 6 6;
      animation: kgDashFlow 1.6s linear infinite;
    }
  </style>
</head>
<body class="bg-[#010409] text-[#e6edf3] min-h-screen flex flex-col selection:bg-rose-500/30 selection:text-rose-200">

  <!-- =====================================================================
       1. TOP CUSTOMIZER CONTROL BAR
       ===================================================================== -->
  <header class="sticky top-0 z-40 bg-[#0d1117]/95 backdrop-blur-md border-b border-[#30363d] px-3 sm:px-6 py-2.5 shadow-lg">
    <div class="max-w-[1320px] mx-auto flex flex-wrap items-center justify-between gap-2.5">
      <!-- Left Brand & Status -->
      <div class="flex items-center gap-2.5">
        <span class="inline-flex items-center justify-center w-7 h-7 rounded-lg bg-rose-500/15 border border-rose-400/40 text-rose-300 font-mono-code text-xs font-bold">
          &gt;_
        </span>
        <div>
          <div class="flex items-center gap-2">
            <span class="text-xs sm:text-sm font-bold text-white tracking-tight">GULINGLE · GitHub 主页预览与源码工坊</span>
            <span class="hidden md:inline-block text-[11px] font-mono-code px-2 py-0.5 rounded-full bg-rose-500/10 text-rose-300 border border-rose-400/30">
              EDITORIAL UI
            </span>
          </div>
        </div>
      </div>

      <!-- Center Interactive Toggles -->
      <div class="flex flex-wrap items-center gap-1.5 sm:gap-2 text-xs">
        <!-- Theme Toggle -->
        <div class="inline-flex rounded-lg bg-[#161b22] p-0.5 border border-[#30363d]">
          <button id="btn-theme-dark" type="button" onclick="setTheme('dark')"
            class="px-2.5 py-1 rounded-md font-medium bg-[#21262d] text-white shadow-sm transition-colors">
            🌙 Dark
          </button>
          <button id="btn-theme-light" type="button" onclick="setTheme('light')"
            class="px-2.5 py-1 rounded-md font-medium text-[#8b949e] hover:text-white transition-colors">
            ☀️ Light
          </button>
        </div>

        <!-- Language Toggle -->
        <button id="btn-lang-toggle" type="button" onclick="toggleLang()"
          class="px-2.5 py-1.5 rounded-lg font-medium bg-[#161b22] hover:bg-[#21262d] text-[#c9d1d9] border border-[#30363d] transition-colors">
          🌐 中英双语
        </button>

        <!-- Section Visibility Toggles -->
        <button id="btn-toggle-arch" type="button" onclick="toggleSection('arch')"
          class="px-2.5 py-1.5 rounded-lg font-medium bg-emerald-500/15 text-emerald-300 border border-emerald-500/40 transition-colors">
          ✓ 知识图谱架构
        </button>
        <button id="btn-toggle-stats" type="button" onclick="toggleSection('stats')"
          class="px-2.5 py-1.5 rounded-lg font-medium bg-emerald-500/15 text-emerald-300 border border-emerald-500/40 transition-colors">
          ✓ 数据看板
        </button>
        <button id="btn-toggle-pins" type="button" onclick="toggleSection('pins')"
          class="px-2.5 py-1.5 rounded-lg font-medium bg-emerald-500/15 text-emerald-300 border border-emerald-500/40 transition-colors">
          ✓ 四宫格置顶
        </button>
      </div>

      <!-- Right Action Buttons -->
      <div class="flex items-center gap-2">
        <button type="button" onclick="openGifStudioModal()"
          class="px-3 py-1.5 rounded-lg text-xs font-semibold bg-rose-500/20 hover:bg-rose-500/30 text-rose-200 border border-rose-400/50 transition-colors flex items-center gap-1.5 shadow-sm">
          <span>🎬</span>
          <span>生成动态 GIF</span>
        </button>
        <button type="button" onclick="openMarkdownModal()"
          class="px-3 py-1.5 rounded-lg text-xs font-medium bg-[#161b22] hover:bg-[#21262d] text-[#c9d1d9] border border-[#30363d] transition-colors">
          查看完整代码
        </button>
        <button id="btn-copy-readme" type="button" onclick="copyReadmeMarkdown()"
          class="px-3 py-1.5 rounded-lg text-xs font-semibold bg-[#238636] hover:bg-[#2ea043] text-white border border-emerald-400/30 transition-colors shadow-sm">
          📋 复制 README.md
        </button>
      </div>
    </div>
  </header>

  <!-- =====================================================================
       2. SIMULATED GITHUB PROFILE NAVIGATION TABS
       ===================================================================== -->
  <nav id="gh-subnav" class="bg-[#010409] border-b border-[#30363d] px-4 sm:px-8 pt-3 transition-colors">
    <div class="max-w-[1240px] mx-auto flex items-center gap-5 overflow-x-auto text-xs sm:text-sm">
      <div class="pb-2.5 border-b-2 border-[#f78166] font-semibold flex items-center gap-1.5 whitespace-nowrap">
        <svg class="w-4 h-4 opacity-80" fill="currentColor" viewBox="0 0 16 16"><path d="M2 2.5A2.5 2.5 0 0 1 4.5 0h8.75a.75.75 0 0 1 .75.75v12.5a.75.75 0 0 1-.75.75h-2.5a.75.75 0 0 1 0-1.5h1.75v-2h-8a1 1 0 0 0-.714 1.7.75.75 0 1 1-1.072 1.05A2.495 2.495 0 0 1 2 11.5Zm10.5-1h-8a1 1 0 0 0-1 1v6.708A2.486 2.486 0 0 1 4.5 9h8ZM5 12.25a.25.25 0 0 1 .25-.25h3.5a.25.25 0 0 1 .25.25v3.25a.25.25 0 0 1-.4.2l-1.45-1.087a.249.249 0 0 0-.3 0L5.4 15.7a.25.25 0 0 1-.4-.2Z"/></svg>
        <span>Overview</span>
      </div>
      <div class="pb-2.5 opacity-75 hover:opacity-100 flex items-center gap-1.5 whitespace-nowrap cursor-pointer">
        <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 16 16"><path d="M2 2.5A2.5 2.5 0 0 1 4.5 0h8.75a.75.75 0 0 1 .75.75v12.5a.75.75 0 0 1-.75.75h-2.5a.75.75 0 0 1 0-1.5h1.75v-2h-8a1 1 0 0 0-.714 1.7.75.75 0 1 1-1.072 1.05A2.495 2.495 0 0 1 2 11.5Zm10.5-1h-8a1 1 0 0 0-1 1v6.708A2.486 2.486 0 0 1 4.5 9h8Z"/></svg>
        <span>Repositories</span>
        <span class="px-1.5 py-0.2 rounded-full text-[11px] bg-[#30363d]/70">12</span>
      </div>
      <div class="pb-2.5 opacity-75 hover:opacity-100 flex items-center gap-1.5 whitespace-nowrap cursor-pointer">
        <span>Projects</span>
      </div>
      <div class="pb-2.5 opacity-75 hover:opacity-100 flex items-center gap-1.5 whitespace-nowrap cursor-pointer">
        <span>Packages</span>
      </div>
      <div class="pb-2.5 opacity-75 hover:opacity-100 flex items-center gap-1.5 whitespace-nowrap cursor-pointer">
        <span>Stars</span>
        <span class="px-1.5 py-0.2 rounded-full text-[11px] bg-[#30363d]/70">48</span>
      </div>
    </div>
  </nav>

  <!-- =====================================================================
       3. MAIN TWO-COLUMN GITHUB PROFILE WORKSPACE
       ===================================================================== -->
  <main id="gh-main-container" class="flex-1 bg-[#0d1117] text-[#e6edf3] px-4 sm:px-8 py-6 sm:py-8 transition-colors">
    <div class="max-w-[1240px] mx-auto grid grid-cols-1 lg:grid-cols-12 gap-6 lg:gap-8">

      <!-- =================================================================
           LEFT SIDEBAR (USER PROFILE INFO & ORIGINAL HUSKY AVATAR)
           ================================================================= -->
      <aside class="lg:col-span-3 space-y-4">
        <div class="flex lg:block items-center gap-4">
          <div class="group relative w-24 h-24 sm:w-32 sm:h-32 lg:w-64 lg:h-64 rounded-full overflow-hidden border-2 border-[#30363d] shadow-xl bg-[#161b22] shrink-0 mx-auto lg:mx-0">
            <!-- Custom Uploaded Image Layer -->
            <img id="avatar-custom-img" alt="GULINGLE Avatar" class="w-full h-full object-cover hidden" />

            <!-- Default Illustrated Husky with Iced Coffee & ID Badge (Matches Original Avatar) -->
            <svg id="avatar-default-svg" viewBox="0 0 260 260" class="w-full h-full block" xmlns="http://www.w3.org/2000/svg">
              <defs>
                <radialGradient id="officeBg" cx="50%" cy="40%" r="70%">
                  <stop offset="0%" stop-color="#334155" />
                  <stop offset="100%" stop-color="#0f172a" />
                </radialGradient>
                <linearGradient id="coffeeCup" x1="0%" y1="0%" x2="100%" y2="0%">
                  <stop offset="0%" stop-color="#3b1d0e" />
                  <stop offset="50%" stop-color="#1e0d05" />
                  <stop offset="100%" stop-color="#451a03" />
                </linearGradient>
              </defs>
              <rect width="260" height="260" fill="url(#officeBg)" />
              <rect x="0" y="175" width="260" height="85" fill="#1e293b" />
              <rect x="14" y="132" width="58" height="12" rx="3" fill="#475569" opacity="0.55" transform="rotate(-12 14 132)" />
              <ellipse cx="122" cy="198" rx="76" ry="68" fill="#f8fafc" />
              <path d="M55 185 Q75 135 122 135 Q168 135 188 185 Z" fill="#cbd5e1" />
              <polygon points="74,95 62,38 106,72" fill="#1e293b" />
              <polygon points="78,86 70,50 98,74" fill="#fbcfe8" opacity="0.7" />
              <polygon points="168,95 182,38 138,72" fill="#1e293b" />
              <polygon points="164,86 174,50 146,74" fill="#fbcfe8" opacity="0.7" />
              <ellipse cx="122" cy="108" rx="54" ry="48" fill="#1e293b" />
              <path d="M76 112 Q84 78 108 86 Q122 92 136 86 Q160 78 168 112 Q168 150 122 152 Q76 150 76 112 Z" fill="#f8fafc" />
              <polygon points="122,68 114,92 130,92" fill="#f8fafc" />
              <ellipse cx="104" cy="92" rx="4.5" ry="3" fill="#f8fafc" />
              <ellipse cx="140" cy="92" rx="4.5" ry="3" fill="#f8fafc" />
              <circle cx="103" cy="104" r="6" fill="#0f172a" />
              <circle cx="105" cy="102" r="2" fill="#38bdf8" />
              <circle cx="141" cy="104" r="6" fill="#0f172a" />
              <circle cx="143" cy="102" r="2" fill="#38bdf8" />
              <ellipse cx="122" cy="122" rx="9" ry="6.5" fill="#0f172a" />
              <path d="M108 132 Q122 142 136 132" stroke="#334155" stroke-width="2.5" fill="none" stroke-linecap="round" />
              <path d="M92 146 L114 192 L130 192 L152 146" stroke="#15803d" stroke-width="6" fill="none" />
              <rect x="103" y="188" width="38" height="48" rx="4" fill="#f1f5f9" stroke="#94a3b8" stroke-width="1.5" />
              <circle cx="122" cy="207" r="10" fill="#64748b" />
              <rect x="110" y="222" width="24" height="4" rx="2" fill="#0f172a" />
              <ellipse cx="152" cy="186" rx="22" ry="15" fill="#f8fafc" stroke="#cbd5e1" stroke-width="1.5" />
              <line x1="176" y1="92" x2="168" y2="132" stroke="#16a34a" stroke-width="4.5" stroke-linecap="round" />
              <polygon points="146,128 194,128 187,196 153,196" fill="url(#coffeeCup)" stroke="#e2e8f0" stroke-width="1.5" />
              <ellipse cx="170" cy="128" rx="24" ry="5" fill="#cbd5e1" opacity="0.85" />
              <rect x="155" y="133" width="11" height="10" rx="2" fill="#e0f2fe" opacity="0.45" transform="rotate(12 155 133)" />
              <rect x="171" y="135" width="12" height="10" rx="2" fill="#e0f2fe" opacity="0.4" transform="rotate(-10 171 135)" />
              <circle cx="170" cy="162" r="13" fill="#15803d" stroke="#f8fafc" stroke-width="1.2" />
              <circle cx="170" cy="162" r="6" fill="#f8fafc" />
            </svg>

            <!-- Hover Action to Load User's Exact Local Avatar File -->
            <label for="avatar-file-input"
              class="opacity-0 group-hover:opacity-100 transition-opacity absolute inset-0 bg-black/70 flex flex-col items-center justify-center text-center p-2 cursor-pointer text-white">
              <span class="text-lg mb-1">📷</span>
              <span class="text-xs font-semibold">载入本地原头像</span>
              <span class="text-[10px] text-slate-300 mt-0.5">支持 JPG / PNG / WebP</span>
            </label>
            <input id="avatar-file-input" type="file" accept="image/*" class="hidden" onchange="handleAvatarUpload(event)" />
          </div>

          <!-- Name & Handle -->
          <div class="lg:mt-4">
            <h1 class="text-xl sm:text-2xl font-bold tracking-tight leading-tight">GULINGLE</h1>
            <p class="text-base sm:text-lg text-[#8b949e] font-light">gulingle</p>
          </div>
        </div>

        <!-- Bio -->
        <p class="text-sm leading-relaxed">
          Founder &amp; AI Builder | Creator of GUKi. Architecting multi-model agent workspaces, autonomous indie sites &amp; full-stack growth engines.
        </p>

        <!-- Edit Profile Button -->
        <button type="button" onclick="showToast('提示：你的 Bio 长度 136/160 字符，布局已达到最佳比例！')"
          class="w-full py-1.5 px-3 rounded-md text-xs font-semibold bg-[#21262d] hover:bg-[#30363d] text-[#c9d1d9] border border-[#30363d] transition-colors">
          Edit profile
        </button>

        <!-- Followers & Meta Links -->
        <div class="space-y-2 text-xs text-[#8b949e] pt-1">
          <div class="flex items-center gap-1.5">
            <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 16 16"><path d="M2 5.5a3.5 3.5 0 1 1 5.898 2.549 5.508 5.508 0 0 1 3.034 4.084.75.75 0 1 1-1.482.235 4 4 0 0 0-7.9 0 .75.75 0 0 1-1.482-.236A5.507 5.507 0 0 1 3.102 8.05 3.493 3.493 0 0 1 2 5.5ZM11 4a3.001 3.001 0 0 1 2.22 5.018 5.01 5.01 0 0 1 2.56 3.012.749.749 0 0 1-.885.954.752.752 0 0 1-.549-.514 3.507 3.507 0 0 0-2.522-2.372.75.75 0 0 1-.574-.73v-.352a.75.75 0 0 1 .416-.672A1.5 1.5 0 0 0 11 5.5.75.75 0 0 1 11 4Zm-5.5-.5a2 2 0 1 0-.001 3.999A2 2 0 0 0 5.5 3.5Z"/></svg>
            <span><strong class="text-[#e6edf3]">1</strong> follower · <strong class="text-[#e6edf3]">5</strong> following</span>
          </div>
          <div class="flex items-center gap-2">
            <span>🏢</span>
            <span>GULINGLE</span>
          </div>
          <div class="flex items-center gap-2">
            <span>🔗</span>
            <a href="https://gulingle.cn" target="_blank" rel="noopener" class="hover:text-rose-300 hover:underline">https://gulingle.cn</a>
          </div>
          <div class="flex items-center gap-2">
            <span>𝕏</span>
            <a href="https://x.com/GULINGLE" target="_blank" rel="noopener" class="hover:text-rose-300 hover:underline">@GULINGLE</a>
          </div>
        </div>

        <!-- Achievements -->
        <div class="pt-3 border-t border-[#30363d]">
          <h2 class="text-xs font-semibold uppercase tracking-wider text-[#8b949e] mb-2.5">Achievements</h2>
          <div class="flex items-center gap-2">
            <div class="w-12 h-12 rounded-full bg-gradient-to-tr from-pink-500 via-purple-500 to-cyan-400 p-0.5 shadow-md" title="YOLO Achievement">
              <div class="w-full h-full rounded-full bg-[#0d1117] flex items-center justify-center text-[10px] font-extrabold text-transparent bg-clip-text bg-gradient-to-r from-pink-400 to-cyan-300">
                YOLO
              </div>
            </div>
            <div class="w-12 h-12 rounded-full bg-gradient-to-tr from-rose-400 to-amber-300 p-0.5 shadow-md" title="Pull Shark / Private Contributions Unlocked">
              <div class="w-full h-full rounded-full bg-[#0d1117] flex items-center justify-center text-base">
                🦈
              </div>
            </div>
          </div>
        </div>
      </aside>

      <!-- =================================================================
           RIGHT MAIN COLUMN (README.md + PINNED REPOS + CONTRIBUTION GRAPH)
           ================================================================= -->
      <section class="lg:col-span-9 space-y-6">

        <!-- README.md Container Card -->
        <div id="readme-card" class="rounded-xl border border-[#30363d] bg-[#0d1117] overflow-hidden shadow-xl transition-colors">
          <!-- README Top File Bar -->
          <div class="px-4 py-2.5 border-b border-[#30363d] flex items-center justify-between text-xs font-mono-code text-[#8b949e] bg-[#161b22]/60">
            <div class="flex items-center gap-2">
              <span class="w-2.5 h-2.5 rounded-full bg-rose-400 animate-pulse"></span>
              <span>GULINGLE / <strong class="text-[#e6edf3]">README.md</strong></span>
            </div>
            <button type="button" onclick="openMarkdownModal()" class="hover:text-rose-300 transition-colors" title="查看并复制 Markdown">
              ✏️ Edit / Raw
            </button>
          </div>

          <!-- README Rendered Content -->
          <div class="p-4 sm:p-6 lg:p-7 space-y-7">

            <!-- 1. HERO BANNER: CINEMATIC PARTED CLIFF & EDITORIAL TECH UI TYPOGRAPHY -->
            <div class="group relative w-full aspect-[16/5] min-h-[210px] sm:min-h-[255px] rounded-xl overflow-hidden border border-[#30363d] shadow-2xl bg-[#18161a]">
              <canvas id="hero-editorial-canvas" class="w-full h-full block"></canvas>

              <!-- Subtle Hover Quick-Action Bar -->
              <div class="opacity-0 group-hover:opacity-100 focus-within:opacity-100 transition-opacity absolute top-3 right-3 flex items-center gap-2">
                <label for="banner-file-input"
                  class="px-2.5 py-1.5 rounded-md bg-black/75 hover:bg-black/90 text-slate-200 border border-white/20 text-[11px] font-mono-code flex items-center gap-1.5 shadow-lg backdrop-blur-md cursor-pointer">
                  <span>🖼️</span>
                  <span>载入本地横幅原图</span>
                </label>
                <input id="banner-file-input" type="file" accept="image/*" class="hidden" onchange="handleBannerImageUpload(event)" />

                <button type="button" onclick="openGifStudioModal()"
                  class="px-2.5 py-1.5 rounded-md bg-black/75 hover:bg-rose-950/90 text-rose-200 border border-rose-400/40 text-[11px] font-mono-code flex items-center gap-1.5 shadow-lg backdrop-blur-md">
                  <span>🎬</span>
                  <span>导出 GIF 动图</span>
                </button>
              </div>
            </div>

            <!-- 2. CLEAN MINIMAL SOCIAL & PROJECT BADGES -->
            <div class="flex flex-wrap items-center justify-between gap-3 pt-1">
              <div class="flex items-center gap-2 text-xs text-[#8b949e]">
                <span class="inline-block w-2 h-2 rounded-full bg-rose-400"></span>
                <span class="font-mono-code">BUILDING IN PUBLIC · SHANGHAI / GLOBAL</span>
              </div>

              <div class="flex flex-wrap items-center gap-2">
                <a href="https://gulingle.cn" target="_blank" rel="noopener"
                  class="inline-flex items-center rounded overflow-hidden text-[11px] font-mono-code font-bold tracking-wider shadow border border-[#30363d]">
                  <span class="bg-[#161b22] text-slate-300 px-2.5 py-1">WEB</span>
                  <span class="bg-[#0d1117] text-rose-300 px-2.5 py-1 border-l border-[#30363d]">GULINGLE.CN</span>
                </a>
                <a href="https://x.com/GULINGLE" target="_blank" rel="noopener"
                  class="inline-flex items-center rounded overflow-hidden text-[11px] font-mono-code font-bold tracking-wider shadow border border-[#30363d]">
                  <span class="bg-[#161b22] text-slate-300 px-2.5 py-1">X</span>
                  <span class="bg-[#0d1117] text-white px-2.5 py-1 border-l border-[#30363d]">@GULINGLE</span>
                </a>
                <a href="https://github.com/gulingle?tab=repositories" target="_blank" rel="noopener"
                  class="inline-flex items-center rounded overflow-hidden text-[11px] font-mono-code font-bold tracking-wider shadow border border-[#30363d]">
                  <span class="bg-[#161b22] text-slate-300 px-2.5 py-1">FLAGSHIP</span>
                  <span class="bg-[#0d1117] text-amber-300 px-2.5 py-1 border-l border-[#30363d]">GUKi_WORKSPACE</span>
                </a>
              </div>
            </div>

            <hr class="border-[#30363d]" />

            <!-- 3. WHAT I'M BUILDING (2x2 GRID CARDS) -->
            <div class="space-y-3">
              <h3 class="text-base sm:text-lg font-bold flex items-center gap-2">
                <span>🚀</span>
                <span>What I'm Building <span class="lang-zh text-sm font-normal text-[#8b949e]">· 核心构建方向</span></span>
              </h3>

              <div class="grid grid-cols-1 md:grid-cols-2 gap-3.5">
                <!-- Card 1 -->
                <div class="p-4 rounded-lg border border-[#30363d] bg-[#161b22]/50 space-y-2">
                  <h4 class="text-sm font-bold text-rose-300">🧠 GUKi — Multi-Model Agent Workspaces</h4>
                  <p class="text-xs text-[#c9d1d9] leading-relaxed">
                    Cross-platform desktop workspaces for multi-model orchestration, MCP tool routing, and human-in-the-loop agent workflows.
                  </p>
                  <p class="lang-zh text-xs text-[#8b949e] pl-2.5 border-l-2 border-rose-400/60">
                    跨平台多模型协作工作台，聚焦模型统一调度、MCP 工具链与人机协同自动化流。
                  </p>
                </div>

                <!-- Card 2 -->
                <div class="p-4 rounded-lg border border-[#30363d] bg-[#161b22]/50 space-y-2">
                  <h4 class="text-sm font-bold text-amber-300">🌐 Autonomous Indie Sites</h4>
                  <p class="text-xs text-[#c9d1d9] leading-relaxed">
                    Self-operating site and commerce infrastructure: RAG knowledge-base support, tool-calling AI assistants, and automated order pipelines.
                  </p>
                  <p class="lang-zh text-xs text-[#8b949e] pl-2.5 border-l-2 border-amber-400/60">
                    全自动独立站与商业基建：知识库智能客服、工具调用型助手及订单自动化闭环。
                  </p>
                </div>

                <!-- Card 3 -->
                <div class="p-4 rounded-lg border border-[#30363d] bg-[#161b22]/50 space-y-2">
                  <h4 class="text-sm font-bold text-emerald-400">⚙️ Full-Stack Growth &amp; Isolated Ops</h4>
                  <p class="text-xs text-[#c9d1d9] leading-relaxed">
                    Sandboxed execution environments, browser &amp; desktop visual RPA agents, and resilient automation for scalable operations.
                  </p>
                  <p class="lang-zh text-xs text-[#8b949e] pl-2.5 border-l-2 border-emerald-500/60">
                    物理级隔离执行环境、浏览器与桌面级视觉智能体，以及可规模化的自动化运维。
                  </p>
                </div>

                <!-- Card 4 -->
                <div class="p-4 rounded-lg border border-[#30363d] bg-[#161b22]/50 space-y-2">
                  <h4 class="text-sm font-bold text-sky-400">📡 Engineering Philosophy</h4>
                  <p class="text-xs text-[#c9d1d9] leading-relaxed">
                    Isolate complexity at the infrastructure layer so autonomous AI agents can execute cleanly and reliably at the surface.
                  </p>
                  <p class="lang-zh text-xs text-[#8b949e] pl-2.5 border-l-2 border-sky-500/60">
                    在底层基础设施封装复杂性与隔离边界，让上层多智能体实现高可靠、低干扰的自治运行。
                  </p>
                </div>
              </div>
            </div>

            <!-- 4. INTERACTIVE CODE + MULTI-HOP KNOWLEDGE GRAPH ARCHITECTURE BLUEPRINT -->
            <div id="section-arch" class="space-y-3">
              <div class="flex flex-wrap items-center justify-between gap-2">
                <h3 class="text-base sm:text-lg font-bold flex items-center gap-2">
                  <span>🧩</span>
                  <span>System Architecture &amp; Knowledge Graph <span class="lang-zh text-sm font-normal text-[#8b949e]">· 代码与知识图谱架构</span></span>
                </h3>
                <span class="text-[11px] font-mono-code text-emerald-400 bg-emerald-500/10 border border-emerald-500/30 px-2 py-0.5 rounded">
                  点击节点查看图谱拓扑链路
                </span>
              </div>

              <div class="relative rounded-xl overflow-hidden border border-[#30363d] bg-[#040812] shadow-2xl">
                <!-- Background Live Code & Graph Particle Canvas -->
                <canvas id="arch-code-canvas" class="absolute inset-0 w-full h-full pointer-events-none opacity-65"></canvas>

                <!-- Foreground Interactive Multi-Hop Knowledge Graph SVG -->
                <div class="relative z-10 p-3 sm:p-5">
                  <svg viewBox="0 0 860 360" class="w-full h-auto block select-none" xmlns="http://www.w3.org/2000/svg">
                    <defs>
                      <radialGradient id="coreGlow" cx="50%" cy="50%" r="50%">
                        <stop offset="0%" stop-color="#f43f5e" stop-opacity="0.35" />
                        <stop offset="55%" stop-color="#38bdf8" stop-opacity="0.16" />
                        <stop offset="100%" stop-color="#040812" stop-opacity="0" />
                      </radialGradient>
                      <linearGradient id="busGrad" x1="0%" y1="0%" x2="100%" y2="0%">
                        <stop offset="0%" stop-color="#0f172a" />
                        <stop offset="50%" stop-color="#1e293b" />
                        <stop offset="100%" stop-color="#0f172a" />
                      </linearGradient>
                    </defs>

                    <circle cx="430" cy="155" r="145" fill="url(#coreGlow)" />

                    <!-- Multi-Hop Knowledge Graph Semantic Edges -->
                    <g id="kg-edges-group">
                      <path d="M 355 135 C 295 105, 255 95, 205 110" stroke="#38bdf8" stroke-width="2" fill="none" class="kg-edge-animated" />
                      <path d="M 355 165 C 295 185, 255 180, 205 155" stroke="#10b981" stroke-width="1.5" fill="none" class="kg-edge-animated" />
                      <path d="M 505 125 C 565 85, 605 75, 655 88" stroke="#fb7185" stroke-width="2" fill="none" class="kg-edge-animated" />
                      <path d="M 505 145 C 565 130, 605 125, 655 118" stroke="#38bdf8" stroke-width="1.5" fill="none" class="kg-edge-animated" />
                      <path d="M 505 168 C 565 188, 605 198, 655 208" stroke="#34d399" stroke-width="2" fill="none" class="kg-edge-animated" />
                      <path d="M 505 185 C 565 225, 605 235, 655 232" stroke="#fbbf24" stroke-width="1.5" fill="none" class="kg-edge-animated" />
                      <line x1="130" y1="185" x2="130" y2="296" stroke="#334155" stroke-width="1.5" stroke-dasharray="4 4" />
                      <line x1="430" y1="225" x2="430" y2="296" stroke="#10b981" stroke-width="2" class="kg-edge-animated" />
                      <line x1="735" y1="258" x2="735" y2="296" stroke="#334155" stroke-width="1.5" stroke-dasharray="4 4" />
                    </g>

                    <!-- Semantic Knowledge Graph Triple Tags -->
                    <g font-family="JetBrains Mono, monospace" font-size="9.5">
                      <rect x="232" y="84" width="84" height="17" rx="4" fill="#091322" stroke="#38bdf8" stroke-width="0.8" />
                      <text x="274" y="95.5" fill="#7dd3fc" text-anchor="middle">[AST: Intent]</text>

                      <rect x="536" y="68" width="84" height="17" rx="4" fill="#091322" stroke="#fb7185" stroke-width="0.8" />
                      <text x="578" y="79.5" fill="#fecdd3" text-anchor="middle">[Vec: 0.962]</text>

                      <rect x="536" y="198" width="88" height="17" rx="4" fill="#091322" stroke="#34d399" stroke-width="0.8" />
                      <text x="580" y="209.5" fill="#6ee7b7" text-anchor="middle">[DOM: Action]</text>

                      <rect x="372" y="250" width="116" height="18" rx="4" fill="#091322" stroke="#10b981" stroke-width="0.9" />
                      <text x="430" y="262" fill="#a7f3d0" text-anchor="middle">[Triple: S → P → O]</text>
                    </g>

                    <!-- Left Cluster: Multi-Model Agents -->
                    <g onclick="selectArchNode('agents')" class="cursor-pointer transition-transform hover:scale-[1.02]" style="transform-origin: 130px 132px;">
                      <rect x="42" y="80" width="176" height="104" rx="10" fill="#0b1324" stroke="#38bdf8" stroke-width="1.8" />
                      <text x="130" y="105" fill="#f8fafc" font-size="13" font-weight="700" text-anchor="middle">Multi-Model Agents</text>
                      <text x="130" y="124" fill="#7dd3fc" font-family="JetBrains Mono, monospace" font-size="10" text-anchor="middle">Hermes · Claude · DeepSeek</text>
                      <circle cx="82" cy="154" r="6" fill="#0284c7" stroke="#bae6fd" stroke-width="1.2" />
                      <circle cx="130" cy="148" r="6" fill="#059669" stroke="#a7f3d0" stroke-width="1.2" />
                      <circle cx="178" cy="156" r="6" fill="#e11d48" stroke="#fecdd3" stroke-width="1.2" />
                      <line x1="88" y1="154" x2="124" y2="148" stroke="#38bdf8" stroke-width="1" />
                      <line x1="136" y1="148" x2="172" y2="156" stroke="#34d399" stroke-width="1" />
                      <text x="130" y="174" fill="#94a3b8" font-family="JetBrains Mono, monospace" font-size="9" text-anchor="middle">MCP Router &amp; Memory</text>
                    </g>

                    <!-- Center Hub: GULINGLE Core -->
                    <g onclick="selectArchNode('core')" class="cursor-pointer transition-transform hover:scale-[1.03]" style="transform-origin: 430px 155px;">
                      <circle cx="430" cy="155" r="70" fill="#061220" stroke="#fb7185" stroke-width="2.5" />
                      <circle cx="430" cy="155" r="60" fill="none" stroke="#38bdf8" stroke-width="1.2" stroke-dasharray="10 5" />
                      <text x="430" y="148" fill="#ffffff" font-size="16" font-weight="800" text-anchor="middle">GULINGLE</text>
                      <text x="430" y="167" fill="#fda4af" font-family="JetBrains Mono, monospace" font-size="12" font-weight="700" text-anchor="middle">CORE ENGINE</text>
                      <text x="430" y="185" fill="#94a3b8" font-family="JetBrains Mono, monospace" font-size="9" text-anchor="middle">KG + Orchestrator</text>
                    </g>

                    <!-- Right Top Cluster: Autonomous Indie Sites -->
                    <g onclick="selectArchNode('sites')" class="cursor-pointer transition-transform hover:scale-[1.02]" style="transform-origin: 735px 96px;">
                      <rect x="646" y="48" width="178" height="94" rx="10" fill="#0b1324" stroke="#fb7185" stroke-width="1.8" />
                      <text x="735" y="72" fill="#f8fafc" font-size="13" font-weight="700" text-anchor="middle">Autonomous Indie Sites</text>
                      <text x="735" y="90" fill="#fecdd3" font-family="JetBrains Mono, monospace" font-size="10" text-anchor="middle">RAG Support · Webhooks</text>
                      <circle cx="690" cy="116" r="5.5" fill="#e11d48" stroke="#fecdd3" stroke-width="1.2" />
                      <circle cx="735" cy="112" r="5.5" fill="#0284c7" stroke="#bae6fd" stroke-width="1.2" />
                      <circle cx="780" cy="118" r="5.5" fill="#059669" stroke="#a7f3d0" stroke-width="1.2" />
                      <line x1="696" y1="116" x2="729" y2="112" stroke="#fb7185" stroke-width="1" />
                      <line x1="741" y1="112" x2="774" y2="118" stroke="#38bdf8" stroke-width="1" />
                      <text x="735" y="133" fill="#94a3b8" font-family="JetBrains Mono, monospace" font-size="9" text-anchor="middle">WooCommerce &amp; Order API</text>
                    </g>

                    <!-- Right Bottom Cluster: Isolated Growth Ops -->
                    <g onclick="selectArchNode('ops')" class="cursor-pointer transition-transform hover:scale-[1.02]" style="transform-origin: 735px 214px;">
                      <rect x="646" y="166" width="178" height="94" rx="10" fill="#0b1324" stroke="#34d399" stroke-width="1.8" />
                      <text x="735" y="190" fill="#f8fafc" font-size="13" font-weight="700" text-anchor="middle">Isolated Growth Ops</text>
                      <text x="735" y="208" fill="#6ee7b7" font-family="JetBrains Mono, monospace" font-size="10" text-anchor="middle">VM Sandbox · GUI/Web RPA</text>
                      <circle cx="690" cy="234" r="5.5" fill="#059669" stroke="#a7f3d0" stroke-width="1.2" />
                      <circle cx="735" cy="230" r="5.5" fill="#d97706" stroke="#fde68a" stroke-width="1.2" />
                      <circle cx="780" cy="236" r="5.5" fill="#0284c7" stroke="#bae6fd" stroke-width="1.2" />
                      <line x1="696" y1="234" x2="729" y2="230" stroke="#34d399" stroke-width="1" />
                      <line x1="741" y1="230" x2="774" y2="236" stroke="#fbbf24" stroke-width="1" />
                      <text x="735" y="251" fill="#94a3b8" font-family="JetBrains Mono, monospace" font-size="9" text-anchor="middle">TUN NetNS &amp; Anti-Detect</text>
                    </g>

                    <!-- Bottom Foundation Infrastructure Bus -->
                    <rect x="42" y="296" width="782" height="44" rx="8" fill="url(#busGrad)" stroke="#334155" stroke-width="1.5" />
                    <text x="433" y="323" fill="#e2e8f0" font-family="JetBrains Mono, monospace" font-size="12.5" font-weight="700" letter-spacing="1.5" text-anchor="middle">
                      MCP · RAG · Knowledge Graph · RPA · Sandboxed Infra
                    </text>
                  </svg>

                  <!-- Interactive Node Detail Bar -->
                  <div id="arch-detail-bar" class="mt-2 px-3.5 py-2.5 rounded-lg bg-[#0d1526]/90 border border-rose-400/30 flex flex-wrap items-center justify-between gap-2 text-xs">
                    <div class="flex items-center gap-2">
                      <span class="px-2 py-0.5 rounded bg-rose-500/20 text-rose-200 font-mono-code font-bold">GULINGLE CORE</span>
                      <span id="arch-detail-text" class="text-slate-300">
                        中枢调度与多跳知识图谱引擎：负责意图解析、上下文实体对齐，并将任务路由至多模型 Agent 或隔离沙盒执行节点。
                      </span>
                    </div>
                    <span id="arch-detail-tag" class="font-mono-code text-[11px] text-sky-400">Cypher + Vector Hybrid</span>
                  </div>
                </div>
              </div>
            </div>

            <!-- 5. TECH STACK & INFRASTRUCTURE BADGES -->
            <div class="space-y-2.5">
              <h3 class="text-base sm:text-lg font-bold flex items-center gap-2">
                <span>🛠️</span>
                <span>Tech Stack &amp; Infrastructure <span class="lang-zh text-sm font-normal text-[#8b949e]">· 技术栈矩阵</span></span>
              </h3>

              <div class="space-y-2 text-xs">
                <div class="flex flex-wrap items-center gap-1.5">
                  <span class="font-semibold text-[#8b949e] w-36">AI &amp; Agent Routing:</span>
                  <span class="px-2 py-0.5 rounded bg-[#161b22] border border-[#30363d] font-mono-code text-sky-300">Python</span>
                  <span class="px-2 py-0.5 rounded bg-[#161b22] border border-[#30363d] font-mono-code text-emerald-300">MCP Protocol</span>
                  <span class="px-2 py-0.5 rounded bg-[#161b22] border border-[#30363d] font-mono-code text-rose-300">Knowledge Graph</span>
                  <span class="px-2 py-0.5 rounded bg-[#161b22] border border-[#30363d] font-mono-code text-purple-300">Multi-Model LLM</span>
                  <span class="px-2 py-0.5 rounded bg-[#161b22] border border-[#30363d] font-mono-code text-teal-300">Playwright &amp; GUI RPA</span>
                </div>
                <div class="flex flex-wrap items-center gap-1.5">
                  <span class="font-semibold text-[#8b949e] w-36">Full-Stack Web:</span>
                  <span class="px-2 py-0.5 rounded bg-[#161b22] border border-[#30363d] font-mono-code text-blue-300">TypeScript</span>
                  <span class="px-2 py-0.5 rounded bg-[#161b22] border border-[#30363d] font-mono-code text-cyan-300">React</span>
                  <span class="px-2 py-0.5 rounded bg-[#161b22] border border-[#30363d] font-mono-code text-slate-200">Next.js</span>
                  <span class="px-2 py-0.5 rounded bg-[#161b22] border border-[#30363d] font-mono-code text-emerald-300">FastAPI</span>
                  <span class="px-2 py-0.5 rounded bg-[#161b22] border border-[#30363d] font-mono-code text-green-300">Node.js</span>
                </div>
                <div class="flex flex-wrap items-center gap-1.5">
                  <span class="font-semibold text-[#8b949e] w-36">Commerce &amp; Infra:</span>
                  <span class="px-2 py-0.5 rounded bg-[#161b22] border border-[#30363d] font-mono-code text-sky-300">Docker</span>
                  <span class="px-2 py-0.5 rounded bg-[#161b22] border border-[#30363d] font-mono-code text-amber-300">Linux &amp; Hyper-V</span>
                  <span class="px-2 py-0.5 rounded bg-[#161b22] border border-[#30363d] font-mono-code text-purple-300">WooCommerce API</span>
                  <span class="px-2 py-0.5 rounded bg-[#161b22] border border-[#30363d] font-mono-code text-orange-300">Cloudflare</span>
                </div>
              </div>
            </div>

            <!-- 6. GITHUB ANALYTICS DASHBOARD -->
            <div id="section-stats" class="space-y-3">
              <h3 class="text-base sm:text-lg font-bold flex items-center gap-2">
                <span>📊</span>
                <span>GitHub Analytics <span class="lang-zh text-sm font-normal text-[#8b949e]">· 实时开发数据</span></span>
              </h3>

              <div class="grid grid-cols-1 md:grid-cols-2 gap-3.5">
                <div class="p-4 rounded-lg border border-[#30363d] bg-[#161b22]/60 flex items-center justify-between">
                  <div class="space-y-1.5 text-xs">
                    <div class="text-sm font-bold text-rose-300 mb-2">GULINGLE's GitHub Stats</div>
                    <div class="flex items-center gap-2 text-[#c9d1d9]"><span>⭐ Total Stars Earned:</span> <strong>142</strong></div>
                    <div class="flex items-center gap-2 text-[#c9d1d9]"><span>🔄 Total Commits (2026):</span> <strong class="text-emerald-400">599</strong></div>
                    <div class="flex items-center gap-2 text-[#c9d1d9]"><span>🔀 Total PRs &amp; Issues:</span> <strong>64</strong></div>
                    <div class="flex items-center gap-2 text-[#c9d1d9]"><span>📦 Private &amp; Public Repos:</span> <strong>28</strong></div>
                  </div>
                  <div class="w-16 h-16 rounded-full border-4 border-rose-400/80 flex flex-col items-center justify-center shrink-0">
                    <span class="text-base font-extrabold text-white">A+</span>
                    <span class="text-[9px] text-[#8b949e]">RANK</span>
                  </div>
                </div>

                <div class="p-4 rounded-lg border border-[#30363d] bg-[#161b22]/60 space-y-2.5">
                  <div class="text-sm font-bold text-rose-300">Most Used Languages</div>
                  <div class="w-full h-2.5 rounded-full overflow-hidden flex bg-slate-800">
                    <div class="bg-[#3572A5] h-full" style="width: 44%"></div>
                    <div class="bg-[#3178c6] h-full" style="width: 32%"></div>
                    <div class="bg-[#89e051] h-full" style="width: 14%"></div>
                    <div class="bg-[#00ADD8] h-full" style="width: 10%"></div>
                  </div>
                  <div class="grid grid-cols-2 gap-1.5 text-xs text-[#c9d1d9] pt-1">
                    <div class="flex items-center gap-1.5"><span class="w-2.5 h-2.5 rounded-full bg-[#3572A5]"></span>Python 44.0%</div>
                    <div class="flex items-center gap-1.5"><span class="w-2.5 h-2.5 rounded-full bg-[#3178c6]"></span>TypeScript 32.0%</div>
                    <div class="flex items-center gap-1.5"><span class="w-2.5 h-2.5 rounded-full bg-[#89e051]"></span>Shell / RPA 14.0%</div>
                    <div class="flex items-center gap-1.5"><span class="w-2.5 h-2.5 rounded-full bg-[#00ADD8]"></span>Go / C 10.0%</div>
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>

        <!-- =================================================================
             PINNED REPOSITORIES (2x2 GRID)
             ================================================================= -->
        <div id="section-pins" class="space-y-3">
          <div class="flex items-center justify-between">
            <h2 class="text-sm font-semibold">Pinned Repositories <span class="lang-zh text-xs font-normal text-[#8b949e]">· 核心置顶仓库矩阵</span></h2>
            <span class="text-xs text-[#8b949e]">Customize your pins</span>
          </div>

          <div class="grid grid-cols-1 md:grid-cols-2 gap-3.5">
            <div class="p-4 rounded-lg border border-[#30363d] bg-[#0d1117] hover:border-[#8b949e] transition-colors flex flex-col justify-between space-y-3">
              <div class="space-y-1.5">
                <div class="flex items-center justify-between">
                  <span class="text-sm font-bold text-rose-300 hover:underline cursor-pointer">guki-workspace</span>
                  <span class="px-2 py-0.5 text-[11px] rounded-full border border-[#30363d] text-[#8b949e]">Public</span>
                </div>
                <p class="text-xs text-[#8b949e] leading-relaxed">
                  Cross-platform multi-model AI agent workspace for model orchestration, MCP tool routing, and autonomous workflows.
                </p>
              </div>
              <div class="flex items-center gap-4 text-xs text-[#8b949e]">
                <span class="flex items-center gap-1"><span class="w-2.5 h-2.5 rounded-full bg-[#3178c6]"></span>TypeScript</span>
                <span>⭐ 86</span>
                <span>🍴 14</span>
              </div>
            </div>

            <div class="p-4 rounded-lg border border-[#30363d] bg-[#0d1117] hover:border-[#8b949e] transition-colors flex flex-col justify-between space-y-3">
              <div class="space-y-1.5">
                <div class="flex items-center justify-between">
                  <span class="text-sm font-bold text-rose-300 hover:underline cursor-pointer">omni-agent-core</span>
                  <span class="px-2 py-0.5 text-[11px] rounded-full border border-[#30363d] text-[#8b949e]">Public</span>
                </div>
                <p class="text-xs text-[#8b949e] leading-relaxed">
                  Lightweight multi-model LLM gateway and MCP server toolkit for building reliable tool-calling AI agents.
                </p>
              </div>
              <div class="flex items-center gap-4 text-xs text-[#8b949e]">
                <span class="flex items-center gap-1"><span class="w-2.5 h-2.5 rounded-full bg-[#3572A5]"></span>Python</span>
                <span>⭐ 54</span>
                <span>🍴 9</span>
              </div>
            </div>

            <div class="p-4 rounded-lg border border-[#30363d] bg-[#0d1117] hover:border-[#8b949e] transition-colors flex flex-col justify-between space-y-3">
              <div class="space-y-1.5">
                <div class="flex items-center justify-between">
                  <span class="text-sm font-bold text-rose-300 hover:underline cursor-pointer">indie-commerce-autopilot</span>
                  <span class="px-2 py-0.5 text-[11px] rounded-full border border-[#30363d] text-[#8b949e]">Public</span>
                </div>
                <p class="text-xs text-[#8b949e] leading-relaxed">
                  AI-driven e-commerce automation engine integrating RAG customer support, order webhooks, and WooCommerce APIs.
                </p>
              </div>
              <div class="flex items-center gap-4 text-xs text-[#8b949e]">
                <span class="flex items-center gap-1"><span class="w-2.5 h-2.5 rounded-full bg-[#3572A5]"></span>Python</span>
                <span>⭐ 41</span>
                <span>🍴 7</span>
              </div>
            </div>

            <div class="p-4 rounded-lg border border-[#30363d] bg-[#0d1117] hover:border-[#8b949e] transition-colors flex flex-col justify-between space-y-3">
              <div class="space-y-1.5">
                <div class="flex items-center justify-between">
                  <span class="text-sm font-bold text-rose-300 hover:underline cursor-pointer">isolated-growth-ops</span>
                  <span class="px-2 py-0.5 text-[11px] rounded-full border border-[#30363d] text-[#8b949e]">Public</span>
                </div>
                <p class="text-xs text-[#8b949e] leading-relaxed">
                  Sandboxed browser &amp; desktop RPA automation toolkit with network-isolated execution environments for scalable growth.
                </p>
              </div>
              <div class="flex items-center gap-4 text-xs text-[#8b949e]">
                <span class="flex items-center gap-1"><span class="w-2.5 h-2.5 rounded-full bg-[#89e051]"></span>Shell</span>
                <span>⭐ 63</span>
                <span>🍴 11</span>
              </div>
            </div>
          </div>
        </div>

        <!-- =================================================================
             52-WEEK CONTRIBUTION HEATMAP
             ================================================================= -->
        <div class="p-4 rounded-xl border border-[#30363d] bg-[#0d1117] space-y-3">
          <div class="flex items-center justify-between text-xs">
            <span class="font-semibold">599 contributions in 2026</span>
            <div class="flex items-center gap-1 text-[11px] text-[#8b949e]">
              <span>Less</span>
              <span class="w-2.5 h-2.5 rounded-xs bg-[#161b22] border border-[#30363d]"></span>
              <span class="w-2.5 h-2.5 rounded-xs bg-[#0e4429]"></span>
              <span class="w-2.5 h-2.5 rounded-xs bg-[#006d32]"></span>
              <span class="w-2.5 h-2.5 rounded-xs bg-[#26a641]"></span>
              <span class="w-2.5 h-2.5 rounded-xs bg-[#39d353]"></span>
              <span>More</span>
            </div>
          </div>
          <div class="overflow-x-auto pb-1">
            <div id="heatmap-grid" class="grid grid-flow-col grid-rows-7 gap-1 min-w-[680px]"></div>
          </div>
        </div>

      </section>
    </div>
  </main>

  <!-- =====================================================================
       4. GIF ANIMATOR STUDIO MODAL (PURE JS GIF89a ENCODER)
       ===================================================================== -->
  <div id="gif-modal" class="fixed inset-0 z-50 hidden items-center justify-center bg-black/80 backdrop-blur-sm p-4">
    <div class="bg-[#0d1117] border border-rose-400/40 rounded-xl max-w-3xl w-full max-h-[90vh] flex flex-col shadow-2xl text-slate-200 overflow-hidden">
      <div class="px-4 py-3 border-b border-slate-800 flex items-center justify-between bg-[#070b12]">
        <div class="flex items-center gap-2">
          <span class="text-rose-400">🎬</span>
          <span class="font-mono-code text-sm font-bold text-white">GULINGLE · 电影级横幅 GIF 动图工坊</span>
          <span class="text-xs text-rose-300 bg-rose-500/10 border border-rose-400/30 px-2 py-0.5 rounded-full">960×280 · 28帧循环</span>
        </div>
        <button type="button" onclick="closeGifStudioModal()" class="p-1 rounded hover:bg-slate-800 text-slate-400 hover:text-white">
          ✕
        </button>
      </div>

      <div class="p-4 sm:p-5 overflow-y-auto space-y-4">
        <div class="flex flex-wrap items-center justify-between gap-2 bg-slate-900/90 p-3 rounded-lg border border-slate-800">
          <div class="flex flex-wrap items-center gap-2 text-xs">
            <button id="btn-gif-mode-synth" type="button" onclick="setGifSourceMode('editorial')"
              class="px-3 py-1.5 rounded-md font-medium bg-rose-500/20 text-rose-200 border border-rose-400/50">
              🌄 峡谷日落社论排版直出
            </button>
            <label for="gif-base-image-input"
              class="px-3 py-1.5 rounded-md font-medium bg-slate-800 hover:bg-slate-700 text-amber-200 border border-slate-600 cursor-pointer inline-flex items-center gap-1.5">
              <span>🖼️ 导入保存的原图叠加光效</span>
            </label>
            <input id="gif-base-image-input" type="file" accept="image/*" class="hidden" onchange="handleGifBaseImageUpload(event)" />
          </div>

          <button type="button" onclick="buildBannerGif()"
            class="px-3 py-1.5 rounded-md text-xs font-semibold bg-sky-500/20 hover:bg-sky-500/30 text-sky-300 border border-sky-500/40">
            ↻ 重新渲染 GIF
          </button>
        </div>

        <div class="relative rounded-lg overflow-hidden border border-slate-700 bg-[#141216] min-h-[160px] flex items-center justify-center">
          <img id="gif-output-preview" alt="Generated GIF Preview" class="w-full h-auto block hidden" />
          <div id="gif-encoding-status" class="py-10 px-4 text-center space-y-2.5">
            <div class="inline-block w-7 h-7 border-2 border-rose-400 border-t-transparent rounded-full animate-spin"></div>
            <p id="gif-status-text" class="text-xs font-mono-code text-rose-200">正在逐帧编码 GIF89a 动图 (0%)...</p>
          </div>
        </div>

        <p class="text-xs text-slate-400 leading-relaxed">
          💡 <strong class="text-slate-200">部署说明：</strong>如果你更喜欢高清静态原图，直接把刚才生成的原图保存为 <code class="text-rose-300">assets/banner.png</code> 上传到仓库即可（默认生成的 <code class="text-emerald-300">README.md</code> 源码已配置为 <code class="text-rose-300">./assets/banner.png</code>）；若需动态流云版本，可下载此 <code class="text-amber-300">gulingle-banner.gif</code> 并改名为 <code class="text-amber-300">assets/banner.gif</code>。
        </p>
      </div>

      <div class="px-4 py-3 border-t border-slate-800 bg-[#070b12] flex items-center justify-between gap-2">
        <span id="gif-file-meta" class="text-xs font-mono-code text-slate-400">准备就绪</span>
        <div class="flex items-center gap-2">
          <button type="button" onclick="closeGifStudioModal()" class="px-3 py-1.5 rounded-lg text-xs bg-slate-800 hover:bg-slate-700 text-slate-300">
            关闭
          </button>
          <a id="btn-download-gif" href="#" download="gulingle-banner.gif"
            class="pointer-events-none opacity-50 px-4 py-1.5 rounded-lg text-xs font-semibold bg-gradient-to-r from-rose-400 to-amber-300 hover:from-rose-300 hover:to-amber-200 text-slate-950 shadow-md flex items-center gap-1.5">
            <span>⬇️ 下载 gulingle-banner.gif</span>
          </a>
        </div>
      </div>
    </div>
  </div>

  <!-- =====================================================================
       5. MARKDOWN SOURCE INSPECTOR MODAL
       ===================================================================== -->
  <div id="md-modal" class="fixed inset-0 z-50 hidden items-center justify-center bg-black/75 backdrop-blur-sm p-4">
    <div class="bg-[#0d1117] border border-[#30363d] rounded-xl max-w-3xl w-full max-h-[85vh] flex flex-col shadow-2xl text-slate-200 overflow-hidden">
      <div class="px-4 py-3 border-b border-[#30363d] flex items-center justify-between bg-[#161b22]">
        <div class="flex items-center gap-2.5">
          <span class="font-mono-code text-xs sm:text-sm font-bold text-white">GULINGLE/README.md · 完整可直接部署源码</span>
          <button id="btn-banner-ext-toggle" type="button" onclick="toggleBannerExt()"
            class="px-2 py-0.5 rounded text-[11px] font-mono-code bg-rose-500/20 text-rose-200 border border-rose-400/40">
            横幅引用: banner.png
          </button>
        </div>
        <button type="button" onclick="closeMarkdownModal()" class="p-1 rounded hover:bg-slate-800 text-slate-400 hover:text-white">✕</button>
      </div>
      <div class="p-4 overflow-y-auto flex-1">
        <pre id="md-source-output" class="font-mono-code text-xs text-rose-200 bg-[#010409] p-4 rounded-lg border border-[#30363d] whitespace-pre-wrap break-all leading-relaxed"></pre>
      </div>
      <div class="px-4 py-3 border-t border-[#30363d] bg-[#161b22] flex items-center justify-end gap-2">
        <button type="button" onclick="closeMarkdownModal()" class="px-3 py-1.5 rounded-lg text-xs bg-slate-800 hover:bg-slate-700 text-slate-300">关闭</button>
        <button type="button" onclick="copyReadmeMarkdown()" class="px-4 py-1.5 rounded-lg text-xs font-semibold bg-[#238636] hover:bg-[#2ea043] text-white">
          📋 一键复制完整源码
        </button>
      </div>
    </div>
  </div>

  <!-- Toast Notification Banner -->
  <div id="toast-box" class="fixed bottom-5 right-5 z-50 hidden px-4 py-2.5 rounded-lg bg-[#161b22]/95 border border-rose-400/60 text-rose-200 text-xs font-medium shadow-2xl backdrop-blur-md"></div>

  <!-- =====================================================================
       6. COMPLETE CLIENT-SIDE LOGIC (EDITORIAL CANVAS, GIF89a ENCODER & UI)
       ===================================================================== -->
  <script>
    // 1. Workspace State
    const previewState = {
      theme: 'dark',
      lang: 'bilingual',
      showArch: true,
      showStats: true,
      showPins: true,
      bannerExt: 'png',
      customBannerImg: null
    };

    // 2. Theme, Language & Section Toggles
    function setTheme(mode) {
      previewState.theme = mode;
      const mainEl = document.getElementById('gh-main-container');
      const subnavEl = document.getElementById('gh-subnav');
      const readmeCard = document.getElementById('readme-card');
      const btnDark = document.getElementById('btn-theme-dark');
      const btnLight = document.getElementById('btn-theme-light');

      if (mode === 'light') {
        mainEl.className = 'flex-1 bg-[#ffffff] text-[#1f2328] px-4 sm:px-8 py-6 sm:py-8 transition-colors';
        subnavEl.className = 'bg-[#f6f8fa] text-[#1f2328] border-b border-[#d0d7de] px-4 sm:px-8 pt-3 transition-colors';
        readmeCard.className = 'rounded-xl border border-[#d0d7de] bg-[#ffffff] overflow-hidden shadow-md transition-colors';
        btnLight.className = 'px-2.5 py-1 rounded-md font-medium bg-white text-slate-900 shadow-sm transition-colors';
        btnDark.className = 'px-2.5 py-1 rounded-md font-medium text-[#8b949e] hover:text-white transition-colors';
      } else {
        mainEl.className = 'flex-1 bg-[#0d1117] text-[#e6edf3] px-4 sm:px-8 py-6 sm:py-8 transition-colors';
        subnavEl.className = 'bg-[#010409] text-[#e6edf3] border-b border-[#30363d] px-4 sm:px-8 pt-3 transition-colors';
        readmeCard.className = 'rounded-xl border border-[#30363d] bg-[#0d1117] overflow-hidden shadow-xl transition-colors';
        btnDark.className = 'px-2.5 py-1 rounded-md font-medium bg-[#21262d] text-white shadow-sm transition-colors';
        btnLight.className = 'px-2.5 py-1 rounded-md font-medium text-[#8b949e] hover:text-slate-900 transition-colors';
      }
    }

    function toggleLang() {
      previewState.lang = previewState.lang === 'bilingual' ? 'en' : 'bilingual';
      const btn = document.getElementById('btn-lang-toggle');
      const zhNodes = document.querySelectorAll('.lang-zh');
      if (previewState.lang === 'en') {
        btn.textContent = '🌐 English Only';
        zhNodes.forEach(el => el.classList.add('hidden'));
      } else {
        btn.textContent = '🌐 中英双语';
        zhNodes.forEach(el => el.classList.remove('hidden'));
      }
    }

    function toggleSection(key) {
      const map = {
        arch: { prop: 'showArch', elId: 'section-arch', btnId: 'btn-toggle-arch', label: '知识图谱架构' },
        stats: { prop: 'showStats', elId: 'section-stats', btnId: 'btn-toggle-stats', label: '数据看板' },
        pins: { prop: 'showPins', elId: 'section-pins', btnId: 'btn-toggle-pins', label: '四宫格置顶' }
      };
      const item = map[key];
      if (!item) return;
      previewState[item.prop] = !previewState[item.prop];
      const active = previewState[item.prop];
      const sec = document.getElementById(item.elId);
      const btn = document.getElementById(item.btnId);
      if (sec) sec.classList.toggle('hidden', !active);
      if (btn) {
        btn.textContent = `${active ? '✓' : '✕'} ${item.label}`;
        btn.className = active
          ? 'px-2.5 py-1.5 rounded-lg font-medium bg-emerald-500/15 text-emerald-300 border border-emerald-500/40 transition-colors'
          : 'px-2.5 py-1.5 rounded-lg font-medium bg-[#161b22] text-[#8b949e] border border-[#30363d] transition-colors';
      }
    }

    function toggleBannerExt() {
      previewState.bannerExt = previewState.bannerExt === 'png' ? 'gif' : 'png';
      const btn = document.getElementById('btn-banner-ext-toggle');
      const output = document.getElementById('md-source-output');
      if (btn) btn.textContent = `横幅引用: banner.${previewState.bannerExt}`;
      if (output) output.textContent = generateReadmeMarkdown();
    }

    // 3. Local Husky Avatar & Custom Banner Image Loaders
    function handleAvatarUpload(event) {
      const file = event.target.files && event.target.files[0];
      if (!file) return;
      const reader = new FileReader();
      reader.onload = function (e) {
        const img = document.getElementById('avatar-custom-img');
        const svg = document.getElementById('avatar-default-svg');
        if (img && svg) {
          img.src = e.target.result;
          img.classList.remove('hidden');
          svg.classList.add('hidden');
          showToast('已载入你的本地原头像！');
        }
      };
      reader.readAsDataURL(file);
    }

    function handleBannerImageUpload(event) {
      const file = event.target.files && event.target.files[0];
      if (!file) return;
      const reader = new FileReader();
      reader.onload = function (e) {
        const img = new Image();
        img.onload = function () {
          previewState.customBannerImg = img;
          gifStudioState.customImg = img;
          gifStudioState.mode = 'custom';
          showToast('已将你选择的原图载入主页横幅！');
        };
        img.src = e.target.result;
      };
      reader.readAsDataURL(file);
    }

    // 4. Interactive Knowledge Graph Node Inspector
    const ARCH_NODE_DETAILS = {
      core: {
        badge: 'GULINGLE CORE',
        text: '中枢调度与多跳知识图谱引擎：负责意图解析、上下文实体对齐，并将任务路由至多模型 Agent 或隔离沙盒执行节点。',
        tag: 'Cypher + Vector Hybrid'
      },
      agents: {
        badge: 'MULTI-MODEL AGENTS',
        text: '多模型协作工作台（GUKi）：统一调度 Hermes-3、Claude、DeepSeek 等异构大模型，通过 MCP 协议实现工具链精准调用。',
        tag: 'MCP + Function Calling'
      },
      sites: {
        badge: 'AUTONOMOUS INDIE SITES',
        text: '全自动独立站商业闭环：基于 RAG 产品知识库驱动 24h 智能客服，打通 WooCommerce 订单状态查询与自动化 Webhook。',
        tag: 'RAG + Commerce API'
      },
      ops: {
        badge: 'ISOLATED GROWTH OPS',
        text: '物理级隔离与自动化增长：Hyper-V 独立网络命名空间（TUN）防关联沙盒，结合浏览器与桌面视觉 RPA 自动执行跨平台任务。',
        tag: 'VM Sandbox + Visual RPA'
      }
    };

    function selectArchNode(nodeKey) {
      const info = ARCH_NODE_DETAILS[nodeKey] || ARCH_NODE_DETAILS.core;
      const bar = document.getElementById('arch-detail-bar');
      const textEl = document.getElementById('arch-detail-text');
      const tagEl = document.getElementById('arch-detail-tag');
      if (bar) {
        const badgeEl = bar.querySelector('span');
        if (badgeEl) badgeEl.textContent = info.badge;
      }
      if (textEl) textEl.textContent = info.text;
      if (tagEl) tagEl.textContent = info.tag;
    }

    // 5. Cinematic Parted-Canyon Sunset Cloudscape & Editorial Tech UI Renderer
    const FILM_GRAIN_TILE = (() => {
      const tile = document.createElement('canvas');
      tile.width = 96;
      tile.height = 96;
      const tctx = tile.getContext('2d');
      const img = tctx.createImageData(96, 96);
      for (let i = 0; i < img.data.length; i += 4) {
        const v = ((i * 73 + 19) % 255);
        img.data[i] = v;
        img.data[i + 1] = v;
        img.data[i + 2] = v;
        img.data[i + 3] = 15;
      }
      tctx.putImageData(img, 0, 0);
      return tile;
    })();

    function wrapCanvasText(ctx, text, maxWidth) {
      const words = text.split(' ');
      const lines = [];
      let current = '';
      for (let i = 0; i < words.length; i++) {
        const test = current ? current + ' ' + words[i] : words[i];
        if (ctx.measureText(test).width > maxWidth && current) {
          lines.push(current);
          current = words[i];
        } else {
          current = test;
        }
      }
      if (current) lines.push(current);
      return lines;
    }

    function renderEditorialBannerFrame(ctx, width, height, t, customBaseImg) {
      const twoPi = Math.PI * 2;
      const phase = t * twoPi;

      // If user loaded their exact saved image file, render it cleanly with subtle warm light shimmer
      if (customBaseImg) {
        const imgRatio = customBaseImg.width / customBaseImg.height;
        const boxRatio = width / height;
        let dw = width;
        let dh = height;
        let dx = 0;
        let dy = 0;
        if (imgRatio > boxRatio) {
          dw = height * imgRatio;
          dx = (width - dw) / 2;
        } else {
          dh = width / imgRatio;
          dy = (height - dh) / 2;
        }
        ctx.drawImage(customBaseImg, dx, dy, dw, dh);

        // Subtle warm golden cleft breathing shimmer for GIF export
        const shimmerAlpha = 0.08 + 0.08 * Math.sin(phase);
        const cleftGlow = ctx.createRadialGradient(width * 0.5, height * 0.78, 8, width * 0.5, height * 0.55, width * 0.25);
        cleftGlow.addColorStop(0, `rgba(255, 224, 178, ${shimmerAlpha})`);
        cleftGlow.addColorStop(1, 'rgba(255, 138, 101, 0)');
        ctx.save();
        ctx.globalCompositeOperation = 'screen';
        ctx.fillStyle = cleftGlow;
        ctx.fillRect(0, 0, width, height);
        ctx.restore();
        return;
      }

      // 1. Atmospheric Dusk & Coral-Sunset Sky Gradient
      const skyGrad = ctx.createLinearGradient(0, 0, 0, height);
      skyGrad.addColorStop(0, '#3a2f35');
      skyGrad.addColorStop(0.28, '#6a4347');
      skyGrad.addColorStop(0.55, '#b66358');
      skyGrad.addColorStop(0.82, '#e28869');
      skyGrad.addColorStop(1, '#221f22');
      ctx.fillStyle = skyGrad;
      ctx.fillRect(0, 0, width, height);

      // 2. Drifting Volumetric Coral & Slate Sunset Clouds
      const driftX = Math.sin(phase) * (width * 0.014);
      const clouds = [
        { x: 0.21, y: 0.34, rx: 0.14, ry: 0.19, c1: 'rgba(247, 152, 138, 0.72)', c2: 'rgba(130, 82, 86, 0)' },
        { x: 0.13, y: 0.45, rx: 0.16, ry: 0.21, c1: 'rgba(84, 80, 88, 0.78)', c2: 'rgba(54, 50, 56, 0)' },
        { x: 0.33, y: 0.48, rx: 0.15, ry: 0.22, c1: 'rgba(72, 68, 76, 0.85)', c2: 'rgba(42, 40, 46, 0)' },
        { x: 0.79, y: 0.35, rx: 0.15, ry: 0.19, c1: 'rgba(245, 146, 130, 0.68)', c2: 'rgba(128, 78, 82, 0)' },
        { x: 0.68, y: 0.46, rx: 0.16, ry: 0.22, c1: 'rgba(76, 72, 80, 0.82)', c2: 'rgba(42, 40, 46, 0)' },
        { x: 0.88, y: 0.47, rx: 0.14, ry: 0.20, c1: 'rgba(92, 84, 92, 0.76)', c2: 'rgba(46, 44, 50, 0)' }
      ];

      clouds.forEach((cl, idx) => {
        const dir = idx % 2 === 0 ? 1 : -1;
        const cx = cl.x * width + driftX * dir;
        const cy = cl.y * height;
        const rad = Math.max(cl.rx * width, cl.ry * height);
        const cg = ctx.createRadialGradient(cx, cy, rad * 0.08, cx, cy, rad);
        cg.addColorStop(0, cl.c1);
        cg.addColorStop(1, cl.c2);
        ctx.fillStyle = cg;
        ctx.fillRect(0, 0, width, height);
      });

      // 3. Radiant Golden-Peach Light Pillar Inside the Canyon Cleft
      const pulse = 0.88 + 0.12 * Math.sin(phase);
      const cleftX = width * 0.50;
      const sunGlow = ctx.createRadialGradient(cleftX, height * 0.86, 6, cleftX, height * 0.56, height * 0.72);
      sunGlow.addColorStop(0, `rgba(255, 246, 224, ${0.98 * pulse})`);
      sunGlow.addColorStop(0.28, `rgba(255, 178, 125, ${0.82 * pulse})`);
      sunGlow.addColorStop(0.65, 'rgba(218, 102, 78, 0.35)');
      sunGlow.addColorStop(1, 'rgba(218, 102, 78, 0)');
      ctx.fillStyle = sunGlow;
      ctx.fillRect(width * 0.35, 0, width * 0.30, height);

      // Diagonal warm sunlight shaft streaming toward bottom-left
      ctx.save();
      const beamGrad = ctx.createLinearGradient(cleftX, height * 0.82, width * 0.24, height);
      beamGrad.addColorStop(0, `rgba(255, 168, 120, ${0.42 * pulse})`);
      beamGrad.addColorStop(1, 'rgba(255, 120, 88, 0)');
      ctx.fillStyle = beamGrad;
      ctx.beginPath();
      ctx.moveTo(cleftX - width * 0.02, height * 0.80);
      ctx.lineTo(cleftX + width * 0.02, height * 0.84);
      ctx.lineTo(width * 0.34, height);
      ctx.lineTo(width * 0.20, height);
      ctx.closePath();
      ctx.fill();
      ctx.restore();

      // 4. Iconic Parted Stepped Basalt Monoliths (Left & Right Silhouettes)
      // Left Cliff
      ctx.fillStyle = '#1e1d21';
      ctx.beginPath();
      ctx.moveTo(width * 0.31, height);
      ctx.lineTo(width * 0.33, height * 0.62);
      ctx.lineTo(width * 0.355, height * 0.60);
      ctx.lineTo(width * 0.365, height * 0.44);
      ctx.lineTo(width * 0.388, height * 0.42);
      ctx.lineTo(width * 0.398, height * 0.31);
      ctx.lineTo(width * 0.422, height * 0.28);
      ctx.lineTo(width * 0.432, height * 0.16);
      ctx.lineTo(width * 0.455, height * 0.11);
      ctx.lineTo(width * 0.472, height * 0.14);
      ctx.lineTo(width * 0.476, height * 0.86);
      ctx.lineTo(width * 0.476, height);
      ctx.closePath();
      ctx.fill();

      // Left Cliff Inner Rim Light
      ctx.strokeStyle = 'rgba(255, 176, 138, 0.55)';
      ctx.lineWidth = 1.5;
      ctx.beginPath();
      ctx.moveTo(width * 0.472, height * 0.14);
      ctx.lineTo(width * 0.476, height * 0.85);
      ctx.stroke();

      // Right Cliff
      ctx.fillStyle = '#1b1a1e';
      ctx.beginPath();
      ctx.moveTo(width * 0.524, height);
      ctx.lineTo(width * 0.524, height * 0.86);
      ctx.lineTo(width * 0.528, height * 0.09);
      ctx.lineTo(width * 0.548, height * 0.12);
      ctx.lineTo(width * 0.556, height * 0.22);
      ctx.lineTo(width * 0.582, height * 0.24);
      ctx.lineTo(width * 0.592, height * 0.36);
      ctx.lineTo(width * 0.618, height * 0.39);
      ctx.lineTo(width * 0.630, height * 0.52);
      ctx.lineTo(width * 0.658, height * 0.55);
      ctx.lineTo(width * 0.685, height);
      ctx.closePath();
      ctx.fill();

      // Right Cliff Inner Rim Light
      ctx.strokeStyle = 'rgba(255, 176, 138, 0.55)';
      ctx.lineWidth = 1.5;
      ctx.beginPath();
      ctx.moveTo(width * 0.528, height * 0.09);
      ctx.lineTo(width * 0.524, height * 0.85);
      ctx.stroke();

      // 5. Low Mist & Dark Foreground Terrain Vignette
      const mistGrad = ctx.createLinearGradient(0, height * 0.48, 0, height);
      mistGrad.addColorStop(0, 'rgba(34, 32, 36, 0)');
      mistGrad.addColorStop(0.45, 'rgba(30, 28, 32, 0.68)');
      mistGrad.addColorStop(1, 'rgba(18, 17, 20, 0.96)');
      ctx.fillStyle = mistGrad;
      ctx.fillRect(0, height * 0.48, width, height * 0.52);

      // Left & Right Edge Foliage Silhouette Framing
      ctx.fillStyle = '#121114';
      ctx.beginPath();
      ctx.moveTo(0, 0);
      ctx.lineTo(width * 0.045, 0);
      ctx.lineTo(width * 0.025, height * 0.32);
      ctx.lineTo(width * 0.052, height * 0.58);
      ctx.lineTo(width * 0.03, height);
      ctx.lineTo(0, height);
      ctx.closePath();
      ctx.fill();

      ctx.beginPath();
      ctx.moveTo(width, 0);
      ctx.lineTo(width * 0.945, 0);
      ctx.lineTo(width * 0.965, height * 0.28);
      ctx.lineTo(width * 0.935, height * 0.55);
      ctx.lineTo(width * 0.96, height);
      ctx.lineTo(width, height);
      ctx.closePath();
      ctx.fill();

      // 6. Editorial Tech UI Overlay (Matching Reference Typography & Grid)
      const padX = Math.max(24, width * 0.048);

      // 6A. Top Minimal Spaced Navigation & Center Arch Logo
      ctx.save();
      const navY = Math.max(18, height * 0.11);
      const navFontSize = Math.max(7.5, Math.min(10.5, width / 96));
      ctx.font = `500 ${navFontSize}px "Inter", sans-serif`;
      ctx.fillStyle = 'rgba(255, 255, 255, 0.68)';
      ctx.textAlign = 'center';
      ctx.textBaseline = 'middle';

      const navItems = [
        { label: 'GUKi WORKSPACE', rx: 0.27 },
        { label: 'REPOSITORY', rx: 0.36 },
        { label: 'INDIE COMMERCE', rx: 0.435 },
        { label: 'ISOLATED OPS', rx: 0.57 },
        { label: 'PHILOSOPHY', rx: 0.645 },
        { label: 'CONTACT', rx: 0.72 }
      ];
      navItems.forEach(item => {
        ctx.fillText(item.label, width * item.rx, navY);
      });

      // Center Minimal Arch Emblem
      const logoR = Math.max(5.5, navFontSize * 0.85);
      ctx.strokeStyle = 'rgba(255, 255, 255, 0.85)';
      ctx.lineWidth = 1.6;
      ctx.beginPath();
      ctx.arc(width * 0.50, navY, logoR, Math.PI, 0, false);
      ctx.lineTo(width * 0.50 + logoR, navY + logoR * 0.75);
      ctx.lineTo(width * 0.50 - logoR, navY + logoR * 0.75);
      ctx.closePath();
      ctx.stroke();
      ctx.restore();

      // 6B. Bottom Hairline Divider & Metadata
      const lineY = height * 0.855;
      ctx.strokeStyle = 'rgba(255, 255, 255, 0.22)';
      ctx.lineWidth = 1;
      ctx.beginPath();
      ctx.moveTo(padX, lineY);
      ctx.lineTo(width - padX, lineY);
      ctx.stroke();

      // Bottom-Left Micro Tag Below Hairline
      const metaFontSize = Math.max(7.5, Math.min(10, width / 98));
      ctx.font = `500 ${metaFontSize}px "JetBrains Mono", monospace`;
      ctx.fillStyle = 'rgba(255, 255, 255, 0.62)';
      ctx.textAlign = 'left';
      ctx.textBaseline = 'top';
      ctx.fillText('FOUNDER & AI BUILDER  •  CREATOR OF GUKi', padX, lineY + Math.max(7, height * 0.032));

      // 6C. Bottom-Left Bold Editorial Title ("GULINGLE") & Subtitle
      const titleSize = Math.max(24, Math.min(48, width / 19.5));
      const subSize = Math.max(11, Math.min(20, width / 46));
      const subLineH = subSize * 1.28;
      const subBottomY = lineY - Math.max(12, height * 0.055);
      const titleY = subBottomY - subLineH * 2 - Math.max(4, height * 0.015);

      ctx.font = `800 ${titleSize}px "Inter", sans-serif`;
      ctx.fillStyle = '#ffffff';
      ctx.textAlign = 'left';
      ctx.textBaseline = 'bottom';
      ctx.fillText('GULINGLE', padX, titleY);

      ctx.font = `400 ${subSize}px "Inter", sans-serif`;
      ctx.fillStyle = 'rgba(235, 238, 242, 0.86)';
      ctx.textBaseline = 'top';
      ctx.fillText('Architecting multi-model agent workspaces,', padX, titleY + 2);
      ctx.fillText('autonomous indie sites & full-stack growth engines.', padX, titleY + 2 + subLineH);

      // 6D. Bottom-Right Micro Editorial Description Paragraph
      if (width >= 520) {
        const descSize = Math.max(7.5, Math.min(9.5, width / 102));
        const descMaxW = Math.min(290, width * 0.30);
        const descX = width - padX - descMaxW;
        ctx.font = `400 ${descSize}px "JetBrains Mono", monospace`;
        ctx.fillStyle = 'rgba(226, 232, 240, 0.65)';
        ctx.textAlign = 'left';
        ctx.textBaseline = 'top';

        const descCopy = 'Deploying cross-platform workspaces for multi-model orchestration, MCP routing, and human-in-the-loop workflows. Densely integrating RAG, visual RPA, and sandboxed system isolation for scalable autonomous operations.';
        const descLines = wrapCanvasText(ctx, descCopy, descMaxW);
        const descLineH = descSize * 1.42;
        const descStartY = lineY - Math.max(10, height * 0.04) - descLines.length * descLineH;
        descLines.forEach((ln, idx) => {
          ctx.fillText(ln, descX, descStartY + idx * descLineH);
        });
      }

      // 7. Subtle Analog Film Grain Overlay
      const pattern = ctx.createPattern(FILM_GRAIN_TILE, 'repeat');
      if (pattern) {
        ctx.fillStyle = pattern;
        ctx.fillRect(0, 0, width, height);
      }
    }

    function initHeroEditorialCanvas() {
      const canvas = document.getElementById('hero-editorial-canvas');
      if (!canvas) return;
      const ctx = canvas.getContext('2d');
      let width = 0;
      let height = 0;

      function resize() {
        const rect = canvas.parentElement.getBoundingClientRect();
        const dpr = Math.min(window.devicePixelRatio || 1, 2);
        width = rect.width;
        height = rect.height;
        canvas.width = width * dpr;
        canvas.height = height * dpr;
        ctx.setTransform(dpr, 0, 0, dpr, 0, 0);
      }

      resize();
      window.addEventListener('resize', resize);

      const startTime = performance.now();
      function draw(now) {
        const t = ((now - startTime) % 6000) / 6000;
        renderEditorialBannerFrame(ctx, width, height, t, previewState.customBannerImg);
        requestAnimationFrame(draw);
      }
      requestAnimationFrame(draw);
    }

    // 6. Architecture Blueprint Background Scrolling Code Canvas
    function initArchCodeCanvas() {
      const canvas = document.getElementById('arch-code-canvas');
      if (!canvas) return;
      const ctx = canvas.getContext('2d');
      let width = 0;
      let height = 0;

      const codeLines = [
        'class GulingleKnowledgeGraph:',
        '    def __init__(self, uri="bolt://localhost:7687"):',
        '        self.driver = GraphDatabase.driver(uri)',
        '    async def multi_hop_retrieve(self, entity: str, depth: int = 3):',
        '        cypher = "MATCH p=(n {name:$e})-[*1..3]-(m) RETURN p"',
        '        return await self.execute_read(cypher, e=entity)',
        'async def orchestrate_agent_pipeline(prompt: str):',
        '    intent = await hermes_router.classify(prompt)',
        '    context = await kg.multi_hop_retrieve(intent.subject)',
        '    if intent.requires_isolation:',
        '        return await hyperv_sandbox.dispatch_rpa(intent, context)',
        '    return await mcp_executor.invoke_tools(intent.tools, context)'
      ];

      function resize() {
        const rect = canvas.parentElement.getBoundingClientRect();
        const dpr = Math.min(window.devicePixelRatio || 1, 2);
        width = rect.width;
        height = rect.height;
        canvas.width = width * dpr;
        canvas.height = height * dpr;
        ctx.setTransform(dpr, 0, 0, dpr, 0, 0);
      }

      resize();
      window.addEventListener('resize', resize);

      let scrollOffset = 0;
      function render() {
        ctx.clearRect(0, 0, width, height);
        ctx.font = '11px "JetBrains Mono", monospace';
        const lineHeight = 22;
        scrollOffset = (scrollOffset + 0.25) % (codeLines.length * lineHeight);

        for (let i = -1; i < Math.ceil(height / lineHeight) + 2; i++) {
          const lineIdx = ((i % codeLines.length) + codeLines.length) % codeLines.length;
          const y = i * lineHeight - (scrollOffset % lineHeight);
          ctx.fillStyle = lineIdx % 3 === 0 ? 'rgba(251, 113, 133, 0.24)' : 'rgba(56, 189, 248, 0.20)';
          ctx.fillText(codeLines[lineIdx], 18, y);
          ctx.fillText(codeLines[(lineIdx + 5) % codeLines.length], width * 0.52, y);
        }
        requestAnimationFrame(render);
      }
      requestAnimationFrame(render);
    }

    // 7. 52-Week Contribution Heatmap Generator
    function renderHeatmap() {
      const grid = document.getElementById('heatmap-grid');
      if (!grid) return;
      const levels = [
        'bg-[#161b22] border-[#30363d]/60',
        'bg-[#0e4429] border-[#0e4429]',
        'bg-[#006d32] border-[#006d32]',
        'bg-[#26a641] border-[#26a641]',
        'bg-[#39d353] border-[#39d353]'
      ];
      let html = '';
      for (let i = 0; i < 364; i++) {
        const bias = i > 210 ? ((i * 19 + 7) % 5) : ((i * 13) % 7 === 0 ? 1 : 0);
        const lvl = Math.min(4, Math.max(0, bias));
        html += `<span class="w-2.5 h-2.5 rounded-[2px] border ${levels[lvl]}" title="Contributions day ${i + 1}"></span>`;
      }
      grid.innerHTML = html;
    }

    // 8. Dynamically Generate Complete Deployable README.md Source
    function generateReadmeMarkdown() {
      const isBi = previewState.lang === 'bilingual';
      const bannerFile = `banner.${previewState.bannerExt}`;
      const mdParts = [
        '<div align="center">',
        '',
        `<!-- Hero Banner: Cinematic Editorial Header (assets/${bannerFile}) -->`,
        `<img src="./assets/${bannerFile}" alt="GULINGLE Banner" width="100%" />`,
        '',
        '<br />',
        '',
        '<!-- Social & Flagship Links -->',
        '<p>',
        '  <a href="https://gulingle.cn"><img src="https://img.shields.io/badge/WEB-GULINGLE.CN-161B22?style=for-the-badge&logo=googlechrome&logoColor=FDA4AF" alt="Website" /></a>',
        '  <a href="https://x.com/GULINGLE"><img src="https://img.shields.io/badge/X-@GULINGLE-161B22?style=for-the-badge&logo=x&logoColor=white" alt="X" /></a>',
        '  <a href="https://github.com/gulingle?tab=repositories"><img src="https://img.shields.io/badge/FLAGSHIP-GUKi_WORKSPACE-161B22?style=for-the-badge&logo=openai&logoColor=FCD34D" alt="GUKi" /></a>',
        '</p>',
        '',
        '</div>',
        '',
        '---',
        '',
        isBi ? '### 🚀 What I\'m Building · 核心构建方向' : '### 🚀 What I\'m Building',
        '',
        '<table>',
        '  <tr>',
        '    <td width="50%" valign="top">',
        '      <h4>🧠 GUKi — Multi-Model Agent Workspaces</h4>',
        '      <p>Cross-platform desktop workspaces for multi-model orchestration, MCP tool routing, and human-in-the-loop agent workflows.</p>',
        ...(isBi ? ['      <blockquote>跨平台多模型协作工作台，聚焦模型统一调度、MCP 工具链与人机协同自动化流。</blockquote>'] : []),
        '    </td>',
        '    <td width="50%" valign="top">',
        '      <h4>🌐 Autonomous Indie Sites</h4>',
        '      <p>Self-operating site and commerce infrastructure: RAG knowledge-base support, tool-calling AI assistants, and automated order pipelines.</p>',
        ...(isBi ? ['      <blockquote>全自动独立站与商业基建：知识库智能客服、工具调用型助手及订单自动化闭环。</blockquote>'] : []),
        '    </td>',
        '  </tr>',
        '  <tr>',
        '    <td width="50%" valign="top">',
        '      <h4>⚙️ Full-Stack Growth &amp; Isolated Ops</h4>',
        '      <p>Sandboxed execution environments, browser &amp; desktop visual RPA agents, and resilient automation for scalable operations.</p>',
        ...(isBi ? ['      <blockquote>物理级隔离执行环境、浏览器与桌面级视觉智能体，以及可规模化的自动化运维。</blockquote>'] : []),
        '    </td>',
        '    <td width="50%" valign="top">',
        '      <h4>📡 Engineering Philosophy</h4>',
        '      <p>Isolate complexity at the infrastructure layer so autonomous AI agents can execute cleanly and reliably at the surface.</p>',
        ...(isBi ? ['      <blockquote>在底层基础设施封装复杂性与隔离边界，让上层多智能体实现高可靠、低干扰的自治运行。</blockquote>'] : []),
        '    </td>',
        '  </tr>',
        '</table>'
      ];

      if (previewState.showArch) {
        mdParts.push(
          '',
          '---',
          '',
          isBi ? '### 🧩 System Architecture & Knowledge Graph · 系统架构蓝图' : '### 🧩 System Architecture & Knowledge Graph',
          '',
          '<div align="center">',
          '  <img src="./assets/architecture.png" alt="GULINGLE System Architecture" width="100%" />',
          '</div>'
        );
      }

      mdParts.push(
        '',
        '---',
        '',
        isBi ? '### 🛠️ Tech Stack & Infrastructure · 技术栈矩阵' : '### 🛠️ Tech Stack & Infrastructure',
        '',
        '- **AI & Agent Routing:** ![Python](https://img.shields.io/badge/Python-161B22?style=flat-square&logo=python&logoColor=3776AB) ![MCP](https://img.shields.io/badge/MCP_Protocol-161B22?style=flat-square&logo=modelcontextprotocol&logoColor=38BDF8) ![Knowledge Graph](https://img.shields.io/badge/Knowledge_Graph-161B22?style=flat-square) ![Playwright](https://img.shields.io/badge/Browser_&_GUI_RPA-161B22?style=flat-square&logo=playwright&logoColor=2EAD33)',
        '- **Full-Stack Web:** ![TypeScript](https://img.shields.io/badge/TypeScript-161B22?style=flat-square&logo=typescript&logoColor=3178C6) ![React](https://img.shields.io/badge/React-161B22?style=flat-square&logo=react&logoColor=61DAFB) ![Next.js](https://img.shields.io/badge/Next.js-161B22?style=flat-square&logo=nextdotjs&logoColor=white) ![FastAPI](https://img.shields.io/badge/FastAPI-161B22?style=flat-square&logo=fastapi&logoColor=009688)',
        '- **Commerce & Infra:** ![Docker](https://img.shields.io/badge/Docker-161B22?style=flat-square&logo=docker&logoColor=2496ED) ![Linux](https://img.shields.io/badge/Linux_&_Hyper--V-161B22?style=flat-square&logo=linux&logoColor=FCC624) ![WooCommerce](https://img.shields.io/badge/WooCommerce-161B22?style=flat-square&logo=woocommerce&logoColor=96588A) ![Cloudflare](https://img.shields.io/badge/Cloudflare-161B22?style=flat-square&logo=cloudflare&logoColor=F38020)'
      );

      if (previewState.showStats) {
        mdParts.push(
          '',
          '---',
          '',
          isBi ? '### 📊 GitHub Analytics · 实时开发数据' : '### 📊 GitHub Analytics',
          '',
          '<div align="center">',
          '  <img src="https://github-readme-stats.vercel.app/api?username=gulingle&show_icons=true&theme=github_dark&hide_border=true&bg_color=0D1117&title_color=FDA4AF&icon_color=FCD34D" height="165" alt="GitHub Stats" />',
          '  <img src="https://github-readme-stats.vercel.app/api/top-langs/?username=gulingle&layout=compact&theme=github_dark&hide_border=true&bg_color=0D1117&title_color=FDA4AF" height="165" alt="Top Languages" />',
          '</div>'
        );
      }

      return mdParts.join('\n');
    }

    // 9. Markdown Modal & Clipboard Helpers
    function openMarkdownModal() {
      const modal = document.getElementById('md-modal');
      const output = document.getElementById('md-source-output');
      if (output) output.textContent = generateReadmeMarkdown();
      if (modal) {
        modal.classList.remove('hidden');
        modal.classList.add('flex');
      }
    }

    function closeMarkdownModal() {
      const modal = document.getElementById('md-modal');
      if (modal) {
        modal.classList.add('hidden');
        modal.classList.remove('flex');
      }
    }

    function copyReadmeMarkdown() {
      const text = generateReadmeMarkdown();
      try {
        const ta = document.createElement('textarea');
        ta.value = text;
        ta.style.position = 'fixed';
        ta.style.opacity = '0';
        document.body.appendChild(ta);
        ta.select();
        document.execCommand('copy');
        document.body.removeChild(ta);
        showToast('✅ 已复制完整 README.md 源码到剪贴板！');
      } catch (err) {
        openMarkdownModal();
        showToast('请从弹窗中手动全选复制源码');
      }
    }

    let toastTimer = null;
    function showToast(message) {
      const box = document.getElementById('toast-box');
      if (!box) return;
      box.textContent = message;
      box.classList.remove('hidden');
      if (toastTimer) clearTimeout(toastTimer);
      toastTimer = setTimeout(() => {
        box.classList.add('hidden');
      }, 3200);
    }

    // 10. Zero-Dependency Pure JS GIF89a LZW Encoder & Studio Controls
    const gifStudioState = {
      mode: 'editorial',
      customImg: null,
      blobUrl: null,
      isEncoding: false
    };

    function openGifStudioModal() {
      const modal = document.getElementById('gif-modal');
      if (!modal) return;
      modal.classList.remove('hidden');
      modal.classList.add('flex');
      if (!gifStudioState.blobUrl && !gifStudioState.isEncoding) {
        buildBannerGif();
      }
    }

    function closeGifStudioModal() {
      const modal = document.getElementById('gif-modal');
      if (!modal) return;
      modal.classList.add('hidden');
      modal.classList.remove('flex');
    }

    function setGifSourceMode(mode) {
      gifStudioState.mode = mode;
      const btnSynth = document.getElementById('btn-gif-mode-synth');
      if (mode === 'editorial' && btnSynth) {
        btnSynth.className = 'px-3 py-1.5 rounded-md font-medium bg-rose-500/20 text-rose-200 border border-rose-400/50';
      }
      buildBannerGif();
    }

    function handleGifBaseImageUpload(event) {
      const file = event.target.files && event.target.files[0];
      if (!file) return;
      const reader = new FileReader();
      reader.onload = function (e) {
        const img = new Image();
        img.onload = function () {
          gifStudioState.customImg = img;
          gifStudioState.mode = 'custom';
          const btnSynth = document.getElementById('btn-gif-mode-synth');
          if (btnSynth) {
            btnSynth.className = 'px-3 py-1.5 rounded-md font-medium bg-slate-800 hover:bg-slate-700 text-slate-300 border border-slate-600';
          }
          buildBannerGif();
        };
        img.src = e.target.result;
      };
      reader.readAsDataURL(file);
    }

    function createEditorialGifPalette() {
      const pal = new Uint8Array(256 * 3);
      const rVals = [0, 51, 102, 153, 204, 255];
      const gVals = [0, 36, 73, 109, 146, 182, 219, 255];
      const bVals = [0, 64, 128, 191, 255];
      let idx = 0;
      for (let r = 0; r < 6; r++) {
        for (let g = 0; g < 8; g++) {
          for (let b = 0; b < 5; b++) {
            pal[idx * 3] = rVals[r];
            pal[idx * 3 + 1] = gVals[g];
            pal[idx * 3 + 2] = bVals[b];
            idx++;
          }
        }
      }
      for (let gr = 0; gr < 16; gr++) {
        const v = Math.round((gr + 1) * (240 / 16));
        pal[idx * 3] = v;
        pal[idx * 3 + 1] = v;
        pal[idx * 3 + 2] = v;
        idx++;
      }
      return pal;
    }

    function quantizeFrameToIndices(rgbaData, width, height) {
      const total = width * height;
      const out = new Uint8Array(total);
      const bayer4 = [
        0, 8, 2, 10,
        12, 4, 14, 6,
        3, 11, 1, 9,
        15, 7, 13, 5
      ];
      for (let y = 0; y < height; y++) {
        const rowOff = y * width;
        const by = (y & 3) << 2;
        for (let x = 0; x < width; x++) {
          const p = (rowOff + x) << 2;
          const dither = (bayer4[by + (x & 3)] - 7.5) * 1.3;
          const r = Math.max(0, Math.min(255, rgbaData[p] + dither));
          const g = Math.max(0, Math.min(255, rgbaData[p + 1] + dither));
          const b = Math.max(0, Math.min(255, rgbaData[p + 2] + dither));

          if (Math.abs(r - g) < 10 && Math.abs(g - b) < 10 && r > 18 && r < 246) {
            const gIdx = Math.max(0, Math.min(15, Math.round((r / 240) * 15)));
            out[rowOff + x] = 240 + gIdx;
          } else {
            const ri = Math.round((r / 255) * 5);
            const gi = Math.round((g / 255) * 7);
            const bi = Math.round((b / 255) * 4);
            out[rowOff + x] = ri * 40 + gi * 5 + bi;
          }
        }
      }
      return out;
    }

    function encodeLzwGifFrame(indices) {
      const chunks = [];
      let subBlock = new Uint8Array(256);
      let subLen = 0;

      function flushSubBlock() {
        if (subLen > 0) {
          chunks.push(subLen);
          for (let i = 0; i < subLen; i++) chunks.push(subBlock[i]);
          subLen = 0;
        }
      }

      function emitByte(b) {
        subBlock[subLen++] = b & 0xff;
        if (subLen === 255) flushSubBlock();
      }

      const clearCode = 256;
      const eoiCode = 257;
      let nextCode = 258;
      let codeSize = 9;
      let curAccum = 0;
      let curBits = 0;

      function emitCode(code) {
        curAccum |= code << curBits;
        curBits += codeSize;
        while (curBits >= 8) {
          emitByte(curAccum & 0xff);
          curAccum >>= 8;
          curBits -= 8;
        }
      }

      const hashSize = 16384;
      const hashMask = hashSize - 1;
      const keys = new Int32Array(hashSize);
      const vals = new Int16Array(hashSize);
      keys.fill(-1);

      emitCode(clearCode);
      let ent = indices[0];

      for (let i = 1; i < indices.length; i++) {
        const c = indices[i];
        const fcode = (ent << 8) | c;
        let h = ((ent << 6) ^ c) & hashMask;
        let found = false;

        while (keys[h] !== -1) {
          if (keys[h] === fcode) {
            ent = vals[h];
            found = true;
            break;
          }
          h = (h + 1) & hashMask;
        }

        if (!found) {
          emitCode(ent);
          if (nextCode < 4096) {
            keys[h] = fcode;
            vals[h] = nextCode++;
            if (nextCode > (1 << codeSize) && codeSize < 12) {
              codeSize++;
            }
          } else {
            emitCode(clearCode);
            keys.fill(-1);
            nextCode = 258;
            codeSize = 9;
          }
          ent = c;
        }
      }

      emitCode(ent);
      emitCode(eoiCode);
      if (curBits > 0) emitByte(curAccum & 0xff);
      flushSubBlock();
      chunks.push(0x00);
      return new Uint8Array(chunks);
    }

    async function buildBannerGif() {
      if (gifStudioState.isEncoding) return;
      gifStudioState.isEncoding = true;

      const previewImg = document.getElementById('gif-output-preview');
      const statusBox = document.getElementById('gif-encoding-status');
      const statusText = document.getElementById('gif-status-text');
      const downloadBtn = document.getElementById('btn-download-gif');
      const metaLabel = document.getElementById('gif-file-meta');

      if (previewImg) previewImg.classList.add('hidden');
      if (statusBox) statusBox.classList.remove('hidden');
      if (downloadBtn) {
        downloadBtn.classList.add('pointer-events-none', 'opacity-50');
      }

      try {
        const width = 960;
        const height = 280;
        const frameCount = 28;
        const delayCentisecs = 7;

        const offCanvas = document.createElement('canvas');
        offCanvas.width = width;
        offCanvas.height = height;
        const offCtx = offCanvas.getContext('2d', { willReadFrequently: true });

        const palette = createEditorialGifPalette();
        const gifBytes = [];

        gifBytes.push(0x47, 0x49, 0x46, 0x38, 0x39, 0x61);
        gifBytes.push(
          width & 0xff, (width >> 8) & 0xff,
          height & 0xff, (height >> 8) & 0xff,
          0xf7, 0x00, 0x00
        );
        for (let i = 0; i < palette.length; i++) gifBytes.push(palette[i]);

        gifBytes.push(
          0x21, 0xff, 0x0b,
          0x4e, 0x45, 0x54, 0x53, 0x43, 0x41, 0x50, 0x45, 0x32, 0x2e, 0x30,
          0x03, 0x01, 0x00, 0x00, 0x00
        );

        const baseImg = gifStudioState.mode === 'custom' ? gifStudioState.customImg : null;

        for (let f = 0; f < frameCount; f++) {
          const t = f / frameCount;
          renderEditorialBannerFrame(offCtx, width, height, t, baseImg);
          const imgData = offCtx.getImageData(0, 0, width, height);
          const indexed = quantizeFrameToIndices(imgData.data, width, height);
          const lzwBlock = encodeLzwGifFrame(indexed);

          gifBytes.push(
            0x21, 0xf9, 0x04, 0x00,
            delayCentisecs & 0xff, (delayCentisecs >> 8) & 0xff,
            0x00, 0x00
          );
          gifBytes.push(
            0x2c, 0x00, 0x00, 0x00, 0x00,
            width & 0xff, (width >> 8) & 0xff,
            height & 0xff, (height >> 8) & 0xff,
            0x00, 0x08
          );
          for (let b = 0; b < lzwBlock.length; b++) gifBytes.push(lzwBlock[b]);

          if (f % 4 === 0) {
            const pct = Math.round(((f + 1) / frameCount) * 100);
            if (statusText) statusText.textContent = `正在逐帧编码 GIF89a 动图 (${pct}%)...`;
            await new Promise(r => setTimeout(r, 0));
          }
        }

        gifBytes.push(0x3b);

        const binaryArray = new Uint8Array(gifBytes);
        const blob = new Blob([binaryArray], { type: 'image/gif' });
        if (gifStudioState.blobUrl) URL.revokeObjectURL(gifStudioState.blobUrl);
        gifStudioState.blobUrl = URL.createObjectURL(blob);

        if (previewImg) {
          previewImg.src = gifStudioState.blobUrl;
          previewImg.classList.remove('hidden');
        }
        if (statusBox) statusBox.classList.add('hidden');
        if (downloadBtn) {
          downloadBtn.href = gifStudioState.blobUrl;
          downloadBtn.classList.remove('pointer-events-none', 'opacity-50');
        }
        const sizeKb = (binaryArray.length / 1024).toFixed(1);
        if (metaLabel) {
          metaLabel.textContent = `960×280 px · 28 帧循环 · 文件大小 ${sizeKb} KB`;
        }
        showToast(`GIF 动图已生成 (${sizeKb} KB)，可直接下载！`);
      } catch (err) {
        if (statusText) statusText.textContent = `编码失败: ${err.message || '未知错误'}`;
      } finally {
        gifStudioState.isEncoding = false;
      }
    }

    // 11. Initialize Canvases, Heatmap & Modal Listeners
    window.addEventListener('load', () => {
      try {
        initHeroEditorialCanvas();
        initArchCodeCanvas();
        renderHeatmap();

        const modal = document.getElementById('md-modal');
        if (modal) {
          modal.addEventListener('click', (e) => {
            if (e.target === modal) closeMarkdownModal();
          });
        }

        const gifModal = document.getElementById('gif-modal');
        if (gifModal) {
          gifModal.addEventListener('click', (e) => {
            if (e.target === gifModal) closeGifStudioModal();
          });
        }
      } catch (err) {
        console.error('Initialization error:', err);
      }
    });
  </script>
</body>
</html>
