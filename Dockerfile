FROM python:3.9.16-slim-bullseye

WORKDIR /env/Scripts/
#COPY . . 
RUN python3 activate_this.py
RUN ./activate
RUN pip install --upgrade pip && pip install -r requirements.txt
EXPOSE 5000/tcp
ENV PATH=/home/ubuntu/.virtualenvs/bin:$PATH
CMD ["flask", "--app", "weezer", "run", "--host=0.0.0.0"]