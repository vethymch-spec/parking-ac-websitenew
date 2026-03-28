# Parking AC Website

一个专业的停车空调产品展示网站，部署在 Kimi + Railway 平台上。

## 在线演示

🌐 **前端 (Kimi)**: https://your-site.ok.kimi.link  
🔧 **后端 (Railway)**: https://your-api.railway.app

## 技术栈

- **前端**: React 19 + TypeScript + Vite + Tailwind CSS 4 + Framer Motion
- **后端**: Node.js + Express + tRPC + Drizzle ORM
- **数据库**: MySQL
- **部署**: Kimi (静态托管) + Railway (后端服务)

## 功能特性

- 🎨 现代化的 UI 设计，支持深色/浅色模式
- 📝 完整的博客系统 (86篇 SEO 优化文章)
- 🛍️ 产品展示与对比
- 💬 客户支持与工单系统
- 🔐 管理员后台
- 📱 完全响应式设计

## 快速开始

### 本地开发

```bash
# 安装依赖
pnpm install

# 启动开发服务器
pnpm dev
```

### 部署

#### 1. Railway (后端 + 数据库)

1. 访问 [Railway Dashboard](https://railway.app)
2. 创建新项目 → 从 GitHub 导入
3. 添加 MySQL 数据库
4. 配置环境变量 (参考 `.env.railway.example`)
5. 部署后运行: `railway run pnpm db:push`

#### 2. Kimi (前端)

1. 访问 [Kimi](https://kimi.com)
2. 创建新项目，导入同一仓库
3. 配置环境变量 `VITE_API_URL` 指向 Railway 后端
4. 部署

## 环境变量

### Railway
```env
NODE_ENV=production
DATABASE_URL=mysql://...
JWT_SECRET=your-secret
RESEND_API_KEY=re_xxx
```

### Kimi
```env
VITE_API_URL=https://your-api.railway.app
```

## 项目结构

```
parking-ac-website/
├── client/          # React 前端应用
├── server/          # Node.js 后端 API
├── shared/          # 共享类型和工具
├── drizzle/         # 数据库迁移文件
├── railway-deploy/  # Railway 部署配置
└── dist/            # 构建输出
```

## 许可证

MIT
