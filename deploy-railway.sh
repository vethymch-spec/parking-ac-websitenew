#!/bin/bash
# Railway 一键部署脚本

set -e

echo "🚀 Parking AC Website 部署脚本"
echo "================================"

# 检查是否在项目目录
if [ ! -f "railway.json" ]; then
    echo "错误: 请在项目根目录运行此脚本"
    exit 1
fi

# 检查 Railway CLI
if ! command -v railway &> /dev/null; then
    echo "安装 Railway CLI..."
    npm install -g @railway/cli
fi

# 登录 Railway
echo ""
echo "步骤 1: 登录 Railway"
echo "如果浏览器没打开，请访问 https://railway.com/activate"
railway login

# 创建项目
echo ""
echo "步骤 2: 创建项目"
railway init --name "parking-ac-website"

# 添加 MySQL
echo ""
echo "步骤 3: 添加 MySQL 数据库"
railway add --database mysql

# 设置环境变量
echo ""
echo "步骤 4: 设置环境变量"
railway variables set NODE_ENV=production
railway variables set JWT_SECRET=$(openssl rand -hex 32 2>/dev/null || head -c 64 /dev/urandom | base64 | tr -d '=+/')

echo ""
echo "请输入 Resend API Key (如果没有请直接回车):"
read -r RESEND_KEY
if [ -n "$RESEND_KEY" ]; then
    railway variables set RESEND_API_KEY="$RESEND_KEY"
fi

# 部署
echo ""
echo "步骤 5: 部署"
railway up

echo ""
echo "✅ 部署完成！"
echo ""
echo "获取域名:"
railway domain

echo ""
echo "数据库迁移:"
echo "请在 Railway Dashboard → 项目 → Shell 中运行:"
echo "  pnpm db:push"
