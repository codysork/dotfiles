#!/bin/bash
 
#function: test_image_day
test_image_day () {
    case $1 in
         su)
           echo a
         ;;
         msu)
           echo b
         ;;
         psu)
           echo c
         ;;
         ic)
           echo c
         ;;
         h)
           echo c
         ;;
         mc)
           echo d
         ;;
         c)
           echo e
         ;;
         d)
           echo e
         ;;
         f)
           echo 0
         ;;
         s)
           echo h
         ;;
         mcs)
           echo g
         ;;
         psus)
           echo g
         ;;
         t)
           echo l
         ;;
         mct)
           echo k
         ;;
         psut)
           echo k
         ;;
         r)
           echo i
         ;;
         fl)
           echo p
         ;;
         mcfl)
           echo o
         ;;
         psfl)
           echo o
         ;;
         sn)
           echo r
         ;;
         mcsn)
           echo o
         ;;
         i)
           echo E
         ;;
         sl)
           echo u
         ;;
         fr)
           echo i
         ;;
         rsn)
           echo v
         ;;
         w)
           echo 6
         ;;
         ho)
           echo 5
         ;;
         co)
           echo E
         ;;
         cl)
           echo A
         ;;
         mcl)
           echo B
         ;;
         pc)
           echo C
         ;;
         pcs)
           echo G
         ;;
         pct)
           echo K
         ;;
        esac
}
 
#function: test_image_night
test_image_night () {
    case $1 in
                 su)
           echo a
         ;;
         msu)
           echo b
         ;;
         psu)
           echo c
         ;;
         c)
           echo f
         ;;
         d)
           echo f
         ;;
         f)
           echo f
         ;;
         s)
           echo h
         ;;
         psus)
           echo g
         ;;
         t)
           echo l
         ;;
         psut)
           echo k
         ;;
         r)
           echo i
         ;;
         fl)
           echo p
         ;;
         psfl)
           echo o
         ;;
         sn)
           echo r
         ;;
         i)
           echo E
         ;;
         sl)
           echo u
         ;;
         fr)
           echo i
         ;;
         rsn)
           echo v
         ;;
         ho)
           echo 5
         ;;
         co)
           echo E
         ;;
         cl)
           echo A
         ;;
         w)
           echo 6
         ;;
         mcl)
           echo B
         ;;
         pc)
           echo C
         ;;
         ic)
           echo B
         ;;
         h)
           echo B
         ;;
         mc)
           echo C
         ;;
         pcs)
           echo G
         ;;
         mcs)
           echo G
         ;;
         pct)
           echo K
         ;;
         mct)
           echo K
         ;;
         mcfl)
           echo O
         ;;
         mcsn)
           echo O
         ;;
        esac
}
 
kill -STOP $(pidof conky)
killall wget
 
#put your Accuweather address here
address="http://www.accuweather.com/en/gb/gloucester/gl1-2/weather-forecast/328266"
 
loc_id=$(echo $address|sed 's/\/weather-forecast.*$//'|sed 's/^.*\///')
last_number=$(echo $address|sed 's/^.*\///')
 
curr_addr="$(echo $address|sed 's/weather-forecast.*$//')"current-weather/"$last_number"
wget -O $HOME/.conky/scripts/accuweather.sh/curr_cond_raw "$curr_addr"
 
addr1="$(echo $address|sed 's/weather-forecast.*$//')"daily-weather-forecast/"$last_number"
wget -O $HOME/.conky/scripts/accuweather.sh/tod_ton_raw "$addr1"
 
