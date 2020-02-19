#/usr/bin/zsh
for i in `seq 10`
do
  ruby ./client.rb&
done
wait
