wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie"  http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz
tar zxf jdk-8u131-linux-x64.tar.gz
mkdir -p /usr/local/jdk8/
mv jdk1.8.0/* /usr/local/jdk8/
update-alternatives --install "/usr/bin/java" "java" "/usr/local/jdk8/bin/java" 1500
update-alternatives --install "/usr/bin/javac" "javac" "/usr/local/jdk8/bin/javac" 1500
update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/local/jdk8/bin/javaws" 1500
