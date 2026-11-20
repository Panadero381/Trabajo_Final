# 1. Imagen base oficial de Python 3.12 en su versión slim
FROM python:3.12-slim

# 2. Carpeta de trabajo dentro del contenedor
WORKDIR /app

# 3. Copiar solo requirements.txt e instalar dependencias sin caché
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. Copiar únicamente las carpetas necesarias para la aplicación
COPY app/ app/
COPY frontend/ frontend/
COPY models/ models/

# 5. Exponer el puerto 8000
EXPOSE 8000

# 6. Comando de arranque del servidor Uvicorn
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
