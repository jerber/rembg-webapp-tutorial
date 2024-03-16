FROM python:3.9

# Install wget
RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*

# Download the model file
RUN wget https://github.com/danielgatis/rembg/releases/download/v0.0.0/u2net.onnx -O /home/.u2net/u2net.onnx

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5100

CMD ["python", "app.py"]
