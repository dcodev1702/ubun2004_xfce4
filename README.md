# ubun2004_xfce4 Container
Inspired from: https://www.youtube.com/watch?v=8IfTXJRAIJw

An Ubuntu 20.04 XFCE 4 Container that can be accessed via VNC

Build the container:
  docker build -t ubun2004_xfce4 .
  

From your home directory:
    mkdir data
    
Run Docker container:
    docker run -d --rm --name ubun_xfce4 --user 1000 -v $(pwd)/data:/home/ubuntu/data -p 6080:6080 ubun2004_xfce4

Go to your web browser:
    + LAN_IP:6080/vnc.html
    + click 'connect' and enter in 'password' as the password
