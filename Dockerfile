# Sử dụng Node.js bản 20 (bản Alpine gọn nhẹ) làm hệ điều hành nền
FROM node:20-alpine

# Cài đặt thư mục làm việc mặc định bên trong container
WORKDIR /app

# Khai báo biến môi trường (Mặc định Next.js chạy ở port 3000)
ENV PORT=3000

# Copy file package.json và package-lock.json vào container trước
# Việc này giúp tận dụng Docker Cache, không phải cài lại thư viện nếu code thay đổi nhưng package.json không đổi
COPY package*.json ./

# Cài đặt thư viện (dependencies)
RUN npm ci

# Copy toàn bộ mã nguồn còn lại vào trong container
COPY . .

# Build dự án Next.js để sẵn sàng chạy production
RUN npm run build

# Mở cổng 3000 để bên ngoài có thể truy cập
EXPOSE 3000

# Lệnh khởi động app khi container bắt đầu chạy
CMD ["npm", "start"]
