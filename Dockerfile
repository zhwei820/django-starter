FROM python:3.6.2
ENV PYTHONUNBUFFERED 1
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code
RUN pip install -r requirements.txt -i https://pypi.mirrors.ustc.edu.cn/simple
ADD create_project /bin
RUN chmod +x /bin/create_project
RUN mkdir -p /root/.pip
ADD pip.conf /root/.pip
