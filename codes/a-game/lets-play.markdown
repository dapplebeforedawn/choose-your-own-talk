# Playing the Game!
===================

Connect to the "kegmotron" wireless network (you won't have internet)
      (The password is "kegmotron")

I'll start the server:
  ```bash
  ~/game/server.rb | column -t  -s, | cat \
       <(echo "Game Results:")            \
       <(echo "========================") \
       -
  ```

The server is running at:
  ```bash
  echo "The server is running at: `ifconfig | awk '/192/ { print $2 }'`"
  echo "~/game-client/client.rb xxaa -i `ifconfig | awk '/191/ { print $2 }'`"
  echo "          <replace xxaa with a ship of your choosing>"
  ```
