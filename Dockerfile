# 使用 Node.js 20 官方镜像
FROM node:20-alpine

# 设置工作目录
WORKDIR /app

# 复制 package.json
COPY package.json ./

# 安装依赖（使用 --force 解决冲突）
RUN npm install --force

# 复制源代码
COPY . .

# 构建应用
RUN npm run build

# 暴露端口
EXPOSE 3000

# 启动命令
CMD ["npm", "start"]
