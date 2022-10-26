FROM ubuntu
RUN apt-get update && apt-get install -y git tar wget xz-utils gcc libncursesw5-dev libc6-dev libgdbm-dev libsqlite3-dev libssl-dev openssl zlib1g-dev libffi-dev    libmysqlclient-dev libsasl2-dev libldap2-dev libbz2-dev make
WORKDIR /app
RUN git clone https://github.com/Rameshh/Django.git
WORKDIR /app/Django
RUN wget -c http://www.python.org/ftp/python/3.9.5/Python-3.9.5.tar.xz --no-check-certificate
RUN tar xf Python-3.9.5.tar.xz  
WORKDIR /app/Django/Python-3.9.5
RUN ./configure --prefix=/app/Django/usr
RUN make
RUN make install
RUN /app/Django/usr/bin/python3 --version
WORKDIR /app/Django
RUN pwd && ls
RUN ./pipinstall.sh
RUN /app/Django/usr/bin/django-admin --version
CMD ["/app/Django/usr/bin/python3", "manage.py", "runserver", "0.0.0.0:8000"]
