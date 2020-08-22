# moodle-docker
To run follow steps below:<br/>
1. Install docker
2. Instal docker-compose
3. Go into cloned directory
4. Run this to build the Moodle image described in file docker-compose.yml via file Dockerfile:<br/>
<code>docker-compose build</code><br/>
After this you should have a new docker image. You can see it by listing images:<br/>
<code>docker image ls</code><br/>
5. Run this to make the image's container running:<br/>
<code>docker-compose up -d</code>
6. Browse <code>http://127.0.0.1:8080</code>.
Enjoy it.
