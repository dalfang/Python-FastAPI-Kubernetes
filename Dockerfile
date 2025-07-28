# Use the official Python 3.9 image from Docker Hub as the base
FROM python:3.9

# Set the working directory inside the container to /code
WORKDIR /code

# Copy the requirements.txt file from your project into the container
COPY ./requirements.txt /code/requirements.txt

# Install the dependencies listed in requirements.txt
# --no-cache-dir helps keep the image size small
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Copy the entire 'app' folder into the container
COPY ./app /code/app

# Run the FastAPI application using uvicorn
# 'app.main:app' means:
# - Go to app/main.py
# - Look for the 'app' FastAPI instance
# --host 0.0.0.0 makes it accessible from outside the container
# --port 80 exposes it on port 80
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
