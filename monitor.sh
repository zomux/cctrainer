while true
do
cnt=$(nvidia-smi | sed -n 's/|\s*[0-9]*\s*\([0-9]*\)\s*.*/\1/p' | sort | uniq | sed '/^\s*$/d' | wc -l)
if [ "$cnt" -gt 1 ]; then
  echo "kill train"
  killall train
  sleep 30s
fi
if [ "$cnt" -lt 1 ]; then
  echo "run train"
  ./train -c hparams2.txt &
  sleep 30s
fi
sleep 5s
done