#current conditions
if [[ -s $HOME/.conky/scripts/accuweather.sh/curr_cond_raw ]]; then
 
    sed -i '/detail-now/,/#details/!d' $HOME/.conky/scripts/accuweather.sh/curr_cond_raw
    egrep -i '"cond"|icon i-|detail-tab-panel' $HOME/.conky/scripts/accuweather.sh/curr_cond_raw > $HOME/.conky/scripts/accuweather.sh/curr_cond
    sed -i -e 's/^.*detail-tab-panel //g' -e 's/^.*icon i-//g' -e 's/"><\/div>.*$//g' $HOME/.conky/scripts/accuweather.sh/curr_cond
    sed -i -e 's/^.*"cond">//g' -e 's/&deg/\n/g' -e 's/<\/span>.*"temp">/\n/g' -e 's/<.*>//g' $HOME/.conky/scripts/accuweather.sh/curr_cond
    sed -i -e 's/">//g' -e 's/-->//g' -e 's/\r$//g' -e 's/ i-alarm.*$//g' $HOME/.conky/scripts/accuweather.sh/curr_cond
        time=$(sed -n 1p $HOME/.conky/scripts/accuweather.sh/curr_cond)
    image=$(sed -n 2p $HOME/.conky/scripts/accuweather.sh/curr_cond)
        if [[ $time == day ]]; then
            sed -i 2s/$image/$(test_image_day $image)/ $HOME/.conky/scripts/accuweather.sh/curr_cond
        elif [[ $time == night ]]; then
            sed -i 2s/$image/$(test_image_night $image)/ $HOME/.conky/scripts/accuweather.sh/curr_cond
        fi
 
fi
 
#First 5 days
if [[ -s $HOME/.conky/scripts/accuweather.sh/tod_ton_raw ]]; then
 
    sed -i '/feed-tabs/,/\.feed-tabs/!d' $HOME/.conky/scripts/accuweather.sh/tod_ton_raw
    egrep -i 'Early AM|Today|Tonight|Overnight|icon i-|cond|temp|Mon|Tue|Wed|Thu|Fri|Sat|Sun' $HOME/.conky/scripts/accuweather.sh/tod_ton_raw > $HOME/.conky/scripts/accuweather.sh/tod_ton
    sed -i -e 's/^.*#">//g' -e 's/^.*icon i-//g' -e 's/^.*cond">//g' -e 's/^.*temp">//g' $HOME/.conky/scripts/accuweather.sh/tod_ton
    sed -i -e 's/Lo<\/span> /\n/g' -e 's/<\/a>.*$//g' -e 's/ "><.*$//g' -e 's/&#.*$//g' -e 's/teo//g' $HOME/.conky/scripts/accuweather.sh/tod_ton
    sed -i -e 's/<span>.*$//g' -e 's/<\/span>//g' -e 's/\r$//g' -e 's/ i-alarm.*$//g' $HOME/.conky/scripts/accuweather.sh/tod_ton
        sed -i -e 's/Early AM/EARLY AM/' -e 's/Today/TODAY/' -e 's/Tonight/TONIGHT/' -e 's/Overnight/OVERNIGHT/' -e 's/Mon/MONDAY/' -e 's/Tue/TUESDAY/' -e 's/Wed/WEDNESDAY/' -e 's/Thu/THURSDAY/' -e 's/Fri/FRIDAY/' -e 's/Sat/SATURDAY/' -e 's/Sun/SUNDAY/' $HOME/.conky/scripts/accuweather.sh/tod_ton
    time=$(sed -n 1p $HOME/.conky/scripts/accuweather.sh/tod_ton)
    image=$(sed -n 2p $HOME/.conky/scripts/accuweather.sh/tod_ton)
        if [[ $time == TODAY ]]; then
            sed -i 2s/$image/$(test_image_day $image)/ $HOME/.conky/scripts/accuweather.sh/tod_ton
        elif [[ $time == TONIGHT || $time == OVERNIGHT || $time == "EARLY AM" ]]; then
            sed -i 2s/$image/$(test_image_night $image)/ $HOME/.conky/scripts/accuweather.sh/tod_ton
        sed -i 3a- $HOME/.conky/scripts/accuweather.sh/tod_ton
        fi
    for (( i=7; i<=22; i+=5 ))
          do
          image=$(sed -n "${i}"p $HOME/.conky/scripts/accuweather.sh/tod_ton)
              sed -i ${i}s/$image/$(test_image_day $image)/ $HOME/.conky/scripts/accuweather.sh/tod_ton
          done
 
fi
 
 
kill -CONT $(pidof conky)
