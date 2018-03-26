#!/bin/bash
script_dir="/root/apps/cryptoTradingGame-Reddit/"
running_file="crypto_trading_processor.running"

mail_sent_file="monitor_mail_sent.txt"

log_file="crypto_trading_processor.log"

cd $script_dir

pid=`cat $running_file`

kill -0 $pid
kill_ret=$?

if [ "$kill_ret" -ne "0" ] && [ ! -f $mail_sent_file ]
then
    echo "mail sent" > $mail_sent_file
    (echo "Trading Processor LOG"; tail -40 $log_file;) | mail -t jjmerri88@gmail.com -s "Crypto Trading Bot Not Running!"
fi

exit 0
