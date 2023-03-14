FROM python:3.9.16-slim-bullseye

COPY . . 
RUN cd /env/Scripts/
RUN python3 activate_this.py
RUN ./activate
RUN pip install --upgrade pip && pip install -r requirements.txt
EXPOSE 5000/tcp
ENV PATH=/home/ubuntu/.virtualenvs/bin:$PATH
CMD ["flask", "--app", "weezer", "run", "--host=0.0.0.0"]