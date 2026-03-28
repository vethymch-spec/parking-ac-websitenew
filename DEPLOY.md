# Parking AC Website - Kimi + Railway 部署指南

## 项目概述
React + Node.js 全栈应用，部署到 Kimi (静态资源) + Railway (后端服务)

## 部署步骤

### 1. Railway 部署 (后端 + 数据库)

1. 访问 https://railway.app
2. 创建新项目 → 从 GitHub 导入此仓库
3. 添加 MySQL 数据库 (New → Database → MySQL)
4. 配置环境变量:

```bash
NODE_ENV=production
JWT_SECRET=<生成随机字符串: openssl rand -hex 32>
RESEND_API_KEY=<你的 Resend API Key>
```

5. Railway 会自动注入 `DATABASE_URL` 和 `PORT`
6. 部署后运行数据库迁移:
   ```bash
   railway run pnpm db:push
   railway run mysql -e "source railway-deploy/seed-data.sql"
   ```

### 2. Kimi 部署 (静态前端)

1. 访问 https://kimi.com
2. 创建新项目，导入同一仓库
3. 配置构建设置:
   - Build Command: `npm install -g pnpm && pnpm install && pnpm build`
   - Output Directory: `dist/client`
4. 配置环境变量:

```bash
VITE_API_URL=https://<your-railway-app>.railway.app
```

### 3. 域名配置

1. 在 Railway 获取后端域名 (如 `https://parking-ac-api.up.railway.app`)
2. 更新 Kimi 环境变量 `VITE_API_URL` 指向 Railway 后端
3. 重新部署 Kimi

## 环境变量清单

### Railway (后端)
```
NODE_ENV=production
PORT=3000
DATABASE_URL=<Railway auto-injects>
JWT_SECRET=<openssl rand -hex 32>
RESEND_API_KEY=re_xxxxxxxxxxxx
```

### Kimi (前端)
```
VITE_API_URL=https://<railway-backend>.railway.app
```

## 功能说明

- ✅ 博客系统 (86篇文章已静态化)
- ✅ 产品展示页面
- ✅ 客户支持系统 (邮箱+密码登录)
- ✅ 论坛功能
- ✅ 管理后台
- ❌ Manus OAuth 登录 (已移除，改用邮件登录)

## 技术栈

- 前端: React 19 + Vite + Tailwind CSS 4 + Framer Motion
- 后端: Node.js + Express + tRPC + Drizzle ORM
- 数据库: MySQL
- 部署: Kimi (静态) + Railway (后端)
