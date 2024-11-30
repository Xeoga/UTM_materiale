FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY . . 
EXPOSE 5002
CMD ["python3", "proxy.py"]