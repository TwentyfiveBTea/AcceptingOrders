# 项目启动说明

## 1. 后端（Django）

1. 进入后端目录：
   ```bash
   cd backend
   ```
2. 安装依赖（建议使用虚拟环境）：
   ```bash
   pip install -r requirements.txt
   ```
   如果没有 requirements.txt，可手动安装主要依赖：
   ```bash
   pip install django djangorestframework pymysql django-cors-headers
   ```
3. 启动 MySQL 数据库，并确保数据库配置正确。
4. 启动后端服务：
   ```bash
   backend目录下运行
   python manage.py runserver
   ```
   默认运行在 http://localhost:8000/

## 2. 前端（Vue）

1. 进入前端目录：
   ```bash
   cd frontend
   ```
2. 安装依赖：
   ```bash
   npm install
   ```
3. 启动前端开发服务器：
   ```bash
   frontend目录下运行
   npm run serve
   ```
   默认运行在 http://localhost:8080/

## 3. 访问项目

- 前端页面访问：http://localhost:8080/
- 后端 API 访问：http://localhost:8000/api_home

## 4. 注意事项
- 确保 MySQL 数据库已启动且账号密码正确。
- 前后端端口需与上述一致，或相应修改配置。


